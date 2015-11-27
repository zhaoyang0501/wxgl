package com.pzy.action.admin;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;

import com.opensymphony.xwork2.ActionSupport;
import com.pzy.entity.AdminUser;
import com.pzy.entity.Item;
import com.pzy.entity.Order;
import com.pzy.entity.Seller;
import com.pzy.service.ItemService;
import com.pzy.service.OrderService;
import com.pzy.service.SellerService;
/***
 * @author 263608237@qq.com
 *
 */
@Namespace("/admin/order")
@ParentPackage("json-default")
public class OrderAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private Integer sEcho = 1;
	private Integer iDisplayStart = 0;
	private Integer iDisplayLength = 10;
	private Map<String, Object> resultMap = new HashMap<String, Object>();
	private String tip;
	private String name;
	private Long id;
	private Order order;
	private Date begain;
	private Date end;
	private List<Order> orders;
	private List<Item> items;
	private List<Seller> sellers;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ItemService  itemService;
	@Autowired
	private SellerService serllerService;
	@Action(value = "back", results = { @Result(name = "success", location = "/WEB-INF/views/admin/order/back.jsp") })
	public String back() {
		return SUCCESS;
	}
	@Action(value = "inlist", results = { @Result(name = "success", location = "/WEB-INF/views/admin/order/inlist.jsp") })
	public String index() {
		return SUCCESS;
	}
	@Action(value = "outlist", results = { @Result(name = "success", location = "/WEB-INF/views/admin/order/outlist.jsp") })
	public String outlist() {
		return SUCCESS;
	}
	@Action(value = "doback", results = { @Result(name = "success", location = "/WEB-INF/views/admin/order/back.jsp") })
	public String doback() {
		Order order1 = orderService.find(order.getId());
		order1.setState("退货");
		orderService.save(order1);
		resultMap.put("state", "success");
		resultMap.put("msg", "退货成功");
		this.tip = "退货成功";
		return SUCCESS;
	}
	
	@Action(value = "dobuy", results = { @Result(name = "success", location = "/WEB-INF/views/admin/buy/index.jsp") })
	public String dobuy() {
		Item item = this.itemService.find(order.getItem().getId());
		item.setCount(item.getCount()+order.getCount());
		itemService.save(item);
		order.setTotalPrice(item.getPrice() * order.getCount());
		order.setCreateDate(new Date(System.currentTimeMillis()));
		AdminUser user = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("adminuser");
		order.setUser(user);
		order.setItem(item);
		order.setSeller(order.getSeller());
		order.setState("入库");
		orderService.save(order);
		items=itemService.findAll();
		sellers=serllerService.findAll();
		this.tip = "入库成功";
		return SUCCESS;
	}
	@Action(value = "dosell", results = { @Result(name = "success", location = "/WEB-INF/views/admin/sell/index.jsp") })
	public String dosell() {
		Item item = this.itemService.find(order.getItem().getId());
		if(order.getCount()>item.getCount()){
			tip="库存不足！";
			items=itemService.findAll();
			sellers=serllerService.findAll();
			return SUCCESS;
		}
		item.setCount(item.getCount()+order.getCount());
		itemService.save(item);
		
		order.setTotalPrice(item.getPrice() * order.getCount());
		order.setCreateDate(new Date(System.currentTimeMillis()));
		AdminUser user = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("adminuser");
		order.setUser(user);
		order.setItem(item);
		order.setState("出库");
		orderService.save(order);
		this.tip = "出库成功";
		items=itemService.findAll();
		sellers=serllerService.findAll();
		return SUCCESS;
	}
	@Action(value = "gobuy", results = { @Result(name = "success", location = "/WEB-INF/views/admin/buy/index.jsp") })
	public String buy() {
		items=itemService.findAll();
		sellers=serllerService.findAll();
		return SUCCESS;
	}
	@Action(value = "sell", results = { @Result(name = "success", location = "/WEB-INF/views/admin/sell/index.jsp") })
	public String sell() {
		items=itemService.findAll();
		sellers=serllerService.findAll();
		return SUCCESS;
	}
	@Action(value = "list", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String list() {
		int pageNumber = (int) (iDisplayStart / iDisplayLength) + 1;
		int pageSize = iDisplayLength;
		Page<Order> list = orderService.findAll(pageNumber, pageSize, name,begain,end);
		resultMap.put("aaData", list.getContent());
		resultMap.put("iTotalRecords", list.getTotalElements());
		resultMap.put("iTotalDisplayRecords", list.getTotalElements());
		resultMap.put("sEcho", sEcho);
		return SUCCESS;
	}
	

	@Action(value = "delete", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String delete() {
		orderService.delete(id);
		resultMap.put("state", "success");
		resultMap.put("msg", "删除成功");
		return SUCCESS;
	}

	@Action(value = "get", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String get() {
		resultMap.put("orderSub", orderService.find(id));
		resultMap.put("state", "success");
		resultMap.put("msg", "删除成功");
		return SUCCESS;
	}

	@Action(value = "update", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String update() {
		Order bean = orderService.find(order.getId());

		orderService.save(bean);
		resultMap.put("state", "success");
		resultMap.put("msg", "修改成功");
		return SUCCESS;
	}

	@Action(value = "save", results = { @Result(name = "success", type = "json") }, params = {
			"contentType", "text/html" })
	public String save() {
		order.setCreateDate(new Date(System.currentTimeMillis()));
		orderService.save(order);
		resultMap.put("state", "success");
		resultMap.put("msg", "保存成功");
		return SUCCESS;
	}

	/* ~~~~~~~~get and setter~~~~~~~~~ */
	@JSON
	public Map<String, Object> getResultMap() {
		return resultMap;
	}

	public void setResultMap(Map<String, Object> resultMap) {
		this.resultMap = resultMap;
	}

	public Integer getSEcho() {
		return sEcho;
	}

	public void setSEcho(Integer sEcho) {
		this.sEcho = sEcho;
	}

	public Integer getIDisplayStart() {
		return iDisplayStart;
	}

	public void setIDisplayStart(Integer idisplayStart) {
		this.iDisplayStart = idisplayStart;
	}

	public Integer getIDisplayLength() {
		return iDisplayLength;
	}

	public void setIDisplayLength(Integer iDisplayLength) {
		this.iDisplayLength = iDisplayLength;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public List<Seller> getSellers() {
		return sellers;
	}
	public void setSellers(List<Seller> sellers) {
		this.sellers = sellers;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public Date getBeagin() {
		return begain;
	}
	public void setBeagin(Date beagin) {
		this.begain = beagin;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public Date getBegain() {
		return begain;
	}
	public void setBegain(Date begain) {
		this.begain = begain;
	}
}
