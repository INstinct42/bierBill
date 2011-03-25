<?php
// Klasse die eine Zahlung mit der DB mappt
require("class_payment.php");

class PaymentMapper
{
    // Klassen-Variablen
    private $sql;

    // Der Konstruktur
    public function  __construct() {
        global $sql;
        $this->sql = $sql;            
    }
    
    // Payment laden
    public function getById($id) {
        $db_data = $this->sql->getData("payments", "*", "WHERE `id`='".$id."'", 1);
        $um = new UserMapper();
        
        $data = array(
            "id" => $db_data['id'],
            "date" => $db_data['date'],
            "payer" => $um->getById($db_data['payer_id']),
            "payee" =>  $um->getById($db_data['payee_id']),
            "amount" =>  $db_data['amount'],
            "desc" =>  $db_data['desc'],
            "confirmed" =>  $db_data['confirmed']
        );      
        $payment = new Payment($data);
        return $payment;    
    }
    
    
    // save to DB
    public function save($payment) {
        $data = array(
            "date" => $payment->getDate(),
            "payer_id" => $payment->getPayer()->getId(),
            "payee_id" => $payment->getPayee()->getId(),
            "amount" => $payment->getAmount(),
            "desc" => $payment->getDesc(),
            "confirmed" => $payment->getConfirmed()
        );
        
        if (null === ($id = $payment->getId())) {
            unset($data['id']);
            $this->sql->setData("payments", array_keys($data), $data);
            return $this->getById($this->sql->getInsertId());
        } else {
            $this->sql->updateData("payments", array_keys($data), $data, "WHERE `id` = '".$id."'");
            return $this->getById($id);
        }
    }
    
}
?>
