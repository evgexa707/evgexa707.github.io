<?php
/*========================================== 
	Appointment (Название) - money
	File (Фаил): money.php 
	Authors(Авторы) - JacksScripts and viiprogrammer
===========================================*/
define("MOZG", true);

include 'system/classes/mysql.php';
include 'system/data/db.php';
include 'system/data/ik_config.php';	
include 'kurss.php';

		$id   = abs((int)$_POST['ik_pm_no']);
		$sum  = abs((int)$_POST['ik_am']);
		$cur = $_POST['ik_cur'];
		if($cur == 'RUB'){
		$s = $sum / $configik['costik_balance'];
		} elseif ($cur == 'USD'){
		$s = $sum * $curs['USD'] / $configik['costik_balance'];
		} elseif ($cur == 'EUR') {
		$s = $sum * $curs['EUR'] / $configik['costik_balance'];
		} elseif ($cur == 'UAH') {
		$s = $sum * $curss['UAH'] / $configik['costik_balance'];
		}
		$date = time();
				
		if ($_POST['ik_inv_st'] == "success") {
			$db->query("UPDATE `".PREFIX."_users` SET user_balance = user_balance + '{$s}' WHERE user_id = '{$id}'");
			$db->query("INSERT INTO `". PREFIX ."_payments` (payment_user, payment_datecreat, payment_money, payment_cont, payment_system) VALUES ('$id', '$date', '$s', 'оплачен', 'payeer')");
			
			$file = fopen("balance-ord.txt", "a+");
			fwrite($file, "ID Пользователя: $id; Сумма: $s; Курс: $cur; Дата: $date\n\r");
			fclose($file);
			
		}
?>