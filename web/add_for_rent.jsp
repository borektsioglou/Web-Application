<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

    <head>
	<meta charset="utf-8" />
	<title>House for rent form</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template." name="description" />
	<meta content="Muhammad Usman" name="author" />

            <script
src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDmRyGw69YDC7-H0jYft5HJ5NS8xnsld5I&sensor=false">
</script>

 <script
        src="https://maps.google.com/maps/api/js?v=3.5&sensor=true">
        </script>
        
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
    <![endif]

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
                    <%@include file="left_menu.jsp" %>


		    <noscript>
			<div class="alert alert-block span10">
			    <h4 class="alert-heading">Warning!</h4>
			    <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
			</div>
		    </noscript>

		    <!--whole content starts-->
		    <div id="content" class="span10" >


			<!--main-content sign_up form starts-->
			<div class="row-fluid">
			    <div class="box span12">
				<div class="box-header well" data-original-title="">

				    <h2><i><span class="icon-user"></span>&nbsp;</i>Form</h2>
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
                                            <span class="divider">/</span><a href="#">Add for Rent</a>
                                        </li>
				    </ul>
                                </div>
				<div class="box-content">

				    <form class="form-horizontal" id="checkform" action="add_rent" method="post">
					<!--fieldset for personal information-->
					<div class="my_legend">Information of house for rent<i style="color:red; font-size:13px;"> ( Note: All required fields are marked with a ' * ' )</i></div>
					<div style="border-bottom: 1px solid #e5e5e5;margin-bottom: 40px; margin-top:0px; width:44%;"></div>
                                        <span style="color:red;">Select the location at the map below!</span><br>
                                        <div class="span6 well">
                                            <div id="googleMap" style=" float:right;width:500px;height:380px;"></div>
                                        </div>
                                            
                                        <fieldset  style="float:left;width:450px;">
					   
                                            <input type="hidden" name="lng" id="lng" value="default"/>
                                            <input type="hidden" name="lat" id="lat" value="default"/>

                                            
                                            <!--Price field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Price in Euros(per month):</label>
						<div class="controls">
						    <input id="price" class="input-xlarge focused" type="text" name="price" autocomplete='off' maxlength="20" />
						    <span style="color:red;">*</span>
						</div>
					    </div>
					    <!--Place field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Place:</label>
						<div class="controls">
						    <input id="place" class="input-xlarge focused" type="text" name="place" autocomplete='off' maxlength="30" />
						    <span style="color:red;">*</span>
						</div>
					    </div>
                                            
                                            <!--Area_size field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Area size(in square meters):</label>
						<div class="controls">
						    <input id="area_size" class="input-xlarge focused" type="text" name="area_size" autocomplete='off' autofocus maxlength="25" />
						    <span style="color:red;">*</span>
						</div>
					    </div>
					    <!--House_or_apartment field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">House or appartment:</label>
						<div class="controls">
                                                    <span style="color:red;">(Type "house" or "appartment")</span>
						    <input id="house_or_appartment" class="input-xlarge focused" type="text" name="house_or_appartment" autocomplete='off' maxlength="10"  />
						    <span style="color:red;">* </span>
						</div>
					    </div>
				
					    
					    <!--Shared field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Cost for Shared in Euros(per month):</label>
						<div class="controls">
						    <input id="shared" class="input-xlarge focused" type="text" name="shared" autocomplete='off' maxlength="20"/>
						    <span style="color:red;">*</span>
						</div>
					    </div>
                                            
                                                <!--Year field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Year of build:</label>
						<div class="controls">
						    <input id="year" class="input-xlarge focused" type="text" name="year" autocomplete='off' maxlength="4" />
						    <span style="color:red;">*</span>
						</div>
					    </div>
                                                
                                                <!--None_central_or_self field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Central or autonomous heat:</label>
						<div class="controls">
                                                    <span style="color:red;">(Type "none" , "central" or "autonomous")</span>
						    <input id="none_central_or_self" class="input-xlarge focused" type="text" name="none_central_or_self" autocomplete='off' maxlength="10" />
						    <span style="color:red;">*</span>
						</div>
					    </div>
                                                
                                                <!--Description field :further descriptions about the house :paradeigma evaero ,evhleio-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Description:</label>
						<div class="controls" style="height: 100px;">
						    <input id="description" class="input-xlarge focused" type="text" name="description" autocomplete='off' maxlength="400" />
						    <!--<span style="color:red;">*</span>-->
						</div>
					    </div>
                                                

                                            <button type="submit" style="box-shadow: 0px 2px 5px 2px grey;">Submit</button>
                                                    </form>
                                            
                                            
                                            <form action="main_page.jsp" method="post">
                                                <button style="box-shadow: 0px 2px 5px 2px grey; margin-top:15px;">Back</button>
                                            </form>
					    <!--</fieldset>   -->                           
					    <!-- end of fieldset for personal information--> 
					    <!--<fieldset style=" margin-left: 470px; float:left; display:block;  clear:both;"> -->	
	
					</fieldset>
                                        
				    
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
        
        google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);
  });
    }
    
    function placeMarker(location) {    //kwdikas gia ton marker panw ston xarth
        if(marker){
            marker.setPosition(location);
        }else{
            marker = new google.maps.Marker({
            position: location,
            map: map
          });
        }
    //krataw stis 2 metavlites to gewgrafiko mhkos kai platos    
    document.getElementById('lng').value = location.lng();
    document.getElementById('lat').value = location.lat();
      
    }
    
    google.maps.event.addDomListener(window, 'load', initialize);
</script>

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

        <%if ((String) request.getAttribute("messages") == "Empty" ) {%>
        <script>alert("Please fill out all the required text boxes.");</script><%}%>

	

    </body>
</html>