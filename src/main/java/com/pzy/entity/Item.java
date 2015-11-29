package com.pzy.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.struts2.json.annotations.JSON;
/***
 *工单
 *
 */
@Entity
@Table(name = "t_Item")
public class Item  {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String name;
	private String remark;
	private String addr;
	private String tel;
	private String carid;
	private String userid;
	private Date crateDate;
	private String needDate;
	private String workremark;
	private String noticeremark;
	public String getNoticeremark() {
		return noticeremark;
	}

	public void setNoticeremark(String noticeremark) {
		this.noticeremark = noticeremark;
	}

	public String getWorkremark() {
		return workremark;
	}

	public void setWorkremark(String workremark) {
		this.workremark = workremark;
	}
	private String state;
	@ManyToOne(fetch = FetchType.EAGER)
	private AdminUser creater;
	public AdminUser getCreater() {
		return creater;
	}

	public void setCreater(AdminUser creater) {
		this.creater = creater;
	}

	public AdminUser getWorker() {
		return worker;
	}

	public void setWorker(AdminUser worker) {
		this.worker = worker;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	private AdminUser worker;
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCarid() {
		return carid;
	}

	public void setCarid(String carid) {
		this.carid = carid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getCrateDate() {
		return crateDate;
	}

	public void setCrateDate(Date crateDate) {
		this.crateDate = crateDate;
	}

	public String getNeedDate() {
		return needDate;
	}

	public void setNeedDate(String needDate) {
		this.needDate = needDate;
	}
	private String imgPath;
	private Double score;
	@ManyToOne(fetch = FetchType.EAGER)
	private Category category;
	
	@JSON(format="￥#,###.####")     
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
	private Date createDate;
	
	private Integer count;
	
  
	private Double price;
	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	@JSON(format="yyyy-MM-dd HH:mm:ss")  
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
