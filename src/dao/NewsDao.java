package dao;

import models.News;

import java.util.List;

public interface NewsDao {
    List<News> getAllNews();
    List<News> getNewsById(Integer id);
    List<News> getNewsByTitle(String title);
    int getAllNum();
    List<News> getByLimit(int index,int sum);
}
