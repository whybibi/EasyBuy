package models;

import java.util.List;

public class Page {

    private int pageNow = 1;//当前页
    private int newsCount;//总条数
    private int pageSum;//总共多少页
    private int pageListSize;//每页显示多少条
    private int pageIndex = 1;
    private int pageEnd;//结束页
    private List<Object> list;

    public int getPageNow() {
        return pageNow;
    }

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    public int getNewsCount() {
        return newsCount;
    }

    public void setNewsCount(int newsCount) {
        this.newsCount = newsCount;
    }

    public int getPageSum() {
        return pageSum;
    }

    public void setPageSum() {
        this.pageSum = (newsCount%pageListSize==0) ? newsCount/pageListSize : newsCount/pageListSize+1;
    }

    public int getPageListSize() {
        return pageListSize;
    }

    public void setPageListSize(int pageListSize) {
        this.pageListSize = pageListSize;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageEnd() {
        return pageEnd;
    }

    public void setPageEnd() {
        this.pageEnd = pageSum;
    }

    public List<Object> getList() {
        return list;
    }

    public void setList(List<Object> list) {
        this.list = list;
    }
}
