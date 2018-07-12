

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/OpenFile")
public class OpenFile extends HttpServlet {

	private static final int BUFFER_SIZE=4096;
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    String data=request.getParameter("title");
		    String[] sdata=data.split(" ");
		    String id=sdata[0];
	        String filePath = "C:\\projectjava\\Medical Reference System\\WebContent\\Files\\"+id+".pdf";
	 System.out.println(filePath);
	        try {
	        	Class.forName("com.mysql.jdbc.Driver");
				Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/mrs?user=root&password=india@123");
	            String sql = "SELECT file FROM items WHERE id=?";
	            PreparedStatement statement = cn.prepareStatement(sql);
	            statement.setString(1, id);
	            ResultSet result = statement.executeQuery();
	            if (result.next()) {
	                Blob blob = result.getBlob("file");
	                InputStream inputStream = blob.getBinaryStream();
	                OutputStream outputStream = new FileOutputStream(filePath);
	                int bytesRead = -1;
	                byte[] buffer = new byte[BUFFER_SIZE];
	                while ((bytesRead = inputStream.read(buffer)) != -1) {
	                    outputStream.write(buffer, 0, bytesRead);
	                }
	 
	                inputStream.close();
	                outputStream.close();
	                System.out.println("File saved");
	            }
	            cn.close();
                response.sendRedirect("Files/"+id+".pdf");
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        } catch (IOException ex) {
	            ex.printStackTrace();
	        } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
