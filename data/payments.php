<?php

if($_POST['action']="add") {
    if (isset($_POST['payee']) && isset($_POST['amount'])) {
        
        $um = new UserMapper();
        $payee = $um->getByRealname($_POST['payee']);
        
        if ($payee !== false && $payee->getId() != $_SESSION['me']->getId()) {
            $pay = new Payment();
            $pay->setDate(time());
            $pay->setPayer($_SESSION['me']);
            $pay->setPayee($payee);
            $pay->setAmount($_POST['amount']);
            $pay->setDesc($_POST['desc']);
            $pay->setConfirmed(false);
            
            $pm = new PaymentMapper();   
            $pay = $pm->save($pay);
           
            $hm = new HashMapper(); 
            $hash = $hm->createByPayment($pay);
            
            $mm = new MailManager();
            $mail = $mm->getMailByHash($hash);
            $mail->send();
            
            echo "Ich habe Zahlung gemacht!";      
        }
        
    } 
}



$theTemplate = new Template("payments.tpl");

// Add Tpl
$theTemplate->load("ADD");
$template['add'] = (string) $theTemplate;

$theTemplate->load("ALL");
$theTemplate->tag("add", $template['add']);
echo (string) $theTemplate;
?>
