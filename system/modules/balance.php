<?php
/* 
	Appointment: Баланс
	File: balance.php 
 
*/
if(!defined('MOZG'))
	die('Hacking attempt!');

if($ajax == 'yes')
	NoAjaxQuery();
include 'system/data/ik_config.php';	
if($logged){
	$act = $_GET['act'];
	 $user_id = $user_info['user_id'];
      $for_user_id = intval($_POST['for_user_id']);
      $nums = str_replace("-", '', $_POST['num']);
     $balanc = $db->super_query("SELECT user_balance, balance_rub FROM `".PREFIX."_users` WHERE user_id = '{$user_id}'");
	$metatags['title'] = $lang['balance'];
	
	switch($act){
	  //################### Выводим фотографию юзера при указании ИД страницы ###################//
  case "checkPaymentUser":
   NoAjaxQuery();
   $id = intval($_POST['id']);
   $row = $db->super_query("SELECT user_photo, user_search_pref FROM `".PREFIX."_users` WHERE user_id = '{$id}'");
   if($row) echo $row['user_search_pref']."|".$row['user_photo'];
   die();
  break;
	//################### Окно передачи голосов ###################//
  case "metodbox_trans":
        if($for_user_id){
   if($balanc['user_balance'] >= "$nums"){

  //###### Считываем и перезаписываем ######//
   $db->query("UPDATE `".PREFIX."_users` SET user_balance = user_balance+{$nums} WHERE user_id = '{$for_user_id}'");
   $db->query("UPDATE `".PREFIX."_users` SET user_balance = user_balance-{$nums} WHERE user_id = '{$user_id}'");
   $db->query("INSERT INTO `".PREFIX."_historytab` SET user_id = '{$user_id}', type = '4', price='{$nums}', status = '-', date = '{$server_time}'");
   $db->query("INSERT INTO `".PREFIX."_historytab` SET user_id = '{$ref_id}', type = '4', price='{$nums}', status = '+', date = '{$server_time}'");
   echo '';
   }
  }

   //Подсчет пользователей
     $rowus = $db->super_query("SELECT COUNT(*) AS cnt FROM `".PREFIX."_users` WHERE user_id");
    $row = $db->super_query("SELECT user_photo, user_id FROM `".PREFIX."_users` WHERE user_id = '{$user_id}'");
   $tpl->load_template('balance/metodbox_trans.tpl');
   if($row['user_photo']){
    $tpl->set('{ava}', $config['home_url'].'uploads/users/'.$row['user_id'].'/50_'.$row['user_photo']);
   } else {
    $tpl->set('{ava}', '/templates/Default/images/no_ava.gif');
   }
   $tpl->set('{balance}', $balanc['user_balance']);
   
   $tpl->set('{cnt}', $rowus['cnt']);
   $tpl->set('{userid}', $row['user_id']);
   $tpl->compile('content');

  AjaxTpl();
  die();
  $tpl->clear();
  $db->free();
  break;
  
  	//################### Окно информации ###################//
  case "metodbox":

   $row = $db->super_query("SELECT user_photo, user_id FROM `".PREFIX."_users` WHERE user_id = '{$user_id}'");
   $tpl->load_template('balance/metodbox.tpl');
   if($row['user_photo']){
    $tpl->set('{ava}', $config['home_url'].'uploads/users/'.$row['user_id'].'/50_'.$row['user_photo']);
   } else {
    $tpl->set('{ava}', '/templates/Default/images/no_ava.gif');
   }
   $tpl->set('{balance}', $balanc['user_balance']);
   $tpl->set('{cnt}', $rowus['cnt']);
   $tpl->set('{userid}', $row['user_id']);
   $tpl->compile('content');

  AjaxTpl();
  die();
  $tpl->clear();
  $db->free();
  break;
  
  
   case "resultweb":
	
$LMI_PAYMENT_AMOUNT = $_POST['LMI_PAYMENT_AMOUNT'];
$LMI_PAYMENT_NO = $_POST['LMI_PAYMENT_NO'];	
	if($LMI_PAYMENT_AMOUNT) {
 $db->query("INSERT INTO `".PREFIX."_test` SET pole1 = '{$user_id}', pole2 = '{$LMI_PAYMENT_AMOUNT}', pole3='{$LMI_PAYMENT_NO}', pole4 = 'тест'");
} 
  break;
  
//################### Окно invite ###################//
  case "metodbox_invite":

   $row = $db->super_query("SELECT user_photo, user_id FROM `".PREFIX."_users` WHERE user_id = '{$user_id}'");
   $tpl->load_template('balance/metodbox_invite.tpl');
   if($row['user_photo']){
    $tpl->set('{ava}', $config['home_url'].'uploads/users/'.$row['user_id'].'/50_'.$row['user_photo']);
   } else {
    $tpl->set('{ava}', '/templates/Default/images/no_ava.gif');
   }
   $tpl->set('{balance}', $balanc['user_balance']);
   $tpl->set('{cnt}', $rowus['cnt']);
   $tpl->set('{userid}', $row['user_id']);
   $tpl->compile('content');

  AjaxTpl();
  die();
  $tpl->clear();
  $db->free();
  break;

//################### Окно Платежные системы ###################//
  case "metodbox_emoney":

    $row = $db->super_query("SELECT user_photo, user_id FROM `".PREFIX."_users` WHERE user_id = '{$user_id}'");
   $tpl->load_template('balance/metodbox_emoney.tpl');
   if($row['user_photo']){
    $tpl->set('{ava}', $config['home_url'].'uploads/users/'.$row['user_id'].'/50_'.$row['user_photo']);
   } else {
    $tpl->set('{ava}', '/templates/Default/images/no_ava.gif');
   }
   $tpl->set('{system}', $configik['payment_systems']);
   $tpl->set('{balance}', $balanc['user_balance']);
   $tpl->set('{cnt}', $rowus['cnt']);
   $tpl->set('{userid}', $row['user_id']);
   $tpl->compile('content');

  AjaxTpl();
  die();
  $tpl->clear();
  $db->free();
  break;  
  
 
		
				//################### История операции ###################//
		case "history":
			$tpl->load_template('balance/history.tpl');
			$tpl->compile('info');
		    $sql_ = $db->super_query("SELECT payment_user,payment_cont,payment_money,payment_datecreat FROM `".PREFIX."_payments` WHERE payment_user = '{$user_id}' ORDER by `payment_datepay` DESC LIMIT 20",1);
            if($sql_){
				$tpl->load_template('balance/HistoryOperation.tpl');
				foreach($sql_ as $row){
			     	$tpl->set('{price}', $row['payment_money']);		
					if($row['payment_cont']=='оплачен')$tpl->set('{status}', 'Оплачен');
					if($row['payment_cont']=='-')$tpl->set('{status}', 'Отнято -');
					$tpl->set('{date}', date("m.d.y в H:i", $row['payment_datecreat']));
					$tpl->compile('content');
				}
			} else msgbox('', '<br /> <br />Вы еще не совершали никаких действий... <br /> <br /><br />', 'info_2'); 
		break;
		
		
		//################### Страница приглашения дург ###################//
		case "invite":
			$tpl->load_template('balance/invite.tpl');
			$tpl->set('{uid}', $user_id);
			$tpl->compile('content');
		break;
		
		//################### Страница СМС комерции ###################//
		case "metodbox_sms":
		$row = $db->super_query("SELECT user_photo, user_id FROM `".PREFIX."_users` WHERE user_id = '{$user_id}'");
   $tpl->load_template('balance/metodbox_sms.tpl');
   if($row['user_photo']){
    $tpl->set('{ava}', $config['home_url'].'uploads/users/'.$row['user_id'].'/50_'.$row['user_photo']);
   } else {
    $tpl->set('{ava}', '/templates/Default/images/no_ava.gif');
   }
   $tpl->set('{system}', $configik['mobile']);
   $tpl->set('{balance}', $balanc['user_balance']);
   $tpl->set('{cnt}', $rowus['cnt']);
   $tpl->set('{userid}', $row['user_id']);
   $tpl->compile('content');
  AjaxTpl();
  die();
  $tpl->clear();
  $db->free();
		break;
		
		//################### Страница  Банкоматы ###################//
		case "metodbox_bank":
		$row = $db->super_query("SELECT user_photo, user_id FROM `".PREFIX."_users` WHERE user_id = '{$user_id}'");
   $tpl->load_template('balance/metodbox_bank.tpl');
   if($row['user_photo']){
    $tpl->set('{ava}', $config['home_url'].'uploads/users/'.$row['user_id'].'/50_'.$row['user_photo']);
   } else {
    $tpl->set('{ava}', '/templates/Default/images/no_ava.gif');
   }
   $tpl->set('{system}', $configik['costik_balance']);
   $tpl->set('{balance}', $balanc['user_balance']);
   $tpl->set('{cnt}', $rowus['cnt']);
   $tpl->set('{userid}', $row['user_id']);
   $tpl->compile('content');
  AjaxTpl();
  die();
  $tpl->clear();
  $db->free();
		break;
		///#############Подтверждение платежа############/
		case "active":
		$row = $db->super_query("SELECT user_photo, user_id FROM `".PREFIX."_users` WHERE user_id = '{$user_id}'");
   $tpl->load_template('balance/active.tpl');
   if($row['user_photo']){
    $tpl->set('{ava}', $config['home_url'].'uploads/users/'.$row['user_id'].'/50_'.$row['user_photo']);
   } else {
    $tpl->set('{ava}', '/templates/Default/images/no_ava.gif');
   }
	$result = "Возникла ошибка";
	$cur = $_POST['ik_cur'];
	$ik_am = $_POST['ik_am'];
	if($cur == 'RUB' or $cur == 'UAH' or $cur == 'EUR' or $cur == 'USD'){
	if(ctype_digit($ik_am)) {
	if ($ik_am != '0') {
	if(isset($_POST['ik_am'])) {
		$cur = $_POST['ik_cur'];
		$money = number_format((int)$_POST['ik_am'], 2, '.', '');
		include_once 'variable_secret_key.php';
		
		$ik_co_id = $configik['id_k'];
		$ik_pm_no = $user_info['user_id'];
		$ik_am = $_POST['ik_am'];
		$ik_pw_on = $_POST['ik_pw_on'];
		$ik_cur  = $cur;
		$ik_desc = $configik['rewiew'];
		$ik_key = $secret_key;
		
		
		$result = <<<H
		<p>Купить голосов на сумму: {$money} {$ik_cur}</p>
		<form id="payment" name="payment" method="post" action="https://sci.interkassa.com/" enctype="utf-8">
        <input type="hidden" name="ik_am" value="{$ik_am}" />
        <input type="hidden" name="ik_co_id" value="{$ik_co_id}" />
        <input type="hidden" name="ik_cur" value="{$ik_cur}">
        <input type="hidden" name="ik_desc" value="{$ik_desc}">
        <input type="hidden" name="ik_pm_no" value="{$ik_pm_no}">
        <input type="hidden" name="ik_sign" value="{$sign}">
		<input type="hidden" name="ik_pw_on" value="{$ik_pw_on}">
		
        <button style="background: rgb(81, 163, 178);width: 154px;border: none;color: white;font-size: 13px;height: 23px;cursor: pointer;margin-top: 5px;" type="submit" name="ik_inv_st" "="">Подтвердить</button>
		</form>
H;

}
} else {
 $result = "Сумма пополнения не может быть равна нулю";
}
} else {
 $result = "В поле сумма можно вводить только цифры";
}
} else {
$result = "Недействительная валюта";
}


	$tpl->load_template('balance/active.tpl');
	   $tpl->set('{balance}', $balanc['user_balance']);
   $tpl->set('{cnt}', $rowus['cnt']);
   $tpl->set('{userid}', $row['user_id']);
	$tpl->set('{result}', $result);
	$tpl->compile('content');
	 AjaxTpl();
  die();
  $tpl->clear();
  $db->free();
		break;
		//################### Страница приглашённых друзей ###################//
		case "invited":
			$tpl->load_template('balance/invited.tpl');
			$tpl->compile('info');
			$sql_ = $db->super_query("SELECT tb1.ruid, tb2.user_name, user_search_pref, user_birthday, user_last_visit, user_photo FROM `".PREFIX."_invites` tb1, `".PREFIX."_users` tb2 WHERE tb1.uid = '{$user_id}' AND tb1.ruid = tb2.user_id", 1);
			if($sql_){
				$tpl->load_template('balance/invitedUser.tpl');
				foreach($sql_ as $row){
					$user_country_city_name = explode('|', $row['user_country_city_name']);
					$tpl->set('{country}', $user_country_city_name[0]);

					if($user_country_city_name[1])
						$tpl->set('{city}', ', '.$user_country_city_name[1]);
					else
						$tpl->set('{city}', '');

					$tpl->set('{user-id}', $row['ruid']);
					$tpl->set('{name}', $row['user_search_pref']);
					
					if($row['user_photo'])
						$tpl->set('{ava}', '/uploads/users/'.$row['ruid'].'/100_'.$row['user_photo']);
					else
						$tpl->set('{ava}', '{theme}/images/100_no_ava.png');
					
					//Возраст юзера
					$user_birthday = explode('-', $row['user_birthday']);
					$tpl->set('{age}', user_age($user_birthday[0], $user_birthday[1], $user_birthday[2]));
					
					OnlineTpl($row['user_last_visit']);
					$tpl->compile('content');
				}
			} else
				msgbox('', '<br /><br />Вы еще никого не приглашали.<br /><br /><br />', 'info_2');
		break;
		//################### Страница покупки рублей ###################//
		case "metodbox_rub":
			
			NoAjaxQuery();
			
			$owner = $db->super_query("SELECT user_balance, balance_rub FROM `".PREFIX."_users` WHERE user_id = '{$user_id}'");
			
			$tpl->load_template('balance/metodbox_rub.tpl');
			
			if($user_info['user_photo']) $tpl->set('{ava}', "/uploads/users/{$user_info['user_id']}/50_{$user_info['user_photo']}");
			else $tpl->set('{ava}', "{theme}/images/no_ava_50.png");

			$tpl->set('{balance}', $owner['user_balance']);
			$tpl->set('{rub}', $owner['balance_rub']);
			$tpl->set('{cost}', $config['cost_balance2']);

			$tpl->compile('content');
			
			AjaxTpl();
			
			exit();
			
		break;
			
		//################### Завершение покупки голосов ###################//
		case "ok_rub":
			
			NoAjaxQuery();
			
			$num = intval($_POST['num']);
			if($num <= 0) $num = 0;
			
			$resCost = $num / 2;

			//Выводим тек. баланс юзера (руб.)
			$owner = $db->super_query("SELECT user_balance, balance_rub FROM `".PREFIX."_users` WHERE user_id = '{$user_id}'");
			
			if($owner['user_balance'] >= $resCost){
				$user_balance = $owner['user_balance'];
				$balance_rub = $owner['balance_rub'];
				$balance_rub += $num;
				$user_balance -= $resCost;
				$db->query("UPDATE `".PREFIX."_users` SET balance_rub = '{$balance_rub}', user_balance = '{$user_balance}' WHERE user_id = '{$user_id}'");

				
			} else
				echo '1';
			
			exit();
			
		break;
		default:
		
			//################### Вывод текущего счета ###################//
			$owner = $db->super_query("SELECT user_balance, balance_rub FROM `".PREFIX."_users` WHERE user_id = '{$user_id}'");
			$tpl->load_template('balance/main.tpl');
			$tpl->set('{ubm}', $owner['user_balance']);
			$tpl->set('{rub}', $owner['balance_rub']);
			$tpl->set('{text-rub}', declOfNum($owner['balance_rub'], array('рубль', 'рубля', 'рублей')));
			$tpl->set('{price}', declOfNum($owner['balance_rub'], array('голос', 'голоса', 'голосов')));
			$tpl->compile('content');
	}
	$tpl->clear();
	$db->free();
} else {
	$user_speedbar = $lang['no_infooo'];
	msgbox('', $lang['not_logged'], 'info');
}
?>