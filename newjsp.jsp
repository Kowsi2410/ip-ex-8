<%-- 
    Document   : newjsp
    Created on : Mar 26, 2024, 2:08:14 PM
    Author     : test02
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/products");
        Statement st=c.createStatement();
        ResultSet rs=st.executeQuery("select * from products");%>
        <table border="2">
            <tr><th>id</th><th>product</th><th>category</th><th>price</th><th>quantity</th></tr>
            <% while(rs.next())
            {%>
            <tr><td><%out.println(rs.getInt(1));%></td>
            <td><%out.println(rs.getString(2));%></td>
            <td><%out.println(rs.getString(3));%></td>
            <td><%out.println(rs.getInt(4));%></td>
            <td><%out.println(rs.getInt(5));%></td>

                <%}
%>
        </table><br><br>
        <% 
        ResultSet rs1=st.executeQuery("select * from products");
        int totalproduct=0;
        while(rs1.next()){
            totalproduct++;
        } %>
        <table border="2">
            <tr><th>Product_id</th></tr>
            <tr><td><%= totalproduct %>;</td></tr>
        </table>
        </table><br><br>
        <% 
        ResultSet rs2=st.executeQuery("select AVG(price) as avg_price from products");
        int avg=0;
        while(rs2.next()){
            avg=rs2.getInt("avg_price");
        } %>
        <table border="2">
            <tr><th>average</th></tr>
            <tr><td><%= avg %>;</td></tr>
        </table>
        
       </table><br><br>
        <% 
        ResultSet rs3=st.executeQuery("select category,SUM(price*quantity) as total from products group by category order by total DESC");
        String highesttotal="";
        if(rs3.next()){
            highesttotal=rs3.getString("category");
        
        } %>
        <table border="2">
            <tr><th>category with highest total</th></tr>
            <tr><td><%= highesttotal %>;</td></tr>
        </table>
    </body>
</html>
