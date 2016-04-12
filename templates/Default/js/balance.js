 var pEnum = 0;
 var payment = {
  addbox: function(){
    viiBox.start();
	$.post('/index.php?go=balance&act=metodbox_trans', function(d){
	  viiBox.win('mt_trans', d);
	});
  },
   metodbox: function(){
    viiBox.start();
	$.post('/index.php?go=balance&act=metodbox', function(d){
	  viiBox.win('metodbox', d);
	});
  },
  mt_rub: function(){
    viiBox.start();
	$.post('/index.php?go=balance&act=metodbox_rub', function(d){
	  viiBox.win('mt_rub', d);
	  $('#inp').focus();
	});
  },
   update_rub: function(){
    var pr = parseInt($('#inp').val());
	if(!isNaN(pr)) $('#inp').val(parseInt($('#inp').val()));
	else $('#inp').val('');
	var m = pr % 2;
	if (m == 0){
	var num = $('#inp').val() / 2;
	var res = ( $('#sp').val() - num );
	$('#balance').text( res );
	if(!$('#inp').val()) $('#balance').text( $('#sp').val() );
	else if(res < 0) $('#balance').text('недостаточно');}
	else if (m != 0)$('#balance').text('нужно больше двух');
  },
  send_rub: function(){
    var num = $('#inp').val();
	var num_2 = num / 2;
	var res = $('#sp').val() - num_2;
	var golos = $('#sp').val() - num_2;
	if(pEnum > 10){
	  alert('Я тебе голову сломаю!');
	  pEnum = 0;
	}
	if(res <= 0) res = 999999999999;
	if(num != 0 && $('#sp').val() >= res){
	  butloading('saverate', 50, 'disabled', '');
      $.post('/index.php?go=balance&act=ok_rub', {num: num}, function(d){
	    if(d == 1){
		  addAllErr('Пополните баланс для покупки.', 3300);
		  return false;
		}
	    $('#num2').text(parseInt(res));
	    $('#rub2').text(parseInt($('#rub2').text()) + parseInt(num));
        viiBox.clos('mt_rub', 1);
      });	
	} else {
	  setErrorInputMsg('inp');
	  pEnum++;
	}
	},
   mt_invite: function(){
    viiBox.start();
	$.post('/index.php?go=balance&act=metodbox_invite', function(d){
	  viiBox.win('mt_invite', d);
	});
  },
  
   mt_emoney: function(){
    viiBox.start();
	$.post('/index.php?go=balance&act=metodbox_emoney', function(d){
	  viiBox.win('mt_emoney', d);
	});
  },
  mt_sms: function(){
    viiBox.start();
	$.post('/index.php?go=balance&act=metodbox_sms', function(d){
	  viiBox.win('mt_sms', d);
	});
  },
  mt_bank: function(){
    viiBox.start();
	$.post('/index.php?go=balance&act=metodbox_bank', function(d){
	  viiBox.win('mt_bank', d);
	});
  },
  mt_active: function(){
    viiBox.start();
	var ik_am = $('#ik_am').val();
	var ik_cur = $('#ik_cur').val();
	var ik_pw_on = $('#ik_pw_on').val();
	$.post('/index.php?go=balance&act=active',{
	ik_am: ik_am,
	ik_cur: ik_cur,
	ik_pw_on: ik_pw_on },	
	function(d){
	  viiBox.win('mt_invite', d);
	});
  },
  nowork_mb:function(){
   $('#nowork').show();
  },
  save: function(u){
  	var numus = parseInt($('#num_balance').text()) - parseInt($('#payment_num').val());
	var add = $('#payment_num').val();
	var upage = $('#upage').val();
	var cnt = $('#cnt').val();
	var userid = $('#userid').val();
	if(parseInt($('#balance').val()) < parseInt($('#payment_num').val())){
	  setErrorInputMsg('payment_num');
	  return false;
	}
if(add != 0){
	if(parseInt($('#cnt').val()) >= parseInt($('#upage').val())){
	if(upage >= 1){
	if(userid != upage){
	  butloading('saverate', 50, 'disabled', '');
	  $.post('/index.php?go=balance&act=payment_2', {for_user_id: upage, num: add}, function(d){
	  $('#num_balance').text(numus);
		viiBox.clos('payment_2', 1);
		Box.Info('msg_info', 'Передача голосов', 'Голоса успешно переданы.' , 300, 1600);
	  });
	  }
	  else
		Box.Info('msg_info', 'Ошибка', 'Нельзя передавать голоса самому себе.' , 300, 1600);
}
	else
	setErrorInputMsg('upage');
}
	else
	setErrorInputMsg('upage');
}
	else
	setErrorInputMsg('payment_num');

  },
  username:function(){
   $('#num').text('Недостаточно');
  },
  update: function(){
    var add = $('#payment_num').val();
	var new_rate = $('#balance').val() - add;
	var pr = parseInt(add);
	if(!isNaN(pr)) $('#payment_num').val(parseInt(add));
	else $('#payment_num').val('');
	if(add && new_rate >= 0){
	  $('#num').text(new_rate);
	  $('#rt').show();
	} else if(new_rate <= 0 || $('#balance').val() <= 0){
	  $('#num').text('Недостаточно');
	  $('#rt').hide();
	} else {
	  $('#rt').show();
	  $('#num').text($('#balance').val());
	}
  }
}
   //Вычесляем юзера по id
	var payments = {
  checkPaymentUser: function(){
	var upage = $('#upage').val();
	var pattern = new RegExp(/^[0-9]+$/);
	if(pattern.test(upage)){
		$.post('/index.php?go=balance&act=checkPaymentUser', {id: upage}, function(d){
		d = d.split('|');
	if(d[0]){
	if(d[1])
		$('#feedimg').attr('src', '/uploads/users/'+upage+'/50_'+d[1]);
	else
		$('#feedimg').attr('src', template_dir+'/images/50_no_ava.png');

	} else {
	  	setErrorInputMsg('upage');
		$('#feedimg').attr('src', template_dir+'/images/contact_info_50.png');
			}
			});
	} else
		$('#feedimg').attr('src', template_dir+'/images/contact_info_50.png');
  }

}