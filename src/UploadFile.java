

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@WebServlet("/UploadFile")
@MultipartConfig(maxFileSize = 56177215)	//16177215

public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String id=request.getParameter("bid");
	String name=request.getParameter("btitle");
	String author=request.getParameter("bauthor");
	String category=request.getParameter("bcategory");
	InputStream is=null;
	//System.out.println("1");
	Part fp=request.getPart("doc");
	//System.out.println("2");
	if(fp!=null)
	{
		//System.out.println("3");
		is=fp.getInputStream();
	}
	
	
	PrintWriter pw=null;
	try
	{
		pw=response.getWriter();
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/mrs?user=root&password=india@123");
		String str="Insert into items values(?,?,?,?,?)";
		PreparedStatement st=cn.prepareStatement(str);
		st.setString(1,id);
		st.setString(2,name);
		st.setString(3,category);
		st.setString(4,author);

		//System.out.println("4");
		if(is!=null)
		{

			//System.out.println("5");
			System.out.println(fp.getName());
			System.out.println(fp.getSize());
			System.out.println(fp.getContentType());
			st.setBlob(5, is);

			//System.out.println("6");
		}

		//System.out.println("7");
		st.executeUpdate();

		//System.out.println("8");
		cn.close();
		response.sendRedirect("admin_activity.jsp?msg=Successful Uploaded");
		}
	catch(Exception e)
	{
		pw.println(e.getMessage());
	}
	}

}
