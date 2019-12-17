package dao;

import models.Addressed;

import java.util.List;

public interface AddressDao {
    List<Addressed> getAllAddress();
    Addressed findById(Integer id);
}
