{include file="header.tpl"}
  <body>
    <div id="page-contents">
      <div class="container">
        <div class="row">
          <div class="post-content">
            <div class="post-conteiner">
              <h3><center>Groups permissions</center></h3>
              <form name="update_group_permissions_form" id='update_group_permissions' class="form-inline" action="update_group_permissions.php" method="post">
                <ul>
                  <ul><h4>Admin</h4></ul>
                  {if isset($permissions)}
                    {foreach name=tbl_permissions item=smarty_permissions from=$permissions}
                      <li><input type="checkbox" name="permission_admin[]" {if isset($group_permissions)} {foreach name=tbl_permissions item=smarty_group_permissions from=$group_permissions} {if $smarty_group_permissions.id_permission == $smarty_permissions.id_permission && $smarty_group_permissions.group=="admin"} checked value="{$smarty_permissions.id_permission}" {/if} {/foreach} {/if}> {$smarty_permissions.permission}, id permission = {$smarty_permissions.id_permission}</input></li>
                    {/foreach}
                  {/if}

                  <br>
                  <ul><h4>Active User</h4></ul>
                  {if isset($permissions)}
                    {foreach name=tbl_permissions item=smarty_permissions from=$permissions}
                      <li><input type="checkbox" name="permission_active_user[]" {if isset($group_permissions)} {foreach name=tbl_permissions item=smarty_group_permissions from=$group_permissions} {if $smarty_group_permissions.id_permission == $smarty_permissions.id_permission && $smarty_group_permissions.group=="active_user"} checked value="{$smarty_permissions.id_permission}"{/if} {/foreach} {/if}> {$smarty_permissions.permission}, id permission = {$smarty_permissions.id_permission}</input></li>
                    {/foreach}
                  {/if}

                  <br>
                  <ul><h4>Banned User</h4></ul>
                  {if isset($permissions)}
                    {foreach name=tbl_permissions item=smarty_permissions from=$permissions}
                      <li><input type="checkbox" name="permission_banned_user[]" {if isset($group_permissions)} {foreach name=tbl_permissions item=smarty_group_permissions from=$group_permissions} {if $smarty_group_permissions.id_permission == $smarty_permissions.id_permission && $smarty_group_permissions.group=="banned_user"} checked value="{$smarty_permissions.id_permission}" {/if} {/foreach} {/if}> {$smarty_permissions.permission}, id permission = {$smarty_permissions.id_permission}</input></li>
                    {/foreach}
                  {/if}

                  <br>
                  <ul><h4>Moderator</h4></ul>
                  {if isset($permissions)}
                    {foreach name=tbl_permissions item=smarty_permissions from=$permissions}
                      <li><input type="checkbox" name="permission_moderator[]" {if isset($group_permissions)} {foreach name=tbl_permissions item=smarty_group_permissions from=$group_permissions} {if $smarty_group_permissions.id_permission == $smarty_permissions.id_permission && $smarty_group_permissions.group=="moderator"} checked value="{$smarty_permissions.id_permission}" {/if} {/foreach} {/if}> {$smarty_permissions.permission}, id permission = {$smarty_permissions.id_permission}</input></li>
                    {/foreach}
                  {/if}

                </ul>
                <button type='submit' class="btn btn-primary">Update</button>
              <form>
            </div>
          </div>
        </div>
      </div>
    </div>


    <!-- Footer
    ================================================= -->
    <footer id="footer">
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