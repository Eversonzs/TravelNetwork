{include file="header.tpl"}

  <body>
    
    <div class="container">

      <!-- Timeline
      ================================================= -->
      <div class="timeline">
          <div class="timeline-cover" style="background: url(images/covers/{if $smarty.session.header_photo}{$smarty.session.header_photo}{else}header_default.jpg{/if}) no-repeat">
            <!--Timeline Menu for Large Screens-->
            <div class="timeline-nav-bar hidden-sm hidden-xs">
              <div class="row">
                <div class="col-md-3">
                  <div class="profile-info">
                    <img src="images/users/{if $smarty.session.profile_photo}{$smarty.session.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="img-responsive profile-photo" />
                      <h3>
                        Admin:<br>{$smarty.session.name} {$smarty.session.surname}
                      </h3>
                  </div>
                </div>

                <header id="header">
                  <nav class="navbar navbar-default menu">
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                      <ul class="nav navbar-nav navbar-left main-menu">
                        <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Group Permissions <span><img src="images/down-arrow.png" alt="" /></span></a>
                            <ul class="dropdown-menu newsfeed-home" style="list-style:none">
                              {if isset($groups)}
                                {foreach name=tbl_groups item=smarty_groups from=$groups}
                                  <li><a href="group_manager.php?group={$smarty_groups.group}">{$smarty_groups.group}</a></li>
                                {/foreach}
                              {/if}
                            </ul>
                        </li>
                        <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Groups <span><img src="images/down-arrow.png" alt="" /></span></a>
                            <ul class="dropdown-menu newsfeed-home" style="list-style:none">
                              <li><a href="groups.php">+ Create new group</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Users Managament <span><img src="images/down-arrow.png" alt="" /></span></a>
                            <ul class="dropdown-menu newsfeed-home">
                              {if isset($groups)}
                                {foreach name=tbl_groups item=smarty_groups from=$groups}
                                  <li><a href="users_management.php?users={$smarty_groups.id_group}">{$smarty_groups.group}s</a></li>
                                {/foreach}
                              {/if}
                              <li><a href="users_management.php?users=all">View all users</a></li>
                            </ul>
                        </li>
                      </ul>
                    </div><!-- /.navbar-collapse -->
                  </nav>
                </header>

                </div>
              </div><!--Timeline Menu for Large Screens End-->

              <!--Timeline Menu for Small Screens-->
              <div class="navbar-mobile hidden-lg hidden-md">
                <div class="profile-info">
                  <img src="images/users/{if $smarty.session.profile_photo}{$smarty.session.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="img-responsive profile-photo" />
                  <h3>
                    Admin:<br>{$smarty.session.name} {$smarty.session.surname}
                  </h3>
                </div>
                <div class="mobile-menu">
                  <ul class="list-inline">
                    <li><a href="group_manager.php" class="active">Group Permissions</a></li>
                    <li><a href="group_manager.php?group=admin">Admin Permissions</a></li>
                    <li><a href="group_manager.php?group=moderator">Moderator Permissions</a></li>
                    <li><a href="group_manager.php?group=active_user">Active User Permissions</a></li>
                    <li><a href="group_manager.php?group=banned_user">Banned User Permissions</a></li>
                  </ul>
                </div>
              </div><!--Timeline Menu for Small Screens End-->
        </div>
      </div>
    </div>

    <div id="page-contents">
      <div class="container">
        <div class="row">
          <div class="post-content">
            <div class="post-conteiner">
              <br>
              
              <form id="create_new_group_form" action="create_new_group.php" method="POST">
                <h3><center>Create new group </center></h3>
                <label> Group name: </label>  
                <input type="text" id="group_name" name="group_name" placeholder="Name new group" /><br>
                <br>
                <button type="submit" class="btn btn-default">Create</button>
              </form>

                <h3><center>Delete group </center></h3>
                  {if isset($groups)}
                    {foreach name=tbl_groups item=smarty_groups from=$groups}
                      <label> Group name: </label>
                      {$smarty_groups.group}<a class="btn text-red" href="delete_group.php?id_group={$smarty_groups.id_group}">x</a><br> 
                    {/foreach}
                  {/if}
                  <br>

            </div>
          </div>
        </div>
      </div>
    </div>

    <br><br><br><br><br>
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