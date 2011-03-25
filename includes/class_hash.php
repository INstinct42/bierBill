<?php
// Klasse die einen Bestätigungs Hash symbolisiert

class Hash
{
    // Klassen-Variablen    
    private $id;    
    private $hash;
    private $user;
    private $type;
    private $typeId;

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
            if(method_exists($this, $method)) {
                $this->$method($opt_arr[$op]);
            }
        }
    }
    
    // setter
    public function setId($data) {
        $this->id = (integer) $data;
    }
    public function setHash($data) {
        $this->hash = (string) $data;
    }
    public function setUser($data) {
        $this->user = $data;
    }
    public function setType($data) {
        if (!in_array($data, array("payment", "bill", "new", "change"))) {
            throw new Exception("Invalid data for property 'type'");
        }
           $this->type = $data;  
    }
    public function setTypeId($data) {
        $this->typeId = (integer) $data;
    }
    
    // getter
    public function getId() {
        return $this->id;
    }
    public function getHash() {
        return $this->hash;
    }
    public function getUser() {
        return $this->user;
    }
    public function getType() {
        return $this->type;
    }
    public function getTypeId() {
        return $this->typeId;
    }

}
?>
