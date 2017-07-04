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
                      </div>
                    </div>
                    <div class="col-md-9">
                      <ul class="list-inline profile-menu">
                        <li><a href="timeline.php?id_user={$smarty_user.id_user}">Timeline</a></li>
                        <li><a href="timeline-about.php?id_user={$smarty_user.id_user}" class="active">About</a></li>
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
                <h4>Sarah Cruiz</h4>
              </div>
              <div class="mobile-menu">
                <ul class="list-inline">
                  <li><a href="timeline.php?id_user={$smarty_user.id_user}">Timeline</a></li>
                  <li><a href="timeline-about.php?id_user={$smarty_user.id_user}" class="active">About</a></li>
                  <li><a href="timeline-followers.php?id_user={$smarty_user.id_user}">Followers</a></li>
                  <li><a href="timeline-following.php?id_user={$smarty_user.id_user}">Following</a></li>
                </ul>
                <li>{if isset($followers)} {$followers} followers {/if}</li>
                {if $smarty_user.id_user != $smarty.session.id_user}<li>{if $already_following==0}<a class="btn-primary" href="friendship.php?id_user={$smarty_user.id_user}&follow=follow">Follow</a>{else}<a class="btn-primary" href="friendship.php?id_user={$smarty_user.id_user}&follow=unfollow">Unfollow</a>{/if}</li>{/if}
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
                      <form name="registration_form" id='registration_form' class="form-inline" action="update_about.php" method="post" hidden="true">      
                        <div class="row">
                        <p class="birth"><strong>Personal Information</strong></p>
                          <div class="form-group col-xs-6">
                            <input type="hidden" name="check" value="1"/>
                            <label for="firstname" class="sr-only">First Name</label>
                            <input id="firstname" class="form-control input-group-lg" type="text" name="firstname" title="Enter first name" placeholder="Enter your first name" value="{$smarty_user.name}" required/>
                          </div>
                          <div class="form-group col-xs-6">
                            <label for="lastname" class="sr-only">Last Name</label>
                            <input id="lastname" class="form-control input-group-lg" type="text" name="lastname" title="Enter last name" placeholder="Enter your lastname" value="{$smarty_user.surname}" required/>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-xs-12">
                            <label for="username" class="sr-only">Username</label>
                            <input id="username" class="form-control input-group-lg" type="text" name="username" title="Enter an username" placeholder="Enter a username" value="{$smarty_user.user_name}" required/>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-xs-12">
                            <label for="email" class="sr-only">Email</label>
                            <input id="email" class="form-control input-group-lg" type="text" name="Email" title="Enter Email" placeholder="Enter your email" value="{$smarty_user.email}" required/>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-xs-12">
                            <label for="password" class="sr-only">Password</label>
                            <input id="password" class="form-control input-group-lg" type="password" name="password" title="Enter password" placeholder="Enter your password" required/>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-xs-12">
                            <label for="cellphone" class="sr-only">Cellphone</label>
                            <input id="cellphone" class="form-control input-group-lg" type="text" name="cellphone" title="Enter your cellphone number" placeholder="Enter your cellphone number" value="{$smarty_user.cellphone}" required/>
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
                            <input id="city" class="form-control input-group-lg reg_name" type="text" placeholder="Enter city" name="city" title="Enter city" value="{$smarty_user.city}" required/>
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
                        <div class="row">
                          <p class="birth"><strong>About Me</strong></p>
                          <div class="form-group col-xs-12">
                            <label for="about_me" class="sr-only">about</label>
                            <input id="about_me" class="form-control input-group-lg reg_name" type="text" placeholder="About me..." name="about_me" title="About me" value="{$smarty_user.about_me}" />
                          </div>
                        </div>
                        
                        <button type='submit' class="btn btn-primary" >Update</button>
                       
                      </form><!--Register Now Form Ends-->
                    {/if}
                    
                    <div class="about-content-block">
                      <div>
                          <h4 class="grey"><i class="ion-ios-information-outline icon-in-title"></i>Personal Information {if $smarty_user.id_user == $smarty.session.id_user} <button class="btn btn-default pull-right" id="edit_information" value="edit information" style="float: right;" onclick="edit_information(0)"><i class="ion-edit"></i></button>{/if}</h4>
                      </div>
                        <ul class="contact">
                          <li><i class="icon ion-person"></i>Name:<blockquote><p>{$smarty_user.name} {$smarty_user.surname}</p></li>
                          <li><i class="icon ion-at"></i>Nickname:<blockquote><p>{$smarty_user.user_name}</p></li>
                          <li><i class="icon ion-ios-email"></i>Email: <blockquote>{$smarty_user.email}</li>
                          <li><i class="icon ion-android-call"></i>Cellphone: <blockquote>{$smarty_user.cellphone}</li>
                          <li><i class="icon ion-location"></i>Location: <blockquote>{$smarty_user.continent}, {$smarty_user.country}, {$smarty_user.city}</li>
                          <li><i class="icon ion-calendar"></i>Born date: <blockquote>{$smarty_user.month_born} {$smarty_user.day_born}, {$smarty_user.year_born}</li>
                          <li><i class="icon ion-calendar"></i>With us since: <blockquote>{$smarty_user.signup_month} {$smarty_user.signup_day}, {$smarty_user.signup_year}</li>
                          <li><i class="icon ion-ios-information-outline"></i>About me: <blockquote>{$smarty_user.about_me}</li>
                        </ul>
                    </div>
                    <div class="about-content-block">
                      <h4 class="grey"><i class="ion-ios-heart-outline icon-in-title"></i>Interests</h4>
                      <ul class="interests list-inline">
                        <li><span class="int-icons" title="Bycycle riding"><i class="icon ion-android-bicycle"></i></span></li>
                        <li><span class="int-icons" title="Photography"><i class="icon ion-ios-camera"></i></span></li>
                        <li><span class="int-icons" title="Eating"><i class="icon ion-pizza"></i></span></li>
                        <li><span class="int-icons" title="Drinking"><i class="icon ion-wineglass"></i></span></li>
                        <li><span class="int-icons" title="Plane"><i class="icon ion-android-plane"></i></span></li>
                      </ul>
                    </div>
                  {/foreach}
                {/if}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


  {include file="footer.tpl"}