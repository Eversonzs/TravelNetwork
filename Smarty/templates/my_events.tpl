{include file="header.tpl"}
  <body>
    <div id="page-contents">
      <div class="container">
        <div class="row">

          <!-- Newsfeed Common Side Bar Left
          ================================================= -->
          <div class="col-md-3 static">
            <div class="profile-card" style="background: linear-gradient(to bottom, rgba(39,170,225,.8), rgba(28,117,188,.8)), url(images/covers/{if $smarty.session.header_photo}{$smarty.session.header_photo}{else}header_default.jpg{/if}) no-repeat">
              <img src="images/users/{if $smarty.session.profile_photo}{$smarty.session.profile_photo}{else}user_without_photo.jpg{/if}" alt="user" class="profile-photo" />
              <h5><a href="timeline.php?id_user={$smarty.session.id_user}" class="text-white"> {$smarty.session.user_name} </a></h5>
              <a href="timeline-followers.php?id_user={$smarty.session.id_user}" class="text-white"><i class="ion ion-android-person-add"></i>{if isset($followers)} {$followers} followers {/if}</a>
            </div><!--profile card ends-->
            <ul class="nav-news-feed">
              <li><i class="icon ion-ios-paper"></i><div><a href="newsfeed.php">My Newsfeed</a></div></li>
              <li><i class="icon ion-ios-people"></i><div><a href="create_event.php">Create Event</a></div></li>
              <li><i class="icon ion-ios-people"></i><div><a href="my_events.php">My events</a></div></li>
            </ul><!--news-feed links ends-->
          </div>

            <!-- Post Content
            ================================================= -->
            <h3 align="center">My events</h3><br>

            <div class="col-md-7">
                <div class="friend-list">
                  <div class="row">
                    {if isset($my_events)}
                      {foreach name=tbl_events item=smarty_my_events from=$my_events}
                        <div class="col-md-6 col-sm-6">
                          <div class="friend-card">
                            <img src="images/album/event.jpg" alt="profile-cover" class="img-responsive cover" />
                            <div class="card-info">
                              <img src="images/users/{if $smarty.session.profile_photo}{$smarty.session.profile_photo}{else}user_without_photo.jpg{/if}" alt="user" class="profile-photo-lg" />
                              <div class="friend-info">
                                <h5><a href="event_page.php?id_event={$smarty_my_events.id_event}" class="profile-link">{$smarty_my_events.event_name}</a></h5>
                                <!-- About me maybe -->
                                <p>{$smarty_my_events.event_date}</p>
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
                  <a href="my_events.php?pagina={$_prima}" class="links ion-chevron-left"></a>
                {/if}
                {if isset($_prec)}{foreach item=precedente from=$_prec}
                  <a href="my_events.php?pagina={$precedente}" class="links">{$precedente}</a>
                {/foreach}{/if}
                {if isset($_corr)}
                  <a>{$_corr}</a>{/if}
                  {if isset($_succ)}{foreach item=successivo from=$_succ}
                    <a href="my_events.php?pagina={$successivo}" class="links">{$successivo}</a>
                  {/foreach}{/if}
                {if isset($_ultima)}
                  <a href="my_events.php?pagina={$_ultima}" class="links ion-chevron-right"></a>
                {/if}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

{include file="footer.tpl"}