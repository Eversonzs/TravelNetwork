{include file="header.tpl"}
	<body>
	    <div id="page-contents">
      		<div class="container">
			    <div class="post-content">
		            <div class="post-container">
		                <div class="post-detail">
							{if isset($message)} <h3 align="center">{$message}</h3> {/if}
							<br>
							<p align="center"><button class="btn btn-primary" onclick="javascript:history.back()"> << Back </button></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>