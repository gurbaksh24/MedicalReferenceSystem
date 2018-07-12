

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/DeleteFile")
public class DeleteFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("bid");
		
		
		PrintWriter pw=null;
		try
		{
			pw=response.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/mrs?user=root&password=india@123");
			String str="Delete from items where id=?";
			PreparedStatement st=cn.prepareStatement(str);
			st.setString(1,id);
			
			st.executeUpdate();

			//System.out.println("8");
			cn.close();
			response.sendRedirect("admin_activity.jsp?msg=Successfully Delete");
			}
		catch(Exception e)
		{
			pw.println(e.getMessage());
		}
		
	}

}
