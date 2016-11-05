<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!--
        ===
        This comment should NOT be removed.

        Charisma v2.0.0

        Copyright 2012-2014 Muhammad Usman
        Licensed under the Apache License v2.0
        http://www.apache.org/licenses/LICENSE-2.0

        http://usman.it
        http://twitter.com/halalit_usman
        ===
    -->
    <meta charset="utf-8">
    <title>Online Real Estate</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">

    <link href="css/charisma-app.css" rel="stylesheet">
    <link href='bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='css/jquery.noty.css' rel='stylesheet'>
    <link href='css/noty_theme_default.css' rel='stylesheet'>
    <link href='css/elfinder.min.css' rel='stylesheet'>
    <link href='css/elfinder.theme.css' rel='stylesheet'>
    <link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='css/uploadify.css' rel='stylesheet'>
    <link href='css/animate.min.css' rel='stylesheet'>
    <link href="css/opa-icons.css" rel="stylesheet" />   
    <link href="css/my_css.css" rel="stylesheet" />


    <!-- jQuery -->
    <script src="bower_components/jquery/jquery.min.js"></script>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="img/favicon.ico">

</head>

    <body>
	<!-- topbar starts -->
	<%@include file="header.jsp" %> 
	<!-- topbar ends -->

	<div class="ch-container">
    <div class="row">

		<noscript>
		    <div class="alert alert-block span10">
			<h4 class="alert-heading">Warning!</h4>
			<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
		    </div>
		</noscript>




		<%@include file="main_menu.jsp" %>	



		<div id="content" style="width: 82.87292817100001%; *width: 82.8197366816383%; margin-left:auto; margin-right:auto;">
		    
		    <!-- content starts -->
		    <div class="row-fluid">
			<div class="box span12">
			    <div class="box-header well" data-original-title="">
				<h2><i class="icon-home"></i>&nbsp;Welcome Page</h2>
			    </div>
			    <div class="box-content">
				<ul class="breadcrumb">
				    <li>
					<span class="divider"><i>Current:</i> </span><a href="#">Home</a>
				    </li>
				</ul>

				<div id="wrapper">
				    <div class="slider-wrapper theme-default">
					<div id="slider" class="nivoSlider">
					    <img alt="" data-thumb="img/sold_house.jpg" src="img/sold_house.jpg" />
                                            <img alt="" data-thumb="img/1407048965931.c005b4ca7f3035b41ad9b15da9618afc.jpg" src="img/1407048965931.c005b4ca7f3035b41ad9b15da9618afc.jpg" />
					</div>
				    </div>

				</div>				

				<div class="page-header">
				    <h1>The Application <small>- Summary -</small></h1>
				</div>     
				<div class="row-fluid ">            
				    <div class="span6">
					<h3>Overview</h3>
					<p>
					    <ul>
                                                <!-- sxolia se bullets sxetika me thn selida -->
						<li>Support maps where you can browse properties  <br/><br/></li>
						<li>You can search properties which meet your requirments<br/><br/></li>
						<li>Properties may be listed for sale<br/><br/></li>
						<li>Your property is listed and at the same time people may be intrested in<br/><br/></li>
					    </ul>
					</p>
				    </div>
				    <div class="span6">
					<h3>Benefits</h3>
					<p>
					    <ul>
						<li>A quick and easy method to advertise your property that is for sale/lease or if you would like to buy a property.<br/><br/></li>
						<li>Direct access to information about the property in question<br/><br/></li>
						<li>Once listed, your home is available until you will sell the property<br/><br/></li>
						<li>Searching for the right house is very easy as the website will allow you to only see the houses that meet your requirements<br/><br/></li>
					    </ul>
					</p>
				    </div>
				</div><!--/row -->
			    </div>
			    <!--box-content ends-->

			</div>
			<!--box span12 ends-->
		    </div><!--row-fluid ends-->

		</div>
		<!--/#content.span10 ends-->

	    </div><!--/fluid-row-->

	    <hr />



            <!-- edw vazoume to script me ta onomata mas ,ta onomata twn diaxeiristwn ths selidas -->
            <%@include file= "footer.jsp" %>


	</div>
	<!--container-fluid ends-->



	<!--MY LINKS FOR jQuery SLIDER-->

	<!--<script type="text/javascript" src= "nivo-slider/demo/scripts/jquery-1.9.0.min.js" ></script>
    <script type="text/javascript" src= "nivo-slider/jquery.nivo.slider.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>-->

	<!--END OF LINKS FOR jQuery SLIDER-->


	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery -->
	<!--<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->





        <!-- external javascript -->

        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- library for cookie management -->
        <!--<script src="js/jquery.cookie.js"></script>
        <!-- calender plugin -->
        <script src='bower_components/moment/min/moment.min.js'></script>
        <script src='bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
        <!-- data table plugin -->
        <script src='js/jquery.dataTables.min.js'></script>

        <!-- select or dropdown enhancer -->
        <script src="bower_components/chosen/chosen.jquery.min.js"></script>
        <!-- plugin for gallery image view -->
        <script src="bower_components/colorbox/jquery.colorbox-min.js"></script>
        <!-- notification plugin -->
        <script src="js/jquery.noty.js"></script>
        <!-- library for making tables responsive -->
        <script src="bower_components/responsive-tables/responsive-tables.js"></script>
        <!-- tour plugin -->
        <script src="bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
        <!-- star rating plugin -->
        <script src="js/jquery.raty.min.js"></script>
        <!-- for iOS style toggle switch -->
        <script src="js/jquery.iphone.toggle.js"></script>
        <!-- autogrowing textarea plugin -->
        <script src="js/jquery.autogrow-textarea.js"></script>
        <!-- multiple file upload plugin -->
        <script src="js/jquery.uploadify-3.1.min.js"></script>
        <!-- history.js for cross-browser state change on ajax -->
        <script src="js/jquery.history.js"></script>
        <!-- application script for Charisma demo -->
        <script src="js/charisma.js"></script>
        
        <!--<link href="css/my_css.css" rel="stylesheet" />-->
        

        <%if ((String) request.getAttribute("message") == "pending" ) {%>
        <script>alert("Your registration is pending.\n Wait for admin's aproval");</script><%}%>
        <%if ((String) request.getAttribute("message") == "registered" ) {%>
        <script>alert("You have successfully registed !");</script><%}%>
	
    </body>
</html>
