package daoImpl;

import baseUtils.BaseUtil;
import dao.ProductDao;
import models.Product;
import models.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl extends BaseUtil implements ProductDao{
    @Override
    public int addNewProduct(Product product) {
            return this.insert("insert into product(name,description,price,stock,categoryLevel1,categoryLevel2,categoryLevel3,fileName,isDelete) values(?,?,?,?,?,?,?,?,?)",
                    new Object[]{product.getName(),product.getDescription(),product.getPrice(),product.getStock(),product.getCategoryLevel1(),product.getCategoryLevel2(),product.getCategoryLevel3(),product.getFileName(),product.getIsDelete()});
    }

    @Override
    public int modifyProduct(Product product) {
        return this.update("update product set name=?,description=?,price=?,stock=?,categoryLevel1=?,categoryLevel2=?,categoryLevel3=?,fileName=?,isDelete=? where id=?",
                new Object[]{product.getName(),product.getDescription(),product.getPrice(),product.getStock(),product.getCategoryLevel1(),product.getCategoryLevel2(),product.getCategoryLevel3(),product.getFileName(),product.getIsDelete(),product.getId()});
    }

    @Override
    public List<Product> getAllProduct() {
        return findProductByList("select * from product",new Object[]{});
    }

    @Override
    public Product getSomeOneProduct(int id) {
        return findProductByList("select * from product where id=?",new Object[]{id}).get(0);
    }

    private List<Product> findProductByList(String sql,Object[] params){
        List<Product> list = new ArrayList<>();
        try{
            this.getConnection();
            ResultSet rs = this.query(sql,params);
            while(rs.next()){
                Product product = new Product(rs.getInt("id"),rs.getString("name"),rs.getString("description"),
                        rs.getDouble("price"),rs.getInt("stock"),rs.getInt("categoryLevel1"),rs.getInt("categoryLevel2"),
                        rs.getInt("categoryLevel3"),rs.getString("fileName"),rs.getInt("isDelete"));
                list.add(product);
            }
            rs.getStatement().close();
            return list;
        }catch(Exception e){
            e.printStackTrace();
            return list;
        }finally {
            try {
                this.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}
