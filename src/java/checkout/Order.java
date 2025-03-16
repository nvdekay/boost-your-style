/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package checkout;




public class Order {
    
    private int id;
    private int accountId;
    private double totalPrice;
    private String note;
    private String createdDate;

    public Order() {
    }

    public Order( int accountId, double totalPrice, String note) {
        this.accountId = accountId;
        this.totalPrice = totalPrice;
        this.note = note;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", accountId=" + accountId + ", totalPrice=" + totalPrice + ", note=" + note + ", createdDate=" + createdDate + ", shippingId=" ;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

}
