Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
boolean loggedIn = false;

try {
    Class.forName("org.mariadb.jdbc.Driver"); #드라이버 이름확인
    conn = DriverManager.getConnection("jdbc:mariadb://10.250.3.120:3306/register", "root", "password");  #DB종류,IP,PORT,데이터베이스이름,id,password확인
    stmt = conn.createStatement();
    String sql = "SELECT * FROM register WHERE username='" + username + "' AND password='" + password + "'";
    rs = stmt.executeQuery(sql);

    if (rs.next()) {
        loggedIn = true;
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (rs != null) rs.close();
    if (stmt != null) stmt.close();
    if (conn != null) conn.close();
}

if (loggedIn) {
    out.println("<h2>Login successful</h2>");
} else {
    out.println("<h2>Login failed</h2>");
}
%>
