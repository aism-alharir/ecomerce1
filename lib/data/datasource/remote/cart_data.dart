import 'package:ecomerce1/core/class/crud.dart';
import 'package:ecomerce1/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartAdd, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartRemove, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCountItems(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.getCountItems, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartView, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCopoun(String couponname) async{
    var response = await crud.postData(AppLink.checkcoupon, {
      "couponname": couponname,
    });
    return response.fold((l) => l, (r) => r);
  }
}
