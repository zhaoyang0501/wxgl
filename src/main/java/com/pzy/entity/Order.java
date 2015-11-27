package com.pzy.entity;
/***
 *订单
 *
 */
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name = "t_order")
public class Order {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToOne(fetch = FetchType.EAGER)
	private AdminUser user;
	@ManyToOne(fetch = FetchType.EAGER)
	private Item item;
	private Integer count;
	private Double TotalPrice;
	private Date createDate;
	private String payType;
	private String state;
	private String addr;
	private String card;
	private Double perPrice;
	public Double getPerPrice() {
		return perPrice;
	}
	public void setPerPrice(Double perPrice) {
		this.perPrice = perPrice;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	private Seller seller;
	public Seller getSeller() {
		return seller;
	}
	public void setSeller(Seller seller) {
		this.seller = seller;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public AdminUser getUser() {
		return user;
	}
	public void setUser(AdminUser user) {
		this.user = user;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Double getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		TotalPrice = totalPrice;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
