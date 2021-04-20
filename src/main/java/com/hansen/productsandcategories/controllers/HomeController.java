package com.hansen.productsandcategories.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hansen.productsandcategories.models.Category;
import com.hansen.productsandcategories.models.Product;
import com.hansen.productsandcategories.services.ProdCatService;


@Controller
public class HomeController {
	
	private ProdCatService pcService;
	
	public HomeController(ProdCatService pcService) {
		super();
		this.pcService = pcService;
	}

	@RequestMapping("/")
	public String index(@ModelAttribute("category") Category category, Model model) {
		
		model.addAttribute("categories", this.pcService.getAllCategories());
		model.addAttribute("products", this.pcService.getAllProducts());
		
		return "index.jsp";
	}
	
	@GetMapping("/category/new")
	public String newCategory(@ModelAttribute("category") Category category) {
		return "newCategoryForm.jsp";
	}
	
	@PostMapping("/category/create")
	public String createCategory(@Valid @ModelAttribute("category") Category category,
			BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			System.out.println(result.getAllErrors());
		} else {
			this.pcService.createCategory(category);
		}
		return "redirect:/";
	}
	
	@GetMapping("/categories/{id}")
	public String showCategory(@PathVariable("id") Long id, Model model) {
		model.addAttribute("category", this.pcService.getCategory(id));
		model.addAttribute("products", this.pcService.otherProducts(this.pcService.getCategory(id)));
		return "showCategory.jsp";
	}
	
	@PostMapping("/categories/add/products")
	public String addProductToCategory(@RequestParam(value = "product_id") Long product_id,
			@RequestParam(value = "category_id") Long category_id) {
		this.pcService.addProduct(product_id, category_id);
		System.out.println(this);
		return "redirect:/";
	}
	
	@GetMapping("/product/new")
	public String newProduct(@ModelAttribute("product") Product product) {
		return "newProductForm.jsp";
	}
	
	@PostMapping("/product/create")
	public String createProduct(@Valid @ModelAttribute("product") Product product,
			BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			System.out.println(result.getAllErrors());
		} else {
			this.pcService.createProduct(product);
		}
		return "redirect:/";
	}
	
	@GetMapping("/products/{id}")
	public String showProduct(@PathVariable("id") Long id, Model model) {
		model.addAttribute("product", this.pcService.getProduct(id));
		model.addAttribute("categories", this.pcService.otherCategories(this.pcService.getProduct(id)));
		return "showProduct.jsp";
	}
	
	@PostMapping("/products/add/categories")
	public String addCategoryToProduct(@RequestParam(value = "product_id") Long product_id,
			@RequestParam(value = "category_id") Long category_id) {
		this.pcService.addCategory(product_id, category_id);
		return "redirect:/";
	}
	
	
}
