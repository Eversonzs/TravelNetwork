<!DOCTYPE html>
<html lang="en">
	
<!-- Mirrored from thunder-team.com/friend-finder/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 23 Feb 2017 11:16:41 GMT -->
<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="This is social network html5 template available in themeforest......" />
		<meta name="keywords" content="Social Network, Social Media, Make Friends, Newsfeed, Profile Page" />
		<meta name="robots" content="index, follow" />
		<title>Travel Network</title>

    <!-- Stylesheets
    ================================================= -->
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/ionicons.min.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    
    <!--Favicon-->
    <link rel="shortcut icon" type="image/png" href="images/fav.png"/>
	</head>
	
	<body>

    <!-- Header
    ================================================= -->
	<header id="header" class="lazy-load">
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
            <a class="navbar-brand" href="index.php"><img src="images/logo.png" alt="logo" /></a>
          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
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

    <!-- Top Banner
    ================================================= -->
		<section id="banner">
			<div class="container">

        <!-- Sign Up Form
        ================================================= -->
        <div class="sign-up-form">
			<a href="index.php" class="logo"><img src="images/logo.png" alt="Friend Finder"/></a>
			<h2 class="text-white">Find friends and travel</h2>
			<div class="line-divider"></div>
			<div class="form-wrapper">
				<p class="signup-text">Signup now and meet awesome people around the world</p>
				<form method="POST" action="signup.php">
					<fieldset class="form-group">
						<input type="hidden" name="check" value="1"/>
						<input type="text" class="form-control" name="name" placeholder="Enter name">
					</fieldset>
					<fieldset class="form-group">
						<input type="email" class="form-control" name="email" placeholder="Enter email">
					</fieldset>
					<fieldset class="form-group">
						<input type="password" class="form-control" name="password" placeholder="Enter a password">
					</fieldset>				
					<p>By signning up you agree to the terms</p>
					<button type="submit" class="btn-secondary">Signup</button>
				</form>
			</div>
			<a href="index-register.php">Already have an account?</a>
			<img class="form-shadow" src="images/bottom-shadow.png" alt="" />
		</div><!-- Sign Up Form End -->

        <svg class="arrows hidden-xs hidden-sm">
          <path class="a1" d="M0 0 L30 32 L60 0"></path>
          <path class="a2" d="M0 20 L30 52 L60 20"></path>
          <path class="a3" d="M0 40 L30 72 L60 40"></path>
        </svg>
			</div>
		</section>

    <!-- Features Section
    ================================================= -->
		<section id="features">
			<div class="container wrapper">
				<h1 class="section-title slideDown">social herd</h1>
				<div class="row slideUp">
					<div class="feature-item col-md-2 col-sm-6 col-xs-6 col-md-offset-2">
						<div class="feature-icon"><i class="icon ion-person-add"></i></div>
						<h3>Make Friends</h3>
					</div>
					<div class="feature-item col-md-2 col-sm-6 col-xs-6">
						<div class="feature-icon"><i class="icon ion-images"></i></div>
						<h3>Share Experiences</h3>
					</div>
					<div class="feature-item col-md-2 col-sm-6 col-xs-6">
						<div class="feature-icon"><i class="icon ion-chatbox-working"></i></div>
						<h3>Share Opinions	</h3>
					</div>
					<div class="feature-item col-md-2 col-sm-6 col-xs-6">
						<div class="feature-icon"><i class="icon ion-pizza"></i></div>
						<h3>Know Dishes</h3>
					</div>
				</div>
				<h2 class="sub-title">find awesome people like you</h2>
				{if isset($number_users)}
					<div id="incremental-counter" data-value="{$number_users}"></div>
				{/if}
				<p>People Already Signed Up</p>
				<img src="images/face-map.png" alt="" class="img-responsive face-map slideUp hidden-sm hidden-xs" />
			</div>

		</section>

    

    <!-- Image Divider
    ================================================= -->
    <div class="img-divider hidden-sm hidden-xs"></div>

    <!-- Facts Section
    ================================================= -->
		<section id="site-facts">
			<div class="container wrapper">
				<div class="circle">
					<ul class="facts-list">
						<li>
							<div class="fact-icon"><i class="icon ion-ios-people-outline"></i></div>
							<h3 class="text-white">{if isset($number_users)} {$number_users} {/if}</h3>
							<p>People registered</p>
						</li>
						<li>
							{if isset($publishing_number)}
								<div class="fact-icon"><i class="icon ion-images"></i></div>
								<h3 class="text-white">{$publishing_number}</h3>
								<p>Posts published</p>
							{/if}
						</li>
						<li>
							{if isset($events_number)}
								<div class="fact-icon"><i class="icon ion-calendar"></i></div>
								<h3 class="text-white">{$events_number}</h3>
								<p>Events created</p>
							{/if}
						</li>
					</ul>
				</div>
			</div>
		</section>


    <!-- Live Feed Section
    ================================================= -->
		<section id="live-feed">
			<div class="container wrapper">
				<h1 class="section-title slideDown">live feed</h1>
				<ul class="online-users list-inline slideUp">
                	{if isset($users)}
                      	{foreach name=tbl_users item=smarty_users from=$users}
							<li><a title="{$smarty_users.user_name}"><img src="images/users/{if $smarty_users.profile_photo}{$smarty_users.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="img-responsive profile-photo" /><span class="online-dot"></span></a></li>
						{/foreach}
					{/if}
				</ul>
				<h2 class="sub-title">see the people enjoying travel</h2>
				<div class="row">
					{if isset($users2)}
                      	{foreach name=tbl_users item=smarty_users2 from=$users2}
					<div class="col-md-4 col-sm-4 col-md-offset-2">
						<div class="feed-item">
							<img src="images/users/{if $smarty_users2.profile_photo}{$smarty_users2.profile_photo}{else}user_without_photo.jpg{/if}" alt="user" class="img-responsive profile-photo-sm" />
							<div class="live-activity">
								<p><a class="profile-link">{$smarty_users2.user_name}</a> with us since: </p>
								<p class="text-muted">{$smarty_users2.signup_date}</p>
							</div>
						</div>
					</div>
					{/foreach}
					{/if}
				</div>
			</div>
		</section>

    <!-- Footer
    ================================================= -->
	<footer id="footer">
      <div class="container">
      	<div class="row">
          <div class="footer-wrapper">
            <div class="col-md-4 col-sm-4" style="float: left;">
	            <a href="#"><img src="images/logo-black.png" alt="" class="footer-logo" /></a>
	            <ul class="list-inline social-icons">
	                <li><a href="#"><i class="icon ion-social-facebook"></i></a></li>
	                <li><a href="#"><i class="icon ion-social-twitter"></i></a></li>
	                <li><a href="#"><i class="icon ion-social-googleplus"></i></a></li>
	                <li><a href="#"><i class="icon ion-social-pinterest"></i></a></li>
	                <li><a href="#"><i class="icon ion-social-linkedin"></i></a></li>
	            </ul>
	        </div>
	        <div class="col-md-4 col-sm-4" style="float: right;">
	            <h6>Contact Us</h6>
	            <ul class="contact">
	                <li><i class="icon ion-ios-email-outline"></i>eversonzs@hotmail.com</li>
	                <li><i class="icon ion-ios-email-outline"></i>waleska.gutierrez@unah.hn</li>
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
    <script src="js/jquery.appear.min.js"></script>
	<script src="js/jquery.incremental-counter.js"></script>
    <script src="js/script.js"></script>
    
	</body>

</html>
