<div id="photo_view_{id}" class="photo_view" onclick="Photo.setEvent(event, '{close-link}')" style="display: block;">
<div class="photo_close" onclick="Photo.Close('{close-link}'); return false;"></div>
 <div class="photo_bg">
  <div class="photo_com_title">[all]Фотография {jid} из {photo-num}[/all][wall]Просмотр фотографии[/wall]<div></div></div><div class="photo_descr clear"> <div id="photo_descr_{id}"></div>Добавлена {date}</div>
  <a href="/photo{uid}_{prev-id}{section}" onclick="Photo.Show(this.href); return false"><div class="photo_prev_but"></div></a>
  <a href="/photo{uid}_{prev-id}{section}" onclick="Photo.Show(this.href); return false"></a>
  
   <div id="distinguishSettings{id}" class="distinguishSettings" style="display:none" onmouseover="Distinguish.HideTag({id})">
  <div style="position:absolute;border-right:3px solid #dbe6f0;cursor:default" id="distinguishSettingsBorder_left{id}"></div>
  <div style="position:absolute;border-bottom:3px solid #dbe6f0;cursor:default" id="distinguishSettingsBorder_top{id}"></div>
  <div style="position:absolute;border-left:3px solid #dbe6f0;cursor:default" id="distinguishSettingsBorder_right{id}"></div>
  <div style="position:absolute;border-top:3px solid #dbe6f0;cursor:default" id="distinguishSettingsBorder_bottom{id}"></div>
    <div style="position:absolute;cursor:default" class="imgareaselect-outer" id="distinguishSettings_left{id}"></div>
  <div style="position:absolute;cursor:default" class="imgareaselect-outer" id="distinguishSettings_top{id}"></div>
  <div style="position:absolute;cursor:default" class="imgareaselect-outer" id="distinguishSettings_right{id}"></div>
  <div style="position:absolute;cursor:default" class="imgareaselect-outer" id="distinguishSettings_bottom{id}"></div>
   </div>
   <a href="/photo{uid}_{prev-id}{section}" onclick="Photo.Show(this.href); return false" id="photo_href"></a><div class="photo_img_box"><a href="/photo{uid}_{prev-id}{section}" onclick="Photo.Show(this.href); return false" id="photo_href"><img id="ladybug_ant{id}" class="ladybug_ant" src="{photo}" alt=""><div id="frameedito{id}"></div></a></div>




















  <div class="clear"></div>
  <div id="save_crop_text{id}" class="save_crop_text no_display">
   Укажите область, которая будет сохранена как фотография Вашей страницы.
   <div class="button_div_gray margin_left fl_r" style="margin-top:-5px"><button onclick="crop.close({id}); return false">Отмена</button></div>
   <div class="button_div fl_r" style="margin-top:-5px"><button onclick="crop.save({id}, 1628); return false">Готово</button></div>
  </div>
<div style="
    background-color: rgb(34, 33, 33);
    height: 50px;
display:none;
    width: 742px;
"></div>
  <div id="pinfo_{id}" class="pinfo">
  <div class="photo_leftcol">



 <div class="ratingbg">
    [not-owner]<div class="ratpos {rate-check}" id="ratpos{id}">
     <div onClick="Photo.addrating(1, {id}, this.style)" class="rating" style="background:url('{theme}/images/rating3.png')">1</div>
     <div onClick="Photo.addrating(2, {id})" class="rating rating2">2</div>
     <div onClick="Photo.addrating(3, {id})" class="rating rating2">3</div>
     <div onClick="Photo.addrating(4, {id})" class="rating rating2">4</div>
     <div onClick="Photo.addrating(5, {id})" class="rating rating2">5</div>
     <div onClick="Photo.addrating(6, {id})" class="rating" style="background:url('{theme}/images/rating2.png')">5+</div>
    </div>
    <img src="{theme}/images/ajax-loader.gif" id="rateload{id}" class="no_display" style="margin-left:255px;margin-top:12px" />
    <div class="ratingyes {rate-check-2}" id="ratingyes{id}"><div class="ratingyestext fl_l">Ваша оценка</div> <div id="addratingyes{id}">{ok-rate}</div></div>[/not-owner]
  [owner]<div class="rateforowne">Всего оценок: &nbsp;<a class="cursor_pointer" onClick="Photo.allrating({id})">{rate-all}</a>&nbsp;&nbsp;&nbsp; Пятерок с плюсом: &nbsp;<a class="cursor_pointer" onClick="Photo.allrating({id})">{rate-max}</a>&nbsp;&nbsp;&nbsp; Рейтинг: &nbsp;<a class="cursor_pointer" onClick="Photo.allrating({id})">{rate}</a></div>[/owner]
   </div>







   <input type="hidden" id="i_left{id}">
   <input type="hidden" id="i_top{id}">
   <input type="hidden" id="i_width{id}">
   <input type="hidden" id="i_height{id}">
  

   <div class="peoples_on_this_photos" id="peoples_on_this_photos{id}"></div>
 
      [all-comm]<a href="/" onClick="comments.all({id}, {num}); return false" id="all_href_lnk_comm_{id}"><div class="photo_all_comm_bg" id="all_lnk_comm_{id}">Показать предыдущие {comm_num}</div></a><span id="all_comments_{id}"></span>[/all-comm]
   <span id="comments_{id}">{comments}</span>


   
   [add-comm]<textarea id="textcom_{id}" class="photo_comm inpst" style="  width: 130% !important;margin-left: 3%;height: 40px;margin-bottom: 10px;margin-top: 13px;border-radius: 2px;"></textarea>
   <div class="button_div fl_l" style="margin-left: 60%;"><button id="add_comm" onclick="comments.add({id}); return false">Отправить</button></div>[/add-comm]











   </div>
  <div class="photo_rightcol1">
   Альбом:<br>
   <a href="/albums/view/{aid}" onclick="Page.Go(this.href); return false">{album-name}</a><br><div class="mgclr"></div>
   Загрузил:<br>
   <div><a href="/u{uid}" onclick="Page.Go(this.href); return false">{author}</a></div><span style="color:#888"></span><div class="mgclr"></div>
  
<a href="/" onclick="Distinguish.Start({id}); return false"><div>Отметить человека</div></a>
   <a href="/" onclick="photoeditor.start('{photo}', '{id}', '1000'); return false"><div>Корректировать</div></a>
   <a href="/" onclick="crop.start({id}); return false"><div>Поместить на мою страницу</div></a>
   <a href="/" onclick="Photo.EditBox({id}, 0); return false"><div>Редактировать</div></a>
   <a href="/" onclick="Photo.MsgDelete({id}, 1707, 1); return false"><div>Удалить</div></a>

   <a onclick="Report.Box('photo', '{id}')"><div>Пожаловаться</div></a>
   <div class="photos_gradus_pos">
    <div class="fl_l">Повернуть:</div>
  <div class="photos_gradus_left fl_l" onclick="Photo.Rotation('right', '{id}')"></div>
  <div class="photos_gradus_right fl_l" onclick="Photo.Rotation('left', '{id}')"></div>
  <div class="fl_l" style="margin-left:5px"><img src="/templates/Default/images/loading_mini.gif" id="loading_gradus{id}" class="no_display"></div>
   </div>
  </div>
 </div>
<div class="clear"></div>
</div></div>