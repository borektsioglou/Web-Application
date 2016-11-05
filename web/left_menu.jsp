<!-- left menu starts -->
<!-- Dynatothtes analoga me to rolo tou xrhsth -->
<div class="span2 main-menu-span" style="margin-top:10px;">
	<div class="well nav-collapse sidebar-nav">
		<ul class="nav nav-tabs nav-stacked main-menu">
			<li class="nav-header hidden-tablet">Menu</li>
			<%
			    session = request.getSession(false);
			    
			    String admin = (String) session.getAttribute("admin");
			    String lessor= (String) session.getAttribute("lessor");
			    String seller= (String) session.getAttribute("seller");
			    String tenant= (String) session.getAttribute("tenant");
			    String buyer= (String) session.getAttribute("buyer");
                            String visitor= (String) session.getAttribute("visitor");
			    
			    if( Integer.parseInt(admin) == 1 ){
				out.println("<li><a href=\"manage_users.jsp\" ><span class=\"hidden-tablet\"> Manage Users</span></a></li>");
                                out.println("<li><a href=\"manage_algorithms.jsp\" ><span class=\"hidden-tablet\"> Manage Algorithms</span></a></li>");
                            }
                            
			    if( Integer.parseInt(lessor) == 1 || Integer.parseInt(seller) == 1  ){
				out.println("<li><a href=\"view_houses.jsp\" ><span class=\"hidden-tablet\"> View Your Houses</span></a></li>");
                                if( Integer.parseInt(lessor) == 1)
                                    out.println("<li><a href=\"add_for_rent.jsp\" ><span class=\"hidden-tablet\"> Add House for Rent</span></a></li>");
                                if( Integer.parseInt(seller) == 1)
                                    out.println("<li><a href=\"add_for_sale.jsp\" ><span class=\"hidden-tablet\"> Add House for Sale</span></a></li>");
                            }
                            
			    if( Integer.parseInt(tenant) == 1 )
				out.println("<li><a href=\"search_for_rent.jsp\" ><span class=\"hidden-tablet\"> Search House for Rent</span></a></li>");
                            if( Integer.parseInt(buyer) == 1 )
				out.println("<li><a href=\"search_for_sale.jsp\" ><span class=\"hidden-tablet\"> Search House for Sale</span></a></li>");
                            
                            
			    if ( Integer.parseInt(admin) == 0 && Integer.parseInt(lessor) == 0 && Integer.parseInt(seller) == 0 && Integer.parseInt(tenant) == 0 && Integer.parseInt(buyer) == 0 ){
				out.println("<li><a href=\"search_for_rent.jsp\" ><span class=\"hidden-tablet\"> Search House for Rent</span></a></li>");
                            	out.println("<li><a href=\"search_for_sale.jsp\" ><span class=\"hidden-tablet\"> Search House for Sale</span></a></li>");
                            }
			%>
		</ul>
	</div><!--/.well -->
</div><!--/span-->
<!-- left menu ends -->