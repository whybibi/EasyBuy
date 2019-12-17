package daoImpl;

import baseUtils.BaseUtil;
import dao.NewsDao;
import models.News;

import javax.xml.transform.Result;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewsDaoImpl extends BaseUtil implements NewsDao {
    @Override
    public List<News> getAllNews() {
        return findNewsList("select * from news",new Object[]{});
    }

    @Override
    public List<News> getNewsById(Integer id) {
        return findNewsList("select * from news where id=?",new Object[]{id});
    }

    @Override
    public List<News> getNewsByTitle(String title) {
        return findNewsList("select * from news where title=?",new Object[]{title});
    }

    @Override
    public int getAllNum() {
        int count = 0;
        try{
            this.getConnection();
            ResultSet rs = this.query("select count(id) from news",new Object[]{});
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
    public List<News> getByLimit(int index, int sum) {
        return findNewsList("select * from news order by id asc limit ?,? ",new Object[]{index,sum});
    }


    private List<News> findNewsList(String sql, Object[] params){
        List<News> list = new ArrayList<>();
        try{
            this.getConnection();
            ResultSet rs = this.query(sql,params);
            while(rs.next()){
                News news = new News(rs.getInt("id"),rs.getString("title"),rs.getString("content"),rs.getDate("createDate"));
                list.add(news);
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
