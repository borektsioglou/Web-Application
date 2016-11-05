<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- Selida anazhthshs pros pwlhsh -->
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

    <head>
	<meta charset="utf-8" />
	<title>Search for Sale</title>
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
        src="https://maps.google.com/maps/api/js?v=3.5&sensor=true">
        </script>
    <script
src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDmRyGw69YDC7-H0jYft5HJ5NS8xnsld5I&sensor=false">
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
                                            <span class="divider">/</span><a href="#">Search for Sale</a>
                                        </li>
				    </ul>
                                    <div id="googleMap" style=" float:right;width:100%;height:300px;"></div>
                                </div> 
                                <form class="form-horizontal" id="checkform" action="search_sale" method="post">
					<!--fieldset for personal information-->
					<div class="my_legend">Complete your Preferences<i style="color:red; font-size:13px;"> ( Note: At least one field is required )</i></div>
					<div style="border-bottom: 1px solid #e5e5e5;margin-bottom: 40px; margin-top:0px; width:44%;"></div>
                                       
                                            
                                        <fieldset  style="float:left;width:800px;">
					   
                                            <input type="hidden" name="lng" id="lng" value="default"/>
                                            <input type="hidden" name="lat" id="lat" value="default"/>
                                            
                                            <!--Price field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Price in Euros:</label>
						<div class="controls">
						    <input id="min_price" style ="width:80px;"type="text" name="min_price" autocomplete='off' maxlength="20" />
						    <span>-</span>
                                                    <input id="max_price" style ="width:80px;"type="text" name="max_price" autocomplete='off' maxlength="20" />
                                                    
                                                     <input id="weight1" style ="width:50px;"type="text" name="weight1" placeholder="weight" autocomplete='off' maxlength="1" />
                                                </div>
					    </div>
                                            
                                            <div class="control-group">
						<label class="control-label" for="focusedInput">Area size(in square meters):</label>
						<div class="controls">
						    <input id="min_area_size" style ="width:80px;"type="text" name="min_area_size" autocomplete='off' maxlength="20" />
						    <span>-</span>
                                                    <input id="max_area_size" style ="width:80px;"type="text" name="max_area_size" autocomplete='off' maxlength="20" />
                                                    
                                                     <input id="weight2" style ="width:50px;"type="text" name="weight2" placeholder="weight" autocomplete='off' maxlength="1" />
                                                </div>
					    </div>
                                            <div class="control-group">
						<label class="control-label" for="focusedInput">Cost for Shared in Euros(per month):</label>
						<div class="controls">
						    <input id="min_shared" style ="width:80px;"type="text" name="min_shared" autocomplete='off' maxlength="20" />
						    <span>-</span>
                                                    <input id="max_shared" style ="width:80px;"type="text" name="max_shared" autocomplete='off' maxlength="20" />
                                                    
                                                     <input id="weight3" style ="width:50px;"type="text" name="weight3" placeholder="weight" autocomplete='off' maxlength="1" />
                                                </div>
					    </div>
                                            <div class="control-group">
						<label class="control-label" for="focusedInput">Year of build:</label>
						<div class="controls">
						    <input id="min_year" style ="width:80px;"type="text" name="min_year" autocomplete='off' maxlength="20" />
						    <span>-</span>
                                                    <input id="max_year" style ="width:80px;"type="text" name="max_year" autocomplete='off' maxlength="20" />
                                                    
                                                     <input id="weight4" style ="width:50px;"type="text" name="weight4" placeholder="weight" autocomplete='off' maxlength="1" />
                                                </div>
					    </div>
					    <!--Place field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Place:</label>
						<div class="controls">
						    <input id="place" class="input-xlarge focused" type="text" name="place" autocomplete='off' maxlength="30" />
						</div>
					    </div>
                                
					    <!--House_or_apartment field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">House or apartment:</label>
						<div class="controls">
						    <input id="house_or_appartment" class="input-xlarge focused" type="text" name="house_or_appartment" autocomplete='off' maxlength="10"  />
						    <span style="color:red;">(Type "house" or "appartment")</span> </span>
						</div>
					    </div>
		
                                                
                                                <!--None_central_or_self field-->
					    <div class="control-group">
						<label class="control-label" for="focusedInput">Central or autonomous heat:</label>
						<div class="controls">
						    <input id="none_central_or_self" class="input-xlarge focused" type="text" name="none_central_or_self" autocomplete='off' maxlength="10" />
						    <span style="color:red;">(Type "none" , "central" or "autonomous")</span>
						</div>
					    </div>
                                             
                                             <div class="control-group">
                                                <label class="control-label" for="selectError">Select Algorithm</label>
                                                 
                                                <div class="controls">
                                                    <select id="selectAlgo" name="algorithm" data-rel="chosen">
                                                        <option></option>
                                                        <option>TOPSIS</option>
                                                        <option>SAW</option>
                                                    </select><span style="color:red;">*</span>
                                                </div>
                                            </div>   
                                                
                                                
                                                
                                            <button type="submit" style="box-shadow: 0px 2px 5px 2px grey;">Submit</button>
                                </form>
                                <%if (request.getAttribute("search")!=null){%>
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
                                                            <th>Cost for Shared</th>
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
                                                        <%
                                                            int [] better_ids =(int[]) session.getAttribute("ids");
                                                            int counter = 0;
                                                            for(House h: HouseTableOperations.getBetterHousesSale(better_ids)){
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
                                                            <td><%=h.getAreaSize()%></td>
                                                            <td><%=h.getYear()%></td>
                                                            <td><%=h.getShared()%></td>
                                                            <td><%=h.getPrice()%></td>
                                                            <td class="center">
								<form style='display:inline' action="view_search" method="post">
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
                                                        </tr><%}%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                                <%}%>
           
                                <form action="main_page.jsp" method="post">
                                    <button style="box-shadow: 0px 2px 5px 2px grey; margin-top:15px;">Back</button>
                                </form>
                            </div>
                        </div>
                                                
                    </div>
                </div>
            </div>
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
                });
                     
            }


  }
  

  google.maps.event.addDomListener(window, 'load', initialize);</script>  
        
        <%if ((String) request.getAttribute("message") == "3orno" ) {%>
        <script>alert("PLease fill min value , max value and weight");</script><%}%>
        <%if ((String) request.getAttribute("message") == "weight" ) {%>
        <script>alert("PLease fill weights with your preferences");</script><%}%>
        <%if ((String) request.getAttribute("message") == "nothing" ) {%>
        <script>alert("Please fill at least one criterion");</script><%}%>
        <%if ((String) request.getAttribute("message") == "algorithm" ) {%>
        <script>alert("Please select an algorithm");</script><%}%>
        <%if ((String) request.getAttribute("message") == "Nothing_found" ) {%>
        <script>alert("Sorry ,there are no houses matching your form!Please fill the form again.");</script><%}%>
    </body>
</html>
