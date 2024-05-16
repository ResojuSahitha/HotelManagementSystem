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
int rooms = Integer.parseInt(request.getParameter("t1"));
int beds  = Integer.parseInt(request.getParameter("t2"));
try
{ 
	Connection con=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	//out.println("Driver is loaded");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HotelManagement","root","Biddu@2004");
	//out.println("Connection is established");
	PreparedStatement pst = con.prepareStatement("insert into addrms values(?,?)");
	pst.setInt(1,rooms);
	pst.setInt(2, beds);
	int rowCount = pst.executeUpdate();
	if(rowCount>0)
	{
		request.setAttribute("status", "success");
		response.sendRedirect("AlertAdd.html");
		
	}
	else
	{
		request.setAttribute("status", "failed");
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