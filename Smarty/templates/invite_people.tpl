{include file="header.tpl"}
  <body>
    <div id="page-contents">
      <div class="container">
        <div class="row">

          <!-- Newsfeed Common Side Bar Left
          ================================================= -->
          {if isset($event_information)}
            {foreach name=tbl_events item=smarty_event_information from=$event_information}
              <div class="col-md-3 static">
                <div class="profile-card" style="background: linear-gradient(to bottom, rgba(39,170,225,.8), rgba(28,117,188,.8)), url(images/covers/header_default.jpg) no-repeat">
                  <img src="images/users/{if $smarty_event_information.profile_photo}{$smarty_event_information.profile_photo}{else}user_without_photo.jpg{/if}" alt="user" class="profile-photo" />
                  <h4><a href="event_page.php?id_event={$smarty_event_information.id_event}" class="text-white">{$smarty_event_information.event_name}</a></h4>
                </div><!--profile card ends-->
                <ul class="nav-news-feed">
                  <li><i class="icon ion-ios-information"></i><div>{$smarty_event_information.description}</div></li>
                  <li><i class="icon ion-calendar"></i><div>{$smarty_event_information.event_date}</div></li>
                  {if $smarty_event_information.id_user == $smarty.session.id_user && $smarty_event_information.type_participation == "creator" || $smarty_event_information.type_participation == "administrator"}
                    <li><i class="icon ion-ios-people"></i><div><a href="invite_people.php?id_event={$smarty_event_information.id_event}">Invite people</a></div></li>
                  {/if}
                  <li><i class="icon ion-ios-people"></i><div><a href="event_participants.php?id_event={$smarty_event_information.id_event}">Participants</a></div></li>
                  <li><i class="icon ion-ios-location"></i><div><a href="#"></a>{$smarty_event_information.address}</div></li>
                </ul><!--news-feed links ends-->
              </div>
              
              <h3 align="center">Invite People</h3><br>

              <div class="col-md-7">
                <div class="friend-list">
                  <div class="row">
                    {if isset($event_participants)}
                      {foreach name=tbl_participants item=smarty_participants from=$event_participants}
                        <div class="col-md-6 col-sm-6">
                          <div class="friend-card">
                            <img src="images/covers/{if $smarty_participants.header_photo}{$smarty_participants.header_photo}{else}header_default.jpg{/if}" alt="profile-cover" class="img-responsive cover" />
                            <div class="card-info">
                              <img src="images/users/{if $smarty_participants.profile_photo}{$smarty_participants.profile_photo}{else}user_without_photo.jpg{/if}" alt="user" class="profile-photo-lg" />
                              <div class="friend-info">
                                <h5><a href="timeline.php?id_user={$smarty_participants.id_user}" class="profile-link">{$smarty_participants.name} {$smarty_participants.surname}</a></h5>
                                <!-- About me maybe -->
                                {if isset($already_invite)}
                                  {foreach name=tbl_participation item=smarty_already_invite from=$already_invite}
                                    {if $smarty_already_invite.id_user_reciver == $smarty_participants.id_user}
                                      <a href="invite_people.php?id_event={$smarty_event_information.id_event}&id_user={$smarty_participants.id_user}"><button class="btn btn-primary" type="submit" disabled style="float: right;">Already invited</button></a>
                                    {else}
                                      <a href="invite_people.php?id_event={$smarty_event_information.id_event}&id_user={$smarty_participants.id_user}"><button class="btn btn-primary" type="submit" style="float: right;">Invite</button></a>
                                    {/if}
                                  {/foreach}
                                {else}
                                  <a href="invite_people.php?id_event={$smarty_event_information.id_event}&id_user={$smarty_participants.id_user}"><button class="btn btn-primary" type="submit" style="float: right;">Invite</button></a>
                                {/if}
                              </div>
                            </div>
                          </div>
                        </div>
                      {/foreach}
                    {/if}
                  </div>
                </div>

            <div class="post-pagination">
              <div class="pagination">
                {if isset($_prima)}
                  <a href="invite_people.php?id_event={$smarty_event_information.id_event}&pagina={$_prima}" class="links ion-chevron-left"></a>
                {/if}
                {if isset($_prec)}{foreach item=precedente from=$_prec}
                  <a href="invite_people.php?id_event={$smarty_event_information.id_event}&pagina={$precedente}" class="links">{$precedente}</a>
                {/foreach}{/if}
                {if isset($_corr)}
                  <a>{$_corr}</a>{/if}
                  {if isset($_succ)}{foreach item=successivo from=$_succ}
                    <a href="invite_people.php?id_event={$smarty_event_information.id_event}&pagina={$successivo}" class="links">{$successivo}</a>
                  {/foreach}{/if}
                {if isset($_ultima)}
                  <a href="invite_people.php?id_event={$smarty_event_information.id_event}&pagina={$_ultima}" class="links ion-chevron-right"></a>
                {/if}
              </div>
            </div>
          {/foreach}
        {/if}
        </div>
      </div>
    </div>
  </div>
{include file="footer.tpl"}