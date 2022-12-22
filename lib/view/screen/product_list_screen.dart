import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/product_controller.dart';
import '../widget/product_list_view.dart';


final ProductController controller = Get.put(ProductController());


class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text("Medicine", style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 28.0),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: controller.navigateToCartScreen,
                  ),
                );
              },
              child: Badge(
                elevation: 8,
                badgeColor: Colors.green,
                position: BadgePosition(top: 5,start: 15 ),
                child: const Icon(Icons.shopping_cart,color: Colors.black,),
                badgeContent: Obx(()=> Text(controller.itemCount.value.toString(), style: TextStyle(color: Colors.white),)),
              ),
            ),
          ),
        ],
      ),
      body: const ProductListView(),
    );
  }
}
