package com.wangziping.mapper;

import java.util.List;

import com.wangziping.pojo.Violation;

public interface ViolationDao {

	List<Violation> getViolations(Integer did);

	Integer getViolationCountByDid(Integer id);
}
