package dal.implement;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import model.User;

public class UserDAO extends DBContext {

    // Method to get all users
    public Vector<User> getAllUsers(String sql) {
        Vector<User> listUsers = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt("userID"), // userID
                        rs.getString("fullName"), // fullName
                        rs.getString("username"), // username
                        rs.getString("password"), // password
                        rs.getInt("roleID"), // roleID
                        rs.getString("address"), // address
                        rs.getString("phone"), // phone
                        rs.getString("email"),// email
                        rs.getBoolean("activate")
                );
                listUsers.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listUsers;
    }

    public User findByUsernamePassword(String username, String password) {
        String sql = "SELECT *FROM [dbo].[tblUsers] where username = ? and password = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, username);
            ptm.setString(2, password);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("userID"), // userID
                        rs.getString("fullName"), // fullName
                        rs.getString("username"), // username
                        rs.getString("password"), // password
                        rs.getInt("roleID"), // roleID
                        rs.getString("address"), // address
                        rs.getString("phone"), // phone
                        rs.getString("email"), // email
                        rs.getBoolean("activate"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null; // no user found 
    }

    public boolean isUsernameExist(String username) {
        String sql = "SELECT COUNT(*) FROM [dbo].[tblUsers] WHERE username = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, username);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // If count is greater than 0, username exists
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false; // Username does not exist
    }

    public int insert(User newUser) {
        String sql = "INSERT INTO [dbo].[tblUsers]\n"
                + "           ([fullName]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[roleID]\n"
                + "           ,[address]\n"
                + "           ,[phone]\n"
                + "           ,[email]\n"
                + "           ,[activate])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        int n = 0;
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, newUser.getFullName());
            ptm.setString(2, newUser.getUsername());
            ptm.setString(3, newUser.getPassword());
            ptm.setInt(4, newUser.getRoleID());
            ptm.setString(5, newUser.getAddress());
            ptm.setString(6, newUser.getPhone());
            ptm.setString(7, newUser.getEmail());
            ptm.setBoolean(8, newUser.isActivate());
            n = ptm.executeUpdate();

        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return n;
    }

    public boolean checkPassword(String username, String password) {
        String sql = "SELECT COUNT(*) FROM [dbo].[tblUsers] WHERE username = ? AND password = ?";
        try (PreparedStatement ptm = connection.prepareStatement(sql)) {
            ptm.setString(1, username);
            ptm.setString(2, password);
            try (ResultSet rs = ptm.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // Returns true if count > 0, false otherwise
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Log the exception properly
        }
        return false; // Return false in case of an error
    }

    public boolean changePassword(String username, String newPassword) {
        String sql = "UPDATE [dbo].[tblUsers] SET password = ? WHERE username = ?";
        try (PreparedStatement ptm = connection.prepareStatement(sql)) {
            ptm.setString(1, newPassword);
            ptm.setString(2, username);
            int rowsAffected = ptm.executeUpdate();
            return rowsAffected > 0; // Returns true if update was successful, false otherwise
        } catch (SQLException ex) {
            ex.printStackTrace(); // Log the exception properly
            return false; // Return false in case of an error
        }
    }

    public boolean isEmailExistForOtherUser(String email, int userID) {
        String sql = "SELECT COUNT(*) FROM [dbo].[tblUsers] WHERE email = ? AND userID != ?";
        try (PreparedStatement ptm = connection.prepareStatement(sql)) {
            ptm.setString(1, email);
            ptm.setInt(2, userID);
            try (ResultSet rs = ptm.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // True if email exists for another user
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false; // False if no match or an error occurred
    }

    public boolean updateUserInfo(int userID, String fullName, String email, String phone, String address) {
        String sql = "UPDATE [dbo].[tblUsers] SET fullName = ?, email = ?, phone = ?, address = ? WHERE userID = ?";
        try (PreparedStatement ptm = connection.prepareStatement(sql)) {
            ptm.setString(1, fullName);
            ptm.setString(2, email);
            ptm.setString(3, phone);
            ptm.setString(4, address);
            ptm.setInt(5, userID);
            int rowsAffected = ptm.executeUpdate();
            return rowsAffected > 0; // True if update succeeded
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false; // False if an error occurred
        }
    }

    public User findByEmail(String email) {
        String sql = "SELECT * FROM [dbo].[tblUsers] WHERE email = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, email);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("userID"),
                        rs.getString("fullName"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("roleID"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getBoolean("activate")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

}
