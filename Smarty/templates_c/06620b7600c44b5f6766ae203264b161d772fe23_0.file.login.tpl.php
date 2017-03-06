<?php
/* Smarty version 3.1.30, created on 2017-02-21 18:22:01
  from "C:\wamp64\www\WebTech\Progetto_practica\Esempio\Smarty\templates\login.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_58ac854965f197_13677924',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '06620b7600c44b5f6766ae203264b161d772fe23' => 
    array (
      0 => 'C:\\wamp64\\www\\WebTech\\Progetto_practica\\Esempio\\Smarty\\templates\\login.tpl',
      1 => 1487701318,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_58ac854965f197_13677924 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>another login panel</title> 
  
  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>

  <form action="logout.php" >

    <?php if (isset($_SESSION['id_utenti'])) {?>
      <?php echo $_SESSION['nome'];?>

    <?php }?>

    <input name="logout" type="submit" value="submit" />

  </form>


  <div class="loginpanel">
    <form action="login.php" method="post">
    <div class="txt">
    <input type="hidden" name="check" value="1"/>
      <input id="user" type="text" name="user" placeholder="Username" />
      <label for="user" class="entypo-user"></label>
    </div>
    <div class="txt">
      <input id="pwd" type="password" name="pwd" placeholder="Password" />
      <label for="pwd" class="entypo-lock"></label>
    </div>
    <div class="buttons">
      <input type="submit" value="submit" />
      
    </form>
  </div>

  
  <div class="hr">
    <div></div>
    <div>OR</div>
    <div></div>
  </div>
  
  
</div>

<span class="resp-info"></span>
 

  
</body>
</html>
<?php }
}
