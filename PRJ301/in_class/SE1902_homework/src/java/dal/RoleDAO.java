/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.Vector;
import models.Roles;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleDAO extends DBContext {

    public Vector<Roles> getAllRole(String sql) {
        Vector<Roles> listRoles = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Roles r = new Roles(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3));
                listRoles.add(r);
            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return listRoles;
    }

    public int insertRole(Roles r) {
        String sql = "INSERT INTO [dbo].[tblRoles]\n"
                + "           ([roleName]\n"
                + "           ,[status])\n"
                + "     VALUES (?,?)";
        int n = 0;
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, r.getRoleName());
            ptm.setInt(2, r.getStatus());
            n = ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return n;
    }

    public Roles searchRole(int roleID) {
        String sql = "SELECT *\n"
                + "FROM [dbo].[tblRoles]\n"
                + "WHERE roleID = ? ";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, roleID);
            ResultSet rs = ptm.executeQuery();
            if (rs.next()) {
                return new Roles(roleID,
                        rs.getString(2),
                        rs.getInt(3));
            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return null;
    }

    public void updateRole(Roles r) {
        String sql = "UPDATE [dbo].[tblRoles]\n"
                + "   SET [roleName] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE roleID = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setString(1, r.getRoleName());
            ptm.setInt(2, r.getStatus());
            ptm.setInt(3, r.getRoleID());
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
    }

    public void changeStatus(int roleID, int status) {
        String sql = "UPDATE [dbo].[tblRoles]\n"
                + "   SET [status] = ?\n"
                + "WHERE roleID = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, status);
            ptm.setInt(2, roleID);
            ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
    }

    public int deleteRole(int roleID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[tblRoles]\n"
                + "      WHERE roleID = ?";
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ptm.setInt(1, roleID);
            ResultSet rs = getData("SELECT *\n"
                    + "  FROM [dbo].[tblUsers]\n"
                    + "  WHERE roleID = " + roleID);
            if (rs.next()) {
                changeStatus(roleID, 0);
                return n;
            }
            n = ptm.executeUpdate();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return n;
    }

    public static void main(String[] args) {
        String sql = "SELECT * FROM [dbo].[tblRoles]";
        RoleDAO rDAO = new RoleDAO();
        Vector<Roles> r = rDAO.getAllRole(sql);
        for (Roles roles : r) {
            System.out.println(roles);
        }
    }
}
