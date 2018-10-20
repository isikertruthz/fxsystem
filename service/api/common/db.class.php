<?php
/**
 * 数据库
 */
 class Db
 {
 	public static $dbConfig = array();
 	public static $link = null;
 	public static $connected = false;

 	function __construct($dbConfig='')
 	{
 		if(!is_array($dbConfig)){
 			$dbConfig = array(
 				'hostname'=>DB_HOST,
 				'username'=>DB_USER,
 				'password'=>DB_PASS
 			);
 		}
 		self::$dbConfig = $dbConfig;
 		if(!isset(self::$link)){
 			try {
 				self::$link = new PDO($dbConfig["hostname"],$dbConfig['username'],$dbConfig['password']);
 				self::$connected = true;
 			} catch (Exception $e) {
 				self::throw_exception($e->getMessage());
 			}
 		}
 	}

 	public static function query($sql){
 		$link = self::$link;
	  	$dbstatement = $link->query($sql);
  		$querydata = $dbstatement->fetchAll(PDO::FETCH_OBJ);
  		return $querydata;
 	}

 	public static function exec($sql){
 		$link = self::$link;
	  	$link->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
		$link->exec($sql);
 	}
 } 
$Db=new Db;
 ?>