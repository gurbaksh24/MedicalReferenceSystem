<%
session.removeValue("uid");
session.setAttribute("uid",null);
session.removeValue("uname");
session.setAttribute("uname",null);
Thread.sleep(2000);
%>