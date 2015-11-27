package com.pzy.service;

import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.pzy.entity.Order;
import com.pzy.entity.User;
import com.pzy.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;

	public List<Order> findAll() {
		return (List<Order>) orderRepository.findAll();
	}

	public List<Order> findOrderSubs() {
		return (List<Order>) orderRepository.findAll();
	}

	public List<Order> findOrders() {
		return (List<Order>) orderRepository.findAll();
	}

	public List<Order> findByUser(User user) {
		return orderRepository.findByUser(user);
	}

	public Page<Order> findAll(final int pageNumber, final int pageSize, final String state, final Date begain, final Date end) {
		PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));

		Specification<Order> spec = new Specification<Order>() {
			public Predicate toPredicate(Root<Order> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (state != null) {
					predicate.getExpressions().add(cb.equal(root.get("state").as(String.class), state));
				}
				if (begain != null) {
					predicate.getExpressions().add(cb.greaterThanOrEqualTo(root.get("createDate").as(Date.class), begain));
				}
				if (end != null) {
					predicate.getExpressions().add(cb.lessThanOrEqualTo(root.get("createDate").as(Date.class), end));
				}
				return predicate;
			}
		};
		Page<Order> result = (Page<Order>) orderRepository.findAll(spec, pageRequest);
		return result;
	}

	public List<Order> findAll(final String state, final Date begain, final Date end) {
		Specification<Order> spec = new Specification<Order>() {
			public Predicate toPredicate(Root<Order> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (state != null) {
					predicate.getExpressions().add(cb.equal(root.get("state").as(String.class), state));
				}
				if (begain != null) {
					predicate.getExpressions().add(cb.greaterThanOrEqualTo(root.get("createDate").as(Date.class), begain));
				}
				if (end != null) {
					predicate.getExpressions().add(cb.lessThanOrEqualTo(root.get("createDate").as(Date.class), end));
				}
				return predicate;
			}
		};
		return orderRepository.findAll(spec);
	}

	public void delete(Long id) {
		orderRepository.delete(id);
	}

	public Order findOrder(Long id) {
		return orderRepository.findOne(id);
	}

	public Order find(Long id) {
		return orderRepository.findOne(id);
	}

	public void save(Order order) {
		orderRepository.save(order);
	}
	
	public Double findPriceBuy(Date b,Date e,Long itemid){
		return this.orderRepository.findPriceBuy(b, e, itemid);
	}
	public Double findPricesell(Date b,Date e,Long itemid){
		return this.orderRepository.findPriceSell(b, e, itemid);
	}
	public Double findAvg(Date b,Date e){
		return this.orderRepository.findAvg(b, e);
	}
}