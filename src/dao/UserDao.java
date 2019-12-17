package dao;

import models.User;

import java.util.List;

public interface UserDao {
    List<User> getAllUser();
    List<User> getUser(Integer id);
    List<User> getUser(String name);
    List<User> checkLogUser(String name,String pwd);
    int insertUser(User user);
    boolean setUser(User user);
    int delUser(Integer id);
    int getAllNum();
    List<User> getUserByLimit(int index,int sum);
}
