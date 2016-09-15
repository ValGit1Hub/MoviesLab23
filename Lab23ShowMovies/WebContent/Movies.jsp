<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
<title>Welcome to the movies!</title>

</head>
<body>
  <h1>Welcome to the movies!!!</h1>
  <form method="get" action="Movies.jsp">
  	<input type="text" name="movieName" >&nbsp &nbsp &nbsp
    <input type="submit"  value="Search by Title">
  
  
  </form>
  <%
    String movie = request.getParameter("movieName");
	String selectCommand;
	//load driver for mysql
			Class.forName("com.mysql.jdbc.Driver");  
			//store the info to the DB orders
			  Connection cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies","root","vsmith38282");
			//command
			  if (movie == null||movie.isEmpty()){
				  selectCommand = "select title,category,images from movie_info order by category";
			  }else
			  {
				  selectCommand = "select title,category,images from movie_info where title like '%"+movie+"%' order by category";
			  }
			//create statement
			  Statement st = cnn.createStatement();
			// use st to execute the commant
			  ResultSet rs = st.executeQuery(selectCommand);
	          out.print("<table border=1>");
				 while(rs.next()){
					 out.print("<tr>");
					 out.print("<td>"+rs.getString(1)+"</td>");
					 out.print("<td>"+rs.getString(2)+"</td>");
					 out.print("<td>"+rs.getString(3)+"</td>");
					 out.print("</tr>");
				 }
				 out.print("</table>");
%>
			  
</body>
</html>