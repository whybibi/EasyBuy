package baseUtils;

import java.sql.*;

public class BaseUtil {

    /**
     * 新建数据库连接
     */
    Connection connection;
    public void getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/easybuy","root","123");
    }

    /**
     * 关闭数据库连接
     * @throws SQLException
     */
    public void closeConnection() throws SQLException {
        if(connection != null){
            connection.close();
        }
    }

    private PreparedStatement createStatements(String sql , Object[] params) {
        try {
            if (connection == null) {
                return null;
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                Object obj = params[i];
                ps.setObject(i + 1, obj);
            }
            return ps;
        }catch(Exception e){
            System.out.println("statement语句时出错");
            return null;
        }
    }

    /**
     * 查询
     * @param sql
     * @param params
     * @return 查询的结果集
     */
    public ResultSet query(String sql, Object[] params){
        PreparedStatement ps = createStatements(sql,params);
        if(ps == null){
            return null;
        }
        try{
            return ps.executeQuery();
        }catch(Exception e){
            return null;
        }
    }

    /**
     * 插入方法
     * @param sql
     * @param params
     * @return  返回受影响的行数
     */
    public int insert(String sql,Object[] params){
        return executeUpdate(sql,params);
    }
    /**
     * 删除方法
     * @param sql
     * @param params
     * @return  返回受影响的行数
     */
    public int del(String sql,Object[] params){
        return executeUpdate(sql,params);
    }
    /**
     * 修改方法
     * @param sql
     * @param params
     * @return  返回受影响的行数
     */
    public int update(String sql,Object[] params){
        return executeUpdate(sql,params);
    }


    /**
     * 增删改实现方法
     * @param sql
     * @param params
     * @return 影响行数，大于0表示修改成功
     */
    public int executeUpdate(String sql,Object[] params){
        try{
            this.getConnection();
            PreparedStatement ps = createStatements(sql,params);
            if(ps==null){
                return 0;
            }
            int result = ps.executeUpdate();
            return result;
        }catch(Exception e){
            return 0;
        }finally {
            try {
                this.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }



}
