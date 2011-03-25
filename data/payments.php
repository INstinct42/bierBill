<?php

// Add Action
if ($_GET['action'] == "add" && $_POST['add'] == "1") {
    if (isset($_POST['payee']) && isset($_POST['amount'])) {
        
        // Get Payee
        $um = new UserMapper();
        $payee = $um->getByRealname($_POST['payee']);
        
        // Continue if Payee exists and not me
        if ($payee !== false && $payee->getId() != $_SESSION['me']->getId()) {
            
            // Create Payment
            $pay = new Payment();
            $pay->setDate(time());
            $pay->setPayer($_SESSION['me']);
            $pay->setPayee($payee);
            $pay->setAmount($_POST['amount']);
            $pay->setDesc($_POST['desc']);
            $pay->setConfirmed(false);
            
            // Save Payment to DB
            $pm = new PaymentMapper();   
            $pay = $pm->save($pay);
           
            // Create Hash
            $hm = new HashMapper(); 
            $hash = $hm->createByPayment($pay);
            
            // Create & send E-Mail
            $mm = new MailManager();
            $mail = $mm->getMailByHash($hash);
            $mail->send();
            
            // Display Massage
            echo '
                <noscript>
                    <meta http-equiv="Refresh" content="4; URL=payments.html">
                </noscript>
                <script type="text/javascript">
                    function auto_forward() {
                        window.location = "payments.html";
                    }
                    window.setTimeout("auto_forward()", 4000);
                </script>
                <p>Ich habe Zahlung gemacht!</p>
            ';  
        }
        
    } 
}

// Default Page
else {
    // Create Work Objects
    $tpl = new Template("payments.tpl");
    $pm = new PaymentMapper();

    // Get Add Template
    $tpl->load("ADD");
    $template['add'] = (string) $tpl;
    
    // Get Incoming
    $tpl->load("INCOMING_LINE");
    $template['incoming'] = "";
    $incoming = $pm->getForIncoming($_SESSION['me']);
    foreach ($incoming as $pay) {
        $tpl->clearTags();
        $tpl->tag("date", date("d.m.Y", $pay->getDate()));
        $tpl->tag("from", $pay->getPayer()->getRealName());
        $tpl->tag("amount", $pay->getAmount());
        $tpl->tag("actions", '<button class="pointer">bestätigen</button>');
        $template['incoming'] .= (string) $tpl;
        $template['incoming'] .= "\r\n";
    }
    $tpl->load("INCOMING");
    $tpl->tag("lines", $template['incoming']);
    $template['incoming'] = (string) $tpl;
    
    // Get History
    $tpl->load("HISTORY_LINE");
    $template['history'] = "";
    $history = $pm->getByUser($_SESSION['me']);
    foreach ($history as $pay) {
        $tpl->clearTags();
        $tpl->tag("date", date("d.m.Y", $pay->getDate()));
        $tpl->tag("from", $pay->getPayer()->getRealName());
        $tpl->tag("to", $pay->getPayee()->getRealName());
        $tpl->tag("amount", $pay->getAmount());
        $tpl->tag("state", ($pay->getConfirmed() ? "bestätigt" : "unbestätigt"));
        $tpl->tag("actions", "");
        $template['history'] .= (string) $tpl;
        $template['history'] .= "\r\n";
    }
    $tpl->load("HISTORY");
    $tpl->tag("lines", $template['history']);
    $template['history'] = (string) $tpl;

    
    // Get Overall Template
    $tpl->load("ALL");
    $tpl->tag("add", $template['add']);
    $tpl->tag("incoming", $template['incoming']);
    $tpl->tag("history", $template['history']);
    echo (string) $tpl;
}
?>
