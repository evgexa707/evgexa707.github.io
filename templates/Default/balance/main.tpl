<script type="text/javascript" src="{theme}/js/balance.js"></script>
<div class="search_form_tab" style="margin-top:-9px">
<div class="bg_block" >
 <div class="buttonsprofile albumsbuttonsprofile buttonsprofileSecond" style="height:22px">
  <a href="/settings" onClick="Page.Go(this.href); return false;"><div><b>Настройки</b></div></a>
  <div class="buttonsprofileSec"><a href="/balance" onClick="Page.Go(this.href); return false;"><div><b>Личный счёт</b></div></a></div>
  <a href="/balance?act=invite" onClick="Page.Go(this.href); return false;"><div><b>Пригласить друга</b></div></a>
  <a href="/balance?act=invited" onClick="Page.Go(this.href); return false;"><div><b>Приглашённые друзья</b></div></a> 
  <a href="/balance?act=history" onClick="Page.Go(this.href); return false;"><div><b>История</b></div></a>
 </div>
</div></div>
<div class="bg_block" >
<div class="margin_top_10"></div><div class="allbar_title">Состояние личного счёта</div>
<div class="ubm_descr">
<b>Голоса</b> – это универсальная валюта для всех приложений на нашем сайте. Кроме этого, голосами можно оплатить подарки. Голосами нельзя оплатить рекламу. Обратите внимание, что услуга считается оказанной в момент зачисления голосов, возврат невозможен. Кроме этого за каждого приглашённого друга по вашей ссылке, вы будете получать по <b>10 голосов</b>, также каждый день на ваш счёт будет начислятся по <b>1 голосу</b>, если вы заходили в течении дня на сайт.
<br />
<br />
<center><span class="color777">На Вашем счёте:</span>&nbsp;&nbsp; <b><span id="num2">{ubm}</span> {price} и {rub} {text-rub}</b></center>
<div style="line-height:15px;margin-left:172px;margin-top:15px"><button onClick="payment.metodbox(); return false;" style="background:#527498;width: 154px;border: none;color: white;font-size: 13px;height: 23px;cursor: pointer;">Получить голоса</button></div>
<div  style="line-height:15px;margin-left:172px;margin-top:15px"><button onClick="payment.addbox();" style="background: rgb(142, 148, 148);  width: 154px;  border: none;  color: white;  font-size: 13px;  height: 23px;  cursor: pointer;">Передать голоса</button></div>
<div  style="line-height:15px;margin-left:172px;margin-top:15px"><button onClick="payment.mt_rub();" style="background: rgb(142, 148, 148);  width: 154px;  border: none;  color: white;  font-size: 13px;  height: 23px;  cursor: pointer;">Обменять на рубли</button></div>
</div></div>