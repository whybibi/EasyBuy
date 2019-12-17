package daoImpl;

import baseUtils.BaseUtil;
import dao.UserDao;
import models.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl extends BaseUtil implements UserDao {

    /**
     * 获得全部用户数据
     * @return 用户结果集
     */
    @Override
    public List<User> getAllUser() {
      return findUserByList("select * from user",new Object[]{});

    }

    /**
     * 通过id获得用户数据
     * @param id
     * @return 结果集
     */
    @Override
    public List<User> getUser(Integer id) {
       return findUserByList("select * from user where id=?",new Object[]{id});
    }

    @Override
    public List<User> getUser(String name) {
        return findUserByList("select * from user where userName=?",new Object[]{name});
    }

    @Override
    public List<User> checkLogUser(String name, String pwd) {
            return findUserByList("select * from user where userName=? and passWord=?",new Object[]{name,pwd});
    }

    @Override
    public int insertUser(User user) {
        return this.insert("insert into user(userName,passWord,email,phone,realName,idCard,type,sex) values(?,?,?,?,?,?,?,?)",
                new Object[]{user.getUserName(),user.getPassWord(),user.getEmail(),user.getPhone(),user.getRealName(),user.getIdCard(),user.getType(),user.getSex()});
    }

    @Override
    public boolean setUser(User user) {
        return false;
    }

    @Override
    public int delUser(Integer id) {
        return this.del("delete from user where id = ? ",new Object[]{id});
    }

    @Override
    public int getAllNum() {
            int count = 0;
            try{
                this.getConnection();
                ResultSet rs = this.query("select count(id) from user",new Object[]{});
                rs.next();
                count = rs.getInt(1);
                return count;
            }catch(Exception e){
                e.printStackTrace();
                return count;
            }finally {
                try {
                    this.closeConnection();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
    }


    @Override
    public List<User> getUserByLimit(int index, int sum) {
        return findUserByList("select * from user order by id asc limit ?,?",new Object[]{index,sum});
    }


    private List<User> findUserByList(String sql,Object[] params){
        List<User> list = new ArrayList<>();
        try{
            this.getConnection();
            ResultSet rs = this.query(sql,params);
            while(rs.next()){
                User user = new User(rs.getInt("id"),rs.getString("userName"),
                        rs.getString("passWord"),rs.getString("email"),rs.getString("phone"),
                        rs.getString("realName"),rs.getString("idCard"),rs.getInt("type"),rs.getString("sex"));
                list.add(user);
            }
            rs.getStatement().close();
            return list;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally {
            try {
                this.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }




}
