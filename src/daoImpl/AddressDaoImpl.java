package daoImpl;

import baseUtils.BaseUtil;
import dao.AddressDao;
import models.Addressed;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AddressDaoImpl extends BaseUtil implements AddressDao {
    @Override
    public List<Addressed> getAllAddress() {
       return findAddressList("select * from address",new Object[]{});
    }


    @Override
    public Addressed findById(Integer id) {
        return null;
    }


    private List<Addressed> findAddressList(String sql,Object[] params){
        try{
            this.getConnection();
            List<Addressed> list = new ArrayList<Addressed>();
            ResultSet rs = this.query(sql,params);
            while(rs.next()){
                Addressed ad = new Addressed(rs.getInt("id"),rs.getString("country"),rs.getString("province"),rs.getString("city"));
                list.add(ad);
            }
            rs.getStatement().close();
            return list;
        }catch(Exception e){
            System.out.print("获取数据失败！");
            return null;
        }finally {
            try{ this.closeConnection();}catch(Exception e){e.printStackTrace();}
        }
    }



}
