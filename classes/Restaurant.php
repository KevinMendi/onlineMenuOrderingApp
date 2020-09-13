<?php
/*Add this function to every pages
function __autoload($class)
{
	require_once "classes/$class.php";
}
*/

class Restaurant extends Db
{
    ////////////////////ADD METHOD///////////////////////
	public function insert($fields,$table_name)
	{
	$implodeColumns = implode(', ',array_keys($fields));
	$implodePlaceholder = implode(", :", array_keys($fields));
	//$sql = "INSERT INTO tb_companies ($implodeColumns) VALUES (:".$implodePlaceholder.")";

	$sql = "";
	$sql.="INSERT INTO ".$table_name;
	$sql.=" (".$implodeColumns.") ";
	$sql.="VALUES (:".$implodePlaceholder.")";

	$stmt = $this->connect()->prepare($sql);

		foreach ($fields as $key => $value) {
			$stmt->bindValue(':'.$key,$value);
		}

		$stmtExec = $stmt->execute();

		if ($stmtExec) {
			return true;
			
		}
		else
		{
			return false;
		}


	}
	
////////////////////END ADD METHOD///////////////////


public function credentialCheck($username, $password)
	{
	
		$sql = "SELECT * FROM tb_customer WHERE username = :username";

		
		//$this is a reference of this class as well as Db
		$stmt = $this->connect()->prepare($sql);
		$stmt->bindValue(':username', $username);
		$stmt->execute();
		$result = $stmt->fetch(PDO::FETCH_ASSOC);
		if($result === false)
		{
			return false;
			exit;
		}
		else
		{
			$validPassword = password_verify($password, $result['password']);
			 if($validPassword){
			 		$_SESSION['customer_id'] = $result['customer_id'];
					 $_SESSION['f_name'] = $result['f_name'];
					 $_SESSION['l_name'] = $result['l_name'];
			 		$_SESSION['username'] = $result['username'];
			 		$_SESSION['logged_in_time'] = time();
			 		return true;
			 		exit;       
        	}
         	else
         	{
            	return false;
            	exit;
        	}
		}

	}

	public function productList($category)
	{

		if ($category == 0)
		{
			$sql = "SELECT * FROM tb_fooditem";
		}
		else{
			$sql = "SELECT f.fooditem_ID, f.menucat_ID, f.name, f.description, f.unit, f.price, f.img_directory, m.menucat_ID, m.name
			FROM tb_fooditem AS f INNER JOIN tb_menucategory AS m ON f.menucat_ID = m.menucat_ID WHERE m.menucat_ID = ".$category;
		}

		// $sql = "SELECT * FROM tb_fooditem";
		
			
			
		
		
		
		//$this is a reference of this class as well as Db
		$result = $this->connect()->query($sql);

		if($result->rowCount() > 0)
		{
			//
			while ($row = $result->fetch())
			{
				$data[] = $row;
			}
			return $data;
		}
	}

	public function productList2()
	{

		$sql = "SELECT * FROM tb_fooditem";
		
		
		//$this is a reference of this class as well as Db
		$result = $this->connect()->query($sql);

		if($result->rowCount() > 0)
		{
			//
			while ($row = $result->fetch())
			{
				$data[] = $row;
			}
			return $data;
		}
	}

	public function readProductDetails($id)
	{
		
		$sql = "SELECT * FROM tb_fooditem WHERE fooditem_id = :id";

		$stmt = $this->connect()->prepare($sql);
		$stmt->bindValue(":id",$id);
		$stmt->execute();
		$result = $stmt->fetch(PDO::FETCH_ASSOC);
		return $result;
	}

}