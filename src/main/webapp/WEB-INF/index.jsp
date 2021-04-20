<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Categories</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container border mt-5">
		<div class="my-2">
			<a href="/category/new" class="btn btn-success mr-3">Add Category</a> <a
				href="/product/new" class="btn btn-primary">Add Product</a>
		</div>
		<div>
			<table class="table table-hover border">
				<thead>
					<tr>
						<th>Category</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items='${ categories }' var='category'>
						<tr>
							<td>
								<h5>
									<a href="/categories/${category.id}">${ category.name}</a>
								</h5>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>				
		</div>
		<div>
			<table class="table table-hover border">
				<thead>
					<tr>
						<th>Product</th>
						<th>Description</th>
						<th>Price</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items='${ products }' var='product'>
						<tr>
							<td>
								<h5>
									<a href="/products/${product.id}">${ product.name}</a>
								</h5>
							</td>
							<td>
								<h5>${ product.description}</h5>
							</td>
							<td>
								<h5>
									<fmt:formatNumber value="${ product.price }" type="currency" />
								</h5>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>		
	</div>
</body>
</html>