package com.wangziping.service;

import com.github.pagehelper.PageInfo;
import com.wangziping.pojo.Violation;

public interface ViolationService {

	PageInfo<Violation> getViolationByDriverId(Integer pageNum,Integer pageSize,Integer id);

}
