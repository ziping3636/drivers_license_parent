package com.wangziping.pojo;

import java.io.Serializable;

/**
 * @ClassName: Driver 实体
 * @Description: TODO
 * @author: wangziping
 * @date: 2020年2月27日 下午3:36:22
 */
public class Driver implements Serializable {

	/**
	 * @fieldName: serialVersionUID
	 * @fieldType: long
	 * @Description: TODO
	 */
	private static final long serialVersionUID = 4438445592888267624L;
	private Integer id;
	private String driverNum;
	private String name;
	private String sex;
	private Integer provinceId;
	private City province;
	private Integer cityId;
	private City city;
	private Integer countyId;
	private City county;
	private String created;
	private Integer violationCount;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDriverNum() {
		return driverNum;
	}

	public void setDriverNum(String driverNum) {
		this.driverNum = driverNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public City getProvince() {
		return province;
	}

	public void setProvince(City province) {
		this.province = province;
	}

	public Integer getCityId() {
		return cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public Integer getCountyId() {
		return countyId;
	}

	public void setCountyId(Integer countyId) {
		this.countyId = countyId;
	}

	public City getCounty() {
		return county;
	}

	public void setCounty(City county) {
		this.county = county;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public Integer getViolationCount() {
		return violationCount;
	}

	public void setViolationCount(Integer violationCount) {
		this.violationCount = violationCount;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Driver other = (Driver) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Driver [id=" + id + ", driverNum=" + driverNum + ", name=" + name + ", sex=" + sex + ", provinceId="
				+ provinceId + ", province=" + province + ", cityId=" + cityId + ", city=" + city + ", countyId="
				+ countyId + ", county=" + county + ", created=" + created + ", violationCount=" + violationCount + "]";
	}

}
