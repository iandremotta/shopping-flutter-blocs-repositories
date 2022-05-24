import 'package:shopping/repositories/category.repository.dart';
import 'package:shopping/repositories/product.repository.dart';
import '../models/category-list-item.model.dart';
import '../models/product-list-item.model.dart';
import 'package:flutter/widgets.dart';

class HomeBloc extends ChangeNotifier {
  final categoryRespository = new CategoryRepository();
  final productRepository = new ProductRepository();

  List<ProductListItemModel> products;
  List<CategoryListItemModel> categories;
  String selectedCategory = 'todos';

  HomeBloc() {
    getCategories();
    getProducts();
  }

  getCategories() {
    categoryRespository.getAll().then((value) {
      this.categories = value;
      notifyListeners();
    });
  }

  getProducts() {
    productRepository.getAll().then((value) {
      this.products = value;
      notifyListeners();
    });
  }

  getProductByCategory() {
    productRepository.getByCategory(selectedCategory).then((value) {
      this.products = value;
      notifyListeners();
    });
  }

  changeCategory(tag) {
    selectedCategory = tag;
    products = null;
    getProductByCategory();
    notifyListeners();
  }
}
