/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package productlist;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Category;

public class CategoryDBContext extends DBContext { //thao tác với bảng category

    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        try {
            String sql = "select * from Categories";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt(1));
                category.setName(rs.getString(2));
                list.add(category);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Category> getAllCategoriesByPage(int page, int PAGE_SIZE) {
        List<Category> list = new ArrayList<>();
        try {
            String sql = "select * from Categories "
                    + "order by id\n"
                    + "offset (?-1)*? row fetch next ? rows only";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, page);
            stm.setInt(2, PAGE_SIZE);
            stm.setInt(3, PAGE_SIZE);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt(1));
                category.setName(rs.getString(2));
                list.add(category);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void insertCategory(String name) {
        try {
            String sql = "INSERT INTO [Categories]\n"
                    + "           ([name])\n"
                    + "     VALUES\n"
                    + "           (?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Category getCategoryById(int id) {
        try {
            String sql = "select *  from Categories where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt(1));
                category.setName(rs.getString(2));
                return category;
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateCategory(Category category) {
        try {
            String sql = "UPDATE [dbo].[Categories]\n"
                    + "   SET [name] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, category.getName());
            stm.setInt(2, category.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteCategory(int id) {
        try {
            String sql = "DELETE FROM [Categories] \n"
                    + "  WHERE [id] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
