<?php
/* 
	Appointment: Временное отключение сайта
	File: offline.php
	Author: vii zona 
	Engine: Vii Engine
	Copyright: vii zona (с) 2011
	e-mail: vii zona
	URL: http://viirips.ru/
	ICQ: viirips.ru
	Данный код защищен авторскими правами
*/
if(!defined('MOZG'))
	die("Hacking attempt!");

if($user_info['user_group'] != '1'){
	$tpl->load_template('offline.tpl');
	$config['offline_msg'] = str_replace('&quot;', '"', stripslashes($config['offline_msg']));
	$tpl->set('{reason}', nl2br($config['offline_msg']));
	$tpl->compile('main');
	echo $tpl->result['main'];
	die();
}
?>