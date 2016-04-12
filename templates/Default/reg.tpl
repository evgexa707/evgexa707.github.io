 <div id="page" class="page"><link rel="stylesheet" href="http://freend.ru/templates/Default/style/animations.css">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<script type="text/javascript" src="http://freend.ru/templates/Default/js/profile.js"></script>
<style>
html, body{background:#486794;overflow:hidden;}
.padcont{
border:0px;
background:none;
padding:0px!important;
}
.content{
width:100% !important
}
.videos_input {
  color: rgb(52, 79, 122);
  border-radius: 2px;
  border: 1px solid #c6d4dc;
  background: #FFFFFF;
}
#text{
color: rgb(255, 255, 255);
  font-weight: 400;
  font-family: Helvetica Neue;
  text-shadow: 1px 1px 0px rgb(52, 79, 122);
}

#footer {
  width: 120%;
  height: 60%;
  position: absolute;
  bottom: 0px;
  background: url('http://freend.ru//templates/Default/images/stickers-bg.png');
  background-size: 40%;
  margin-left: -772px;
  padding-right: 7px;
  border-top: 5px solid #344F7A;
}

#register {
  background: white;
  left: 50%;
  margin-left: -200px;
  position: absolute;
  width: 358px;
  z-index: 1;
  padding: 10px 20px 10px 10px;
  bottom: 47%;
border-radius:4px;
border-bottom:1px solid #C0CAD5;
}

.mainlogo {
  background: url('http://freend.ru//templates/Default/images/logo.png') no-repeat;
  width: 103px;
  height: 81px;
  background-size: 100%;
  position: absolute;
  left: -6%;
  top: -53%;
}
.slideLeft{

	visibility: hidden;
}
.cloud {
  position: absolute;
  width: 100%;
}
</style>
	<div id="content">
<div class="cloud">
<div class="slideLeft duration1">ВКонтакте</div>
<div class="slideLeft duration2">Интернет</div>
<div class="slideLeft duration3">Друзья</div>
<div class="slideLeft duration4">Сообщества</div>
<div class="slideLeft duration17">bienvenue</div>
<div class="slideLeft duration9">Видео</div>
<div class="slideLeft duration5">Общение</div>
<div class="slideLeft duration6">Развлечение</div>
<div class="slideLeft duration7">Добро Пожаловать</div>
<div class="slideLeft duration8">Музыка</div>
<div class="slideLeft duration9">Фотографии</div>
<div class="slideLeft duration10">Медиа</div>
<div class="slideLeft duration8">Новости</div>
<div class="slideLeft duration1">Ласкаво просимо</div>
<div class="slideLeft duration11">Контент</div>
<div class="slideLeft duration4">Сообщества</div>
<div class="slideLeft duration12">Бренды</div>
<div class="slideLeft duration5">Общение</div>
<div class="slideLeft duration13">Коллеги</div>
<div class="slideLeft duration2">Интернет</div>
<div class="slideLeft duration14">Одногруппники</div>
<div class="slideLeft duration15">Welcome</div>

</div>
<div class="headmain">

</div>
<div id="register" >
<div class="mainlogo"></div>

	<div style="margin-top: 20px;position: absolute;right: 0;top: -35%;"><a href="/restore" onclick="restore.Go(this.href); return false" style="color: rgb(255, 255, 255);
text-shadow: 1px 1px 0 rgb(52, 79, 122);">Восстановить пароль</a></div>
    <div class="fl_l" style="margin-left: -120px;">
<div  id="step1" style="margin-top:-10px; position:relative">
<div class="flLg" style="
    float: right;
    margin-bottom: -8px;
    padding-top: 13px;
"><b> Регистрация <b> </div>

<div style="padding-left:130px">
<input type="text" 
	class="videos_input fl_l" 
	style="width:150px;margin-top:10px" 
	maxlength="30" 
	id="name"
	placeholder="Ваше имя"
/><div class="clear"></div>

<input type="text" 
	class="videos_input fl_l" 
	style="width:150px" 
	maxlength="30" 
	id="lastname"
	placeholder="Ваша фамилия"
/><div class="clear"></div>

<div class="clear"></div>
<div class="button_div fl_l"><button onClick="reg.step1(); reg.step2(); return false" style="width:165px">Следующий шаг</button></div>
</div>
<div class="clear"></div>
</div>

<div class="no_display" id="step2" style="margin-top:-10px">

</div>

<div class="no_display" id="step3" style="margin-top:-5px">
<div style="padding-left:130px">
<input type="text" 
	class="videos_input fl_l" 
	style="width:150px;margin-top:10px" 
	maxlength="30" 
	id="email"
	placeholder="Электронный адрес"
/><div class="clear"></div>
<div class="input_hr" style="width:163px"></div>
<input type="password" 
	class="videos_input fl_l" 
	style="width:150px" 
	maxlength="30" 
	id="new_pass"
	placeholder="Пароль"
/><div class="clear"></div>
<div class="input_hr" style="width:163px"></div>
<input type="password" 
	class="videos_input fl_l" 
	style="width:150px" 
	maxlength="30" 
	id="new_pass2"
	placeholder="Еще раз пароль"
/><div class="clear"></div>
<div class="input_hr" style="width:163px"></div>
<div class="clear"></div>
<div class="button_div fl_l"><button onClick="reg.finish(); return false" style="width:165px">Отправить</button></div>
</div>
<div class="clear"></div>
</div>
</div>
<div class="fl_l" style="
    position: relative;
    margin-left: 20px;
"><form method="POST" action="" style="margin-left:-3px">
   <div class="flLg"><b> Вход </b></div><input type="text" name="email" id="log_email" class="videos_input" maxlength="50" style="width:150px" placeholder="Почта">
<div class="clear"></div>
<input type="password" name="password" style="width:150px" id="log_password" class="videos_input" maxlength="50" placeholder="Пароль">
   
<div class="clear"></div>
    <div class="button_div fl_r" style="width: 161px;margin-right:2px"><button name="log_in" id="login_but" style="width: 164px;">Войти</button></div>
<div class="mgclr"></div>
   
  </form></div>
</div></div>
<div class="mgclr"></div>
</div>
<div id="footer">
</div></div>
   <div class="clear"></div>
  </div>
  </div>
  </html>