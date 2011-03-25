<?php
// Klasse die einen User mit der DB mappt
require("class_user.php");

class UserMapper
{
    // Klassen-Variablen
    private $sql;

    // Der Konstruktur
    public function  __construct() {
        global $sql;
        $this->sql = $sql;            
    }
    
    // User laden
    public function getById($id) {
        $db_data = $this->sql->getData("users", "*", "WHERE `id`='".$id."'", 1);
        $db_info = $this->sql->getData("user_info", "*", "WHERE `user_id`='".$id."'", 1);
        
        if(!$this->sql->wasGetSuccessful($db_data)) {
            return false;
        }

        $data = array(
            "id" => $db_data['id'],
            "name" => $db_data['name'],
            "mail" => $db_data['mail'],
            "realname" => $db_info['real_name'],
            "account" => $db_info['bank_account'],
            "accept" => $db_info['accept_per_default']
        );
        $user = new User($data);    
        return $user;    
    }
    
    public function getByMail($mail) {
        $db_id = $this->sql->getData("users", "id", "WHERE `mail`='".$mail."'", 1);
        return $this->getById($db_id); 
    }
    
    public function getByRealname($name) {
        $db_id = $this->sql->getData("user_info", "user_id", "WHERE `real_name`='".$name."'", 1);
        return $this->getById($db_id); 
    }    
    
    
    // save to DB
    public function save($user) {
        $data = array(
            "id" => $user->getId(),
            "name" => $user->getName(),
            "mail" => $user->getMail(),
            "password" => $user->getCryptedPw()
        );
        
        $info = array(
            "user_id" => $user->getId(),
            "real_name" => $user->getRealName(),
            "bank_account" => $user->getAccount(),
            "accept_per_default" => $user->getAccept()
        );        
        
        if (!isset($data['id']) || null === $user->getId()) {
            $this->sql->setData("users", array_keys($data), $data);
            $info['user_id'] = $sql->getInsertId();
            $this->sql->setData("user_info", array_keys($info), $info);
        } else {
            $this->sql->updateData("users", array_keys($data), $data, "WHERE `id` = '".$data['id']."'");
            $this->sql->updateData("user_info", array_keys($info), $info, "WHERE `id` = '".$data['id']."'");
        }
        
    }
    
}
?>
