package dal;

import model.Admin;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO extends DBContext {

    public Admin check(String username, String password) {
        String sql = "select * from account where username = ? and password = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Admin a = new Admin(rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role"));
                return a;
            }

        } catch (Exception e) {

        }

        return null;
    }
}
