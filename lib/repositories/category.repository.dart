import 'package:dio/dio.dart';
import 'package:shopping/Settings.dart';
import 'package:shopping/models/category-list-item.model.dart';

class CategoryRepository {
  Future<List<CategoryListItemModel>> getAll() async {
    var url = "${Settings.apiUrl}v1/categories";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((e) => CategoryListItemModel.fromJson(e))
        .toList();
  }
}
