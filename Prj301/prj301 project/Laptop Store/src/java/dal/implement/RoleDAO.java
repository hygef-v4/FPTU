
package dal.implement;

import dal.DBContext;
import java.util.Vector;
import model.Role;
import java.sql.*;

public class RoleDAO extends  DBContext{
    public Vector<Role> getAllRoles(String sql) {
        Vector<Role> listRoles = new Vector<>();
        try {
            PreparedStatement ptm = connection.prepareStatement(sql);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                Role role = new Role(
                        rs.getInt("roleID"),      // roleID
                        rs.getString("roleName")  // roleName
                );
                listRoles.add(role);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listRoles;
    }
}
