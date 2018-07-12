

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login_Patient")
public class Login_Patient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String email=request.getParameter("email");
	String pass=request.getParameter("pass");
	PrintWriter pw=null;
	HttpSession hs=request.getSession();
	try{
		pw=response.getWriter();
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/mrs?user=root&password=india@123");
		String str="Select * from patients where email=? and pass=?";
		PreparedStatement st=cn.prepareStatement(str);
		st.setString(1, email);
		st.setString(2, pass);
		ResultSet rs=st.executeQuery();
		if(rs.next()){
			hs.setAttribute("uid", email);
			hs.setAttribute("uname", rs.getString(3));
		}
		st.close();
		cn.close();
		response.sendRedirect("index.jsp");
	}
	catch(Exception e){
		e.printStackTrace();
	}
	}

}
