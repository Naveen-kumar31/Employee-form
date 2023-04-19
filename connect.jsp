<%@ page import = "java.sql.*"%>
<%
String empname = request.getParameter("empname");
String email = request.getParameter("email");
String dob = request.getParameter("dob");
String mobile = request.getParameter("mobile");
String gender = request.getParameter("gender");
String qual = request.getParameter("qual");
String exppast = request.getParameter("exppast");
String expcur = request.getParameter("expcur");
try{
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeeform","root","");
  PreparedStatement ps = conn.prepareStatement("insert into details(empname,email,dob,mobile,gender,qual,exppast,expcur) values(?,?,?,?,?,?,?,?);");
  ps.setString(1,empname);
  ps.setString(2,email);
  ps.setString(3,dob);
  ps.setString(4,mobile);
  ps.setString(5,gender);
  ps.setString(6,qual);
  ps.setString(7,exppast);
  ps.setString(8,expcur);
  int x = ps.executeUpdate();
  if(x>0){
    out.println("Registration Successful...");
  }
  else{
    out.println("Registration Unsuccessful....");
  }

}
catch(Exception e){
  out.println(e);
}

%>