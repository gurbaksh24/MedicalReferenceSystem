<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<title>Home Page</title>
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist\bootstrap-3.3.7-dist\css\bootstrap.min.css">
	<script type="text/javascript" src="bootstrap-3.3.7-dist\bootstrap-3.3.7-dist\js\bootstrap.min.js"></script>
	<script type="text/javascript">
	var f=1;
function check(val,cntrl)
{
	if(val.length==0)
		{
		document.getElementById(cntrl).innerHTML="<font color=red>Sorry blank field</font>";
		f=1;
		}
	else
		{
		document.getElementById(cntrl).innerHTML="";
		f=0;
		}
}

function check2(val,cntrl)
{
	if(val.length!=10 || isNaN(val))
		{
		document.getElementById(cntrl).innerHTML="<font color=red>Invalid Phone Number</font>";
		f=1;
		}
	else
		{
		document.getElementById(cntrl).innerHTML="";
		f=0;
		}
}
function check3(val,cntrl)
{
	var k=0;
	var a=val.indexOf('@');
	if(a<1)
		k=1;
	var pos=-1;
	for(i=0;i<val.length;i++)
		{
		if(val[i]=='.')
			pos=i;
		}
	if(a>pos||pos<a+2||pos==val.length-1)
		k=1;
	if(k==1)
		{
		document.getElementById(cntrl).innerHTML="<font color=red>Invalid Email</font>";
		f=1;
		}
	else
		{
		document.getElementById(cntrl).innerHTML="";
		f=0;
		}
}
function sub()
{
	if(f==1)
		return false;
	else
		return true;
}
</script>
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
    	height: 1000px;
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
					<li><a href="signup.jsp"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
					<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
				</ul>
			</div>
		</div>
</nav>
<section>
	<br><br>
<div class="container">
<h1>User's Registration</h1>
<form role="form" action="SignUpPat" method="post">
<div class="form-group">
  <label for="name">Name:</label>
  <input type="text" class="form-control" id="name" name="name" onblur="check(this.value,'error1')"><div id="error1"></div>
</div>


<div class="form-group">
  <label for="email">Email:</label>
  <input type="email" class="form-control" id="email" name="email"  onblur="check3(this.value,'error5')"><div id="error5"></div>
</div>

<div class="form-group">
  <label for="pass">Password:</label>
  <input type="password" class="form-control" id="pass" name="pass" onblur="check(this.value,'error2')"><div id="error2"></div>
</div>

<div class="form-group">
  <label for="pno">Mobile Number:</label>
  <input type="tel" class="form-control" id="pno" name="pno" onblur="check2(this.value,'error3')"><div id="error3"></div>
</div>

<div class="form-group">
  <label for="dob">Date of Birth:</label>
  <input type="date" class="form-control" id="dob" name="dob">
</div>

<div class="radio">
 <label for="gender">Gender:</label>
 	<label class="radio-inline">Male<input type="radio" value="male" class="form-control" id="gender" name="gender" checked></label>
 	<label class="radio-inline">Female<input type="radio" value="female" class="form-control" id="gender" name="gender"></label>
</div>
<br><br>
<input type="submit" class="btn btn-primary" value="Sign Up" onclick="return sub()">
</form>
</div>
<br><br>
</section>
<footer class="container-fluid text-center">
&copy;Medical Reference System <br>
2017
</footer>
</body>
</html>