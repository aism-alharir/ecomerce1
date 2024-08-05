import 'package:ecomerce1/core/class/crud.dart';
import 'package:ecomerce1/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.adressView, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(AppLink.adressAdd, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response = await crud.postData(AppLink.adressDelete, {
      "addressid" : addressid.toString() 
    });
    return response.fold((l) => l, (r) => r);
  }
}
