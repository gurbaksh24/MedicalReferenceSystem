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
    	min-height: 768px;
    }
    footer{
    	background-color: #266;
    	color: white;
    }
    h2{
    	color: #FFF;
    }
	</style>
	<script type="text/javascript">
	var xmlHttp;
	function disp(str)
	{
		var cat=document.getElementById("category").value;
		xmlHttp=new XMLHttpRequest();
		var url="Search?key="+str+"&categ="+cat;
		xmlHttp.open("GET",url,true);
		xmlHttp.onreadystatechange=myfunction;
		xmlHttp.send(null);
	}
	function myfunction()
	{
		if(xmlHttp.readyState==4 || x.readyState=="complete")
			{
			document.getElementById("mymsg").innerHTML=xmlHttp.responseText;
			}
		else
		{
			document.getElementById("mymsg").innerHTML="Please Wait";
		}
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
				<ul class="nav navbar-nav navbar-right"><%	HttpSession hs=request.getSession();
				 if(hs.getAttribute("uid")!=null){ %>
				 <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
				<li><a href="signup.jsp"><span class="glyphicon glyphicon-user"></span><%=request.getSession().getAttribute("uname") %></a></li>
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
	<br><br>
	<form role="form" action="OpenFile">
	<div class="form-group">
 			<label for="category">Select Category:</label>
      		<select class="form-control" id="category" name="category">
        		<option>Articles</option>
        		<option>Research Papers</option>
        		<option>Books</option>
        		<option>Medicines</option>
      		</select>
      	</div>
		<div class="form-group">
  			<label for="keyword">Keyword:</label>
  			<input type="text" class="form-control" autocomplete="off" onkeyup="disp(this.value)" name="key" id="keyword">
		
      	<div class="form-group" id="mymsg">
      	</div>
      	</div>
			<input type="submit" class="btn btn-primary" value="Search">
	</form>
</div>

<br>
</section>
<footer class="container-fluid text-center">
&copy;Medical Reference System <br>
2017
</footer>
</body>
</html>