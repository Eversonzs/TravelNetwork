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
	                        <li><a href="timeline-followers.php?id_user={$smarty_user.id_user}">Followers</a></li>
                          <li><a href="timeline-following.php?id_user={$smarty_user.id_user}" class="active">Following</a></li>
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
                  <li><a href="timeline-followers.php?id_user={$smarty_user.id_user}">Followers</a></li>
                  <li><a href="timeline-following.php?id_user={$smarty_user.id_user}" class="active">Following</a></li>
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
                  {if isset($following)}
                    {foreach name=tbl_friends item=smarty_following from=$following}
                      <div class="col-md-6 col-sm-6">
                        <div class="friend-card">
                          <img src="images/covers/{if $smarty_following.header_photo}{$smarty_following.header_photo}{else}header_default.jpg{/if}" alt="profile-cover" class="img-responsive cover" />
                          <div class="card-info">
                            <img src="images/users/{if $smarty_following.profile_photo}{$smarty_following.profile_photo}{else}user_without_photo.jpg{/if}" alt="user" class="profile-photo-lg" />
                            <div class="friend-info">
                              <h5><a href="timeline.php?id_user={$smarty_following.id_user}" class="profile-link">{$smarty_following.name} {$smarty_following.surname}</a></h5>
                              <p>Student at Harvard</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    {/foreach}
                  {/if}
                </div>
              </div>
            </div>

            <div class="col-md-2 static">
              <div id="sticky-sidebar">
                <h4 class="grey">Sarah's activity</h4>
                <div class="feed-item">
                  <div class="live-activity">
                    <p><a href="#" class="profile-link">Sarah</a> Commended on a Photo</p>
                    <p class="text-muted">5 mins ago</p>
                  </div>
                </div>
                <div class="feed-item">
                  <div class="live-activity">
                    <p><a href="#" class="profile-link">Sarah</a> Has posted a photo</p>
                    <p class="text-muted">an hour ago</p>
                  </div>
                </div>
                <div class="feed-item">
                  <div class="live-activity">
                    <p><a href="#" class="profile-link">Sarah</a> Liked her friend's post</p>
                    <p class="text-muted">4 hours ago</p>
                  </div>
                </div>
                <div class="feed-item">
                  <div class="live-activity">
                    <p><a href="#" class="profile-link">Sarah</a> has shared an album</p>
                    <p class="text-muted">a day ago</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


    <!-- Footer
    ================================================= -->
    <footer id="footer">
      <div class="container">
      	<div class="row">
          <div class="footer-wrapper">
            <div class="col-md-3 col-sm-3">
              <a href="#"><img src="images/logo-black.png" alt="" class="footer-logo" /></a>
              <ul class="list-inline social-icons">
              	<li><a href="#"><i class="icon ion-social-facebook"></i></a></li>
              	<li><a href="#"><i class="icon ion-social-twitter"></i></a></li>
              	<li><a href="#"><i class="icon ion-social-googleplus"></i></a></li>
              	<li><a href="#"><i class="icon ion-social-pinterest"></i></a></li>
              	<li><a href="#"><i class="icon ion-social-linkedin"></i></a></li>
              </ul>
            </div>
            <div class="col-md-2 col-sm-2">
              <h6>For individuals</h6>
              <ul class="footer-links">
                <li><a href="#">Signup</a></li>
                <li><a href="#">login</a></li>
                <li><a href="#">Explore</a></li>
                <li><a href="#">Finder app</a></li>
                <li><a href="#">Features</a></li>
                <li><a href="#">Language settings</a></li>
              </ul>
            </div>
            <div class="col-md-2 col-sm-2">
              <h6>For businesses</h6>
              <ul class="footer-links">
                <li><a href="#">Business signup</a></li>
                <li><a href="#">Business login</a></li>
                <li><a href="#">Benefits</a></li>
                <li><a href="#">Resources</a></li>
                <li><a href="#">Advertise</a></li>
                <li><a href="#">Setup</a></li>
              </ul>
            </div>
            <div class="col-md-2 col-sm-2">
              <h6>About</h6>
              <ul class="footer-links">
                <li><a href="#">About us</a></li>
                <li><a href="#">Contact us</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Terms</a></li>
                <li><a href="#">Help</a></li>
              </ul>
            </div>
            <div class="col-md-3 col-sm-3">
              <h6>Contact Us</h6>
                <ul class="contact">
                	<li><i class="icon ion-ios-telephone-outline"></i>+1 (234) 222 0754</li>
                	<li><i class="icon ion-ios-email-outline"></i>info@thunder-team.com</li>
                  <li><i class="icon ion-ios-location-outline"></i>228 Park Ave S NY, USA</li>
                </ul>
            </div>
          </div>
      	</div>
      </div>
      <div class="copyright">
        <p>Travel Network © 2017. All rights reserved</p>
      </div>
		</footer>
    
    <!--preloader-->
    <div id="spinner-wrapper">
      <div class="spinner"></div>
    </div>

    <!-- Scripts
    ================================================= -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky-kit.min.js"></script>
    <script src="js/jquery.scrollbar.min.js"></script>
    <script src="js/script.js"></script>
    
  </body>

</html>
