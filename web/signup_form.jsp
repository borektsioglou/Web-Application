<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- Forma eggrafhs neou xrhsth -->
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

    <head>
	<meta charset="utf-8" />
	<title>SignUp Form</title>
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





	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link href="img/favicon.ico" rel="shortcut icon" />

    </head>

    <body>
	<!-- topbar starts -->
	<%@include file="header.jsp" %> 
	<!-- topbar ends -->

	<div class="container-fluid">
	    <div class="row-fluid">

		<%@include file="main_menu.jsp" %>



		<div class="row-fluid">


		    <noscript>
			<div class="alert alert-block span10">
			    <h4 class="alert-heading">Warning!</h4>
			    <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
			</div>
		    </noscript>

		    <!--whole content starts-->
		    <div id="content" style="width: 82.87292817100001%; *width: 82.8197366816383%; margin-left:auto; margin-right:auto;">


			<!--main-content sign_up form starts-->
			<div class="row-fluid">
			    <div class="box span12">
				<div class="box-header well" data-original-title="">

				    <h2><i><span class="icon-user"></span>&nbsp;</i>Registration Form</h2>
				</div>
				<div class="box-content">

				    <form class="form-horizontal" id="checkform" action="validate" method="post">
					<!--fieldset for personal information-->
					<div class="my_legend">Personal Information <i style="color:red; font-size:13px;"> ( Note: All required fields are marked with a ' * ' )</i></div>
					<div style="border-bottom: 1px solid #e5e5e5;margin-bottom: 40px; margin-top:0px; width:44%;"></div>
					<fieldset  style="float:left;">
					   
				
                                            	    <!--Username field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Username</label>
						<div class="controls">
						    <input id="username" class="input-xlarge focused" type="text" name="username" autocomplete='off' maxlength="30"  />
						    <span style="color:red;">*</span>
						</div>
					    </div>
                                                    
                                            <%--  String USERNAMEResult = request.getParameter("USERNAMEResult");                                                    
                                            request.getSession().setAttribute("USERNAMEResult", USERNAMEResult);--%>
                                            
                                            <!--Password field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Password</label>
						<div class="controls">
						    <input id="password" class="input-xlarge focused" type="password" name="password" autocomplete='off' maxlength="20" />
						    <span style="color:red;">*</span>
						</div>
					    </div>
                                            
					    <!--Confirm Password field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Confirm Password</label>
						<div class="controls">
						    <input id="confirm_password" class="input-xlarge focused" type="password" name="password_confirmation" autocomplete='off' maxlength="20" />
						    <span style="color:red;">*</span>
						</div>
					    </div>
                                            
                                            <!--Name field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Name</label>
						<div class="controls">
						    <input id="name" class="input-xlarge focused" type="text" name="name" autocomplete='off' autofocus maxlength="25" />
						    <span style="color:red;">*</span>
						</div>
					    </div>
                                            
					    <!--Surname field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Surname</label>
						<div class="controls">
						    <input id="surname" class="input-xlarge focused" type="text" name="surname" autocomplete='off' maxlength="30"  />
						    <span style="color:red;">*</span>
						</div>
					    </div>
				
					    
					    <!--Email address field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Email address</label>
						<div class="controls">
						    <input id="email" class="input-xlarge focused" type="email" name="email_address" autocomplete='off' maxlength="40"/>
						    <span style="color:red;">*</span>
						</div>
					    </div>
                                            
                                            <!--Contact number field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Contact No</label>
						<div class="controls">
						    <input id="confirm_password" class="input-xlarge focused" type="text" name="phone" autocomplete='off' maxlength="10" />
						    <span style="color:red;">*</span>
						</div>
					    </div>


					    <!--Choose Role field-->

                                        <!--Checkboxes field-->
                                        <b><font>Choose your role:</font></b><span style="color:red;">* (Note: Type only 'y' if you wish the specific role)</span><br><br>
                                                <b><span style="color:red;">If you choose "visitor", you cannot have any other role!!!!</span></b><br><br>
                                            <%--<input type="checkbox" name="Admin" value="admin">Admin<br>--%>

                                            Lessor<input style="width:50px; margin-left:15px;" type="text" name="Lessor" autocomplete='off' maxlength="1"/><br><br>    
                                            Seller<input style="width:50px; margin-left:15px;" type="text" name="Seller" autocomplete='off' maxlength="1"/><br><br>       
                                            Tenant<input style="width:50px; margin-left:15px;" type="text" name="Tenant" autocomplete='off' maxlength="1"/><br><br>  
                                            Buyer<input style="width:50px; margin-left:15px;" type="text" name="Buyer" autocomplete='off' maxlength="1"/><br><br>     
                                            Visitor<input style="width:50px; margin-left:15px;" type="text" name="Visitor" autocomplete='off' maxlength="1"/><br><br> 
                                            <br><br>
                                            <button type="submit" style="box-shadow: 0px 2px 5px 2px grey;">Submit</button>
                                            
                                            </form>
                                            
                                            <form action="index.jsp" method="post">
                                                <button style="box-shadow: 0px 2px 5px 2px grey; margin-top:15px;">Back</button>
                                            </form>
					    <!--</fieldset>   -->                           
					    <!-- end of fieldset for personal information--> 
					    <!--<fieldset style=" margin-left: 470px; float:left; display:block;  clear:both;"> -->	
	
					</fieldset>
				    </form>
				</div>
				<!--<div class="box-content"> ends-->
			    </div>
			    <!--<div class="box span12"> ends-->
			</div>
			<!--<div class="row-fluid"> ends-->
		    </div>
		    <!--div id=content ends-->
		</div> <!--rowfluid ends-->
	    </div> <!--<div class="row-fluid" ends-->
	    <hr />
	    


	</div>
             <%@include file="footer.jsp" %> 
	    
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

        <!--<script language="JavaScript" src="js/validateform.js"></script>-->
	<!--<script src="js/enable_modal_manually.js"></script>	-->

        <%if ((String) request.getAttribute("message") == "Empty" ) {%>
        <script>alert("Please fill out all text boxes.");</script><%}%>
        <%if ((String) request.getAttribute("message") == "EmptyRole" ) {%>
        <script>alert("Please fill out at least one role.");</script><%}%>
        <%if ((String) request.getAttribute("message") == "WrongLetter" ) {%>
        <script>alert("Just type 'y' at role fields!!");</script><%}%>
        <%if ((String) request.getAttribute("message") == "username taken" ) {%>
        <script>alert("Sorry, your username is taken .Please change it!");</script><%}%>
        <%if ((String) request.getAttribute("message") == "email taken" ) {%>
        <script>alert("Sorry, email is being used by other user. \n Please change it!");</script><%}%>
        <%if ((String) request.getAttribute("message") == "pass confir" ) {%>
        <script>alert("Wrong password confirmation!!!");</script><%}%>
        <%if ((String) request.getAttribute("message") == "wrong_email" ) {%>
        <script>alert("Please correct your email !");</script><%}%>
        

	

    </body>
</html>