package com.lson.dao;

import com.lson.dto.Order;
import com.lson.dto.OrderDetail;
import com.lson.utils.DBUtils;
import com.lson.utils.DateUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDAO {
    
     public static List<Order> getOrders() {
        List<Order> list = new ArrayList<>();

        Connection conn = null;

        try {
            conn = DBUtils.makeConnection();

            if (conn != null) {

                String sql = "SELECT OrderId, orderDate, shipDate, o.status, a.accId "
                        + "FROM Orders o"
                        + " INNER JOIN Accounts a"
                        + " ON a.accId = o.accId";

                PreparedStatement stm = conn.prepareStatement(sql);
                ResultSet rs = stm.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("orderId");
                    Date orderDate = rs.getDate("orderDate");
                    String orderDateString = DateUtils.format(orderDate);

                    Date shipDate = rs.getDate("shipDate");
                    String shipDateString = DateUtils.format(shipDate);
                    int accId = rs.getInt("accId");
                    int status = rs.getInt("status");

                    Order order = new Order(id, orderDateString, shipDateString, status, accId);
                    list.add(order);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return list;
    }

    public static List<Order> getOrders(String email, int status) {
        List<Order> list = new ArrayList<>();

        Connection conn = null;

        try {
            conn = DBUtils.makeConnection();

            if (conn != null) {

                String sql = "SELECT OrderId, orderDate, shipDate, o.status, a.accId "
                        + "FROM Orders o"
                        + " INNER JOIN Accounts a"
                        + " ON a.accId = o.accId"
                        + " WHERE a.email = ?";

                if(status != 0) {
                    sql += " and o.status = ?";
                }
                PreparedStatement stm = conn.prepareStatement(sql);

                stm.setString(1, email);
                
                if(status != 0) {
                    stm.setInt(2, status);   
                }

                ResultSet rs = stm.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("orderId");
                    Date orderDate = rs.getDate("orderDate");
                    String orderDateString = DateUtils.format(orderDate);

                    Date shipDate = rs.getDate("shipDate");
                    String shipDateString = DateUtils.format(shipDate);
                    int accId = rs.getInt("accId");
                    int statusDb = rs.getInt("status");

                    Order order = new Order(id, orderDateString, shipDateString, statusDb, accId);
                    list.add(order);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return list;
    }
    
    public static List<Order> getOrders(Date dateFrom, Date dateTo) {
        List<Order> list = new ArrayList<>();

        Connection conn = null;

        try {
            conn = DBUtils.makeConnection();

            if (conn != null) {

                String sql = "SELECT OrderId, orderDate, shipDate, o.status, a.accId "
                        + "FROM Orders o"
                        + " INNER JOIN Accounts a"
                        + " ON a.accId = o.accId"
                        + " WHERE orderDate >= ? and orderDate <= ?";


                PreparedStatement stm = conn.prepareStatement(sql);

                stm.setDate(1, dateFrom);
                stm.setDate(2, dateTo);

                ResultSet rs = stm.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("orderId");
                    Date orderDate = rs.getDate("orderDate");
                    String orderDateString = DateUtils.format(orderDate);

                    Date shipDate = rs.getDate("shipDate");
                    String shipDateString = DateUtils.format(shipDate);
                    int accId = rs.getInt("accId");
                    int statusDb = rs.getInt("status");

                    Order order = new Order(id, orderDateString, shipDateString, statusDb, accId);
                    list.add(order);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return list;
    }
    
    public static List<Order> getOrders(String email, int status, Date dateFrom, Date dateTo) {
        List<Order> list = new ArrayList<>();

        Connection conn = null;

        try {
            conn = DBUtils.makeConnection();

            if (conn != null) {

                String sql = "SELECT OrderId, orderDate, shipDate, o.status, a.accId "
                        + "FROM Orders o"
                        + " INNER JOIN Accounts a"
                        + " ON a.accId = o.accId"
                        + " WHERE a.email = ? and orderDate >= ? and orderDate <= ?";

                if(status != 0) {
                    sql += " and o.status = ?";
                }
                PreparedStatement stm = conn.prepareStatement(sql);

                stm.setString(1, email);
                stm.setDate(2, dateFrom);
                stm.setDate(3, dateTo);
                
                if(status != 0) {
                    stm.setInt(4, status);   
                }

                ResultSet rs = stm.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("orderId");
                    Date orderDate = rs.getDate("orderDate");
                    String orderDateString = DateUtils.format(orderDate);

                    Date shipDate = rs.getDate("shipDate");
                    String shipDateString = DateUtils.format(shipDate);
                    int accId = rs.getInt("accId");
                    int statusDb = rs.getInt("status");

                    Order order = new Order(id, orderDateString, shipDateString, statusDb, accId);
                    list.add(order);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return list;
    }
 

    public static List<OrderDetail> getOrderDetails(int id) {

        List<OrderDetail> list = new ArrayList<>();
        Connection conn = null;

        try {
            conn = DBUtils.makeConnection();

            if (conn != null) {
                String sql = "SELECT detailId, orderId, o.PId, PName, price, imgPath, quantity"
                        + " FROM OrderDetails o"
                        + " INNER JOIN Plants p ON p.pId = o.pId"
                        + " WHERE o.OrderID = ?";

                PreparedStatement stm = conn.prepareStatement(sql);

                stm.setInt(1, id);

                ResultSet rs = stm.executeQuery();

                while (rs.next()) {
                    int detailId = rs.getInt("detailId");
                    int orderId = rs.getInt("orderId");
                    int pId = rs.getInt("PId");
                    String plantName = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    int quantity = rs.getInt("quantity");

                    OrderDetail orderDetail = new OrderDetail(id, orderId, pId, plantName, price, imgPath, quantity);

                    list.add(orderDetail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return list;
    }

    public static boolean insertOrder(String email, HashMap<String, Integer> cart) {
        Connection cnn = null;
        boolean result = false;

        try {
            cnn = DBUtils.makeConnection();
            if (cnn != null) {
                int accId = 0, orderId = 0;
                cnn.setAutoCommit(false);

                String sql = "SELECT a.accID from accounts a where a.email=?";
                PreparedStatement pst = cnn.prepareStatement(sql);
                pst.setString(1, email);

                ResultSet rs = pst.executeQuery();

                if (rs != null && rs.next()) {
                    accId = rs.getInt("accId");
                }
                System.out.println("accId save order: " + accId);

                Date orderDate = new Date(System.currentTimeMillis());
                System.out.println("Order date: " + orderDate);

                sql = "INSERT INTO Orders(orderDate, status, accId) values(?, ?, ?)";
                pst = cnn.prepareStatement(sql);
                pst.setDate(1, orderDate);
                pst.setInt(2, 1);
                pst.setInt(3, accId);

                pst.executeUpdate();

                sql = "SELECT TOP 1 orderID FROM Orders ORDER BY OrderID DESC";
                pst = cnn.prepareStatement(sql);
                rs = pst.executeQuery();

                if (rs != null && rs.next()) {
                    orderId = rs.getInt("orderId");
                }
                System.out.println("OrderId: " + orderId);

                for (String pId : cart.keySet()) {
                    sql = "INSERT INTO OrderDetails(OrderID, PID, quantity) VALUES(?, ?, ?)";
                    pst = cnn.prepareStatement(sql);
                    pst.setInt(1, orderId);
                    pst.setInt(2, Integer.parseInt(pId));
                    pst.setInt(3, cart.get(pId));

                    pst.executeUpdate();

                    cnn.commit();
                    cnn.setAutoCommit(true);
                }

                System.out.println("Saved order");
                result = true;
            }
        } catch (Exception ex) {
            if (cnn != null) {
                try {
                    cnn.rollback();
                } catch (SQLException ex1) {
                    ex.printStackTrace();
                }
            }
            ex.printStackTrace();
            result = false;
        } finally {
            try {
                cnn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return result;
    }

    public static boolean changeStatus(int orderId, int status) {
        Connection cnn = null;
        boolean result = false;

        try {
            cnn = DBUtils.makeConnection();
            if (cnn != null) {

                String sql = "UPDATE Orders SET status = ? where OrderId=?";
                PreparedStatement pst = cnn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, orderId);

                result = pst.executeUpdate() > 0;
                
            }
        } catch (Exception ex) {
            if (cnn != null) {
                try {
                    cnn.rollback();
                } catch (SQLException ex1) {
                    ex.printStackTrace();
                }
            }
            ex.printStackTrace();
            result = false;
        } finally {
            try {
                cnn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return result;
    }
}