package com.ordering.user.bean;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="user")
public class User {
	@Id
	private String userId;	//用户Id
	private String accountNumber;	//用户账号
	private String nickName;	//用户昵称
	private String password;	//用户密码
	private String headPicture;		//用户头像
	private String phone;	//联系电话
	@OneToMany(mappedBy="user",targetEntity=ConsigneeAddress.class,cascade=CascadeType.ALL)
	private Set<ConsigneeAddress> consigneeAddressSet;	//收货地址
	public Set<ConsigneeAddress> getConsigneeAddressSet() {
		return consigneeAddressSet;
	}
	public void setConsigneeAddressSet(Set<ConsigneeAddress> consigneeAddressSet) {
		this.consigneeAddressSet = consigneeAddressSet;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getHeadPicture() {
		return headPicture;
	}
	public void setHeadPicture(String headPicture) {
		this.headPicture = headPicture;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
