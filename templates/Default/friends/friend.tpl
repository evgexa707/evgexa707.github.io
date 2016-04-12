





<div class="friends_onefriend width_100" id="friend_{user-id}">
 <a href="/u{user-id}" onclick="Page.Go(this.href); return false"><div class="friends_ava"><img src="{ava}" alt="" id="ava_{user-id}"></div></a>
 <div class="fl_l" style="width:266px;color: rgba(123, 123, 123, 1);">
  <a href="/u{user-id}" onclick="Page.Go(this.href); return false" style="font-weight: 400;  text-shadow: -0.05em 0px 0px rgba(68, 99, 131, 0.61);">{name}</a><div class="friends_clr"></div>
<div class=" user_descr">
  <div class="friends_clr"></div>
  <div class="friends_clr"></div>
<div class="friends_clr"></div>
 </div></div>
 <div class="friends_m menuleft fl_r">
  [viewer]<a href="/" onClick="messages.new_({user-id}); return false"><div>Написать сообщение</div></a>[/viewer]
  [owner]<a onMouseDown="friends.delet({user-id}, 0); return false"><div>Убрать из друзей</div></a>[/owner]
  <a href="/albums/{user-id}" onClick="Page.Go(this.href); return false"><div>Альбомы</div></a>
 </div>
</div>







