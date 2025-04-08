/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext{

    private static final String LOGIN = "SELECT *\n"
            + "  FROM [dbo].[tblUsers]\n"
            + "  where userID=? and password=?";
    public boolean checkLogin(String userID, String password){
        boolean check = false;
        try {
            PreparedStatement ptm = connection.prepareStatement(LOGIN);
            ptm.setString(1, userID);
            ptm.setString(2, password);
            ResultSet rs = ptm.executeQuery();
            if(rs.next()){
                check=true;
            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return check;
    }

}
