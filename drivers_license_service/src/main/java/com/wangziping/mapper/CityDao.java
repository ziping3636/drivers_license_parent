package com.wangziping.mapper;

import java.util.List;

import com.wangziping.pojo.City;

public interface CityDao {

	City getCityById(Integer id);

	List<City> getCityByPid(Integer pid);

	List<City> getProvince();
}
