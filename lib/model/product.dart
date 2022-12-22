import 'package:get/get.dart';

class Product {
  String name;
  String origin;
  String price;
  int count;
  String image;

  Product(this.name, this.origin, this.price, this.count, this.image);
}

List<Product> productList = [
  Product('Napa', "Acme Limited", "100", 0,'asset/images/napa.png'),
  Product('Asthalin inhaler', "Squire Limited",  '200', 0,'asset/images/asthalin.png'),
  Product('Ecosprin', "Ibn Sina", "300",  0,'asset/images/ecosprin.png'),
  Product('Zolium', "Squire Limited", "250",  0,'asset/images/zolium.png'),
  Product('Asthalin inhaler', "Acme Limited", "150",  0,'asset/images/asthalin.png'),
  Product('Ecosprin', "Ibn Sina", "200",  0,'asset/images/ecosprin.png'),
  Product('Napa', "Acme Limited", "100", 0,'asset/images/napa.png'),
  Product('Asthalin inhaler', "Squire Limited", "200",  0,'asset/images/asthalin.png'),
  Product('Ecosprin', "Ibn Sina", "300",  0,'asset/images/ecosprin.png'),
  Product('Zolium', "Squire Limited", "250", 0,'asset/images/zolium.png'),
  Product('Asthalin inhaler', "Acme Limited", "150",  0,'asset/images/asthalin.png'),
  Product('Ecosprin', "Ibn Sina", "200",  0,'asset/images/ecosprin.png'),


];

