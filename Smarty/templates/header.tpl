<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="This is social travel network"/>
    <meta name="keywords" content="Social Travel Network, Social Media, Make Friends, Newsfeed, Profile Page" />
    <meta name="robots" content="index" />
    <title>Travel Network</title>


    <script src="js/jquery-3.1.1.min.js"></script>
    <!-- Stylesheets
    ================================================= -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/ionicons.min.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/rating.css" />
    <link href="css/emoji.css" rel="stylesheet"/>
    <script type="text/javascript" src="js/functions.js"></script>



    <!--Favicon-->
    <link rel="shortcut icon" type="image/png" href="images/fav.png"/>

    <script type="text/javascript" src="js/stars.js"></script>

</head>


   <!-- Header
    ================================================= -->
		<header id="header">
      <nav class="navbar navbar-default navbar-fixed-top menu">
        <div class="container">

          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index-register.php"><img src="images/logo.png" alt="logo" /></a>
          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right main-menu">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Newsfeed <span><img src="images/down-arrow.png" alt="" /></span></a>
                  <ul class="dropdown-menu newsfeed-home">
                    <li><a href="newsfeed.php">Newsfeed</a></li>
                    <li><a href="newsfeed-people-nearby.html">Poeple Nearly</a></li>
                    <li><a href="newsfeed-friends.html">My friends</a></li>
                    <li><a href="newsfeed-messages.html">Chatroom</a></li>
                    <li><a href="newsfeed-images.html">Images</a></li>
                    <li><a href="newsfeed-videos.html">Videos</a></li>
                  </ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My timeline <span><img src="images/down-arrow.png" alt="" /></span></a>
                <ul class="dropdown-menu login">
                  <li><a href="timeline.php?id_user={$smarty.session.id_user}">Timeline</a></li>
                  <li><a href="timeline-about.php?id_user={$smarty.session.id_user}">Timeline About</a></li>
                  <li><a href="timeline-followers.php?id_user={$smarty.session.id_user}">Timeline Followers</a></li>
                  <li><a href="timeline-following.php?id_user={$smarty.session.id_user}">Timeline Following </a></li>
                </ul>
              </li>
              {if isset($delete_moderator)}
                <li class="dropdown">
                  <a href="group_manager.php">Manager</a>
                </li>
              {/if}
              <li class="dropdown">
                <!-- // FORM: logout -->  
                <a href="logout.php" >Logout</a>
              </li>
            </ul>
            <form class="navbar-form navbar-right hidden-sm">
              <div class="form-group">
                <i class="icon ion-android-search"></i>
                <input type="text" class="form-control" placeholder="Search friends, places, experiences">
              </div>
            </form>
          </div><!-- /.navbar-collapse -->
        </div><!-- /.container -->
      </nav>
    </header>
    <!--Header End-->