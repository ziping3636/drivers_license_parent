package com.wangziping.service.impl;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangziping.mapper.ViolationDao;
import com.wangziping.pojo.Violation;
import com.wangziping.service.ViolationService;

@Service
public class ViolationServiceImpl implements ViolationService {

	@Autowired
	private ViolationDao violationDao;

	@Override
	public PageInfo<Violation> getViolationByDriverId(Integer pageNum, Integer pageSize, Integer did) {
		PageHelper.startPage(pageNum, pageSize);

		return new PageInfo<Violation>(violationDao.getViolations(did));
	}
}
