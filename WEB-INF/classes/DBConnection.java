import java.sql.*;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/biteright_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String USER = "root";  // Replace with your actual username
    private static final String PASSWORD = "password";  // Replace with your actual password

    // Establish a connection to the database
    public static Connection getConnection() throws SQLException {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
    }

    
    // Get all orders from the database with user information
    public static ResultSet getAllOrders() throws SQLException {
        String query = "SELECT o.id, u.username, o.total_price, o.status, o.user_id FROM orders o " +
                    "JOIN users u ON o.user_id = u.id";
        Connection conn = getConnection();
        Statement stmt = conn.createStatement();
        return stmt.executeQuery(query);
    }


    // Get all menu items from the database
    public static ResultSet getAllMenuItems() throws SQLException {
        String query = "SELECT * FROM menu";
        Connection conn = getConnection();
        Statement stmt = conn.createStatement();
        return stmt.executeQuery(query);
    }

    // Get login logs from the database
    public static ResultSet getLoginLogs() throws SQLException {
        String query = "SELECT ll.id, u.username, ll.login_time FROM login_logs ll " +
                       "JOIN users u ON ll.user_id = u.id ORDER BY ll.login_time DESC";
        Connection conn = getConnection();
        Statement stmt = conn.createStatement();
        return stmt.executeQuery(query);
    }
    

    // Update order status
    public static boolean updateOrderStatus(int orderId, String status) throws SQLException {
        String query = "UPDATE orders SET status = ? WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, status);
            ps.setInt(2, orderId);
            return ps.executeUpdate() > 0;
        }
    }

    // Add a menu item to the database
    public static boolean addMenuItem(String name, String description, double price) throws SQLException {
        String query = "INSERT INTO menu (name, description, price) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setDouble(3, price);
            return ps.executeUpdate() > 0;
        }
    }

    // Delete a menu item from the database
    public static boolean deleteMenuItem(int menuId) throws SQLException {
        String query = "DELETE FROM menu WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, menuId);
            return ps.executeUpdate() > 0;
        }
    }

    // Insert a login record into the login_log table
    public static boolean insertLoginLog(int userId) throws SQLException {
        String query = "INSERT INTO login_logs (user_id, login_time) VALUES (?, NOW())";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            return ps.executeUpdate() > 0;
        }
    }

    // Get login history for a specific user
    public static ResultSet getLoginHistoryForUser(int userId) throws SQLException {
        String query = "SELECT * FROM login_logs WHERE user_id = ? ORDER BY login_time DESC";
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, userId);
        return ps.executeQuery();
    }

    public static ResultSet getAllUsers() throws SQLException {
        String query = "SELECT * FROM users";
        Connection conn = getConnection();
        Statement stmt = conn.createStatement();
        return stmt.executeQuery(query);
    }

    public static ResultSet getBillDetails(int orderId) throws SQLException {
        String query = "SELECT o.id, o.total_price, o.status, o.created_at, u.username, m.name AS item_name, m.price, oi.quantity " +
                       "FROM orders o " +
                       "JOIN users u ON o.user_id = u.id " +
                       "JOIN order_items oi ON o.id = oi.order_id " +
                       "JOIN menu m ON oi.menu_id = m.id " +
                       "WHERE o.id = ?";
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, orderId);
        return ps.executeQuery();
    }
    
    
}
