<?php
// Klasse die einen User darstellt

class User
{
    // Klassen-Variablen
    private $id;
    private $name;
    private $mail;
    private $cryptedpw;
    
    private $realname;    
    private $account;   
    private $accept;    

    // Der Konstruktur
    public function  __construct($opt_arr) {
        $this->setOptions($opt_arr);
    }
    
    // magic set function
    public function __set($name, $value)
    {
        $method = "set".$name;
        if (!method_exists($this, $method)) {
            throw new Exception("Invalid property");
        }
        $this->$method($value);
    }
    
    // magic get function
    public function __get($name)
    {
        $method = "get".$name;
        if (!method_exists($this, $method)) {
            throw new Exception("Invalid property");
        }
        return $this->$method();
    }    
    
    // alle Options setzen
    public function setOptions(array $opt_arr) {
        $ops = get_object_vars($this);
        foreach($ops as $op => $value) {
            $method = "set".$op;
            if(method_exists($this, $method)) {
                $this->$method($opt_arr[$op]);
            }
        }
    }
    
    // setter
    public function setId($data) {
        $this->id = (integer) $data;
    }
    public function setName($data) {
        $this->name = (string) $data;
    }
    public function setMail($data) {
        $this->mail = (string) $data;
    }
    public function setCryptedPw($data) {
        $this->cryptedpw = (string) $data;
    }
    
    public function setRealName($data) {
        $this->realname = (string) $data;
    }
    public function setAccount($data) {
        $this->account = (string) $data;
    }
    public function setAccept($data) {
        $this->accept = (boolean) $data;
    }   
    
    // getter
    public function getId() {
        return $this->id;
    }
    public function getName() {
        return $this->name;
    }
    public function getMail() {
        return $this->mail;
    }
    public function getCryptedPw() {
        return $this->cryptedpw;
    }
    
    public function getRealName() {
        return $this->realname;
    }
    public function getAccount() {
        return $this->account;
    }
    public function getAccept() {
        return $this->accept;
    }
}
?>
