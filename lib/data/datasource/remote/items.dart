import 'package:ecomerce1/core/class/crud.dart';
import 'package:ecomerce1/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(String id,String userid) async {
    var response = await crud.postData(AppLink.items, {
      "id" : id.toString(),
      "userid" :userid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
