<div class="miniature_box">
 <div class="miniature_pos" style="width:500px">
  <div class="payment_title">
   <img src="{ava}" width="50" height="50" />
   <div class="fl_l">
   Пополнение голосов через мобильную комерцию.<br />
    Ваш текущий баланс: <b>{balance} голос</b>
   </div>
   <div class="fl_r">
    <a class="cursor_pointer" onClick="viiBox.clos('mt_sms', 1)">Закрыть</a>
   </div>
   <div class="clear"></div>
  </div>
  <div class="clear"></div>
 <center>
 

				<input style="border: 1px solid rgb(189, 189, 189);height: 21px;padding: 1px;margin-bottom: 5px;width: 133px;" type="text" id="ik_am" maxlength="5" placeholder="Укажите сумму" value="">
				<input type="hidden" id="ik_pw_on" value="{system}">				
				<select type="text" id="ik_cur" style="height: 25px;padding: 4px;font-size: 11px; border: 1px solid rgb(189, 189, 189);">  
			<option  value="RUB">RUB</option>  
			<option value="UAH">UAH</option>  
			<option value="EUR">EUR</option> 
			<option value="USD">USD</option> 
			</select>
			
				<button style="background: rgb(81, 163, 178);width: 154px;border: none;color: white;font-size: 13px;height: 23px;cursor:pointer;" type="submit" onClick="payment.mt_active();viiBox.clos('mt_emoney', 1);">Пополнить</button>
		   

</center>
 </div>
 </div>