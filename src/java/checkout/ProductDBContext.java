/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package checkout;

import productlist.*;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;

public class ProductDBContext extends DBContext {

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from products";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = mapProduct(rs);
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Product mapProduct(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setId(rs.getString(1));
        product.setName(rs.getString(2));
        product.setQuantity(rs.getInt(3));
        product.setPrice(rs.getDouble(4));
        product.setReleaseDate(rs.getString(5));
        product.setDescribe(rs.getString(6));
        product.setImage(rs.getString(7));
        Category category = new Category();
        category.setId(rs.getInt(8));
        product.setCategory(category);
        return product;
    }

    public List<Product> getProductsByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Products where cid = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = mapProduct(rs);
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getProductsWithPagging(int page, int PAGE_SIZE) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select *  from Products order by id\n"
                    + "offset (?-1)*? row fetch next ? rows only";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, page);
            stm.setInt(2, PAGE_SIZE);
            stm.setInt(3, PAGE_SIZE);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = mapProduct(rs);
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalProducts() {
        try {
            String sql = "select count(id)  from Products ";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Product> search(String keyword) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select *  from Products where name like ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = mapProduct(rs);
                list.add(product);

            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Product getProductById(String productId) {
        try {
            String sql = "select *  from Products where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, productId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = mapProduct(rs);
                return product;
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getProductsByPage(int page, int PAGE_SIZE) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Products "
                    + "order by id\n"
                    + "offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, page);
            stm.setInt(2, PAGE_SIZE);
            stm.setInt(3, PAGE_SIZE);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = mapProduct(rs);
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void inSertProduct(Product product) {
        try {
            String sql = "INSERT INTO [products]\n"
                    + "           ([name]\n"
                    + "           ,[image]\n"
                    + "           ,[price]\n"
                    + "           ,[describe]\n"
                    + "           ,[quantity]\n"
                    + "           ,[cid]\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, product.getName());
            stm.setString(2, product.getImage());
            stm.setDouble(3, product.getPrice());
            stm.setString(4, product.getDescribe());
            stm.setInt(5, product.getQuantity());
            stm.setInt(6, product.getCategory().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteProduct(int id) {
        try {
            String sql = "DELETE FROM [Product]\n"
                    + "WHERE id = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateProduct(Product p) {
        try {
            String sql = "UPDATE [product]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[image] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[describe] = ?\n"
                    + "      ,[cid] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, p.getName());
            stm.setString(2, p.getImage());
            stm.setDouble(3, p.getPrice());
            stm.setString(4, p.getDescribe());
            stm.setInt(5, p.getCategory().getId());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<Product> getAllProductsLast() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT TOP 4 * FROM product ORDER BY ID DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = mapProduct(rs);
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
