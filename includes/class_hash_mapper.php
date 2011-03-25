<?php
// Klasse die eine Zahlung mit der DB mappt
require("class_hash.php");

class HashMapper
{
    // Klassen-Variablen
    private $sql;

    // Der Konstruktur
    public function  __construct() {
        global $sql;
        $this->sql = $sql;            
    }
    
    // Hash laden
    private function getById($id) {     
        $db_data = $this->sql->getData("confirm_hashes", "*", "WHERE `id`='".$id."'", 1);
        $um = new UserMapper();
        
        $data = array(
            "id" => $db_data['id'],
            "hash" => $db_data['hash'],
            "user" => $um->getById($db_data['for_user_id']),
            "type" => $db_data['type'],
            "typeid" => $db_data['type_id']
        );      
        $hash = new Hash($data);
        return $hash;
    }    
    
    public function getByHashCode($code) {
        $hash = substr($code, 0, 40);
        $id = substr($code, 40); 
        
        $db_data = $this->sql->getData("confirm_hashes", "*", "WHERE `id`='".$id."' AND `hash` = '".$hash."'", 1);
        $um = new UserMapper();
        
        $data = array(
            "id" => $db_data['id'],
            "hash" => $db_data['hash'],
            "user" => $um->getById($db_data['for_user_id']),
            "type" => $db_data['type'],
            "typeid" => $db_data['type_id']
        );      
        $hash = new Hash($hash);       
        return $hash;
    }
    
    
    // save to DB
    public function save($hash) {
        $data = array(
            "hash" => $hash->getHash(),
            "for_user_id" => $hash->getUser()->getId(),
            "type" => $hash->getType(),
            "type_id" => $hash->getTypeId()
        );

        if (null === ($id = $hash->getId())) {
            unset($data['id']);
            $this->sql->setData("confirm_hashes", array_keys($data), $data);
            return $this->getById($this->sql->getInsertId());
        } else {
            $this->sql->updateData("confirm_hashes", array_keys($data), $data, "WHERE `id` = '".$id."' AND `hash` = '".$data['hash']."'");
            return $this->getById($id);
        }
    }
    
    // Create new hash By Payment
    public function createByPayment($payment) {
        $hash = new Hash();
        $hash->setHash($this->calculateHash());
        $hash->setUser($payment->getPayee());
        $hash->setType("payment");
        $hash->setTypeId($payment->getId());
        return $this->save($hash);
    }
    
    
    
    // Calculate Hash
    private function calculateHash() {
        $LENGHT = 40;
        $charset = "abcdefghijklmnopqrstuvwxyz.,:-_!$%{][)(}\?@=ABCDEFGHIJKLMNOPRQSTUVWXYZ0123456789";
        $hash = "";
        $real_strlen = strlen ( $charset ) - 1;
        mt_srand ( (double)microtime () * 1001000 );

        while ( strlen ( $hash ) < $LENGHT ) {
            $hash .= $charset[mt_rand ( 0,$real_strlen ) ];
        }
        return $hash;
    }      
}
?>
