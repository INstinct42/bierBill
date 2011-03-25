<?php
// Klasse die eine Zahlung symbolisiert

class Payment
{
    // Klassen-Variablen
    private $id;
    private $date;
    private $payer;
    private $payee;
    private $amount;
    private $desc;
    private $confirmed;

    // Der Konstruktur
    public function  __construct($opt_arr = array()) {
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
        
        foreach($opt_arr as $op => $value) {
            $method = "set".$op;
            if(method_exists($this, $method) && property_exists($this, $op)) {
                $this->$method($opt_arr[$op]);
            }
        }
    }
    
    // setter
    public function setId($data) {
        $this->id = (integer) $data;
    }
    public function setDate($data) {
        $this->date = (integer) $data;
    }
    public function setPayer($data) {
        $this->payer = $data;
    }
    public function setPayee($data) {
        $this->payee = $data;
    }
    public function setAmount($data) {
        $this->amount = (float) $data;
    }
    public function setDesc($data) {
        $this->desc = (string) $data;
    }
    public function setConfirmed($data) {
        $this->confirmed = (boolean) $data;
    }    
    
    // getter
    public function getId() {
        return $this->id;
    }
    public function getDate() {
        return $this->date;
    }
    public function getPayer() {
        return $this->payer;
    }
    public function getPayee() {
        return $this->payee;
    }
    public function getAmount() {
        return $this->amount;
    }
    public function getDesc() {
        return $this->desc;
    }
    public function getConfirmed() {
        return $this->confirmed;
    }

}
?>
