<?php
    class DataBase{
        
        private $hostname;          // MySQL Hostname
    	private $username;          // MySQL Username
    	private $password;          // MySQL Password
    	private $database;          // MySQL Database
        private $conn;              // MySQL Conection
        public  $sql;               // MySQL Query
        public  $returnQuery;       // MySQL Return Query
        
        function __construct(){
            $database = 'focanopreco'; 
            $username = 'root';
            $password = 'aleajactaest';
            $hostname = 'localhost';
            
            $this->database = $database;
    		$this->username = $username;
    		$this->password = $password;
    		$this->hostname = $hostname;
    		
    		$this->Connect();
    	}

    	private function Connect(){
            $this->conn = new mysqli($this->hostname, $this->username, $this->password, $this->database);

            if ($this->conn->error) {
                die("Connection failed: " . $this->conn->error);
            } 
    	}
        
        public function ExecutListQuery(){
            if ($this->returnQuery = $this->conn->query($this->sql)) {
                //return $this->returnQuery;
            }
        }

    	public function Close(){
            $this->conn->close();
    	}
    }
?>