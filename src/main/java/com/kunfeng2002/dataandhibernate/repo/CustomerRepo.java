package com.kunfeng2002.dataandhibernate.repo;

import com.kunfeng2002.dataandhibernate.model.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface CustomerRepo extends JpaRepository<Customer, Integer> {

    @Override
    @Query(value = "select * from customer where idCustomer",
    nativeQuery = true)
    List<Customer> findAll();

    @Query(value = "insert into customer values (7, 'user7')",
    nativeQuery = true)
    void insert();

    @Query(value = "UPDATE customer SET nameCustomer 'user666' WHERE idCustomer in (?2)",
    nativeQuery = true)
    void updateNameById();

    @Query(value = "DELETE from customer where idCustomer in(?1)",
    nativeQuery = true)
    void delById();

    @Query(value = "select * from customer where idCustomer in(?1)",
    nativeQuery = true)
    void findByIdCustomer();
}
