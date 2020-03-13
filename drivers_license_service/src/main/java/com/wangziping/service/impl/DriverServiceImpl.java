package com.wangziping.service.impl;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangziping.mapper.DriverDao;
import com.wangziping.pojo.Driver;
import com.wangziping.service.DriverService;

@Service
public class DriverServiceImpl implements DriverService {

	@Autowired
	private DriverDao driverDao;

	@Override
	public PageInfo<Driver> getDrivers(int pageNum, int pageSize, String name) {
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<Driver>(driverDao.getDrivers(name));
	}

	@Override
	public int addDriver(Driver driver) {

		return driverDao.addDriver(driver);
	}

	@Override
	public Driver getDriverById(Integer id) {
		return driverDao.getDriverById(id);
	}

	@Override
	public int updateDriverInfoById(Driver driver) {
		return driverDao.updateDriverInfoById(driver);
	}

}
