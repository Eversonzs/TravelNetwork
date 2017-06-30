{include file="header.tpl"}

<body>

    <div class="container">

        <!-- Timeline
        ================================================= -->
        <div class="timeline">
            {if isset($user)}
            {foreach name=tbl_users item=smarty_user from=$user}
            <div class="timeline-cover" style="background: url(images/covers/{if $smarty_user.header_photo}{$smarty_user.header_photo}{else}header_default.jpg{/if}) no-repeat">
              {if $smarty_user.id_user == $smarty.session.id_user}
                <form name="change_cover_photo" action="update_cover_photo.php" id='change_cover_photo' method="POST" enctype="multipart/form-data">
                    <a class="change-cover"><label for="change_cover" class="ion-edit"> Change cover</label><input type="file" id="change_cover" name="image" size="50" class="change-cover" ></input></a>
                    <button id="upload_cover_photo" class="btn btn-update" type="submit" style="float: right;"> update</button>
                </form>
              {/if}
                <!--Timeline Menu for Large Screens-->
                <div class="timeline-nav-bar hidden-sm hidden-xs">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="profile-info">
                                <img src="images/users/{if $smarty_user.profile_photo}{$smarty_user.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="img-responsive profile-photo">
                                  {if $smarty_user.id_user == $smarty.session.id_user}
                                    <form name="change_profile_photo" action="update_profile_photo.php" id="change_profile_photo" method="POST" enctype="multipart/form-data">
                                      <a><label for="change_photo" class="ion-edit"> Change profile photo</label><input type="file" id="change_photo" name="image" size="50" class="change-photo"/></a>
                                      <button id="upload_profile_photo" class="btn btn-update" type="submit"> update</button>
                                    </form>
                                  {/if}
                                </img>
                                <h3>
                                    {$smarty_user.name} {$smarty_user.surname}
                                </h3>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <ul class="list-inline profile-menu">
                                <li><a href="timeline.php?id_user={$smarty_user.id_user}" class="active">Timeline</a></li>
                                <li><a href="timeline-about.php?id_user={$smarty_user.id_user}">About</a></li>
                                <li><a href="timeline-followers.php?id_user={$smarty_user.id_user}">Followers</a></li>
                                <li><a href="timeline-following.php?id_user={$smarty_user.id_user}">Following</a></li>
                            </ul>
                            <ul class="follow-me list-inline">
                                <li>{if isset($followers)} {$followers} followers {/if}</li>
                                {if $smarty_user.id_user != $smarty.session.id_user}<li>{if $already_following==0}<a class="btn-primary" href="friendship.php?id_user={$smarty_user.id_user}&follow=follow">Follow</a>{else}<a class="btn-primary" href="friendship.php?id_user={$smarty_user.id_user}&follow=unfollow">Unfollow</a>{/if}</li>{/if}
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
                    </div>
                    <div class="mobile-menu">
                        <ul class="list-inline">
                            <li><a href="timeline.php?id_user={$smarty_user.id_user}" class="active">Timeline</a></li>
                            <li><a href="timeline-about.php?id_user={$smarty_user.id_user}">About</a></li>
                            <li><a href="timeline-followers.php?id_user={$smarty_user.id_user}">Followers</a></li>
                            <li><a href="timeline-following.php?id_user={$smarty_user.id_user}">Following</a></li>
                        </ul>
                        <li>{if isset($followers)} {$followers} followers {/if}</li>
                        {if $smarty_user.id_user != $smarty.session.id_user}<li>{if $already_following==0}<a class="btn-primary" href="friendship.php?id_user={$smarty_user.id_user}&follow=follow">Follow</a>{else}<a class="btn-primary" href="friendship.php?id_user={$smarty_user.id_user}&follow=unfollow">Unfollow</a>{/if}</li>{/if}
                    </div>
                </div><!--Timeline Menu for Small Screens End-->


            </div>
            <div id="page-contents">
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-7">

                        <!-- Post Create Box
                        ================================================= -->
                        <form name="form_publish" id='form_publish' action="insert_publication.php" method="POST" enctype="multipart/form-data">
                          <output id="list"></output>
                            <div class="create-post">
                                <div class="row">
                                    <div class="col-md-7 col-sm-7">
                                        <div class="form-group">
                                            <img src="images/users/{if $smarty.session.profile_photo}{$smarty.session.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="profile-photo-md" />
                                            <textarea name='description' id="description" cols="30" rows="1" class="form-control" placeholder="Share your experience"></textarea>
                                            <input type="hidden" name="page" value="timeline"/>
                                        </div>
                                    </div>
                                    <div class="col-md-5 col-sm-5">
                                        <div class="tools">
                                            <ul class="publishing-tools list-inline">
                                                <li><a href="#"><i class="ion-compose"></i></a></li>
                                                <li><a href="#"><label for="files" class="ion-images"></label><input type="file" id="files" name="image" size="50" class="file" /></a></li>
                                                <script>
                                                  document.getElementById('files').addEventListener('change', image, false);
                                                </script>
                                                <li><a href="#"><i class="ion-ios-videocam"></i></a></li>
                                                <li><a href="#"><i class="ion-map"></i></a></li>
                                            </ul>
                                            <button class="btn btn-primary pull-right" type="submit">Publish</button>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- Post Create Box End-->
                        </form>
                        {/foreach}
                        {/if}

                        <!-- Post Content
                        ================================================= -->
                        {if isset($publication)}
                          {foreach name=tbl_publications item=smarty_publication from=$publication}
                            <div class="post-content">
                                <!--Post Date-->
                                <div class="post-date hidden-xs hidden-sm">
                                    <h5>{$smarty_publication.user_name}</h5>
                                    <p class="text-grey">{$smarty_publication.publication_date}</p>
                                </div><!--Post Date End-->

                                <div class="post-container">
                                    <img src="images/users/{if $smarty_publication.profile_photo}{$smarty_publication.profile_photo}{else}user_without_photo.jpg{/if}" alt="user" class="profile-photo-md pull-left" />
                                    <div class="post-detail">
                                        <div class="user-info">
                                            <h5><a href="timeline.php?id_user={$smarty_publication.id_user}" class="profile-link">{$smarty_publication.name} {$smarty_publication.surname}</a></h5>
                                            <p class="text-muted">{$smarty_publication.publication_date}</p>
                                        </div>
                                        <div class="reaction">
                                          {if $smarty_publication.id_user == $smarty.session.id_user || isset($delete_publication)}
                                            <a class="btn text-red" href="delete_publication.php?id_publication={$smarty_publication.id_publication}&page=timeline">x</a>
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
                                                <p><a href="timeline.php?id_user={$smarty_comments.id_user}" class="profile-link">{$smarty_comments.user_name} </a> {$smarty_comments.comment}</p>
                                                <div class="delete-comment">
                                                    {if $smarty_comments.id_user == $smarty.session.id_user || $smarty_publication.id_user==$smarty.session.id_user || isset($delete_comment)}
                                                    <a class="btn text-red" href="delete_comments.php?id_comment={$smarty_comments.id_comment}&id_user={$smarty_publication.id_user}&page=timeline">x</a>
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
                                                <input type="hidden" name="page" value="timeline"/>
                                                <input type="hidden" name="id_user" value="{$smarty_user.id_user}"/>
                                                <button class="btn btn-comment" type="submit"><i class="icon ion-android-send"></i></button>
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
                                  <a href="timeline.php?pagina={$_prima}&id_user={$smarty_user.id_user}" class="links ion-chevron-left"></a>
                                {/if}
                                {if isset($_prec)}
                                    {foreach item=precedente from=$_prec}
                                      <a href="timeline.php?pagina={$precedente}&id_user={$smarty_user.id_user}" class="links">{$precedente}</a>
                                    {/foreach}
                                {/if}
                                {if isset($_corr)}
                                  <a>{$_corr}</a>{/if}
                                  {if isset($_succ)}
                                    {foreach item=successivo from=$_succ}
                                        <a href="timeline.php?pagina={$successivo}&id_user={$smarty_user.id_user}" class="links">{$successivo}</a>
                                    {/foreach}
                                  {/if}
                                {if isset($_ultima)}
                                  <a href="timeline.php?pagina={$_ultima}&id_user={$smarty_user.id_user}" class="links ion-chevron-right"></a>
                                {/if}
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