<%-- 
    Document   : addEmployee
    Created on : 5 Jul, 2019, 4:55:00 PM
    Author     : kd
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Simple CRUD</title>
    </head>
    <body>
        <%!
            Connection conn; 
            Statement stmt;
            PreparedStatement ps;
            String qry;
        %>
        <%
            if(request.getParameter("insert")!=null)
            {
            try
            {
               Class.forName("com.mysql.jdbc.Driver");
               conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","root");
               qry = "INSERT INTO data(firstname,lastname,email,password) VALUES(?,?,?,?)";
               ps = conn.prepareStatement(qry);
               ps.setString(1, request.getParameter("firstname"));
               ps.setString(2, request.getParameter("lastname"));
               ps.setString(3, request.getParameter("email"));
               ps.setString(4, request.getParameter("password"));
               
               ps.executeUpdate();
               response.sendRedirect("./employees.jsp");
            }
            catch(Exception e)
            {
              System.out.println(e);
            }
            }
        
        %>
    <center>
        <h1 style="text-decoration: underline;">Add Details Here</h1>
        <form id="addForm" action="" method="post">
            <table border="2" cellspacing="0" cellpadding="5" style="background-color: lightblue; border-radius: 5px;">
                <tr>
                    <td>First Name : </td>
                    <td><input type="text" name="firstname" required="" style="background-color: lightgreen;
                               border: 2px solid black;"/></td>
                </tr>
                <tr>
                    <td>Last Name : </td>
                    <td><input type="text" name="lastname" required="" style="background-color: lightgreen;
                               border: 2px solid black;"/></td>
                </tr>
                <tr>
                    <td>Email : </td>
                    <td><input type="text" name="email" required="" style="background-color: lightgreen;
                               border: 2px solid black;"/></td>
                </tr>
                <tr>
                    <td>Password : </td>
                    <td><input type="password" name="password" required="" style="background-color: lightgreen;
                               border: 2px solid black;"/></td>
                </tr>
                <tr>
                    <td><input type="submit" name="insert" value="ADD" id="btnAdd" style="background-color: lightblue;
                               border: 2px solid black" required=""/></td>
                </tr>
            </table>
            
        </form>
    </center>
    </body>
</html>
