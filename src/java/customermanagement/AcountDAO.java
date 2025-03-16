package customermanagement;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Product;
import model.Role;

public class AcountDAO extends DBContext {

    public Account checkAccountExist(String username) {
        try {
            String sql = "SELECT id , username , password , active FROM Account where [username] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt(1));
                a.setUsername(rs.getString(2));
                a.setPassword(rs.getString(3));
                a.setActive(rs.getBoolean(4));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AcountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Account where [roleId] != 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = mapAccount(rs);

                list.add(account);
            }
        } catch (Exception ex) {
            Logger.getLogger(AcountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Account mapAccount(ResultSet rs) throws SQLException {
        Account account = new Account();
        account.setId(rs.getInt(1));
        account.setUsername(rs.getString(2));
        account.setEmail(rs.getString(3));
        account.setAddress(rs.getString(4));
        account.setPhoneNumber(rs.getString(5));
        account.setPassword(rs.getString(6));
        account.setRoleId(rs.getInt(7));
        account.setActive(rs.getBoolean(9));
        return account;
    }

    public List<Account> getAllAccountByPage(int page, int PAGE_SIZE) {
        List<Account> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Account where roleId != 1"
                    + " order by id\n"
                    + "offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, page);
            stm.setInt(2, PAGE_SIZE);
            stm.setInt(3, PAGE_SIZE);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = mapAccount(rs);

                list.add(account);
            }
        } catch (Exception ex) {
            Logger.getLogger(AcountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalAccount() {
        List<Account> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Account where roleId != 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = mapAccount(rs);

                list.add(account);
            }
        } catch (Exception ex) {
            Logger.getLogger(AcountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list.size();
    }

    public void UpDatePassWord(String pass, int id) {
        try {
            String sql = "UPDATE [Account]\n"
                    + "   SET [password] = ?\n"
                    + " WHERE [id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pass);
            stm.setInt(2, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AcountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int insertAccount(Account account) {
        try {
            String sql = "INSERT INTO [Account]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[email]\n"
                    + "           ,[address]\n"
                    + "           ,[active]\n"
                    + "           ,[roleId]\n"
                    + "           ,[phoneNumber])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,1\n"
                    + "           ,2\n" // role customer
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, account.getUsername());
            stm.setString(2, account.getPassword());
            stm.setString(3, account.getEmail());
            stm.setString(4, account.getAddress());
            stm.setString(5, account.getPhoneNumber());
            return stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AcountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void updateAccount(Account account) {

        try {
            String sql = "UPDATE [Account]\n"
                    + "   SET [active] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, account.isActive());
            stm.setInt(2, account.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AcountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
