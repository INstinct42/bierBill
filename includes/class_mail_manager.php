<?php
// Klasse die die Erstellung und den Versand von Mails regelt

class MailManager
{
    // Klassen-Variablen
    private $sql;
    private $tpl;
    
    // Der Konstruktur
    public function  __construct() {
        global $sql;
        $this->sql = $sql;
        $this->tpl = new Template("mails.tpl");           
    } 
    
    
    // Mail erstellen nach Hash
    public function getMailByHash($hash) {
        $pm = new PaymentMapper();
        $payment = $pm->getById($hash->getTypeId());
        
        $this->tpl->load("CONFIRM_PAYMENT_SUBJECT");
        $subject = (string) $this->tpl;

        $this->tpl->load("CONFIRM_PAYMENT");
        $this->tpl->tag("name", $payment->getPayee()->getRealName());
        $this->tpl->tag("pagename", "bierBill Test");
        $this->tpl->tag("payer", $payment->getPayer()->getRealName());
        $this->tpl->tag("payertext", $payment->getDesc());
        $this->tpl->tag("amount", $payment->getAmount()." €");
        $this->tpl->tag("url", "http://localhost/bierBill/confirm.html?h=".$hash->getHash().$hash->getId());
        $content = (string) $this->tpl;
        
        return new Mail($payment->getPayee()->getMail(), $payment->getPayer()->getMail(), $subject, $content);
    }
}


// Klasse die eine E-Mail repräsentiert
class Mail {
    
    // Klassen-Variablen
    private $to;
    private $from;
    private $subject;
    private $content;
    private $html = true;
        
    // Der Konstruktur
    public function  __construct($TO, $FROM, $SUBJECT, $CONTENT, $HTML = true) {
        $this->to = $TO;
        $this->from = $FROM;
        $this->subject = $SUBJECT;
        $this->content = $CONTENT;
        $this->html = $HTML;      
    } 
    
    
    // Mail versenden
    public function send() {
        $header  = "From: " . $this->from . "\r\n";
        $header .= "X-Mailer: PHP/" . phpversion() . "\r\n";
        $header .= "X-Sender-IP: " . $_SERVER['REMOTE_ADDR'] . "\r\n";
        $header .= "MIME-Version: 1.0" . "\r\n";
        
        if ($this->html) {
            $header .= "Content-Type: text/html; charset=UTF-8";
            $this->content = "<html><body>" . $this->content . "</body></html>";
        } else  {
            $header .= "Content-Type: text/plain; charset=UTF-8";
        }

        return mail($this->to, "=?UTF-8?B?".base64_encode($this->subject)."?=", $this->content, $header);  
    }    
}
?>
