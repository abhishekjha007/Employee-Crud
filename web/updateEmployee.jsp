<%-- 
    Document   : updateEmployee
    Created on : 6 Jul, 2019, 12:22:28 PM
    Author     : kd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Simple CRUD</title>
    </head>
    <body>
        <%!
            Connection conn; 
            PreparedStatement ps;
            ResultSet result;
            String query;
            Integer eId;
        %>
        <%
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","root");
            if(request.getParameter("update") != null)
            {
                eId = Integer.parseInt(request.getParameter("hiddenid"));
                try
            {
               Class.forName("com.mysql.jdbc.Driver");
               //conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","root");
               query = "UPDATE data SET firstname = ?, lastname = ?, email = ?, password = ? WHERE empid = ?";
               ps = conn.prepareStatement(query);
               ps.setString(1,request.getParameter("firstname"));
               ps.setString(2,request.getParameter("lastname"));
               ps.setString(3,request.getParameter("email"));
               ps.setString(4,request.getParameter("password"));
               ps.setInt(5,eId);
               ps.executeUpdate();
               response.sendRedirect("./employees.jsp");
            }
            catch(Exception e)
            {
              System.out.println(e);
            }
            }
            if(request.getParameter("empid")!=null && request.getParameter("empid") != ""){
                eId = Integer.parseInt(request.getParameter("empid"));
                try
            {
               Class.forName("com.mysql.jdbc.Driver");
               //conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","root");
               query = "SELECT * FROM data WHERE empid = ?";
               ps = conn.prepareStatement(query);
               ps.setInt(1,eId);
               result = ps.executeQuery();
               result.first();
            }
            catch(Exception e)
            {
              System.out.println(e);
            }
                
            }else
            {
                response.sendRedirect("./employees.jsp");
            }
            
        %>
        <center>
        <h1 style="text-decoration: underline;">Update Details Here</h1>
        <form id="updForm" action="" method="post">
            <table border="2" cellspacing="0" cellpadding="5" style="background-color: lightblue; border-radius: 5px;">
                <tr>
                    <td>First Name : </td>
                    <input type="hidden" id="hiddenid" name="hiddenid" value="<%=eId%>"/>
                    <td><input type="text" name="firstname" required="" value='<%=result.getString("firstname")%>'
                                style="background-color: lightgreen;
                               border: 2px solid black;"/></td>
                </tr>
                <tr>
                    <td>Last Name : </td>
                    
                    <td>
                        <input type="text" name="lastname" required="" value='<%=result.getString("lastname")%>'
                                style="background-color: lightgreen;
                               border: 2px solid black;"/>
                    </td>
                </tr>
                <tr>
                    <td>Email : </td>
                    <td><input type="text" name="email" required="" value='<%=result.getString("email")%>'
                                style="background-color: lightgreen;
                               border: 2px solid black;"/></td>
                </tr>
                <tr>
                    <td>Password : </td>
                    <td><input type="text" name="password" required="" value='<%=result.getString("password")%>'
                                style="background-color: lightgreen;
                               border: 2px solid black;"/></td>
                </tr>
                <tr>
                    <td><input type="submit" name="update" value="UPDATE" id="update" style="background-color: lightblue;
                               border: 2px solid black" required=""/></td>
                </tr>
            </table>
            
        </form>
    </center>
    </body>
</html>
