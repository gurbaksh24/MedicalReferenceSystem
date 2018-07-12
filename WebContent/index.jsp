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
    }
    h2{
    	color: #FFF;
    }
	</style>
	
</head>
<%!
	int b=0,a=0,m=0;
	String books[];
	String articles[];
	String medicines[];
%>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/mrs?user=root&password=india@123");
    String sql = "SELECT * FROM items";
    PreparedStatement st = cn.prepareStatement(sql);
    ResultSet rs=st.executeQuery();
    while(rs.next()){
    	if((rs.getString(4)).equals("Books"))
    	{
    		books[b++]=rs.getString(2);
    	}
    	if((rs.getString(4)).equals("Articles"))
    	{
    		articles[a++]=rs.getString(2);
    	}
    	if((rs.getString(4)).equals("Medicines"))
    	{
    		medicines[m++]=rs.getString(2);
    	}
    }
    st.close();
    cn.close();
    out.println("<h1>Hello"+books[0]+"<//h1>");
    System.out.println("Hello"+books[0]);
    for(int i=0;i<3;i++){
    	out.println("books:"+books[i]);
    	System.out.println("Books"+books[i]);
    }
    System.out.println("Hello2");
    
}
catch(Exception e){
	e.printStackTrace();
}

%>





<body>
<header>
		<div class="jumbotron">
			<div class="container">
			<h1>Medical Reference System</h1>
			<h3>Learning, Consultation and Remedies</h3>
		</div>
	</div>
</header>

<nav class="navbar navbar-inverse">
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
				<li><a href="editProfile.jsp"><span class="glyphicon glyphicon-user"></span><%=request.getSession().getAttribute("uname") %></a></li>
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
<section>
<div class="container">    
  <h2>Articles</h2>
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
</div>
<h2>Researches</h2>    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
</div>

<h2>Books</h2>    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
</div>

<h2>Medicines</h2>
	    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
</div>
</section>
<footer class="container-fluid text-center">
&copy;Medical Reference System <br>
2017
</footer>
</body>
</html>