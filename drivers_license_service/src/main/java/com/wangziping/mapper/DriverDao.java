package com.wangziping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wangziping.pojo.Driver;

public interface DriverDao {

	List<Driver> getDrivers(@Param("name") String name);

	int addDriver(Driver driver);

	Driver getDriverById(Integer id);

	int updateDriverInfoById(Driver driver);

}
