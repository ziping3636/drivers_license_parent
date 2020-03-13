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
		<h4>违章记录查询</h4>
		<hr>
		<table class="table">
			<tr>
				<th>驾驶证号码</th>
				<th>司机姓名</th>
				<th>违章明细</th>
				<th>罚款</th>
				<th>扣分</th>
				<th>违章时间</th>
				<th>状态</th>
			</tr>
			<c:forEach items="${info.list }" var="vio">
				<tr>
					<td>${vio.driver.driverNum }</td>
					<td>${vio.driver.name }</td>
					<td>${vio.detail }</td>
					<td>${vio.penalty }</td>
					<td>${vio.points }</td>
					<td>${vio.created }</td>
					<td>${vio.status == '0' ? '未处理':'已处理'}</td>
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
	function goPage(pageNum) {
		location.href="details?pageNum="+pageNum;
	}
</script>
</html>