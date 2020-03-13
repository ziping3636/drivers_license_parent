package com.wangziping.service;

import com.github.pagehelper.PageInfo;
import com.wangziping.pojo.Driver;

public interface DriverService {

	PageInfo<Driver> getDrivers(int pageNum, int pageSize, String name);

	int addDriver(Driver driver);

	Driver getDriverById(Integer id);

	int updateDriverInfoById(Driver driver);
}
