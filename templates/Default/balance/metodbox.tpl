<div class="miniature_box">
 <div class="miniature_pos" style="width:500px">
  <div class="payment_title">
   <img src="{ava}" width="50" height="50" />
   <div class="fl_l">
   Выберите способ пополнения голосов.<br />
    Ваш текущий баланс: <b>{balance} голос</b>
   </div>
   <div class="fl_r">
    <a class="cursor_pointer" onClick="viiBox.clos('metodbox', 1)">Закрыть</a>
   </div>
   <div class="clear"></div>
  </div>
  <div class="clear"></div>
<div class="err_red no_display name_errors" id="nowork" style="font-weight:normal;">Данный способ пополнения находится в разработке.</div>
<div id="payments_getvotes_method">

<a class="payments_getvotes_method_opt" onClick="viiBox.clos('metodbox', 1);payment.mt_invite();">
<div class="payments_getvotes_method_img payments_method_offers"> </div>
<div class="payments_getvotes_method_text">
<h2>Бесплатный способ</h2>
 Пополнение счета с помощью приглашения ваших друзей на проект.
</div>
</a>

<a class="payments_getvotes_method_opt" onClick="viiBox.clos('metodbox', 1);payment.mt_sms();">
<div class="payments_getvotes_method_img payments_method_sms"> </div>
<div class="payments_getvotes_method_text">
<h2>SMS сообщение</h2>
 Пополнение баланса при помощи отправки недорогих SMS-сообщений.
</div>
</a>

<a class="payments_getvotes_method_opt" onClick="viiBox.clos('metodbox', 1);payment.mt_bank();">
<div class="payments_getvotes_method_img payments_method_term"> </div>
<div class="payments_getvotes_method_text">
<h2>Банкоматы</h2>
Экономичный способ пополнения счета, с помощью банкомата.
</div>
</a>

<a class="payments_getvotes_method_opt" onClick="viiBox.clos('metodbox', 1);payment.mt_emoney();">
<div class="payments_getvotes_method_img payments_method_ps"> </div>
<div class="payments_getvotes_method_text">
<h2>Электронные деньги</h2>
 Пополнение баланса через электронные деньги(WebMoney, Яндекс.Деньги и др.)
</div>
</a>
 </div>
 </div>