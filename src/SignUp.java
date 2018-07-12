

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String email=request.getParameter("email");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	String pno=request.getParameter("pno");
	String dob=request.getParameter("dob");
	String gender=request.getParameter("gender");
	PrintWriter pw=null;
		try {
			pw=response.getWriter();
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/mrs?user=root&password=india@123");
		String str="Insert into doctors values(?,?,?,?,?,?)";
		PreparedStatement st=cn.prepareStatement(str);
		st.setString(1, email);
		st.setString(2, pass);
		st.setString(3, name);
		st.setString(4, pno);
		st.setString(5, dob);
		st.setString(6, gender);
		st.executeUpdate();
		st.close();
		cn.close();
		response.sendRedirect("login.jsp");
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	}

}
