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
              {if isset($users)}
                <br>
                <h3><center>Users</center></h3><br>
                {foreach name=tbl_users item=smarty_users from=$users}
                  <p>Id: {$smarty_users.id_user}, Name: {$smarty_users.name} {$smarty_users.surname}, Username: {$smarty_users.user_name}, Email: {$smarty_users.email}, Cellphone: {$smarty_users.cellphone}, Born date: {$smarty_users.born_date}, Signup date: {$smarty_users.signup_date}, About me: {$smarty_users.about_me} <a class="btn text-red" href="delete_user.php?id_user={$smarty_users.id_user}">x</a></p>
                  <div class="line-divider"></div>

                {/foreach}
              {/if}
            </div>
          </div>
        </div>
      </div>
    </div>


    <br><br><br><br><br>
{include file="footer.tpl"}