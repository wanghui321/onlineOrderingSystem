package com.ordering.business.bean;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="orders")
public class Order {
	@Id
	private String id;
	private String accountNumber;
	private String businessNumber;
	private String consigneeAddress;
	private String phoneNumber;
	private String remake;
	private String state;
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public String getConsigneeAddress() {
		return consigneeAddress;
	}
	public void setConsigneeAddress(String consigneeAddress) {
		this.consigneeAddress = consigneeAddress;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getRemake() {
		return remake;
	}
	public void setRemake(String remake) {
		this.remake = remake;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

}
