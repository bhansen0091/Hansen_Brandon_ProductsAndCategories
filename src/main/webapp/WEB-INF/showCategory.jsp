<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Category</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container border mt-5 text-center  col-7">
		<h1 class="mt-3 mb-2">${ category.name }</h1>
		<div class="container mb-5">
			<br /> <a href="/">Home</a>
			<div class="d-flex justify-content-between">
				<div class="col-5">
					<table class="table table-hover border">
						<thead>
							<tr>
								<th>Products:</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ category.products }" var="product">
								<tr>
									<td>${ product.name }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-5 border p-4">
					<form action="/categories/add/products" method="post">
						<div class="form-group">
							<input name="product_id" type="hidden" value="${ category.id }">
							<div class="input-group">
								<div class="input-group-prepend">
									<label class="input-group-text">Products:</label>
								</div>
								<select name="category_id" class="form-control">
									<c:forEach items="${ products }" var="product">
										<option value="${ product.id }">${ product.name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<input type="submit" />
					</form>
				</div>			
			</div>
		</div>
	</div>
</body>
</html>






