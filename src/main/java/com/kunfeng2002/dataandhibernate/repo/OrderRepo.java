package com.kunfeng2002.dataandhibernate.repo;

import com.kunfeng2002.dataandhibernate.model.Order;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepo extends CrudRepository<Order, Integer> {

    @Override
    @Query(nativeQuery = true, value = "select * from orderitemdisplay")
    Iterable<Order> findAll();

    @Query(nativeQuery = true, value = "select * from `order`")
    Iterable<Order> viewOrder();

    @Query(nativeQuery = true, value = "update `order`set isDeleted=1 where idOrder in (?1)")
    void updateIsDeleted();

    @Query(nativeQuery = true, value = "update `order`set isDeleted=0 where idOrder in (?1)")
    void restoreOrder();
}
