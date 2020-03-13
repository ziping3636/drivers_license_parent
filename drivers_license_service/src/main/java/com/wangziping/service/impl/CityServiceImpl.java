package com.wangziping.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.wangziping.mapper.CityDao;
import com.wangziping.pojo.City;
import com.wangziping.service.CityService;

@Service
public class CityServiceImpl implements CityService {

	@Autowired
	private CityDao cityDao;

	@Override
	public List<City> getProvince() {
		return cityDao.getProvince();
	}

	@Override
	public List<City> getCityByPid(Integer pid) {
		return cityDao.getCityByPid(pid);
	}

}
