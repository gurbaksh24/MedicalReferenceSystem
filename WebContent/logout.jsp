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
	<script type="text/javascript">
	var x;
	function log()
	{
		  	x=new XMLHttpRequest();
		  	var url="abc.jsp";
		  	x.onreadystatechange=Myfunction;
		  	x.open("GET",url,true);
		  	x.send(null);
	}
	function Myfunction()
	{
		  if(x.readyState==4||x.readyState=="complete")
			  {
			  	location="index.jsp";
			  }
	}
	function noBack()
	{
		  	window.history.forward();
	}
	</script>
</head>
<body onload="log(),noBack()">
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
        <div class="panel-footer">&#8377;</div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">&#8377;</div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">&#8377;</div>
      </div>
    </div>
</div>
<h2>Researches</h2>    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">&#8377;</div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">&#8377;</div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">&#8377;</div>
      </div>
    </div>
</div>

<h2>Books</h2>    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">&#8377;</div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">&#8377;</div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">&#8377;</div>
      </div>
    </div>
</div>

<h2>Medicines</h2>
	    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">&#8377;</div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">&#8377;</div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"></div>
        <div class="panel-body"><img src="" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">&#8377;</div>
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