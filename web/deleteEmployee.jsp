<%-- 
    Document   : deleteEmployee
    Created on : 5 Jul, 2019, 5:54:10 PM
    Author     : kd
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
            Connection conn; 
            Statement stmt;
            PreparedStatement ps;
            String qry;
            Integer eId;
        %>
        <%
            if(request.getParameter("empid")!=null && request.getParameter("empid") != "")
            {
                eId = Integer.parseInt(request.getParameter("empid"));
                try
            {
               Class.forName("com.mysql.jdbc.Driver");
               conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","root");
               qry = "DELETE FROM data WHERE empid = ?";
               ps = conn.prepareStatement(qry);
               ps.setInt(1, eId);
               /*ps.setString(2, request.getParameter("lastname"));
               ps.setString(3, request.getParameter("email"));
               ps.setString(4, request.getParameter("password"));*/
               
               ps.executeUpdate();
               response.sendRedirect("./employees.jsp");
            }
            catch(Exception e)
            {
              System.out.println(e);
            }
            }
        
        %>
