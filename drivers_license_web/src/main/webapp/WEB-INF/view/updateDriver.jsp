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
	<div class="container form-inline" style="margin-top: 50px; width: 600px">
		<h4>驾驶证信息录入</h4>
		<hr>
		<form action="doUpdateDriver" method="post" style="margin-left: 100px">
			<input type="hidden" name="id" value="${id}">
			驾驶证号码&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="driverNum"
				class="form-control"><br> <br>
			司机姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="text" name="name" class="form-control"><br> <br>
			性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="radio" name="sex" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="radio" name="sex" value="女">女<br> <br>
			地区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select
				name="provinceId" id="provinceId" class="form-control">
				<option value="">省</option>
			</select> <select name="cityId" id="cityId" class="form-control">
				<option value="">市</option>
			</select> <select name="countyId" id="countyId" class="form-control">
				<option value="">区</option>
			</select><br> <br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="submit" class="form-control" value="保存"><br> <br>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(function() {

		var id = "${id}";
		$.post("getDriverById", {
			id : id
		}, function(driver) {
			$("[name=id]").val(driver.id);
			$("[name=name]").val(driver.name);
			$("[name=driverNum]").val(driver.driverNum);
			$("input[value='" + driver.sex + "']").attr('checked', 'checked');
			var provinceId = driver.provinceId;
			var cityId = driver.cityId;
			var countyId = driver.countyId;
			$.post("getProvince", function(obj) {
				$("#provinceId").empty();
				$("#provinceId").append("<option value=''>省</option>")
				for ( var i in obj) {
					if (provinceId == obj[i].id) {
						$("#provinceId").append(
								"<option selected value='"+obj[i].id+"'>"
										+ obj[i].cityName + "</option>")
					} else {

						$("#provinceId").append(
								"<option value='"+obj[i].id+"'>"
										+ obj[i].cityName + "</option>")
					}
				}
				$.post("getCityByPid", {
					pid : $("#provinceId").val()
				}, function(obj) {
					$("#cityId").empty();
					$("#countyId").empty();
					$("#cityId").append("<option value=''>市</option>")
					$("#countyId").append("<option value=''>区</option>")
					for ( var i in obj) {
						if (cityId == obj[i].id) {
							$("#cityId").append(
									"<option selected value='"+obj[i].id+"'>"
											+ obj[i].cityName + "</option>")
						} else {
							$("#cityId").append(
									"<option  value='"+obj[i].id+"'>"
											+ obj[i].cityName + "</option>")
						}
					}
					$.post("getCityByPid", {
						pid : $("#cityId").val()
					}, function(obj) {
						$("#countyId").empty();
						$("#countyId").append("<option value=''>区</option>")
						for ( var i in obj) {
							if (countyId == obj[i].id) {
								$("#countyId")
										.append(
												"<option selected value='"+obj[i].id+"'>"
														+ obj[i].cityName
														+ "</option>")
							} else {
								$("#countyId")
										.append(
												"<option value='"+obj[i].id+"'>"
														+ obj[i].cityName
														+ "</option>")
							}
						}
					}, "json")
				}, "json")
			}, "json")

		}, "json")

		$("#provinceId").change(
				function() {
					$.post("getCityByPid", {
						pid : $("#provinceId").val()
					}, function(obj) {
						$("#cityId").empty();
						$("#countyId").empty();
						$("#cityId").append("<option value=''>市</option>")
						$("#countyId").append("<option value=''>区</option>")
						for ( var i in obj) {
							$("#cityId").append(
									"<option value='"+obj[i].id+"'>"
											+ obj[i].cityName + "</option>")
						}
					}, "json")
				})
		$("#cityId").change(
				function() {
					$.post("getCityByPid", {
						pid : $("#cityId").val()
					}, function(obj) {
						$("#countyId").empty();
						$("#countyId").append("<option value=''>区</option>")
						for ( var i in obj) {
							$("#countyId").append(
									"<option value='"+obj[i].id+"'>"
											+ obj[i].cityName + "</option>")
						}
					}, "json")
				})
	})
</script>
</html>