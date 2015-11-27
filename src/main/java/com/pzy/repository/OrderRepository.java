package com.pzy.repository;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Order;
import com.pzy.entity.User;
public interface OrderRepository extends PagingAndSortingRepository<Order, Long>,JpaSpecificationExecutor<Order>{
	public List<Order> findByUser(User user);
	@Query(value=" SELECT sum(total_price) FROM  t_order t1 WHERE t1.create_date>=?1 AND t1.create_date<?2 and t1.item=?3 and state='出库'", nativeQuery=true)
	public Double findPriceSell(Date b,Date e,Long itemid );
	@Query(value=" SELECT sum(total_price) FROM  t_order t1 WHERE t1.create_date>=?1 AND t1.create_date<?2 and t1.item=?3 and state='入库'", nativeQuery=true)
	public Double findPriceBuy(Date b,Date e,Long itemid );
	@Query(value=" select sum(if(t1.state='出库',t1.total_price,-t1.total_price)) from t_order t1  WHERE t1.create_date>=?1 AND t1.create_date<?2 ", nativeQuery=true)
	public Double findAvg(Date b,Date e);
}

