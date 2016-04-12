<?php
/* 
	Appointment: Настройки оплаты
	File: Balance.php
	Author: viiprogrammer and JacksScripts
	Engine: Vii Engine
	NiceSay Project
	Данный код защищен авторскими правами
*/
if(!defined('MOZG'))
	die('Hacking attempt!');

	include ENGINE_DIR.'/data/ik_config.php';
//Если сохраянем
if(isset($_POST['saveconf'])){
	$saves = $_POST['save'];

	$find[] = "'\r'";
	$replace[] = "";
	$find[] = "'\n'";
	$replace[] = "";
	
	$handler = fopen(ENGINE_DIR.'/data/ik_config.php', "w");
	fwrite($handler, "<?php \n\n//System Configurations ik\n\n\$configik = array (\n\n");
	
	foreach($saves as $name => $value ) {
			
		$value = str_replace("$", "&#036;", $value);
		$value = str_replace("{", "&#123;", $value);
		$value = str_replace("}", "&#125;", $value);
		
		$name = str_replace("$", "&#036;", $name);
		$name = str_replace("{", "&#123;", $name);
		$name = str_replace("}", "&#125;", $name);
		
		$value = $db->safesql($value);
		
		fwrite($handler, "'{$name}' => \"{$value}\",\n\n");
	}
	
	fwrite($handler, ");\n\n?>" );
	fclose($handler);
	
	msgbox('Настройки сохранены', 'Настройки оплаты были успешно сохранены!', '?mod=interkassa');
} else {
	echoheader();
	echohtmlstart('Настройки');
		
	echo <<<HTML
<style type="text/css" media="all">
.inpu{width:300px;}
textarea{width:300px;height:100px;}
</style>

<form method="POST" action="">
<div class="fllogall">ID кассы:</div><input type="text" name="save[id_k]" class="inpu" value="{$configik['id_k']}" /><div class="mgcler"></div>
<div class="fllogall">Стоимость 1 голоса в рублях(целое число):</div><input type="text" name="save[costik_balance]" class="inpu" value="{$configik['costik_balance']}" /><div class="mgcler"></div>
<div class="fllogall">Описание выводимое при оплате:</div><input type="text" name="save[rewiew]" class="inpu" value="{$configik['rewiew']}" /><div class="mgcler"></div>
<div class="fllogall">Мобильная комерция:</div><input type="text" name="save[mobile]" class="inpu" value="{$configik['mobile']}" /><div class="mgcler"></div>
<div class="fllogall">Банковский счет:</div><input type="text" name="save[bank_account]" class="inpu" value="{$configik['bank_account']}" /><div class="mgcler"></div>
<div class="fllogall">Платежные системы:</div><input type="text" name="save[payment_systems]" class="inpu" value="{$configik['payment_systems']}" /><div class="mgcler"></div>
HTML;



	echo <<<HTML

<div class="fllogall">&nbsp;</div><input type="submit" value="Сохранить" name="saveconf" class="inp" style="margin-top:0px" />

</form>
HTML;

htmlclear();

$uid = intval($_GET['id']);
if($uid <= 0) $uid = '';
if($uid){$sql_where = "tb1.user_id = '{$uid}'";
$sql_where_a = "WHERE  user_id = '{$uid}'";}
if($_GET['page'] > 0) $page = intval($_GET['page']); else $page = 1;$gcount = 20;$limit_page = ($page-1)*$gcount;
$sql_ = $db->super_query("SELECT tb1.payment_user, payment_id, payment_cont, payment_money, tb2.user_search_pref, user_balance FROM `".PREFIX."_payments` tb1, `".PREFIX."_users` tb2 WHERE tb1.payment_user = tb2.user_id {$sql_where} ORDER by `payment_id` DESC LIMIT {$limit_page}, {$gcount}", 1);
$numRows = $db->super_query("SELECT COUNT(*) AS cnt FROM `".PREFIX."_payments` {$sql_where_a}");
if($sql_){foreach($sql_ as $row){$row['date'] = langdate('j F Y', strtotime($row['date']));
$res .= <<<HTML
<div style="float:left;padding:5px;width:160px;text-align:center;border-bottom:1px dashed #ddd">{$row['user_search_pref']}</div>
<div style="float:left;padding:5px;width:110px;text-align:center;margin-left:1px;border-bottom:1px dashed #ddd">{$row['payment_id']}</div>
<div style="float:left;padding:5px;width:70px;text-align:center;margin-left:1px;border-bottom:1px dashed #ddd">{$row['payment_money']}</div>
<div style="float:left;padding:5px;width:98px;text-align:center;margin-left:1px;border-bottom:1px dashed #ddd">{$row['user_balance']}</div>
<div style="float:left;padding:5px;width:108px;text-align:center;margin-left:1px;border-bottom:1px dashed #ddd">{$row['payment_cont']}</div>
HTML;
}
} else $res = '<center><br /><br /><br /><br /><br />Пока что нет счетов</center>';
echo <<<HTML
<br />
Поиск по ID пользователя: &nbsp; 
<input type="text" class="inpu" id="uid" style="width: 200px;margin-bottom:10px" value="{$uid}" />
<input type="submit" class="inp" style="margin-bottom:10px;margin-top:0px" onClick="window.location.href = '?mod=balance&id='+document.getElementById('uid').value" />
<div class="clr"></div>
HTML;
echohtmlstart('Отчеты ('.$numRows['cnt'].')');
echo <<<HTML
<div style="background:#f0f0f0;float:left;padding:5px;width:160px;text-align:center;font-weight:bold;margin-top:-5px">Пользователь</div>
<div style="background:#f0f0f0;float:left;padding:5px;width:110px;text-align:center;font-weight:bold;margin-top:-5px;margin-left:1px">Номер</div>
<div style="background:#f0f0f0;float:left;padding:5px;width:70px;text-align:center;font-weight:bold;margin-top:-5px;margin-left:1px">Сумма</div>
<div style="background:#f0f0f0;float:left;padding:5px;width:98px;text-align:center;font-weight:bold;margin-top:-5px;margin-left:1px">Общий баланс</div>
<div style="background:#f0f0f0;float:left;padding:5px;width:108px;text-align:center;font-weight:bold;margin-top:-5px;margin-left:1px">Статус</div>
{$res}
<div class="clr" style="margin-top:70px"></div>
HTML;
$query_string = preg_replace("/&page=[0-9]+/i", '', $_SERVER['QUERY_STRING']);
echo navigation($gcount, $numRows['cnt'], '?'.$query_string.'&page=');	
	echohtmlend();
}	
?>