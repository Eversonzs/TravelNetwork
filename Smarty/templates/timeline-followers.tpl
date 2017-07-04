{include file="header.tpl"}
	<body>
    <div class="container">

      <!-- Timeline
      ================================================= -->
      <div class="timeline">
		{if isset($user)}
        	{foreach name=tbl_users item=smarty_user from=$user}
	          <div class="timeline-cover" style="background: url(images/covers/{if $smarty_user.header_photo}{$smarty_user.header_photo}{else}header_default.jpg{/if}) no-repeat">
	            <!--Timeline Menu for Large Screens-->
	            <div class="timeline-nav-bar hidden-sm hidden-xs">
	              <div class="row">
	                    <div class="col-md-3">
	                      <div class="profile-info">
	                        <img src="images/users/{if $smarty_user.profile_photo}{$smarty_user.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="img-responsive profile-photo" />
	                          <h3>
	                            {$smarty_user.name} {$smarty_user.surname}
	                          </h3>
	                      </div>
	                    </div>
	                    <div class="col-md-9">
	                      <ul class="list-inline profile-menu">
	                        <li><a href="timeline.php?id_user={$smarty_user.id_user}">Timeline</a></li>
	                        <li><a href="timeline-about.php?id_user={$smarty_user.id_user}">About</a></li>
	                        <li><a href="timeline-followers.php?id_user={$smarty_user.id_user}" class="active">Followers</a></li>
                          <li><a href="timeline-following.php?id_user={$smarty_user.id_user}">Following</a></li>
	                      </ul>
	                      <ul class="follow-me list-inline">
	                        <li>{if isset($followers_number)} {$followers_number} followers {/if}</li>
	                        {if $smarty_user.id_user != $smarty.session.id_user}<li>{if $already_following==0}<a class="btn-primary" href="friendship.php?id_user={$smarty_user.id_user}&follow=follow">Follow</a>{else}<a class="btn-primary" href="friendship.php?id_user={$smarty_user.id_user}&follow=unfollow">Unfollow</a>{/if}</li>{/if}
	                      </ul>
	                    </div>
	              </div>
	            </div><!--Timeline Menu for Large Screens End-->

            <!--Timeline Menu for Small Screens-->
            <div class="navbar-mobile hidden-lg hidden-md">
              <div class="profile-info">
                <img src="images/users/{if $smarty_user.profile_photo}{$smarty_user.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="img-responsive profile-photo" />
                <h4>{$smarty_user.name} {$smarty_user.surname}</h4>
              </div>
              <div class="mobile-menu">
                <ul class="list-inline">
                  <li><a href="timeline.php?id_user={$smarty_user.id_user}">Timeline</a></li>
                  <li><a href="timeline-about.php?id_user={$smarty_user.id_user}">About</a></li>
                  <li><a href="timeline-followers.php?id_user={$smarty_user.id_user}" class="active">Followers</a></li>
                  <li><a href="timeline-following.php?id_user={$smarty_user.id_user}">Following</a></li>
                </ul>
                <li>{if isset($followers_number)} {$followers_number} followers {/if}</li>
                {if $smarty_user.id_user != $smarty.session.id_user}<li>{if $already_following==0}<a class="btn-primary" href="friendship.php?id_user={$smarty_user.id_user}&follow=follow">Follow</a>{else}<a class="btn-primary" href="friendship.php?id_user={$smarty_user.id_user}&follow=unfollow">Unfollow</a>{/if}</li>{/if}
              </div>
            </div><!--Timeline Menu for Small Screens End-->    
          </div>
        {/foreach}
      {/if}

        <div id="page-contents">
          <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-7">

              <!-- Friend List
              ================================================= -->
              <div class="friend-list">
                <div class="row">
                  {if isset($followers)}
                    {foreach name=tbl_friends item=smarty_followers from=$followers}
                      <div class="col-md-6 col-sm-6">
                        <div class="friend-card">
                          <img src="images/covers/{if $smarty_followers.header_photo}{$smarty_followers.header_photo}{else}header_default.jpg{/if}" alt="profile-cover" class="img-responsive cover" />
                          <div class="card-info">
                            <img src="images/users/{if $smarty_followers.profile_photo}{$smarty_followers.profile_photo}{else}user_without_photo.jpg{/if}" alt="user" class="profile-photo-lg" />
                            <div class="friend-info">
                              <h5><a href="timeline.php?id_user={$smarty_followers.id_friend}" class="profile-link">{$smarty_followers.name} {$smarty_followers.surname}</a></h5>
                              <p>Student at Harvard</p>
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
                      <a href="timeline-followers.php?pagina={$_prima}&id_user={$smarty_user.id_user}" class="links ion-chevron-left"></a>
                    {/if}
                    {if isset($_prec)}
                        {foreach item=precedente from=$_prec}
                          <a href="timeline-followers.php?pagina={$precedente}&id_user={$smarty_user.id_user}" class="links">{$precedente}</a>
                        {/foreach}
                    {/if}
                    {if isset($_corr)}
                      <a>{$_corr}</a>{/if}
                      {if isset($_succ)}
                        {foreach item=successivo from=$_succ}
                            <a href="timeline-followers.php?pagina={$successivo}&id_user={$smarty_user.id_user}" class="links">{$successivo}</a>
                        {/foreach}
                      {/if}
                    {if isset($_ultima)}
                      <a href="timeline-followers.php?pagina={$_ultima}&id_user={$smarty_user.id_user}" class="links ion-chevron-right"></a>
                    {/if}
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
    </div>

{include file="footer.tpl"}