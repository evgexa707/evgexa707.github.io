<script type="text/javascript">
$(document).ready(function(){
  payment.update();
});
</script>
<div class="miniature_box">
 <div class="miniature_pos" style="width:500px">
  <div class="payment_title">
   <img src="{ava}" width="50" height="50" />
   <div class="fl_l">
    Вы собираетесь пополнить Ваш счёт рублей <br />
    Ваш текущий баланс: <b>{rub} руб.</b>
   </div>
   <div class="fl_r">
    <a class="cursor_pointer" onClick="viiBox.clos('mt_rub', 1)">Закрыть</a>
   </div>
   <div class="clear"></div>
  </div>
  <div class="clear"></div>
  <div class="payment_h2" style="text-align:center">Введите желаемое количество рублей:</div>
  <center>
   <input type="text" class="inpst payment_inp" maxlength="4" id="inp" onKeyUp="payment.update_rub()" />
   <div class="rating_text_balance">У Вас <span id="rt">останется</span> <b id="balance">{balance}</b> голосов</div>
   <input type="hidden" id="sp" value="{balance}" />
   <input type="hidden" id="cost" value="{cost}" />
  </center>
  <div class="button_div fl_l" style="margin-left:210px;margin-top:15px"><button onClick="payment.send_rub()" id="saverate">Обменять</button></div>
  <div class="clear"></div>
 </div>
 <div class="clear" style="height:50px"></div>
</div>