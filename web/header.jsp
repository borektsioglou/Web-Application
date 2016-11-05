<!-- topbar starts -->
<!--H mple Epikefalida krataei ta stoixeia tou xrhsth p exei kanei login kai tou epitrepei na kanei logout-->
<div class="navbar navbar-default" role="navigation">

        <div class="navbar-inner">
            <a class="navbar-brand" href="index.jsp"> <img alt="Charisma Logo" src="img/logo20.png" class="hidden-xs"/>
                <span>On R Est</span></a>

            <!-- user dropdown starts -->
            <%session = request.getSession(false);%>

            <% if (session.getAttribute("username")!=null) { %>
            <%@ page import="userOp.User" %>
            <%User user = (User) session.getAttribute("user");%>
               
            <div class="btn-group pull-right" >
                    <a class="btn dropdown-toggle my_border_style" data-toggle="dropdown" href="#">
                            <span class="hidden-phone"> <%=user.getName()%></span>
                            <span class="hidden-phone"> <%=user.getSurname()%></span>
                            <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                            <li><a href="main_page.jsp">Profile</a></li>
                            <li class="divider"></li>
                            <form id="myForm" method="post" action="logout" >
                            <li onclick="myForm.submit();" style="cursor: pointer;">
                                    <a>Logout</a>
                            </li>
                            <li class="divider"></li>
                            </form>
                    </ul>
            </div>
            
            <% }
            else { %>
                 <div class="btn-group pull-right">
                    <a class="btn btn-default" href="signup_form.jsp">
                        <span class="hidden-sm hidden-xs"> Create An Account</span>   
                    </a>
                </div>
                <!-- user dropdown ends -->

                <!-- theme selector starts -->
                <div class="btn-group pull-right ">
                    <a class="btn btn-default" href="login.jsp">
                        <span class="hidden-sm hidden-xs"> Login</span>
                    </a>
                </div>    
            <%}%>
                

                    <form class="navbar-search pull-left">
                        <input placeholder="Search" class="search-query form-control col-md-10" name="query"
                               type="text">
                    </form>


        </div>
    </div>

<!-- topbar ends -->