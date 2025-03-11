package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

import model.Product;

public class ProductDAO extends DBContext {

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescribe(rs.getString("describe"));
                p.setReleaseDate(rs.getString("releaseDate"));

                Category c = new Category(rs.getInt("cid"), rs.getString("cname"), rs.getString("cdescribe"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getByCategoryID(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.id, p.name, p.image, p.price, p.quantity, p.describe, p.releaseDate, p.cid cid, c.name cname "
                + "FROM PRODUCTS p inner join CATEGORIES c on p.cid = c.id where cid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescribe(rs.getString("describe"));
                p.setReleaseDate(rs.getString("releaseDate"));

                Category c = new Category(rs.getInt("cid"), rs.getString("cname"), rs.getString("cdescribe"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> searchByName(String key) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.id, p.name, p.image, p.price, p.quantity, p.describe, p.releaseDate, p.cid cid, c.name cname "
                + "FROM PRODUCTS p inner join CATEGORIES c on p.cid = c.id where p.name LIKE ? OR p.describe LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setDescribe(rs.getString("describe"));
                p.setReleaseDate(rs.getString("releaseDate"));

                Category c = new Category(rs.getInt("cid"), rs.getString("cname"), rs.getString("cdescribe"));
                p.setCategory(c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
