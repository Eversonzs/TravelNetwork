{include file="header.tpl"}
  <body>

    <div class="container">

      <!-- Timeline
      ================================================= -->
      <div class="timeline">
      {if isset($user)}
        {foreach name=tbl_users item=smarty_user from=$user}
          <div class="timeline-cover" style="background: url(images/covers/{if $smarty_user.header_photo}{$smarty_user.header_photo}{else}header_default.jpg{/if}) no-repeat">
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
                        <li><a href="timeline.php?id_user={$smarty_user.id_user}">Timeline</a></li>
                        <li><a href="timeline-about.php?id_user={$smarty_user.id_user}" class="active">About</a></li>
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
                <h4>Sarah Cruiz</h4>
                <p class="text-muted">Creative Director</p>
              </div>
              <div class="mobile-menu">
                <ul class="list-inline">
                  <li><a href="timline.html">Timeline</a></li>
                  <li><a href="timeline-about.html" class="active">About</a></li>
                  <li><a href="timeline-album.html">Album</a></li>
                  <li><a href="timeline-friends.html">Friends</a></li>
                </ul>
                <button class="btn-primary">Add Friend</button>
              </div>
            </div><!--Timeline Menu for Small Screens End-->    
          </div>
        {/foreach}
      {/if}

        <div id="page-contents">
          <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-7">

              <!-- About
              ================================================= -->
              <div class="about-profile">
                {if isset($user)}
                  {foreach name=tbl_users item=smarty_user from=$user}
                    {if $smarty_user.id_user == $smarty.session.id_user}
                      <form name="registration_form" id='registration_form' class="form-inline" action="update_about.php" method="post">      
                        <div class="row">
                          <div class="form-group col-xs-6">
                            <input type="hidden" name="check" value="1"/>
                            <label for="firstname" class="sr-only">First Name</label>
                            <input id="firstname" class="form-control input-group-lg" type="text" name="firstname" title="Enter first name" value="{$smarty_user.name}" required/>
                          </div>
                          <div class="form-group col-xs-6">
                            <label for="lastname" class="sr-only">Last Name</label>
                            <input id="lastname" class="form-control input-group-lg" type="text" name="lastname" title="Enter last name" value="{$smarty_user.surname}" required/>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-xs-12">
                            <label for="username" class="sr-only">Username</label>
                            <input id="username" class="form-control input-group-lg" type="text" name="username" title="Enter an username" value="{$smarty_user.user_name}" required/>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-xs-12">
                            <label for="email" class="sr-only">Email</label>
                            <input id="email" class="form-control input-group-lg" type="text" name="Email" title="Enter Email"  value="{$smarty_user.email}" required/>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-xs-12">
                            <label for="password" class="sr-only">Password</label>
                            <input id="password" class="form-control input-group-lg" type="password" name="password" title="Enter password"  value="{$smarty_user.user_password}" required/>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-xs-12">
                            <label for="cellphone" class="sr-only">Cellphone</label>
                            <input id="cellphone" class="form-control input-group-lg" type="text" name="cellphone" title="Enter your cellphone number" value="{$smarty_user.cellphone}" required/>
                          </div>
                        </div>
                        <div class="row">
                          <p class="birth"><strong>Date of Birth</strong></p>
                          <div class="form-group col-sm-3 col-xs-6">
                            <label for="day" class="sr-only"></label>
                            <select class="form-control" id="day" name="day">
                              <option value="" disabled>Day</option>
                              <option value="{$smarty_user.day_born}" selected>{$smarty_user.day_born}</option>
                              <script>
                                list_days();
                              </script>
                            </select>
                          </div>
                          <div class="form-group col-sm-3 col-xs-6">
                            <label for="month" class="sr-only"></label>
                            <select class="form-control" id="month" name="month">
                              <option value="" disabled>Month</option>
                              <option value="{$smarty_user.month_born_number}" selected>{$smarty_user.month_born}</option>
                              <option value="01">Jan</option>
                              <option value="02">Feb</option>
                              <option value="03">Mar</option>
                              <option value="04">Apr</option>
                              <option value="05">May</option>
                              <option value="06">Jun</option>
                              <option value="07">Jul</option>
                              <option value="08">Aug</option>
                              <option value="09">Sep</option>
                              <option value="10">Oct</option>
                              <option value="11">Nov</option>
                              <option value="12">Dec</option>
                            </select>
                          </div>
                          <div class="form-group col-sm-6 col-xs-12">
                            <label for="year" class="sr-only"></label>
                            <select class="form-control" id="year" name="year">
                              <option value="" disabled>Year</option>
                              <option value="{$smarty_user.year_born}" selected>{$smarty_user.year_born}</option>
                              <script>
                                list_years();
                              </script>
                            </select>
                          </div>
                        </div>
                        <div class="row">
                          <p class="birth"><strong>Location</strong></p>
                          <div class="form-group col-xs-12">
                            <label for="city" class="sr-only">city</label>
                            <input id="city" class="form-control input-group-lg reg_name" type="text" name="city" title="Enter city" value="{$smarty_user.city}" required/>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-xs-6">
                            <label for="country" class="sr-only"></label>
                            <select class="form-control" id="country" name="country">
                              <option value="" disabled>Country</option>
                              <option value="{$smarty_user.country}" selected="">{$smarty_user.country}</option>
                              <option value="AFG">Afghanistan</option>
                              <option value="ALA">Åland Islands</option>
                              <option value="ALB">Albania</option>
                              <option value="DZA">Algeria</option>
                              <option value="ASM">American Samoa</option>
                              <option value="AND">Andorra</option>
                              <option value="AGO">Angola</option>
                              <option value="AIA">Anguilla</option>
                              <option value="ATA">Antarctica</option>
                              <option value="ATG">Antigua and Barbuda</option>
                              <option value="ARG">Argentina</option>
                              <option value="ARM">Armenia</option>
                              <option value="ABW">Aruba</option>
                              <option value="AUS">Australia</option>
                              <option value="AUT">Austria</option>
                              <option value="AZE">Azerbaijan</option>
                              <option value="BHS">Bahamas</option>
                              <option value="BHR">Bahrain</option>
                              <option value="BGD">Bangladesh</option>
                              <option value="BRB">Barbados</option>
                              <option value="BLR">Belarus</option>
                              <option value="BEL">Belgium</option>
                              <option value="BLZ">Belize</option>
                              <option value="BEN">Benin</option>
                              <option value="BMU">Bermuda</option>
                              <option value="BTN">Bhutan</option>
                              <option value="BOL">Bolivia, Plurinational State of</option>
                              <option value="BES">Bonaire, Sint Eustatius and Saba</option>
                              <option value="BIH">Bosnia and Herzegovina</option>
                              <option value="BWA">Botswana</option>
                              <option value="BVT">Bouvet Island</option>
                              <option value="BRA">Brazil</option>
                              <option value="IOT">British Indian Ocean Territory</option>
                              <option value="BRN">Brunei Darussalam</option>
                              <option value="BGR">Bulgaria</option>
                              <option value="BFA">Burkina Faso</option>
                              <option value="BDI">Burundi</option>
                              <option value="KHM">Cambodia</option>
                              <option value="CMR">Cameroon</option>
                              <option value="CAN">Canada</option>
                              <option value="CPV">Cape Verde</option>
                              <option value="CYM">Cayman Islands</option>
                              <option value="CAF">Central African Republic</option>
                              <option value="TCD">Chad</option>
                              <option value="CHL">Chile</option>
                              <option value="CHN">China</option>
                              <option value="CXR">Christmas Island</option>
                              <option value="CCK">Cocos (Keeling) Islands</option>
                              <option value="COL">Colombia</option>
                              <option value="COM">Comoros</option>
                              <option value="COG">Congo</option>
                              <option value="COD">Congo, the Democratic Republic of the</option>
                              <option value="COK">Cook Islands</option>
                              <option value="CRI">Costa Rica</option>
                              <option value="CIV">Côte d'Ivoire</option>
                              <option value="HRV">Croatia</option>
                              <option value="CUB">Cuba</option>
                              <option value="CUW">Curaçao</option>
                              <option value="CYP">Cyprus</option>
                              <option value="CZE">Czech Republic</option>
                              <option value="DNK">Denmark</option>
                              <option value="DJI">Djibouti</option>
                              <option value="DMA">Dominica</option>
                              <option value="DOM">Dominican Republic</option>
                              <option value="ECU">Ecuador</option>
                              <option value="EGY">Egypt</option>
                              <option value="SLV">El Salvador</option>
                              <option value="GNQ">Equatorial Guinea</option>
                              <option value="ERI">Eritrea</option>
                              <option value="EST">Estonia</option>
                              <option value="ETH">Ethiopia</option>
                              <option value="FLK">Falkland Islands (Malvinas)</option>
                              <option value="FRO">Faroe Islands</option>
                              <option value="FJI">Fiji</option>
                              <option value="FIN">Finland</option>
                              <option value="FRA">France</option>
                              <option value="GUF">French Guiana</option>
                              <option value="PYF">French Polynesia</option>
                              <option value="ATF">French Southern Territories</option>
                              <option value="GAB">Gabon</option>
                              <option value="GMB">Gambia</option>
                              <option value="GEO">Georgia</option>
                              <option value="DEU">Germany</option>
                              <option value="GHA">Ghana</option>
                              <option value="GIB">Gibraltar</option>
                              <option value="GRC">Greece</option>
                              <option value="GRL">Greenland</option>
                              <option value="GRD">Grenada</option>
                              <option value="GLP">Guadeloupe</option>
                              <option value="GUM">Guam</option>
                              <option value="GTM">Guatemala</option>
                              <option value="GGY">Guernsey</option>
                              <option value="GIN">Guinea</option>
                              <option value="GNB">Guinea-Bissau</option>
                              <option value="GUY">Guyana</option>
                              <option value="HTI">Haiti</option>
                              <option value="HMD">Heard Island and McDonald Islands</option>
                              <option value="VAT">Holy See (Vatican City State)</option>
                              <option value="HND">Honduras</option>
                              <option value="HKG">Hong Kong</option>
                              <option value="HUN">Hungary</option>
                              <option value="ISL">Iceland</option>
                              <option value="IND">India</option>
                              <option value="IDN">Indonesia</option>
                              <option value="IRN">Iran, Islamic Republic of</option>
                              <option value="IRQ">Iraq</option>
                              <option value="IRL">Ireland</option>
                              <option value="IMN">Isle of Man</option>
                              <option value="ISR">Israel</option>
                              <option value="ITA">Italy</option>
                              <option value="JAM">Jamaica</option>
                              <option value="JPN">Japan</option>
                              <option value="JEY">Jersey</option>
                              <option value="JOR">Jordan</option>
                              <option value="KAZ">Kazakhstan</option>
                              <option value="KEN">Kenya</option>
                              <option value="KIR">Kiribati</option>
                              <option value="PRK">Korea, Democratic People's Republic of</option>
                              <option value="KOR">Korea, Republic of</option>
                              <option value="KWT">Kuwait</option>
                              <option value="KGZ">Kyrgyzstan</option>
                              <option value="LAO">Lao People's Democratic Republic</option>
                              <option value="LVA">Latvia</option>
                              <option value="LBN">Lebanon</option>
                              <option value="LSO">Lesotho</option>
                              <option value="LBR">Liberia</option>
                              <option value="LBY">Libya</option>
                              <option value="LIE">Liechtenstein</option>
                              <option value="LTU">Lithuania</option>
                              <option value="LUX">Luxembourg</option>
                              <option value="MAC">Macao</option>
                              <option value="MKD">Macedonia, the former Yugoslav Republic of</option>
                              <option value="MDG">Madagascar</option>
                              <option value="MWI">Malawi</option>
                              <option value="MYS">Malaysia</option>
                              <option value="MDV">Maldives</option>
                              <option value="MLI">Mali</option>
                              <option value="MLT">Malta</option>
                              <option value="MHL">Marshall Islands</option>
                              <option value="MTQ">Martinique</option>
                              <option value="MRT">Mauritania</option>
                              <option value="MUS">Mauritius</option>
                              <option value="MYT">Mayotte</option>
                              <option value="MEX">Mexico</option>
                              <option value="FSM">Micronesia, Federated States of</option>
                              <option value="MDA">Moldova, Republic of</option>
                              <option value="MCO">Monaco</option>
                              <option value="MNG">Mongolia</option>
                              <option value="MNE">Montenegro</option>
                              <option value="MSR">Montserrat</option>
                              <option value="MAR">Morocco</option>
                              <option value="MOZ">Mozambique</option>
                              <option value="MMR">Myanmar</option>
                              <option value="NAM">Namibia</option>
                              <option value="NRU">Nauru</option>
                              <option value="NPL">Nepal</option>
                              <option value="NLD">Netherlands</option>
                              <option value="NCL">New Caledonia</option>
                              <option value="NZL">New Zealand</option>
                              <option value="NIC">Nicaragua</option>
                              <option value="NER">Niger</option>
                              <option value="NGA">Nigeria</option>
                              <option value="NIU">Niue</option>
                              <option value="NFK">Norfolk Island</option>
                              <option value="MNP">Northern Mariana Islands</option>
                              <option value="NOR">Norway</option>
                              <option value="OMN">Oman</option>
                              <option value="PAK">Pakistan</option>
                              <option value="PLW">Palau</option>
                              <option value="PSE">Palestinian Territory, Occupied</option>
                              <option value="PAN">Panama</option>
                              <option value="PNG">Papua New Guinea</option>
                              <option value="PRY">Paraguay</option>
                              <option value="PER">Peru</option>
                              <option value="PHL">Philippines</option>
                              <option value="PCN">Pitcairn</option>
                              <option value="POL">Poland</option>
                              <option value="PRT">Portugal</option>
                              <option value="PRI">Puerto Rico</option>
                              <option value="QAT">Qatar</option>
                              <option value="REU">Réunion</option>
                              <option value="ROU">Romania</option>
                              <option value="RUS">Russian Federation</option>
                              <option value="RWA">Rwanda</option>
                              <option value="BLM">Saint Barthélemy</option>
                              <option value="SHN">Saint Helena, Ascension and Tristan da Cunha</option>
                              <option value="KNA">Saint Kitts and Nevis</option>
                              <option value="LCA">Saint Lucia</option>
                              <option value="MAF">Saint Martin (French part)</option>
                              <option value="SPM">Saint Pierre and Miquelon</option>
                              <option value="VCT">Saint Vincent and the Grenadines</option>
                              <option value="WSM">Samoa</option>
                              <option value="SMR">San Marino</option>
                              <option value="STP">Sao Tome and Principe</option>
                              <option value="SAU">Saudi Arabia</option>
                              <option value="SEN">Senegal</option>
                              <option value="SRB">Serbia</option>
                              <option value="SYC">Seychelles</option>
                              <option value="SLE">Sierra Leone</option>
                              <option value="SGP">Singapore</option>
                              <option value="SXM">Sint Maarten (Dutch part)</option>
                              <option value="SVK">Slovakia</option>
                              <option value="SVN">Slovenia</option>
                              <option value="SLB">Solomon Islands</option>
                              <option value="SOM">Somalia</option>
                              <option value="ZAF">South Africa</option>
                              <option value="SGS">South Georgia and the South Sandwich Islands</option>
                              <option value="SSD">South Sudan</option>
                              <option value="ESP">Spain</option>
                              <option value="LKA">Sri Lanka</option>
                              <option value="SDN">Sudan</option>
                              <option value="SUR">Suriname</option>
                              <option value="SJM">Svalbard and Jan Mayen</option>
                              <option value="SWZ">Swaziland</option>
                              <option value="SWE">Sweden</option>
                              <option value="CHE">Switzerland</option>
                              <option value="SYR">Syrian Arab Republic</option>
                              <option value="TWN">Taiwan, Province of China</option>
                              <option value="TJK">Tajikistan</option>
                              <option value="TZA">Tanzania, United Republic of</option>
                              <option value="THA">Thailand</option>
                              <option value="TLS">Timor-Leste</option>
                              <option value="TGO">Togo</option>
                              <option value="TKL">Tokelau</option>
                              <option value="TON">Tonga</option>
                              <option value="TTO">Trinidad and Tobago</option>
                              <option value="TUN">Tunisia</option>
                              <option value="TUR">Turkey</option>
                              <option value="TKM">Turkmenistan</option>
                              <option value="TCA">Turks and Caicos Islands</option>
                              <option value="TUV">Tuvalu</option>
                              <option value="UGA">Uganda</option>
                              <option value="UKR">Ukraine</option>
                              <option value="ARE">United Arab Emirates</option>
                              <option value="GBR">United Kingdom</option>
                              <option value="USA">United States</option>
                              <option value="UMI">United States Minor Outlying Islands</option>
                              <option value="URY">Uruguay</option>
                              <option value="UZB">Uzbekistan</option>
                              <option value="VUT">Vanuatu</option>
                              <option value="VEN">Venezuela, Bolivarian Republic of</option>
                              <option value="VNM">Viet Nam</option>
                              <option value="VGB">Virgin Islands, British</option>
                              <option value="VIR">Virgin Islands, U.S.</option>
                              <option value="WLF">Wallis and Futuna</option>
                              <option value="ESH">Western Sahara</option>
                              <option value="YEM">Yemen</option>
                              <option value="ZMB">Zambia</option>
                              <option value="ZWE">Zimbabwe</option>
                            </select>
                          </div>
                          <div class="form-group col-xs-6">
                            <label for="continent" class="sr-only"></label>
                            <select class="form-control" id="continent" name="continent">
                              <option value="" disabled>Continent</option>
                              <option value="{$smarty_user.continent}" selected>{$smarty_user.continent}</option>
                              <option value="Asia">Asia</option>
                              <option value="America">America</option>
                              <option value="Africa">Africa</option>
                              <option value="Antartida">Antartida</option>
                              <option value="Europe">Europe</option>
                              <option value="Oceania">Oceania</option>
                            </select>
                          </div>
                        </div>
                        
                        <button type='submit' class="btn btn-primary" >Update</button>
                       
                      </form><!--Register Now Form Ends-->

                  {else}
                    <div class="about-content-block">
                      <h4 class="blue"><i class="ion-ios-information"></i>  Personal Information</h4>
                        <ul class="contact">
                          <li><i class="icon ion-person"></i>Name: {$smarty_user.name} {$smarty_user.surname}</li>
                          <li><i class="icon ion-at"></i>Nickname: {$smarty_user.user_name}</li>
                          <li><i class="icon ion-ios-email"></i>Email: {$smarty_user.email}</li>
                          <li><i class="icon ion-android-call"></i>Cellphone: {$smarty_user.cellphone}</li>
                          <li><i class="icon ion-location"></i>Location: {$smarty_user.continent}, {$smarty_user.country}, {$smarty_user.city}</li>
                          <li><i class="icon ion-calendar"></i>Born date: {$smarty_user.month_born} {$smarty_user.day_born}, {$smarty_user.year_born}</li>
                          <li><i class="icon ion-calendar"></i>With us since: {$smarty_user.signup_date}</li>
                          <li><i class="icon ion-ios-information-outline"></i>About me: {$smarty_user.about_me}</li>
                        </ul>
                    </div>
                    <div class="about-content-block">
                      <h4 class="grey"><i class="ion-ios-briefcase-outline icon-in-title"></i>Work Experiences</h4>
                      <div class="organization">
                        <img src="images/envato.png" alt="" class="pull-left img-org" />
                        <div class="work-info">
                          <h5>Envato</h5>
                          <p>Seller - <span class="text-grey">1 February 2013 to present</span></p>
                        </div>
                      </div>
                      <div class="organization">
                        <img src="images/envato.png" alt="" class="pull-left img-org" />
                        <div class="work-info">
                          <h5>Envato</h5>
                          <p>Seller - <span class="text-grey">1 February 2013 to present</span></p>
                        </div>
                      </div>
                      <div class="organization">
                        <img src="images/envato.png" alt="" class="pull-left img-org" />
                        <div class="work-info">
                          <h5>Envato</h5>
                          <p>Seller - <span class="text-grey">1 February 2013 to present</span></p>
                        </div>
                      </div>
                    </div>
                    <div class="about-content-block">
                      <h4 class="grey"><i class="ion-ios-location-outline icon-in-title"></i>Location</h4>
                      <p>228 Park Eve, New York</p>
                      <div class="google-maps">
                        <div id="map" class="map"></div>
                      </div>
                    </div>
                    <div class="about-content-block">
                      <h4 class="grey"><i class="ion-ios-heart-outline icon-in-title"></i>Interests</h4>
                      <ul class="interests list-inline">
                        <li><span class="int-icons" title="Bycycle riding"><i class="icon ion-android-bicycle"></i></span></li>
                        <li><span class="int-icons" title="Photography"><i class="icon ion-ios-camera"></i></span></li>
                        <li><span class="int-icons" title="Shopping"><i class="icon ion-android-cart"></i></span></li>
                        <li><span class="int-icons" title="Traveling"><i class="icon ion-ios-locked"></i></span></li>
                        <li><span class="int-icons" title="Eating"><i class="icon ion-android-lock"></i></span></li>
                        <li><span class="int-icons" title="Driving"><i class="icon ion-android-calendar"></i></span></li>
                      </ul>
                    </div>
                    <div class="about-content-block">
                      <h4 class="grey"><i class="ion-ios-chatbubble-outline icon-in-title"></i>Language</h4>
                        <ul>
                          <li><a href="#">Russian</a></li>
                          <li><a href="#">English</a></li>
                        </ul>
                    </div>
                    {/if}
                  {/foreach}
                {/if}
              </div>
            </div>
            <div class="col-md-2 static">
              <div id="sticky-sidebar">
                <h4 class="grey">Sarah's activity</h4>
                <div class="feed-item">
                  <div class="live-activity">
                    <p><a href="#" class="profile-link">Sarah</a> Commended on a Photo</p>
                    <p class="text-muted">5 mins ago</p>
                  </div>
                </div>
                <div class="feed-item">
                  <div class="live-activity">
                    <p><a href="#" class="profile-link">Sarah</a> Has posted a photo</p>
                    <p class="text-muted">an hour ago</p>
                  </div>
                </div>
                <div class="feed-item">
                  <div class="live-activity">
                    <p><a href="#" class="profile-link">Sarah</a> Liked her friend's post</p>
                    <p class="text-muted">4 hours ago</p>
                  </div>
                </div>
                <div class="feed-item">
                  <div class="live-activity">
                    <p><a href="#" class="profile-link">Sarah</a> has shared an album</p>
                    <p class="text-muted">a day ago</p>
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
        <p>Thunder Team © 2016. All rights reserved</p>
      </div>
    </footer>
    
    <!--preloader-->
    <div id="spinner-wrapper">
      <div class="spinner"></div>
    </div>

    <!-- Scripts
    ================================================= -->
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTMXfmDn0VlqWIyoOxK8997L-amWbUPiQ&amp;callback=initMap"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.sticky-kit.min.js"></script>
    <script src="js/jquery.scrollbar.min.js"></script>
    <script src="js/script.js"></script>
    
  </body>

<!-- Mirrored from thunder-team.com/friend-finder/timeline-about.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 23 Feb 2017 11:54:56 GMT -->
</html>
