package com.wangziping.service;

import java.util.List;

import com.wangziping.pojo.City;

public interface CityService {

	List<City> getProvince();

	List<City> getCityByPid(Integer pid);

}
