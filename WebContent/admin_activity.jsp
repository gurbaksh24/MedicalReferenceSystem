<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home Page</title>
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist\bootstrap-3.3.7-dist\css\bootstrap.min.css">
	<script type="text/javascript" src="bootstrap-3.3.7-dist\bootstrap-3.3.7-dist\js\bootstrap.min.js"></script>
	<style type="text/css">
		.jumbotron {

    	background-image: url("Images/bg.jpg");
			text-align: center;
			background-color:#00CCFF;
			color: #000;
      margin-bottom: 0px;
    }
	td,th{
	padding:4px;
	}
    .navbar {
      margin-bottom: 0px;
      border-radius: 0px;
    }
    section{
    	background-image: url("Images/bg.jpg");
    	background-color: #0099FF;
    }
    footer{
    	background-color: #266;
    	color: white;
      clear: both;
    }
    h2{
    	color: #FFF;
    }
    .nav1{
      width: 33.33%;
      height: 1200px;
      float: left;
      background-color: #3CF;
      text-align: center;
    }
    .nav2{
      width: 33.33%;
      height: 1200px;
      float: left;
      clear: none;
      background-color: #3BF;
      text-align: center;
    }
    .nav3{
      width: 33.33%;
      height: 1200px;
      float: left;
      background-color: #3AF;
      text-align: center;
    }
    .affix {
      top: 0;
      width: 100%;
  }

  .affix + .container-fluid {
      padding-top: 70px;
  }
	</style>

<script type="text/javascript">
  function bookUpload()
  {
    var s = "<br><br><form action='UploadFile' method='post' enctype='multipart/form-data'> <table><tr><td> Book ID: </td><td><input type='text' name='bid'></td></tr> <tr><td> Book Title: </td><td><input type='text' name='btitle'></td></tr> <tr><td> Book Author: </td><td><input type='text' name='bauthor'></td></tr> <tr><td> File: </td><td><input type='file' name='doc'><input type='hidden' value='Books' name='bcategory'></td></tr> <tr><td></td><td><input type='submit' value='Upload'></td></tr></table></form>";
      document.getElementById("div1").innerHTML=s;
  }
  function bookDelete(){
    var s = "<br><br><form action='DeleteFile' method='post'> Book ID: <input type='text' name='bid'><br><input type='hidden' value='Book' name='bcategory'><br><input type='submit' value='Delete'></form>";
    document.getElementById("div1").innerHTML=s;
  }
   function artUpload()
  {
    var s = "<br><br><form action='UploadFile' method='post' enctype='multipart/form-data'> <table><tr><td> Article ID: </td><td><input type='text' name='bid'></td></tr> <tr><td> Article Title: </td><td><input type='text' name='btitle'></td></tr> <tr><td> Article Author: </td><td><input type='text' name='bauthor'></td></tr> <tr><td> File: </td><td><input type='file' name='doc'><input type='hidden' value='Articles' name='bcategory'></td></tr> <tr><td></td><td><input type='submit' value='Upload'></td></tr></table></form>";
      document.getElementById("div2").innerHTML=s;
  }
  function artDelete(){
    var s = "<br><br><form action='DeleteFile' method='post'> Article ID: <input type='text' name='bid'><br><input type='hidden' value='Article' name='bcategory'><br><input type='submit' value='Delete'></form>";
    document.getElementById("div2").innerHTML=s;
  }
   function medUpload()
  {
    var s = "<br><br><form action='UploadFile' method='post' enctype='multipart/form-data'> <table><tr><td> Medicine ID: </td><td><input type='text' name='bid'></td></tr> <tr><td> Medicine Name: </td><td><input type='text' name='btitle'></td></tr> <tr><td> Manufacturer: </td><td><input type='text' name='bauthor'></td></tr> <tr><td> File: </td><td><input type='file' name='doc'><input type='hidden' value='Medicines' name='bcategory'></td></tr> <tr><td></td><td><input type='submit' value='Upload'></td></tr></table></form>";
      document.getElementById("div3").innerHTML=s;
  }
  function medDelete(){
    var s = "<br><br><form action='DeleteFile' method='post'> Medicine ID: <input type='text' name='bid'><br><input type='hidden' value='Medicine' name='bcategory'><br><input type='submit' value='Delete'></form>";
    document.getElementById("div3").innerHTML=s;
  }
</script>
</head>

<body>
<header>
		<div class="jumbotron">
			<div class="container">
			<h1>Medical Reference System</h1>
			<h3>Learning, Consultation and Remedies</h3>
		</div>
	</div>
</header>

<nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="197">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Navigation</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.jsp">Home</a></li>
					<li><a href="search.jsp">Search</a></li>
					<li><a href="services.jsp">Other Services</a></li>
					<li><a href="contact.jsp">Contact</a></li>
					<li><a href="about.jsp">About Us</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
				<%	HttpSession hs=request.getSession();
				 if(hs.getAttribute("uid")!=null){ %>
				<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
				<li><a href="editProfile.jsp"><span class="glyphicon glyphicon-user"></span>Admin</a></li>
				<%
				}
				else{
				%>
					<li><a href="signup.jsp"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
					<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
				<%
				}
				%>
				</ul>
			</div>
		</div>
</nav>
<div class="nav1">
  <br><br>
  <button class="btn btn-danger" onclick="bookUpload()">Upload a Book</button><br><br>
  <button class="btn btn-danger" onclick="bookDelete()">Delete a Book</button>
  <div id="div1"></div>
  <div id="showBooks">
  <table border=2>
  <tr><th style="text-align:center;">Book ID</th><th style="text-align:center;">Book Title</th><th style="text-align:center;">Author</th></tr>
  	<%
  	Class.forName("com.mysql.jdbc.Driver");
  	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/mrs?user=root&password=india@123");
	String str="Select * from items where category='Books'";
	PreparedStatement st=cn.prepareStatement(str);
	ResultSet rs=st.executeQuery();
	while(rs.next()){
		%>
			<tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(4) %></td></tr>
		<%
	}
	st.close();
  	%>
  	</table>
  </div>
</div>

<div class="nav2">
  <br><br>
  <button class="btn btn-danger" onclick="artUpload()">Upload an Article</button><br><br>
  <button class="btn btn-danger" onclick="artDelete()">Delete an Article</button>
  <div id="div2"></div>
  <div id="showBooks">
  <table border=2>
  <tr><th style="text-align:center;">Article ID</th><th style="text-align:center;">Article Title</th><th style="text-align:center;">Author</th></tr>
  	<%
	String str1="Select * from items where category='Articles'";
	PreparedStatement st1=cn.prepareStatement(str1);
	ResultSet rs1=st1.executeQuery();
	while(rs1.next()){
		%>
			<tr><td><%=rs1.getString(1) %></td><td><%=rs1.getString(2) %></td><td><%=rs1.getString(4) %></td></tr>
		<%
	}
	st.close();
  	%>
  	</table>
  </div>
</div>

<div class="nav3">
  <br><br>
  <button class="btn btn-danger" onclick="medUpload()">Upload a Medicine</button><br><br>
  <button class="btn btn-danger" onclick="medDelete()">Delete a Medicine</button>
  <div id="div3"></div>
  <div id="showBooks">
   <table border=2>
  <tr><th style="text-align:center;">Medicine ID</th><th style="text-align:center;">Medicine Name</th><th style="text-align:center;">Manufacturer</th></tr>
  	<%
 	String str2="Select * from items where category='Medicines'";
	PreparedStatement st2=cn.prepareStatement(str2);
	ResultSet rs2=st2.executeQuery();
	while(rs2.next()){
		%>
			<tr><td><%=rs2.getString(1) %></td><td><%=rs2.getString(2) %></td><td><%=rs2.getString(4) %></td></tr>
		<%
	}
	st.close();
	cn.close();
  	%>
  	</table>
  </div>
</div>
<footer class="container-fluid text-center">
&copy;Medical Reference System <br>
2017
</footer>
</body>
</html>