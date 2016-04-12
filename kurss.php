<?php
/*========================================== 
	Appointment (Название) - kurs
	File (Фаил): kurss.php 
	Authors(Авторы) - JacksScripts and viiprogrammer
===========================================*/
$curs = array();
function get_timestamp($date)
 {
     list($d, $m, $y) = explode('.', $date);
     return mktime(0, 0, 0, $m, $d, $y);
 } 
if(!$xml=simplexml_load_file('http://www.cbr.ru/scripts/XML_daily.asp')) die('Ошибка загрузки XML');
$curs['date']=get_timestamp($xml->attributes()->Date);
 
foreach($xml->Valute as $m){
   if($m->CharCode=="USD" || $m->CharCode=="EUR" || $m->CharCode=="UAH"){
    $curs[(string)$m->CharCode]=(float)str_replace(",", ".", (string)$m->Value);
   }
  }
 $curss['UAH'] = $curs['UAH'] / 10 ;
echo 'Курс евро: '.$curs['EUR'].'р ';
echo 'Курс доллора: '.$curs['USD'].'р ';
echo 'Курс UAH: '.$curss['UAH'].'р ';



?>

