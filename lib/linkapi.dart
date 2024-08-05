class AppLink {
  static const String server = "http://192.168.33.64/ecommerce";
  static const String test = "$server/test.php";
  static const String imagesstatic = "http://192.168.33.64/ecommerce/upload";
  //=========Images=============//
  static const String imagesCategories = "$imagesstatic/categories";
  static const String imagesItems = "$imagesstatic/items";

  //===============auth=================//
  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";

  //===============forgetpassword=================//
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";

  //===============Home=======================//
  static const String hpmePage = "$server/home.php";

  //===============items=====================//
  static const String items = "$server/items/items.php";
  static const String searchItems = "$server/items/search.php";

  //===============Favorite=================//
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deleteFromeFavorite =
      "$server/favorite/deletefromefavorite.php";

  //===============Cart=================//
  static const String cartAdd = "$server/cart/add.php";
  static const String cartRemove = "$server/cart/delete.php";
  static const String cartView = "$server/cart/view.php";
  static const String getCountItems = "$server/cart/getcountitems.php";

  //===============Address=================//
  static const String adressAdd = "$server/address/add.php";
  static const String adressDelete = "$server/address/delete.php";
  static const String adressView = "$server/address/view.php";
  static const String adressEdit = "$server/address/edit.php";

  //===============copoun========//
  static const String checkcoupon = "$server/coupon/checkcopoun.php";

  //===========checkout==========//
  static const String checkout = "$server/orders/checkout.php";

  //===========orders==========//
  static const String pendingorders = "$server/orders/pending.php";
  static const String archiveorders = "$server/orders/archive.php";
  static const String ordersdetalis = "$server/orders/details.php";
  static const String ordersdelete = "$server/orders/delete.php";

  //===========offers==========//
  static const String offers = "$server/offers.php";
  static const String rating = "$server/rating.php";
}
// ipv4 address 192.168.200.
