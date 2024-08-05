import 'package:ecomerce1/core/constant/routes.dart';
import 'package:ecomerce1/core/middleawer/mymiddleawer.dart';
import 'package:ecomerce1/view/address/add.dart';
import 'package:ecomerce1/view/address/view.dart';
import 'package:ecomerce1/view/screen/auth/forgetpassword/checkemail.dart';
import 'package:ecomerce1/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecomerce1/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:ecomerce1/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:ecomerce1/view/screen/auth/login.dart';
import 'package:ecomerce1/view/screen/auth/signup.dart';
import 'package:ecomerce1/view/screen/auth/successsignup.dart';
import 'package:ecomerce1/view/screen/auth/verfiycodesignup.dart';
import 'package:ecomerce1/view/screen/cart.dart';
import 'package:ecomerce1/view/screen/checkout.dart';
import 'package:ecomerce1/view/screen/homescreen.dart';
import 'package:ecomerce1/view/screen/items.dart';
import 'package:ecomerce1/view/screen/language.dart';
import 'package:ecomerce1/view/screen/myfavorite.dart';
import 'package:ecomerce1/view/screen/onboarding.dart';
import 'package:ecomerce1/view/screen/orders/archive.dart';
import 'package:ecomerce1/view/screen/orders/details.dart';
import 'package:ecomerce1/view/screen/orders/pending.dart';
import 'package:ecomerce1/view/screen/productdetails.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: AppRoutes.language,
      page: () => const Language(),
      middlewares: [MyMiddleawer()]),
  //GetPage(name: "/", page: () =>const Cart()),

  //auth

  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRoutes.singUp,
    page: () => const SignUp(),
  ),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verIfyCode, page: () => const VerFiyCode()),
  GetPage(
      name: AppRoutes.verFiyCodeSignUp, page: () => const VerFiyCodeSignUp()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutes.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  //onBoarding
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  //HOmePage
  GetPage(name: AppRoutes.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.items, page: () => const Items()),
  GetPage(name: AppRoutes.productDetails, page: () => const ProductDetails()),
  GetPage(name: AppRoutes.myFavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoutes.cart, page: () => const Cart()),
  //Address
  GetPage(name: AppRoutes.addressView, page: () => const AddressView()),
  GetPage(name: AppRoutes.addressAdd, page: () => const AddressAdd()),

  //checkout
  GetPage(name: AppRoutes.checkout, page: () => const CheckOut()),

  //orders Detalis
  GetPage(name: AppRoutes.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoutes.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoutes.ordersdetails, page: () => const OrdersDetails()),
];
