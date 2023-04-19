<%@ page import="java.sql.*" %>
<%
   // Setting up the database connection
   String driver = "com.mysql.jdbc.Driver";
   String url = "jdbc:mysql://localhost:3306/employeeform";
   String username = "root";
   String password = "";
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   try {
      Class.forName(driver);
      conn = DriverManager.getConnection(url, username, password);
      
      // Retrieving data from the database
      stmt = conn.createStatement();
      String sql = "SELECT * FROM details";
      rs = stmt.executeQuery(sql);
      
      // Displaying data in a table
      out.println("<table>");
      out.println("<tr><th>EMP NAME</th><th>EMAIL</th><th>PHONE</th><th>GENDER</th><th>DOB</th><th>QUALIFICATION</th><th>EXPERIENCE PAST</th><th>JOINING YEAR</th><th>EXPERIENCE</th>");
      while(rs.next()) {
        int y = rs.getInt("expcur");
        int ans = 2023 - y;
         out.println("<tr>");
         out.println("<td>" + rs.getString("empname") + "</td>");
         out.println("<td>" + rs.getString("email") + "</td>");
         out.println("<td>" + rs.getString("dob") + "</td>");
         out.println("<td>" + rs.getString("mobile") + "</td>");
         out.println("<td>" + rs.getString("gender") + "</td>");
         out.println("<td>" + rs.getString("qual") + "</td>");
         out.println("<td>" + rs.getString("exppast") + "</td>");
         out.println("<td>" + rs.getInt("expcur") + "</td>");
         out.println("<td>"+ans+"</td>");
         out.println("</tr>");
      }
      out.println("</table>");
   } catch(Exception e) {
      e.printStackTrace();
   } finally {
      try {
         if(rs!=null) rs.close();
         if(stmt!=null) stmt.close();
         if(conn!=null) conn.close();
      } catch(Exception e) {
         e.printStackTrace();
      }
   }
%>