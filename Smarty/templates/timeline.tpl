{include file="header.tpl"}

  <body>
    
    <div class="container">

      <!-- Timeline
      ================================================= -->
      <div class="timeline">
        <div class="timeline-cover">

          {if isset($user)}
            {foreach name=tbl_users item=smarty_user from=$user}
              <!--Timeline Menu for Large Screens-->
              <div class="timeline-nav-bar hidden-sm hidden-xs">
                <div class="row">
                      <div class="col-md-3">
                        <div class="profile-info">
                          <img src="images/users/{if $smarty_user.profile_photo}{$smarty_user.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="img-responsive profile-photo" />
                            <h3>
                              {$smarty_user.name} {$smarty_user.surname}
                            </h3>
                          <p class="text-muted">Creative Director</p>
                        </div>
                      </div>
                      <div class="col-md-9">
                        <ul class="list-inline profile-menu">
                          <li><a href="timeline.php?id_user={$smarty_user.id_user}" class="active">Timeline</a></li>
                          <li><a href="timeline-about.php?id_user={$smarty_user.id_user}">About</a></li>
                          <li><a href="timeline-album.html">Album</a></li>
                          <li><a href="timeline-friends.html">Friends</a></li>
                        </ul>
                        <ul class="follow-me list-inline">
                          <li>1,299 people following her</li>
                          <li><button class="btn-primary">Add Friend</button></li>
                        </ul>
                      </div>
                </div>
              </div><!--Timeline Menu for Large Screens End-->

              <!--Timeline Menu for Small Screens-->
              <div class="navbar-mobile hidden-lg hidden-md">
                <div class="profile-info">
                  <img src="images/users/{if $smarty_user.profile_photo}{$smarty_user.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="img-responsive profile-photo" />
                  <h4>
                    {$smarty_user.name} {$smarty_user.surname}
                  </h4>
                  <p class="text-muted">Creative Director</p>
                </div>
                <div class="mobile-menu">
                  <ul class="list-inline">
                    <li><a href="timline.html" class="active">Timeline</a></li>
                    <li><a href="timeline-about.html">About</a></li>
                    <li><a href="timeline-album.html">Album</a></li>
                    <li><a href="timeline-friends.html">Friends</a></li>
                  </ul>
                  <button class="btn-primary">Add Friend</button>
                </div>
              </div><!--Timeline Menu for Small Screens End-->


        </div>
        <div id="page-contents">
          <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-7">

              <!-- Post Create Box
              ================================================= -->
              <div class="create-post">
                <div class="row">
                  <div class="col-md-7 col-sm-7">
                    <div class="form-group">
                      <img src="images/users/{if $smarty_user.profile_photo}{$smarty_user.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="profile-photo-md" />
                      <textarea name="texts" id="exampleTextarea" cols="30" rows="1" class="form-control" placeholder="Write what you wish"></textarea>
                    </div>
                  </div>
                  <div class="col-md-5 col-sm-5">
                    <div class="tools">
                      <ul class="publishing-tools list-inline">
                        <li><a href="#"><i class="ion-compose"></i></a></li>
                        <li><a href="#"><i class="ion-images"></i></a></li>
                        <li><a href="#"><i class="ion-ios-videocam"></i></a></li>
                        <li><a href="#"><i class="ion-map"></i></a></li>
                      </ul>
                      <button class="btn btn-primary pull-right">Publish</button>
                    </div>
                  </div>
                </div>
              </div><!-- Post Create Box End-->
            {/foreach}
          {/if}

              <!-- Post Content
              ================================================= -->
              
              <div class="post-content">
              {if isset($publication)}
                {foreach name=tbl_publications item=smarty_publication from=$publication}              
                <!--Post Date-->
                <div class="post-date hidden-xs hidden-sm">
                  <h5>{$smarty_publication.user_name}</h5>
                  <p class="text-grey">{$smarty_publication.publication_date}</p>
                </div><!--Post Date End-->

                <img src="images/post-images/12.jpg" alt="post-image" class="img-responsive post-image" />
                <div class="post-container">
                  <img src="images/users/{if $smarty_publication.profile_photo}{$smarty_publication.profile_photo}{else}user_without_photo.jpg{/if}" alt="user" class="profile-photo-md pull-left" />
                  <div class="post-detail">
                    <div class="user-info">
                      <h5><a href="timeline.php?id_user={$smarty_publication.id_user}" class="profile-link">{$smarty_publication.name} {$smarty_publication.surname}</a> <span class="following">following</span></h5>
                      <p class="text-muted">{$smarty_publication.publication_date}</p>
                    </div>
                    <div class="reaction">
                      <a class="btn text-green"><i class="icon ion-thumbsup"></i> 13</a>
                      <a class="btn text-red"><i class="fa fa-thumbs-down"></i> 0</a>
                      {if $smarty_publication.id_user == $smarty.session.id_user}
                        <a class="btn text-red" href="delete_publication.php?id_publication={$smarty_publication.id_publication}">x</a>
                      {/if}
                    </div>
                    <div class="line-divider"></div>
                    <div class="post-text">
                      <p>{$smarty_publication.description}</p>
                    </div>
                    <div class="line-divider"></div>
                    {if isset($comments)}
                      {foreach name=tbl_comments item=smarty_comments from=$comments}
                        {if $smarty_publication.id_publication == $smarty_comments.id_publication}
                          <div class="post-comment">
                            <img src="images/users/{if $smarty_comments.profile_photo}{$smarty_comments.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="profile-photo-sm" />
                            <p><a href="timeline.php?id_user={$smarty_comments.id_user}" class="profile-link">{$smarty_comments.user_name} </a><i class="em em-laughing"></i>{$smarty_comments.comment}</p>
                            {if $smarty_comments.id_user == $smarty.session.id_user || $smarty_publication.id_user==$smarty.session.id_user}
                              <a class="btn text-red" href="delete_comments.php?id_comment={$smarty_comments.id_comment}&id_user={$smarty_publication.id_user}">x</a>
                            {/if}
                          </div>
                        {/if}
                      {/foreach}
                    {/if}
                    <div class="post-comment">
                      <img src="images/users/{if $smarty.session.profile_photo}{$smarty.session.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="profile-photo-sm" />
                      <input type="text" class="form-control" placeholder="Post a comment">
                    </div>
                  </div>
                </div>
                {/foreach}
              {/if}
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
        <p>Thunder Team © 2016. All rights reserved</p>
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