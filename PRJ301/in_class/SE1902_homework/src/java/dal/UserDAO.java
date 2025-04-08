/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Users;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    private static final String LOGIN = "SELECT *\n"
            + "  FROM [dbo].[tblUsers]\n"
            + "  where userID=? and password=?";

    public Vector<Users> getAllUser(String sql) {
        Vector<Users> listUsers = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8));
                listUsers.add(u);
            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return listUsers;
    }

    public int insertUser(Users u) {
        String sql = "INSERT INTO [dbo].[tblUsers]\n"
                + "           ([userID]\n"
                + "           ,[fullName]\n"
                + "           ,[password]\n"
                + "           ,[roleID]\n"
                + "           ,[address]\n"
                + "           ,[phone]\n"
                + "           ,[email]\n"
                + "           ,[activate])\n"
                + "     VALUES (?,?,?,?,?,?,?,?)";
        int n = 0;
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, u.getUserID());
            ptm.setString(2, u.getFullName());
            ptm.setString(3, u.getPassword());
            ptm.setInt(4, u.getRoleID());
            ptm.setString(5, u.getAddress());
            ptm.setString(6, u.getPhone());
            ptm.setString(7, u.getEmail());
            ptm.setBoolean(8, u.isActivate());
            n = ptm.executeUpdate();

        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return n;
    }

    public Users searchUser(String userID) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[tblUsers]\n"
                + "  WHERE userID=? ";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, userID);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                return new Users(userID,
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8));
            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return null;
    }

    public void updateUser(Users u) {
        String sql = "UPDATE [dbo].[tblUsers]\n"
                + "   SET [fullName] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[roleID] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[activate] = ?\n"
                + " WHERE userID = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, u.getFullName());
            ptm.setString(2, u.getPassword());
            ptm.setInt(3, u.getRoleID());
            ptm.setString(4, u.getAddress());
            ptm.setString(5, u.getPhone());
            ptm.setString(6, u.getEmail());
            ptm.setBoolean(7, u.isActivate());
            ptm.setString(8, u.getUserID());
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
    }

    public void changeActivate(String userID, boolean activate) {
        String sql = "UPDATE [dbo].[tblUsers]\n"
                + "   SET [activate] = ?\n"
                + " WHERE userID = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setBoolean(1, activate);
            ptm.setString(2, userID);
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
    }

    public int deleteUser(String userID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[tblUsers]\n"
                + "      WHERE userID like ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, userID);
            ResultSet rs = getData("SELECT *\n"
                    + "FROM [dbo].[tblOrders]\n"
                    + "WHERE userID like '" + userID + "'");
            if (rs.next()) {
                changeActivate(userID, false);
                return n;
            }
            n = ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return n;
    }

    public boolean checkLogin(String userID, String password) {
        boolean check = false;
        try {
            PreparedStatement ptm = connection.prepareStatement(LOGIN);
            ptm.setString(1, userID);
            ptm.setString(2, password);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                check = true;
            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return check;
    }

}
