package com.hansen.productsandcategories.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hansen.productsandcategories.models.Category;
import com.hansen.productsandcategories.models.Product;
import com.hansen.productsandcategories.repositories.CategoryRepo;
import com.hansen.productsandcategories.repositories.ProductRepo;

@Service
public class ProdCatService {

	private CategoryRepo categoryRepo;
	private ProductRepo productRepo;
	
	public ProdCatService(CategoryRepo categoryRepo, ProductRepo productRepo) {
		super();
		this.categoryRepo = categoryRepo;
		this.productRepo = productRepo;
	}
	
	public Product createProduct(Product product) {
		return productRepo.save(product);
	}
	
	public Category createCategory(Category category) {
		return categoryRepo.save(category);
	}
	
	public List<Product> getAllProducts() {
		return productRepo.findAll();
	}
	
	public List<Category> getAllCategories() {
		return categoryRepo.findAll();
	}
	
	public Product getProduct(Long id) {
		return this.productRepo.findById(id).orElse(null);
	}
	
	public Category getCategory(Long id) {
		return this.categoryRepo.findById(id).orElse(null);
	}
	
	public Product addProduct(Long prodId, Long catId) {
		Product product = productRepo.findById(prodId).orElse(null);
		Category category = categoryRepo.findById(catId).orElse(null);
		product.getCategories().add(category);
		return productRepo.save(product);
	}
	
	public Category addCategory(Long catId, Long prodId) {
		Product product = productRepo.findById(prodId).orElse(null);
		Category category = categoryRepo.findById(catId).orElse(null);
		category.getProducts().add(product);
		return categoryRepo.save(category);
	}
	
	public List<Product> otherProducts(Category category) {
		return this.productRepo.findByCategoriesNotContains(category);
	}
	
	public List<Category> otherCategories(Product product) {
		return this.categoryRepo.findByProductsNotContains(product);
	}
	
	
}
