<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/resource/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
</head>
<body>
	<div class="container form-inline" style="margin-top: 50px">
		<h4>驾驶证管理</h4>
		<hr>
		<button onclick="toAddDriver()" class="btn btn-info">增加</button>
		<form action="getDrivers" method="post"
			style="float: right; margin-bottom: 20px">
			<input type="hidden" name="pageNum"> 司机姓名 ：<input type="text"
				name="name" value="${name }" class="form-control"> <input
				type="submit" value="查询" class="form-control">
		</form>
		<table class="table">
			<tr>
				<th>驾驶证号码</th>
				<th>司机姓名</th>
				<th>性别</th>
				<th>省</th>
				<th>市</th>
				<th>区</th>
				<th>发证日期</th>
				<th>违章条数</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${info.list }" var="dri">
				<tr>
					<td>${dri.driverNum }</td>
					<td>${dri.name }</td>
					<td>${dri.sex }</td>
					<td>${dri.province.cityName }</td>
					<td>${dri.city.cityName }</td>
					<td>${dri.county.cityName }</td>
					<td>${dri.created }</td>
					<td><a onclick="details(${dri.id })">${dri.violationCount }</a></td>
					<td><button onclick="toUpdateDriver(${dri.id })"
							class="btn btn-info">修改</button></td>
				</tr>
			</c:forEach>
		</table>
		<nav aria-label="...">
		<ul class="pagination">
			<li class="page-item disabled"><button onclick="goPage(1)"
					class="btn btn-light">首页</button></li>
			<li class="page-item disabled"><button
					onclick="goPage(${info.prePage == 0 ? pageNum : info.prePage})"
					class="btn btn-light">Previous</button></li>

			<c:forEach begin="${info.pageNum - 2 > 1 ? info.prePage - 2 : 1}"
				end="${info.pageNum + 2 > info.pages ? info.pages : info.pageNum + 2}"
				varStatus="index">
				<c:if test="${info.pageNum != index.index}">
					<li class="page-item"><button type="button"
							class="btn btn-light" onclick="goPage(${index.index})">${index.index}</button></li>
				</c:if>
				<c:if test="${info.pageNum == index.index}">
					<li class="page-item"><button type="button"
							class="btn btn-primary" onclick="goPage(${index.index})">${index.index}</button></li>
				</c:if>
			</c:forEach>

			<li class="page-item"><button type="button"
					class="btn btn-light"
					onclick="goPage(${info.pageNum == info.pages ? info.pages : info.pageNum +1})">Next</button></li>
			<li class="page-item"><button type="button"
					class="btn btn-light" onclick="goPage(${info.pages})">尾页</button></li>
		</ul>
		</nav>
	</div>
</body>
<script type="text/javascript">
	function toAddDriver() {
		location.href="toAddDriver";
	}
	
	function toUpdateDriver(id) {
		location.href="toUpdateDriver?id="+id;
	}
	
	function details(id) {
		location.href="details?did="+id;
	}

	function goPage(pageNum) {
		$("[name=pageNum]").val(pageNum);
		$("form").submit();
	}
</script>
</html>