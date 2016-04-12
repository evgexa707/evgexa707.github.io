<?php
/* 
	Appointment: Выбор языка
	File: lang.php 
	Author: vii zona 
	Engine: Vii Engine
	Copyright: vii zona (с) 2011
	e-mail: vii zona
	URL: http://viirips.ru/
	ICQ: viirips.ru
	Данный код защищен авторскими правами
*/
if(!defined('MOZG'))
	die('Hacking attempt!');

NoAjaxQuery();

$tpl->load_template('lang/main.tpl');

$useLang = intval($_COOKIE['lang']);
if($useLang <= 0) $useLang = 1;
$config['lang_list'] = nl2br($config['lang_list']);
$expLangList = explode('<br />', $config['lang_list']);
$numLangs = count($expLangList);
$cil = 0;
foreach($expLangList as $expLangData){
	
	$expLangName = explode(' | ', $expLangData);
	
	if($expLangName[0]){
		
		$cil++;
		
		if($cil == $useLang OR $numLangs == 1)
		
			$langs .= "<div class=\"lang_but lang_selected\">{$expLangName[0]}</div>";
			
		else
		
			$langs .= "<a href=\"/index.php?act=chage_lang&id={$cil}\" style=\"text-decoration:none\"><div class=\"lang_but\">{$expLangName[0]}</div></a>";
		
	}
	
}

if(!$checkLang) $checkLang = 'Russian';

$tpl->set('{langs}', $langs);

$tpl->compile('content');

AjaxTpl();

exit();
?>