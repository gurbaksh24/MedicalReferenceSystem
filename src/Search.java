

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

@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key=request.getParameter("key");
		String cate=request.getParameter("categ");
		PrintWriter pw=null;
		try{
			pw=response.getWriter();
			Class.forName("com.mysql.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/mrs?user=root&password=india@123");
			String str="select * from items where name like '"+key+"%' and category='"+cate+"'";
			PreparedStatement st=cn.prepareStatement(str);
			System.out.println(str);
			ResultSet rs=st.executeQuery();
			String sss="<select class="+"form-control"+" name='title' size=5>";
			while(rs.next())
			{	
				sss=sss+"<option>"+rs.getString(1)+" "+rs.getString(2)+"</option>";
			}
			sss=sss+"</select>";
			cn.close();
			pw.println(sss);
		}
		catch(Exception e){
			pw.println(e.getMessage());
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
