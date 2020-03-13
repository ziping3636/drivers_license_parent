package com.wangziping.controller;

import java.util.List;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.wangziping.pojo.City;
import com.wangziping.pojo.Driver;
import com.wangziping.pojo.Violation;
import com.wangziping.service.CityService;
import com.wangziping.service.DriverService;
import com.wangziping.service.ViolationService;

@Controller
public class DriverController {

	// (version = "2.7.3", url = "dubbo://127.0.0.1:20881")
	@Reference
	private DriverService driverService;

	@Reference
	private CityService cityService;

	@Reference
	private ViolationService violationService;

	@RequestMapping("getDrivers")
	public String getDrivers(Model model, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "5") int pageSize, String name) {
		PageInfo<Driver> drivers = driverService.getDrivers(pageNum, pageSize, name);
		model.addAttribute("info", drivers);
		model.addAttribute("name", name);
		return "driverList";
	}

	@RequestMapping("toAddDriver")
	public String toAddDriver() {
		return "addDriver";
	}

	@RequestMapping("details")
	public String getViolationByDriverId(Model model, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "5") int pageSize, Integer did) {
		PageInfo<Violation> violationByDriverId = violationService.getViolationByDriverId(pageNum, pageSize, did);
		model.addAttribute("info", violationByDriverId);
		return "details";
	}

	@RequestMapping("toUpdateDriver")
	public String toUpdateDriver(Model model, Integer id) {
		model.addAttribute("id", id);
		return "updateDriver";
	}

	@RequestMapping("doUpdateDriver")
	public String doUpdateDriver(Driver driver) {
		try {
			driverService.updateDriverInfoById(driver);
			return "redirect:getDrivers";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "addDriver";
	}

	@ResponseBody
	@RequestMapping("getDriverById")
	public Object getDriverById(Integer id) {

		return driverService.getDriverById(id);
	}

	@RequestMapping("doAddDriver")
	public String doAddDriver(Driver driver) {
		try {
			driverService.addDriver(driver);
			return "redirect:getDrivers";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "addDriver";
	}

	@ResponseBody
	@RequestMapping("getProvince")
	public Object getProvince() {

		return cityService.getProvince();
	}

	@ResponseBody
	@RequestMapping("getCityByPid")
	public List<City> getCityByPid(Integer pid) {

		return cityService.getCityByPid(pid);
	}
}
