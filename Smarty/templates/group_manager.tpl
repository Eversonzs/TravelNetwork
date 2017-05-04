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
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Users Managers <span><img src="images/down-arrow.png" alt="" /></span></a>
                            <ul class="dropdown-menu newsfeed-home">
                              <li><a href="#">Users manager</a></li>
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
              {if isset($permissions)}
                <br>
                <h3><center>Groups permissions</center></h3>
                <form name="update_group_permissions_form" id='update_group_permissions' class="form-inline" action="update_group_permissions.php" method="post">
                  <ul>
                    <ul><h4>{if isset($name_group)} {$name_group} {/if}</h4></ul>
                      {foreach name=tbl_permissions item=smarty_permissions from=$permissions}
                        <li><input type="checkbox" name="permissions[]" {if isset($group_permissions)} {foreach name=tbl_permissions item=smarty_group_permissions from=$group_permissions} {if $smarty_group_permissions.id_permission == $smarty_permissions.id_permission} checked {/if} {/foreach} {/if} value="{$smarty_permissions.id_permission}"> {$smarty_permissions.permission}, id permission = {$smarty_permissions.id_permission}</input></li>
                      {/foreach}
                  </ul>
                  <input type="hidden" name="group" value="{$name_group}"/>
                  <button type='submit' class="btn btn-primary">Update</button>
                <form>
              {/if}
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