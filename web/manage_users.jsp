<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

    <head>
	<meta charset="utf-8" />
	<title>Profile</title>
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
                                            <span class="divider">/</span><a href="#">Manage Users</a>
                                        </li>
				    </ul>
                                <h1>Manage Users</h1>
				    </div>     
				    <div class="row-fluid ">            					
					<div class="box span12">
					    <div class="box-header well" data-original-title>
						<h2>Pending Users List</h2>
					    </div>
					    <div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable responsive" id="users">
						    <thead>
							<tr>
							    <th>Username</th>
                                                            <th>Name</th>
                                                            <th>Surname</th>
							    <th>Email</th>
                                                            <th>Contact No</th>
							    <th>Actions</th> 
							</tr>
						    </thead>
                                                    <tbody>

                                                        <%@page import = "userOp.UserTableOperations" %>
                                                        <%  int counter = 0;
								for (User c : UserTableOperations.getPendUsers()) {
                                                               
									counter++;
									String button_id = "button."+Integer.toString(counter);
                                                                        String button2_id = "remove." +Integer.toString(counter);
									String form_id = "form" + counter;
                                                                        String username_id = "username." + Integer.toString(counter);
							%>
							<tr>
							    <td><%=c.getUsername()%></td>
							    <td class="center"><%=c.getName()%></td>
							    <td class="center"><%=c.getSurname()%></td>
                                                            <td class="center"><%=c.getEmailaddress()%></td>
                                                            <td class="center"><%=c.getPhone()%></td>
							    <td class="center">
								<form style='display:inline' action="manage" method="post">
								    <input type="hidden" name="<%=username_id%>" value="<%=c.getUsername()%>" />
								    <%
									    out.println("<button  type=\"submit\" name=\"" + button_id + "\">"
										    + "<a style=\"color:#000000;\" > "
										    + "Accept User"
										    + "</a>"
										    + "</button>");
									
								    %>
								</form>
				
                                                                <form style="display:inline" action="manage" id ="<%=form_id%>" method="post">
								    <input type="hidden" name="<%=username_id%>" value="<%=c.getUsername()%>" />
								    <input type="hidden" name="where" value="1" />
								    <%
									    out.println("<button type=\"submit\"  name=\"" + button2_id + "\" >"
										    + "<a style=\"color:#000000;\" > "
										    + "<i class=\"icon-trash icon-white\"></i> "
										    + "Delete Pending User"
										    + "</a>"
										    + "</button>");
									
								    %>
								</form>
							    </td>
							</tr>
							<% }%>
						    </tbody>
						</table>            
					    </div>
					</div><!--/span-->
				    </div>
				    <div class="row-fluid "> 						
					<div class="box span12">
					    <div class="box-header well" data-original-title>
						<h2>Confirmed Users List</h2>
					    </div>
					    <div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable" id="users1" >
						    <thead>
							<tr>
							    <th>Username</th>
                                                            <th>Name</th>
                                                            <th>Surname</th>
							    <th>Email</th>
                                                            <th>Contact No</th>
							    <th>Actions</th> 
						    </thead>   
						    <tbody>
							<%@ page import="userOp.User" %>
							<%@ page import="userOp.UserTableOperations" %>
							<%  //int temp = counter + 1;
								for (User c : UserTableOperations.getConfUsers()) {
									counter++;
									String button_id = "button_id."+Integer.toString(counter);
                                                                        String button2_id = "remove." +Integer.toString(counter);
									String form_id = "form" + counter;
                                                                        String username_id = "username." + Integer.toString(counter); 
							%>
							<tr>
							    <td><%=c.getUsername()%></td>
							    <td class="center"><%=c.getName()%></td>
							    <td class="center"><%=c.getSurname()%></td>
							    <td class="center"><%=c.getEmailaddress()%></td>
							    <td class="center"><%=c.getPhone()%></td>
								
							    <td class="center">
				
								<form style="display:inline" action="manage" id ="<%=form_id%>" method="post">
								    <input type="hidden" name="<%=username_id%>" value="<%=c.getUsername()%>" />
								    <input type="hidden" name="where" value="1" />
								    <%
									    out.println("<button type=\"submit\"  name=\"" + button2_id + "\" >"
										    + "<a style=\"color:#000000;\" > "
										    + "<i class=\"icon-trash icon-white\"></i> "
										    + "Delete Account"
										    + "</a>"
										    + "</button>");
									
								    %>
								</form>
							    </td>
							</tr>
							<% }%>
						    </tbody>
						</table>            
					    </div>
					</div><!--/span-->								  		
					<!--/row -->  
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
