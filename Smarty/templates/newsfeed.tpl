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
              <li><i class="icon ion-ios-people"></i><div><a href="newsfeed-people-nearby.html">People Nearby</a></div></li>
              <li><i class="icon ion-ios-people-outline"></i><div><a href="newsfeed-friends.html">Friends</a></div></li>
              <li><i class="icon ion-chatboxes"></i><div><a href="newsfeed-messages.html">Messages</a></div></li>
              <li><i class="icon ion-images"></i><div><a href="newsfeed-images.html">Images</a></div></li>
              <li><i class="icon ion-ios-videocam"></i><div><a href="newsfeed-videos.html">Videos</a></div></li>
            </ul><!--news-feed links ends-->
          </div>
          <div class="col-md-7">
            <!-- Post Create Box
            ================================================= -->
            <form name="form_publish" id='form_publish' action="insert_publication.php" method="POST" enctype="multipart/form-data" >
              <output id="list"> </output>
              <div class="create-post">
                <div class="row">
                  <div class="col-md-7 col-sm-7">
                    <div class="form-group">
                      <img src="images/users/{if $smarty.session.profile_photo}{$smarty.session.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="profile-photo-md" />
                      <textarea name='description' id="description" cols="30" rows="1" class="form-control" placeholder="Share your experience"></textarea>
                      <input type="hidden" name="page" value="newsfeed"/>
                    </div>
                  </div>
                  <div class="col-md-5 col-sm-5">
                    <div class="tools">
                      <ul class="publishing-tools list-inline">
                        <li><a href="#"><i class="ion-map"></i></a></li>
                        <li><a href="#"><label for="files" class="ion-images"></label><input type="file" id="files" name="image" size="50" class="file" /></a></li>
                        <script>
                          document.getElementById('files').addEventListener('change', image, false);
                        </script>
                        <li><a href="#"><i class="ion-ios-videocam"></i></a></li>
                        <li><a href="#"><i class="ion-compose"></i></a></li>
                      </ul>
                      <button class="btn btn-primary pull-right" type="submit">Publish</button>
                    </div>
                  </div>
                </div>
              </div><!-- Post Create Box End-->
            </form>

            <!-- Post Content
            ================================================= -->
            {if isset($publication)}
              {foreach name=tbl_publications item=smarty_publication from=$publication}
                <div class="post-content">
                  <div class="post-container">
                    <img src="images/users/{if $smarty_publication.profile_photo}{$smarty_publication.profile_photo}{else}user_without_photo.jpg{/if}" alt="user" class="profile-photo-md pull-left" />
                    <div class="post-detail">
                      <div class="user-info">
                        <h5><a href="timeline.php?id_user={$smarty_publication.id_user}" class="profile-link">{$smarty_publication.name} {$smarty_publication.surname}</a></h5>
                        <p class="text-muted">{$smarty_publication.publication_date}</p>
                      </div>
                      <div class="reaction">
                        {if $smarty_publication.id_user == $smarty.session.id_user || isset($delete_publication)}
                          <a class="btn text-red" href="delete_publication.php?id_publication={$smarty_publication.id_publication}&page=newsfeed">x</a>
                        {/if}
                      </div>
                      <div class="line-divider"></div>
                      <div class="post-text">
                        <p>{$smarty_publication.description}</p>
                      </div>
                      <div class="line-divider"></div>

                      <div class="right">
                        <fieldset  class="rating">
                          <input class="stars" type="radio" id="star_average" name="rating"/>
                          <label class = "yellow" for="star_average" >
                            {if isset($average)}
                              {foreach name=tbl_valuations item=smarty_average from=$average}
                                {if $smarty_average.id_publication == $smarty_publication.id_publication} {$smarty_average.average} {/if}
                              {/foreach}
                            {/if}
                          </label>
                        </fieldset>
                      </div>

                      <img src="images/post-images/{$smarty_publication.file}" alt="post-image" class="img-responsive post-image" />
                      
                      <fieldset id='demo1_{$smarty_publication.id_publication}' class="rating">
                        {if isset($my_valuations)}
                          {foreach name=tbl_valuations item=smarty_my_valuations from=$my_valuations}
                            {if $smarty_publication.id_publication == $smarty_my_valuations.id_publication}
                              <script type="text/javascript">
                                paint_stars({$smarty_publication.id_publication}, {$smarty_my_valuations.valuation}, 'demo1_{$smarty_publication.id_publication}');
                              </script>
                            {/if}
                          {/foreach}
                        {/if}
                        <input class="stars" type="radio" id="star5" name="rating" value="5" />
                        <label class = "full" id="label5_{$smarty_publication.id_publication}" for="star5" title="Awesome - 5 stars" value="5" onclick="get_id_publication({$smarty_publication.id_publication},5, 'demo1_{$smarty_publication.id_publication}')"></label>
                        <input class="stars" type="radio" id="star4" name="rating" value="4" />
                        <label class = "full" id="label4_{$smarty_publication.id_publication}" for="star4" title="Pretty good - 4 stars" onclick="get_id_publication({$smarty_publication.id_publication},4, 'demo1_{$smarty_publication.id_publication}')"></label>
                        <input class="stars" type="radio" id="star3" name="rating" value="3" />
                        <label class = "full" id="label3_{$smarty_publication.id_publication}" for="star3" title="Meh - 3 stars" onclick="get_id_publication({$smarty_publication.id_publication},3, 'demo1_{$smarty_publication.id_publication}')"></label>
                        <input class="stars" type="radio" id="star2" name="rating" value="2" />
                        <label class = "full" id="label2_{$smarty_publication.id_publication}" for="star2" title="Kinda bad - 2 stars" onclick="get_id_publication({$smarty_publication.id_publication},2, 'demo1_{$smarty_publication.id_publication}')"></label>
                        <input class="stars" type="radio" id="star1" name="rating" value="1" />
                        <label class = "full" id="label1_{$smarty_publication.id_publication}" for="star1" title="Sucks big time - 1 star" onclick="get_id_publication({$smarty_publication.id_publication},1, 'demo1_{$smarty_publication.id_publication}')"></label>
                      </fieldset>
                      
                      <div class="line-divider"></div>
                      {if isset($comments)}
                        {foreach name=tbl_comments item=smarty_comments from=$comments}
                          {if $smarty_publication.id_publication == $smarty_comments.id_publication}
                            <div class="post-comment">
                              <img src="images/users/{if $smarty_comments.profile_photo}{$smarty_comments.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="profile-photo-sm" />
                              <p><a href="timeline.php?id_user={$smarty_comments.id_user}" class="profile-link">{$smarty_comments.name} {$smarty_comments.surname} </a>{$smarty_comments.comment}</p>
                              <div class="delete-comment">
                                {if $smarty_comments.id_user == $smarty.session.id_user || $smarty_publication.id_user==$smarty.session.id_user || isset($delete_comment)}
                                  <a class="btn text-red" href="delete_comments.php?id_comment={$smarty_comments.id_comment}&id_user={$smarty_publication.id_user}&page=newsfeed">x</a>
                                {/if}
                              </div>
                            </div>
                          {/if}
                        {/foreach}
                      {/if}
                      <form name="form_comment" id='form_comment' action="insert_comment.php" method="POST">
                        <div class="post-comment">
                          <img src="images/users/{if $smarty.session.profile_photo}{$smarty.session.profile_photo}{else}user_without_photo.jpg{/if}" class="profile-photo-sm" />
                          <input type="hidden" name="id_publication" value="{$smarty_publication.id_publication}"/>
                          <input type="textarea" class="form-control" name="comment" placeholder="Share your opinion"/>
                          <input type="hidden" name="page" value="newsfeed"/>
                          <input type="hidden" name="id_user" value="{$smarty.session.id_user}"/>
                          <button class="btn btn-circle btn-comment" type="submit"><i class="icon ion-android-send"></i></button>
                        </div>
                      </form>
                      <div class="line-divider"></div>
                    </div>
                  </div>
                </div>
              {/foreach}
            {/if}
            <div class="post-pagination">
              <div class="pagination">
                {if isset($_prima)}
                  <a href="newsfeed.php?pagina={$_prima}" class="links ion-chevron-left"></a>
                {/if}
                {if isset($_prec)}{foreach item=precedente from=$_prec}
                  <a href="newsfeed.php?pagina={$precedente}" class="links">{$precedente}</a>
                {/foreach}{/if}
                {if isset($_corr)}
                  <a>{$_corr}</a>{/if}
                  {if isset($_succ)}{foreach item=successivo from=$_succ}
                    <a href="newsfeed.php?pagina={$successivo}" class="links">{$successivo}</a>
                  {/foreach}{/if}
                {if isset($_ultima)}
                  <a href="newsfeed.php?pagina={$_ultima}" class="links ion-chevron-right"></a>
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
        <p>Travel Network © 2017. All rights reserved</p>
      </div>
    </footer>
    
    <!--preloader-->
    <div id="spinner-wrapper">
      <div class="spinner"></div>
    </div>
    
    <!-- Scripts
    ================================================= -->
    <!--
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTMXfmDn0VlqWIyoOxK8997L-amWbUPiQ&amp;callback=initMap"></script>
    -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky-kit.min.js"></script>
    <script src="js/jquery.scrollbar.min.js"></script>
    <script src="js/script.js"></script>
  

  </body>

<!-- Mirrored from thunder-team.com/friend-finder/newsfeed.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 23 Feb 2017 11:16:58 GMT -->
</html>