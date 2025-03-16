/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package checkout;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class OrderDetailDBcontext extends DBContext {

    public void saveCart(int orderId, Map<String, Cart> carts) {
        try {

            String sql = "INSERT INTO [dbo].[OrderDetail]\n"
                    + "           ([order_id]\n"
                    + "           ,[productName]\n"
                    + "           ,[productImage]\n"
                    + "           ,[productPrice]\n"
                    + "           ,[quantity])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            for (Map.Entry<String, Cart> entry : carts.entrySet()) {
                String productId = entry.getKey();
                String getProductQuantitySql = "select quantity from Products where id = ?";
                PreparedStatement getProductQuantityStm = connection.prepareStatement(getProductQuantitySql);
                getProductQuantityStm.setString(1, productId);
                ResultSet rs = getProductQuantityStm.executeQuery();
                int productQuantity = 0;
                while (rs.next()) {
                     productQuantity = rs.getInt("quantity");
                }
                Cart cart = entry.getValue();
                // Validate product's quantity
                if(cart.getQuantity() > productQuantity){
                    return;
                }
                stm.setInt(1, orderId);
                stm.setString(2, cart.getProduct().getName());
                stm.setString(3, cart.getProduct().getImage());
                stm.setDouble(4, cart.getProduct().getPrice());
                stm.setDouble(5, cart.getQuantity());
                String updateProductQuantitySql = "UPDATE [products]\n"
                    + "   SET [quantity] = [products].quantity - ?\n"
                    + " WHERE id = ?";
                PreparedStatement updatePQuantityStm = connection.prepareStatement(updateProductQuantitySql);
                updatePQuantityStm.setInt(1, cart.getQuantity());
                updatePQuantityStm.setString(2, productId);
                stm.executeUpdate();
                updatePQuantityStm.executeUpdate();
            }

        } catch (Exception ex) {
            Logger.getLogger(OrderDetailDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<OrderDetail> getAllOrderDetailById(int id) {
        List<OrderDetail> OrderDetails = new ArrayList<>();
        try {
            String sql = "SELECT * FROM OrderDetail Where order_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDetail order = new OrderDetail();
                order.setId(rs.getInt(1));
                order.setOrderId(rs.getInt(2));
                order.setProductName(rs.getString(3));
                order.setProductImage(rs.getString(4));
                order.setProductPrice(rs.getDouble(5));
                order.setQuantity(rs.getInt(6));

                OrderDetails.add(order);
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDetailDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return OrderDetails;
    }

    public void delete(int id) {

        try {

            String sql = "DELETE FROM [OrderDetail]\n"
                    + "      WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void main(String[] args) {
        OrderDetailDBcontext a = new OrderDetailDBcontext();
        a.delete(19);
    }
}
