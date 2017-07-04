{include file="header.tpl"}
  <body>
    <div id="page-contents">
      <div class="container">
        <div class="row">

          <!-- Newsfeed Common Side Bar Left
          ================================================= -->
          {if isset($event_information)}
            {foreach name=tbl_events item=smarty_event_information from=$event_information}
              <div class="col-md-3 static">
                <div class="profile-card" style="background: linear-gradient(to bottom, rgba(39,170,225,.8), rgba(28,117,188,.8)), url(images/covers/header_default.jpg) no-repeat">
                  <img src="images/users/{if $smarty_event_information.profile_photo}{$smarty_event_information.profile_photo}{else}user_without_photo.jpg{/if}" alt="user" class="profile-photo" />
                  <h4><a href="event_page.php?id_event={$smarty_event_information.id_event}" class="text-white">{$smarty_event_information.event_name}</a></h4>
                </div><!--profile card ends-->
                <ul class="nav-news-feed">
                  <li><i class="icon ion-ios-information"></i><div>{$smarty_event_information.description}</div></li>
                  <li><i class="icon ion-calendar"></i><div>{$smarty_event_information.event_date}</div></li>
                  {if $smarty_event_information.id_user == $smarty.session.id_user && $smarty_event_information.type_participation == "creator" || $smarty_event_information.type_participation == "administrator"}
                    <li><i class="icon ion-ios-people"></i><div><a href="invite_people.php?id_event={$smarty_event_information.id_event}">Invite people</a></div></li>
                  {/if}
                  <li><i class="icon ion-ios-people"></i><div><a href="event_participants.php?id_event={$smarty_event_information.id_event}">Participants</a></div></li>
                  <li><i class="icon ion-ios-location"></i><div><a href="#"></a>{$smarty_event_information.address}</div></li>
                </ul><!--news-feed links ends-->
              </div>

              <div class="col-md-7">
                <!-- Post Create Box
                ================================================= -->
                <form name="review" id='review_form' action="insert_review.php" method="POST">
                  <div class="create-post">
                    <div class="row">
                      <div class="col-md-9 col-sm-9">
                        <div class="form-group2">
                          <img src="images/users/{if $smarty.session.profile_photo}{$smarty.session.profile_photo}{else}user_without_photo.jpg{/if}" alt="" class="profile-photo-md"/>
                          <textarea name='description' id="description" cols="30" rows="4" class="form-control" placeholder="Share your opinion"></textarea>
                          <input type="hidden" name="id_event" value="{$smarty_event_information.id_event}" />
                        </div>
                      </div>
                      <div class="col-md-3 col-sm-3">
                        <div class="tools">
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
            {if isset($event_reviews)}
              {foreach name=tbl_reviews item=smarty_reviews from=$event_reviews}
                <div class="post-content">
                  <div class="post-container">
                    <img src="images/users/{if $smarty_reviews.profile_photo}{$smarty_reviews.profile_photo}{else}user_without_photo.jpg{/if}" alt="user" class="profile-photo-md pull-left" />
                    <div class="post-detail">
                      <div class="user-info">
                        <h5><a href="timeline.php?id_user={$smarty_reviews.id_user}" class="profile-link">{$smarty_reviews.name} {$smarty_reviews.surname}</a></h5>
                        <p class="text-muted">{$smarty_reviews.review_date}</p>
                      </div>
                      <div class="reaction">
                        {if $smarty_reviews.id_user == $smarty.session.id_user || isset($delete_publication)}
                          <a class="btn text-red" href="delete_review.php?id_review={$smarty_reviews.id_review}&id_event={$smarty_reviews.id_event}">x</a>
                        {/if}
                      </div>
                      <div class="line-divider"></div>
                      <div class="post-text">
                        <p>{$smarty_reviews.review}</p>
                      </div>
                      <div class="line-divider"></div>
                    </div>
                  </div>
                </div>
              {/foreach}
            {/if}
            <div class="post-pagination">
              <div class="pagination">
                {if isset($_prima)}
                  <a href="event_page.php?id_event={$smarty_reviews.id_event}&pagina={$_prima}" class="links ion-chevron-left"></a>
                {/if}
                {if isset($_prec)}{foreach item=precedente from=$_prec}
                  <a href="event_page.php?id_event={$smarty_reviews.id_event}&pagina={$precedente}" class="links">{$precedente}</a>
                {/foreach}{/if}
                {if isset($_corr)}
                  <a>{$_corr}</a>{/if}
                  {if isset($_succ)}{foreach item=successivo from=$_succ}
                    <a href="event_page.php?id_event={$smarty_reviews.id_event}&pagina={$successivo}" class="links">{$successivo}</a>
                  {/foreach}{/if}
                {if isset($_ultima)}
                  <a href="event_page.php?id_event={$smarty_reviews.id_event}&pagina={$_ultima}" class="links ion-chevron-right"></a>
                {/if}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
{include file="footer.tpl"}