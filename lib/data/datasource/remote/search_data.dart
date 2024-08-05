import 'package:ecomerce1/core/class/crud.dart';
import 'package:ecomerce1/linkapi.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);

  searchData(String search) async {
    var response = await crud.postData(AppLink.searchItems, {
      "search" : search
    });
    return response.fold((l) => l, (r) => r);
  }
}
