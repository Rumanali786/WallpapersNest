import 'package:location/model/categories_model.dart';
String apiKey ="563492ad6f91700001000001543e89397e5747239bbec9188aad12be";

List <CategoryModel> getCategories(){

  List<CategoryModel> categories = List();
  CategoryModel categoryModel = CategoryModel();
  //
  categoryModel.categoriesName = "Street Art";
  categories.add(categoryModel);
  categoryModel = CategoryModel();

  //
  categoryModel.categoriesName = "Wild Life";
  categories.add(categoryModel);
  categoryModel = CategoryModel();

  //
  categoryModel.categoriesName = "Nature";
  categories.add(categoryModel);
  categoryModel = CategoryModel();

  //
  categoryModel.categoriesName = "City";
  categories.add(categoryModel);
  categoryModel = CategoryModel();

  //
  categoryModel.categoriesName = "Motivation";

  categories.add(categoryModel);
  categoryModel = CategoryModel();

  //
  categoryModel.categoriesName = "Bikes";
  categories.add(categoryModel);
  categoryModel = CategoryModel();

  //
  categoryModel.categoriesName = "Cars";
  categories.add(categoryModel);
  categoryModel = CategoryModel();

  //
  categoryModel.categoriesName = "Abstract";
  categories.add(categoryModel);
  categoryModel = CategoryModel();

  //
  categoryModel.categoriesName = "Buildings";
  categories.add(categoryModel);
  categoryModel = CategoryModel();

  return categories;
}