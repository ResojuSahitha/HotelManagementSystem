<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
<%
int id = Integer.parseInt(request.getParameter("t1"));
String uname =request.getParameter("t2");
String uemail =request.getParameter("t3");
String pwd  = request.getParameter("t4");
String umobile = request.getParameter("t5");
try
{ 
	Connection con=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	//out.println("Driver is loaded");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HotelManagement","root","Biddu@2004");
	//out.println("Connection is established");
	PreparedStatement pst = con.prepareStatement("insert into users values(?,?,?,?,?)");
	pst.setInt(1,id);
	pst.setString(2, uname);
	pst.setString(3, uemail);
	pst.setString(4, pwd);
	pst.setString(5, umobile);
	int rowCount = pst.executeUpdate();
	if(rowCount>0)
	{
		request.setAttribute("status", "success");
		response.sendRedirect("RegAlert.html");
	}
	else
	{
		request.setAttribute("status", "failed");
		response.sendRedirect("RegWarn.html");
	}
	pst.close();
	con.close();
	
}
catch(Exception e)
{
	
}
%>

</body>
</html>