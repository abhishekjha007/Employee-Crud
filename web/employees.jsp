<%-- 
    Document   : employees
    Created on : 5 Jul, 2019, 1:42:46 PM
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
            Statement stmt;
            ResultSet result;
            String query;
            Integer empId;
        %>
        <%
            try
            {
               Class.forName("com.mysql.jdbc.Driver");
               conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","root");
               stmt = conn.createStatement();
               query = "SELECT * from data";
               result = stmt.executeQuery(query);
               
            }
            catch(Exception e)
            {
              System.out.println(e);
            }
        %>
    <center>
        <h1 style="text-decoration: underline;">Welcome to CRUD Application</h1>
        <h3><a href="addEmployee.jsp">Add Details</a><h3>
        <table border="2" cellspacing="0" cellpadding="5" style="background-color: lightblue; border-radius: 5px;">
            <tr>
                <th>Employee Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Password</th>
                <th colspan="2">Action</th>
            </tr>
            <%
                while(result.next())
                {
                    empId = result.getInt("empid");
                
            %>
            <tr>    
                    <td><%=empId%></td>
                    <td><%=result.getString("firstname")%></td>
                    <td><%=result.getString("lastname")%></td>
                    <td><%=result.getString("email")%></td>
                    <td><%=result.getString("password")%></td>
                    <td><a href="updateEmployee.jsp?empid=<%=empId%>">Update</a></td>
    <td><a href="deleteEmployee.jsp?empid=<%=empId%>" onclick="return confirm('Are you Sure want to delete ???')">Delete</a></td>
            </tr>
            <%
                }
            %>    
        </table>
    </center>
        
    </body>
</html>
