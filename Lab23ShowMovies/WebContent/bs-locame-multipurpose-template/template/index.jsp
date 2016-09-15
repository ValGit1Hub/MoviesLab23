<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<!-- HEAD SECTION -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Movies,Movies, Movies</title>
    <!--GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <!--BOOTSTRAP MAIN STYLES -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!--FONTAWESOME MAIN STYLE -->
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <!--CUSTOM STYLE -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
    <!--END HEAD SECTION -->
<body>   
     <!-- NAV SECTION -->
    
    <div class="container">
            <div class="row ">
                 Movies, Movies, Movies				
		
            </div>
               </div>
     <!--END NAV SECTION -->
     <!-- HEADER SECTION -->
    <div id="header-section">
        <div class="container">
            <div class="row centered">
                <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
     <form method="get" action="index.jsp">
                    <br>
                    <br>
                    
                    
  	Movie: <input type="text" name="movieName" >&nbsp &nbsp &nbsp
     
    Rate a movie: <select name="stars">
 	<option value="none"></option>
	<option value="1">1 star</option>
	<option value="2">2 stars</option>
	<option value="3">3 stars</option>
	<option value="4">4 stars</option>
	<option value="5">5 stars</option>
	</select>&nbsp &nbsp &nbsp &nbsp 
	
     <br>
     <br>
      <input type="submit"  value="Search/Save">
     <br>
                   <br>
                    <br>
                    <br>
  
  </form>
  <%
    String movie = request.getParameter("movieName");
    String rate = request.getParameter("stars");
	String selectCommand,sql;
	//load driver for mysql
			Class.forName("com.mysql.jdbc.Driver");  
			//store the info to the DB orders
			  Connection cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies","root","vsmith38282");
			//command
			  if (movie == null||movie.isEmpty()||rate == null||rate.isEmpty()){
				  selectCommand = "select title,category,images from movie_info order by category";
				//create statement
				  Statement st = cnn.createStatement();
				  ResultSet rs = st.executeQuery(selectCommand);
		          out.print("<table border=1>");
				 while(rs.next()){
					out.print("<tr>");
					out.print("<td>"+rs.getString(1)+"</td>");
					out.print("<td>"+rs.getString(2)+"</td>");
					%>
					<td><img src="images/<%=rs.getString(3)%>" alt="image" height = "120" width = "80"/></td>
					<%
					//try this it might work now.
					//out.print("<td><img src=\"images/'"+rs.getString(3)+"'/></td>");
					out.print("</tr>");
					}
					 out.print("</table>");
			  }
			  else
			  {
				  if (rate!=null){
					  sql = "Update movie_info set rate= ? where title  = ?";
						//create statement
						 PreparedStatement ps = cnn.prepareStatement(sql);
						ps.setString(1,rate);
						ps.setString(2,movie);
						ps.executeUpdate();
						
						rate = null;
					  
				  }
				  
				  sql = "select title,category,images from movie_info where title like '%"+movie+"%' order by category";
				//create statement
				 PreparedStatement ps = cnn.prepareStatement(sql);
				// use st to execute the commant
				
				  ResultSet rs = ps.executeQuery();
		          out.print("<table border=1>");
				 while(rs.next()){
					out.print("<tr>");
					out.print("<td>"+rs.getString(1)+"</td>");
					out.print("<td>"+rs.getString(2)+"</td>");
					%>
					<td><img src="images/<%=rs.getString(3)%>" alt="image" height = "120" width = "80"/></td>
					<%
					//out.print("<td><img src=images/'"+rs.getString(3)+"'/></td>");
					out.print("</tr>");
					}
					 out.print("</table>");
						 
			 }
			
	 %>				
				 
				

<!-- <img src="images/Home.jpg" height = "120" width = "80"/> -->
                     <br />
                 <!--  <a href="#about-section">  <i class="fa fa-angle-double-down fa-5x down-icon"></i> </a> -->
                </div>
            </div>
           
        </div>
       
    </div> 
    
    <!--FOOTER SECTION -->
    <div id="footer">
        <div class="container">
            <div class="row ">
                				
		
            </div>
            
        </div>
       
    </div>  
    <!--END FOOTER SECTION --> 
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY LIBRARY -->
    <script src="assets/js/jquery.js"></script>
    <!-- CORE BOOTSTRAP LIBRARY -->
    <script src="assets/js/bootstrap.min.js"></script>
     <!-- SCROLL REVEL LIBRARY FOR SCROLLING ANIMATIONS-->
    <script src="assets/js/scrollReveal.js"></script>
       <!-- CUSTOM SCRIPT-->
    <script src="assets/js/custom.js"></script>
</body>
</html>
