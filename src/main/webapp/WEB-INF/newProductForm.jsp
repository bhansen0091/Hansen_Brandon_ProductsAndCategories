<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change This</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
  
<div class="container mt-5">
	<div class="col-7 mx-auto">
		<h1>Create Product</h1>
		<div id="createForm">
			<form:form action="/product/create" method="post" modelAttribute="product">
				
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-prepend">
							<form:label path="name" class="input-group-text">Name:</form:label>
						</div>
						<form:input path="name" class="form-control" />
						<form:errors path="name" />
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-prepend">
							<form:label path="description" class="input-group-text">Description:</form:label>
						</div>
						<textarea name="description" rows="5" ></textarea>
						<form:errors path="description" />
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<div class="input-group-prepend">
							<form:label path="price" class="input-group-text">Price:</form:label>
						</div>
						<form:input type ="number" step="0.01" path="price" class="form-control" />
						<form:errors path="price" />
					</div>
				</div>
				
				<input type="submit" />
			</form:form>
		</div>
	</div>
</div>
</body>
</html>