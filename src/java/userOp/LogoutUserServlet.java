/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package userOp;

import java.io.IOException;
import javax.servlet.http.HttpSession;


import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutUserServlet extends HttpServlet {

    /**
     * Logs the user out
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doPost(HttpServletRequest request,
	    HttpServletResponse response)
	    throws ServletException, IOException {

	HttpSession session = request.getSession(false);

	if (session != null && session.getAttribute("username") != null) {
	    session.setAttribute("username",null);
            session.setAttribute("user",null);


	}
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/logout_success.jsp");
	dispatcher.forward(request, response);
    }
}
