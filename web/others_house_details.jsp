<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- Deixnei oles tis leptomereies enos spitiou pou o xrhsths koitaei kai mporei na steilei 
    Question mail ston idiokthth tou  -->
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

    <head>
	<meta charset="utf-8" />
	<title>House Details</title>
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

	<!--MY LINKS FOR jQuery SLIDER-->


	<link href="nivo-slider/themes/default/default.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/themes/light/light.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/themes/dark/dark.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/themes/bar/bar.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="nivo-slider/nivo-slider.css" media="screen" rel="stylesheet" type="text/css" />
	<!-- <link rel="stylesheet" href="nivo-slider/demo/style.css" type="text/css" media="screen" /> -->
	<!--END OF LINKS FOR jQuery SLIDER-->

<script
src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDmRyGw69YDC7-H0jYft5HJ5NS8xnsld5I&sensor=false">
</script>
        <script
        src="https://maps.google.com/maps/api/js?v=3.5&sensor=true">
        </script>


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
	<!-- topbar ends -->
        <%@ page import="userOp.User" %>
        <%User user = (User) session.getAttribute("user");%>
        <%@ page import="houseOp.House" %>
        <%House house = (House) session.getAttribute("house");%>
	<div class="container-fluid">
	    <div class="row-fluid">


		<!--main menu starts-->
		 <%@ include file="main_menu.jsp" %>
		<!--main menu ends-->

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
                                        <%if(session.getAttribute("sale").equals("true")){%>
                                            <li>
                                                <span class="divider">/</span><a href="search_for_sale.jsp">Search for Sale </a>
                                            </li>
                                        <%}else{%>
                                            <li>
                                                <span class="divider">/</span><a href="search_for_rent.jsp">Search for Rent </a>
                                            </li>
                                            <%}%>
                                        <li>
                                      <span class="divider">/</span><a href="#">House Details</a>
                                        </li>
				    </ul>
		
				    <div class="page-header">
					<h1>House</small></h1>
				    </div>     
				    <div class="row-fluid ">            
					<div class="box span6">
					    <div class="box-header well" data-original-title>
                                                <h2>House Information</h2></br>
					    </div>
					    <div class="box-content">
						<br/>
						 <form class="form-horizontal" method="post" action="send_email">
                                                  <div id="googleMap" style=" float:right;width:100%;height:300px;"></div>
						    <!--fieldset for personal information--> 
						    <fieldset style="float:left;">
                                                            
                                                        <input type="hidden" name="id" value="<%=house.getId() %>"/>
                                                        <input type="hidden" name="lng" id="lng" value="<%=house.getLng() %>"/>
                                                        <input type="hidden" name="lat" id="lat" value="<%=house.getLat() %>"/>
                                                        <input type="hidden" name="desc" id="desc" value="<%=house.getDescription() %>"/>
                                                        <input type="hidden" name="info" id="info" value="<%=house.getInfo() %>"/>
                                                        <script>
                                                           var  lng=document.getElementById("lng").value;
                                                           var  lat=document.getElementById("lat").value;
                                                           var  desc=document.getElementById("desc").value;
                                                           var  info=document.getElementById("info").value;
                                                        </script>
                                                        
                                                            
                                                        
							<!--username field-->
							<div class="control-group">
							    <label class="control-label" for="focusedInput" >Place</label>
							    <div class="controls">
								
                                                                <%=house.getPlace() %>
                                                            </div>
							</div>

                                                            <!--password field-->
							<div class="control-group">
							    <label class="control-label font_change" for="focusedInput" >Price (in Euros)</label>
							    <div class="controls">
								<%=house.getPrice() %>
							    </div>
							</div>
							    
                                                            <!--Name field-->
							<div class="control-group">
							    <label class="control-label font_change" for="focusedInput" >Area Size</label>
							    <div class="controls">
								<%=house.getAreaSize() %>
							    </div>
							</div>

							<!--Surname field-->
							<div class="control-group">
							    <label class="control-label font_change" for="focusedInput" >Built Year</label>
							    <div class="controls">
								<%=house.getYear() %>
							    </div>
							</div>

							<!--email field-->
							<div class="control-group">
							    <label class="control-label font_change" for="focusedInput" >Public Expenditure</label>
							    <div class="controls">
								<%=house.getShared() %> 
							    </div>
							</div>

                                                         <!--Type field-->
							<div class="control-group">
							    <label class="control-label font_change" for="focusedInput" >Type</label>
							    <div class="controls">
                                                                <%if (house.getHouseAppartment() == 0){%>
								house
                                                                <%}else{%>
                                                                appartment
                                                                <%}%>
							    </div>
							</div>
                                                        
                                                        
							<!--Heat field-->
							<div class="control-group">
							    <label class="control-label" for="focusedInput" >Heat</label>
							    <div class="controls">
                                                                <%if (house.getHeat() == 0){%>
								none
                                                                <%}else if (house.getHeat() == 1){%>
                                                                central
                                                                <%}else{%>
                                                                autonomous
                                                                <%}%>
							    </div>
							</div>
                                                                
                                                         <div class="control-group">
							    <label class="control-label font_change" for="focusedInput" >Description</label>
							    <div class="controls">
								<%=house.getDescription() %>
							    </div>
							</div>
                                                        
                                                        <%User u = (User) session.getAttribute("seller_user");%>    
                                                        <div class="control-group">
                                                            <%if(session.getAttribute("sale").equals("true")){%>
							    <label class="control-label font_change" for="focusedInput" >Seller's Email Address</label>
                                                            <%}else{%>
                                                            <label class="control-label font_change" for="focusedInput" >Lessor's Email Address</label>
                                                            <%}%>
							    <div class="controls">
								<%=u.getEmailaddress() %>
							    </div>
							</div>
                                                            
                                                        <div class="control-group">
							    <%if(session.getAttribute("sale").equals("true")){%>
							    <label class="control-label font_change" for="focusedInput" >Seller's Phone Number</label>
                                                            <%}else{%>
                                                            <label class="control-label font_change" for="focusedInput" >Lessor's Phone Number</label>
                                                            <%}%>
							    <div class="controls">
								<%=u.getPhone()%>
							    </div>
							</div>
                                                            
                                                            
						    
                                                       <%
                                                            //Elegxos an o xrhsths den einai visitor opote na mporei na kanei Question            
                                                            if(Integer.parseInt(visitor)!=1){  %> 
                                                        
                                                     
                                                          <div class="control-group">
							    <label class="control-label font_change" for="focusedInput" >Question</label>
							    <div class="controls">
								<input class="input-xlarge focused disabled_input" id="first_input" type="text" name="question" autocomplete ="off" />
							    </div>
							</div>
                                                                <div class="form-actions">
                                                                   <button type="submit" style="box-shadow: 0px 2px 5px 2px grey;">Send Email </button><br/><br/>
                                                                   </form> 
                                                                   <button type="reset" style="box-shadow: 0px 2px 5px 2px grey;">Cancel</button>
                                                               </div>
                                                           <%}%> 
                                                           <%if(session.getAttribute("sale").equals("true")){%>
							<form action="search_for_sale.jsp" method="post">
                                                            <button style="margin-top:15px; box-shadow: 0px 2px 5px 2px grey;">Back</button>
                                                        </form>
                                                        <%}else{%>
                                                        <form action="search_for_rent.jsp" method="post">
                                                            <button style="margin-top:15px; box-shadow: 0px 2px 5px 2px grey;">Back</button>
                                                        </form>
                                                        <%}%>
                                                  </fieldset>
                                                       
                                                            
					    </div>
					</div><!--/span-->
				    </div><!--/row -->   
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
	<!--container-fluid ends-->

<script>
    var map;
    var marker;
    function initialize()
    {
        var mapProp = {
          center:new google.maps.LatLng(47.3667,8.5500),
          zoom:3,
          mapTypeId:google.maps.MapTypeId.ROADMAP
          };
         map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
        
        var location = new google.maps.LatLng(lat,lng);

        marker = new google.maps.Marker({
            position: location,
            map: map,
            title: info+"\n"+desc
          });
          
        google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);
  });
    }
    
    function placeMarker(location) {
 
    }
    
    google.maps.event.addDomListener(window, 'load', initialize);
</script>


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
        


        <%if ((String) request.getAttribute("message") == "empty" ) {%>
        <script>alert("Please fill the box with your question");</script><%}%>
        <%if ((String) request.getAttribute("message") == "ok" ) {%>
        <script>alert("Your email has sent");</script><%}%>

        
    </body>
</html>