<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- Epiloges gia tous algorithmous pou tha einai energoi -->
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

    <head>
	<meta charset="utf-8" />
	<title>Manage Algorithms</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template." name="description" />
	<meta content="Muhammad Usman" name="author" />

	<!-- The styles -->
	<link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">
	<style type="text/css">
	    body {
		padding-bottom: 40px;
	    }
	    .sidebar-nav {
		padding: 9px 0;
	    }
	</style>
    

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
    <link href='css/jquery.iphone.toggle.css' rel='stylesheet'/>
    <link href='css/uploadify.css' rel='stylesheet'/>
    <link href='css/animate.min.css' rel='stylesheet'/>
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

	<!--MY LINKS FOR jQuery SLIDER-->


	<link href="nivo-slider/themes/default/default.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/themes/light/light.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/themes/dark/dark.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/themes/bar/bar.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/nivo-slider.css" media="screen" rel="stylesheet" type="text/css" />
	<!-- <link rel="stylesheet" href="nivo-slider/demo/style.css" type="text/css" media="screen" /> -->
	<!--END OF LINKS FOR jQuery SLIDER-->




	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link href="img/favicon.ico" rel="shortcut icon" />

    </head>



    <%

	// get attributes from the request
	String message = (String) session.getAttribute("username");

	// handle null values
	if (message == null) {
	    message = "";
	}
    %>

    <body>
        
	<%@include file="header.jsp" %> 
        
        
	<div class="container-fluid">
	    <div class="row-fluid">
		<%@include file="main_menu.jsp" %>
		<div class="row-fluid"> <!--row-fluid gia left menu kai content-->
		    <%@include file="left_menu.jsp" %>
                    
		    <noscript>
			<div class="alert alert-block span10">
			    <h4 class="alert-heading">Warning!</h4>
			    <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
			</div>
		    </noscript>
                    
                    		    <!--whole content starts-->
		    <div id="content" class="span10" >
			<!--main-content admin starts-->
			<div class="row-fluid">
			    <div class="box span12">
				<div class="box-header well" data-original-title="">
                                    <%@ page import="userOp.User" %>
                                    <h2><%= ((User)session.getAttribute("user")).getName()%></h2>
                                    <h2><%= ((User)session.getAttribute("user")).getSurname()%></h2>
				</div>
				<div class="box-content">
				    <ul class="breadcrumb">
					<li>
                                            <span class="divider"><i>Current:</i> </span><a href="index.jsp">Home</a>
					</li>
                                        <li>
                                            <span class="divider">/</span><a href="main_page.jsp">Profile</a>
                                        </li>
                                        <li>
                                            <span class="divider">/</span><a href="#">Manage Algorithms</a>
                                        </li>
				    </ul>
                                <h1>Manage Algorithms</h1>
				    </div>
                                <%@ page import="algoOp.AlgoTableOperations" %>
				    <div class="row-fluid ">            					
					<div class="box span12">
					    <div class="box-header well" data-original-title>
						<h2>Algorithm List</h2>
					    </div>
					    <div class="box-content">
                                                <form action="manage_algo" method="post">
						<table class="table table-striped table-bordered bootstrap-datatable datatable responsive" id="users">
						    <thead>
							<tr>
							    <th>Algorithm Name</th>
                                                            <th>Activate</th>
							</tr>
						    </thead>
                                                    <tbody>
							<tr>
							    <td>TOPSIS</td>
							    <td class="center"><input type="radio" name="topsis" id="topsis_yes" value="yes" /> yes
                                                            		
							</tr>

                                                        <script> document.getElementById("topsis_yes").checked = true;</script>
                                                        <tr>
							    <td>SAW</td>
                                                            <td class="center"><input type="radio" name="saw" id="saw_yes" value="yes" /> yes
                                                            
							</tr>
                                                        <script> document.getElementById("saw_yes").checked = true;</script>
						    </tbody>
						</table> 
                                                    <button type="submit" style="box-shadow: 0px 2px 5px 2px grey;">Submit</button>
                                                </form>     
					    </div>
					</div><!--/span-->
				    </div>
				</div> <!--box-content ends-->
			    </div> <!--box span12 ends-->
			</div> <!--gia row-fluid ends-->
			<!--main-content admin ends-->	
		    </div>
		    <!--whole content ends (#content.span10)-->
		</div> 
		<!-- row-fluid gia left menu kai content ends-->
	    </div>
	    <!--row-fluid-->
	    <hr />

	    <%@include file="footer.jsp" %>

	</div>
    
	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->

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
   </body>                                                  
</html>
