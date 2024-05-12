<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String name = request.getParameter("name");

    Connection conn = null;
    Statement stmt = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mariadb://10.250.3.120:3306/register", "root", "password");
        stmt = conn.createStatement();
        String sql = "INSERT INTO register (username, password, name) VALUES ('" + username + "', '" + password + "', '" + name + "')";
        int rowsAffected = stmt.executeUpdate(sql);
        if (rowsAffected > 0) {
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("register.jsp");
        }
    } catch (SQLException e) {
        out.println("Database error: " + e.getMessage());
        response.sendRedirect("register.jsp");
    } catch (Exception e) {
        out.println("An unexpected error occurred: " + e.getMessage());
        response.sendRedirect("register.jsp");
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("Error closing database resources: " + e.getMessage());
        }
    }
%>
