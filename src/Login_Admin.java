

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Login_Admin")
public class Login_Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  email=request.getParameter("email");
		String pass=request.getParameter("pass");
		HttpSession hs=request.getSession();
		if(email.equals("admin@gmail.com")&&pass.equals("admin"))
		{
			hs.setAttribute("uid", email);
			response.sendRedirect("admin_activity.jsp");
		}
		else
		{
			response.sendRedirect("login_admin.jsp?msg=error");
		}
		
	}

}
