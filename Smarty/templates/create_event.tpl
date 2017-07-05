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
              <li><i class="icon ion-ios-people"></i><div><a href="create_event.php">Create Event</a></div></li>
              <li><i class="icon ion-ios-people"></i><div><a href="my_events.php">My events</a></div></li>
              <li><i class="icon ion-star" style="color: #0166fc;"></i><div><a href="events_invitation.php">Events invitation</a></div></li>
            </ul><!--news-feed links ends-->
          </div>

          <div class="col-sm-6 col-sm-offset-1">
            <div class="reg-form-container"> 
            <!--Create new event-->

            <form name="create_event" id='create_event' class="form-inline" action="create_event.php" method="post">
              <h4 align="center"> Create new event </h4><br>
              <div class="row">
                <label>Event name: </label>
                <div class="form-group col-xs-12">
                  <input type="hidden" name="check" value="1"/>
                  <input id="event_name" class="form-control input-group-lg" type="text" name="event_name" title="Enter the event name" placeholder="Event name" style="width: 100%;" required/>
                </div>
              </div><br>
              <div class="row">
                <label>Event description: </label>
                <div class="form-group col-xs-12">
                  <textarea id="event_date" class="form-control input-group-lg" type="text" name="event_description" title="Enter the event description" placeholder="Event description" style="width: 100%;" required></textarea><br><br>
                </div>
              </div>
              <div class="row">
                <label>Event date: </label>
                <div class="form-group col-xs-12">
                  <input id="event_date" class="form-control input-group-lg" type="date" name="event_date" title="Enter the event date" placeholder="Event date" style="width: 100%;" required/><br><br>
                </div>
              </div>
              <div class="row">
                <label>Address: </label>
                <div class="form-group col-xs-12">
                  <input id="address" class="form-control input-group-lg" type="text" name="event_address" title="Enter the address for this event" placeholder="Event address" style="width: 100%;" required/><br><br>
                </div>
              </div>
              <div class="row" align="right">
                <button type='submit' class="btn btn-primary">Create event</button>
              </div>
            </form><!--Register Now Form Ends-->
            </div>

          </div>
        </div>
      </div>
    </div>

{include file="footer.tpl"}