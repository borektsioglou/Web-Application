<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- selida pou emfanizei tis idiokthsies enos pwlhth i' ekmisthwths -->
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

    <head>
	<meta charset="utf-8" />
	<title>View your houses</title>
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


    <script
src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDmRyGw69YDC7-H0jYft5HJ5NS8xnsld5I&sensor=false">
</script>
    
    <script
        src="https://maps.google.com/maps/api/js?v=3.5&sensor=true">
        </script>
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
    <body>
        <%if (session.getAttribute("username")==null){
            String redirectURL = "/index.jsp";
            response.sendRedirect(redirectURL);
           }
        %>
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
                                    <%@ page import="houseOp.House" %>
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
                                            <span class="divider">/</span><a href="#">View Your Houses</a>
                                        </li>
				    </ul>
                                    <h1>Your Houses</h1>
                                </div> 
                                <div id="googleMap" style=" float:right;width:100%;height:300px;"></div>
                                <div class="row-fluid ">            					
                                    <div class="box span12">
                                        <div class="box-header well" data-original-title>
                                            <h2>Houses for Sale</h2>
                                        </div>
                                        <div class="box-content">
                                            <table class="table table-striped table-bordered bootstrap-datatable datatable responsive" id="users">
                                                <thead>
                                                    <tr>
                                                        <th>Place</th>
                                                        <th>Area_Size</th>
                                                        <th>Year Built</th>
                                                        <th>Price</th>
                                                        <th></th> 
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <script>
                                                    var lng = [];
                                                    var lat = [];
                                                    var info = [];
                                                    var desc = [];
                                                </script>
                                                  <%@page import = "houseOp.HouseTableOperations" %>
                                                        <%  int counter = 0;
                                                                String username = (String) session.getAttribute("username");
								for (House h : HouseTableOperations.getHouseSale(username)) {
                                                               
									counter++;
									String button_id = "button"+Integer.toString(counter);
                                                                        String id = "id" + Integer.toString(counter);
                                                                        String lng = "lng" + Integer.toString(counter);
                                                                        String lat = "lat" + Integer.toString(counter);
                                                                        String info = "info" + Integer.toString(counter);
                                                                        String desc = "desc" + Integer.toString(counter);
							%>  
                                                          
                                                            
                                                        
                                                            
                                                            <input type="hidden" name="lng" id="<%=lng%>" value="<%=h.getLng()%>"/> 
                                                          <input type="hidden" name="lat" id="<%=lat%>" value="<%=h.getLat()%>"/>
                                                          <input type="hidden" name="info" id="<%=info%>" value="<%=h.getInfo()%>"/> 
                                                          <input type="hidden" name="desc" id="<%=desc%>" value="<%=h.getDescription()%>"/>
                                                          
                                                          <script>
                                                             lng.push(document.getElementById("<%=lng%>").value);
                                                             lat.push(document.getElementById("<%=lat%>").value);
                                                             info.push(document.getElementById("<%=info%>").value);
                                                             desc.push(document.getElementById("<%=desc%>").value);
                                                            </script> 
                                                          <tr>
                                                            <td class="center"><%=h.getPlace()%></td>
							    <td class="center"><%=h.getAreaSize()%></td>
							    <td class="center"><%=h.getYear()%></td>
                                                            <td class="center"><%=h.getPrice()%></td>
							    <td class="center">
								<form style='display:inline' action="view" method="post" >
								    <input type="hidden" name="<%=id%>" value="<%=h.getId()%>" />
								    <%
									    out.println("<button  type=\"submit\" name=\"" + button_id + "\">"
										    + "<a style=\"color:#000000;\" > "
										    + "View Details"
										    + "</a>"
										    + "</button>");
									
								    %>
								</form>
                                                            </td>
                                                        </tr>
                                                            
                                                    <%}%>
                                                    </tbody>
						</table>            
					    </div>
					</div><!--/span-->
				    </div>
                                    <div class="row-fluid ">            					
                                    <div class="box span12">
                                        <div class="box-header well" data-original-title>
                                            <h2>Houses for Rent</h2>
                                        </div>
                                        <div class="box-content">
                                            <table class="table table-striped table-bordered bootstrap-datatable datatable responsive" id="users">
                                                <thead>
                                                    <tr>
                                                        <th>Place</th>
                                                        <th>Area_Size</th>
                                                        <th>Year Built</th>
                                                        <th>Price</th>
                                                        <th></th> 
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                  <%@page import = "houseOp.HouseTableOperations" %>
                                                        <%  
								for (House h : HouseTableOperations.getHouseRent(username)) {
                                                               
									counter++;
									String button_id = "button"+Integer.toString(counter);
                                                                        String id = "id" + Integer.toString(counter);
                                                                        String lng = "lng" + Integer.toString(counter);
                                                                        String lat = "lat" + Integer.toString(counter);
                                                                        String info = "info" + Integer.toString(counter);
                                                                        String desc = "desc" + Integer.toString(counter);
							%>  
                                                       
                                                          <input type="hidden" name="lng" id="<%=lng%>" value="<%=h.getLng()%>"/> 
                                                          <input type="hidden" name="lat" id="<%=lat%>" value="<%=h.getLat()%>"/>
                                                          <input type="hidden" name="info" id="<%=info%>" value="<%=h.getInfo()%>"/> 
                                                          <input type="hidden" name="desc" id="<%=desc%>" value="<%=h.getDescription()%>"/> 
                                                          <script>
                                                             lng.push(document.getElementById("<%=lng%>").value);
                                                             lat.push(document.getElementById("<%=lat%>").value);
                                                             info.push(document.getElementById("<%=info%>").value);
                                                             desc.push(document.getElementById("<%=desc%>").value);
                                                            </script> 
                                                        <tr>
                                                            
                                                            
							    <td><%=h.getPlace()%></td>
							    <td class="center"><%=h.getAreaSize()%></td>
							    <td class="center"><%=h.getYear()%></td>
                                                            <td class="center"><%=h.getPrice()%></td>
							    <td class="center">
								<form style='display:inline' action="view" method="post" >
								    <input type="hidden" name="<%=id%>" value="<%=h.getId()%>" />
								    <%
									    out.println("<button  type=\"submit\" name=\"" + button_id + "\">"
										    + "<a style=\"color:#000000;\" > "
										    + "View Details"
										    + "</a>"
										    + "</button>");
									
								    %>
								</form>
                                                            </td>
                                                        </tr>
                                                    <%}%>
                                                    </tbody>
						</table>            
					    </div>
					</div><!--/span-->
				    </div>
                                </div>
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
        
                                                    
        <script > 
    var map;

  function initialize()
  {
      var mapProp = {
        center:new google.maps.LatLng(47.3667,8.5500),
        zoom:3,
        mapTypeId:google.maps.MapTypeId.ROADMAP
        
        };
       map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
       



      for(var i=0; i<lng.length;i++){

          var location = new google.maps.LatLng(lat[i],lng[i]);
          var marker = new google.maps.Marker({
                  position:location,
                  map: map,
                  title: info[i]+"\n"+desc[i]
                  //zoomControl:true,
                  
                });

    
            }


  }
  

  google.maps.event.addDomListener(window, 'load', initialize);</script>
      

    
    </body>
</html>
