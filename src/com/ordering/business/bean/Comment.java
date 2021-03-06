package com.ordering.business.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="comment")
public class Comment {
	@Id
	private String id;
	private String content;
	private String userId;
	private int level;
	private String state;
	private String businessId;
	private String businessContent;
	private String data;
	private String businessData;
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getBusinessData() {
		return businessData;
	}
	public void setBusinessData(String businessData) {
		this.businessData = businessData;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getBusinessId() {
		return businessId;
	}
	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}
	public String getBusinessContent() {
		return businessContent;
	}
	public void setBusinessContent(String businessContent) {
		this.businessContent = businessContent;
	}

}
