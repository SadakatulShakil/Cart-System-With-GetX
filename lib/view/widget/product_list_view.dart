import 'package:cart_app_getx/view/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/product_controller.dart';
import '../../model/product.dart';
import '../../until/constants.dart';

final ProductController controller = Get.put(ProductController());

class ProductListView extends StatelessWidget {
  const ProductListView();

  Widget countButton(int index, void Function(int index) counter,
      {IconData icon = Icons.add}) {
    return RawMaterialButton(
      onPressed: () {
        counter(index);
      },
      elevation: 2.0,
      fillColor: Colors.white,
      child: Icon(
        icon,
        size: 15,
      ),
      shape: const CircleBorder(),
    );
  }


  @override
  Widget build(BuildContext context) {
    Widget listViewBody(Product item, int index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ProductDetailScreen(item.name,item.image, item.price);
          },),);
        },

        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Visibility(
                  visible: false,
                    child: Image.asset(item.image, fit: BoxFit.contain, width: 60)),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name, style: kItemNameStyle),
                      Text(item.origin, style: kItemOriginStyle),
                      Text('৳ '+item.price, style: kItemPriceStyle),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    countButton(index, controller.decrease, icon: Icons.remove),
                    Obx(() => Text(controller.allProducts[index].count.toString())),
                    countButton(index, controller.increase),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Divider(thickness: 1,),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      body: Column(
        children: [
          Visibility(
            visible: controller.isCartScreen?false:true,
            child:
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],),
              height: 100,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 18.0, bottom: 20, right: 18),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      textInputAction: TextInputAction.go,
                      maxLines: 1,
                      minLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                        contentPadding: EdgeInsets.all(8),
                        hintText: 'what are you searching for?',
                        hintStyle: TextStyle(fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 25),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Text("Medicine", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 100),
            child: Divider(thickness: 1,),
          ),
          SizedBox(height: 8,),
          Visibility(
            visible: controller.isCartScreen?true:false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('Type - Item'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 70.0),
                  child: Text('QTY'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.allProducts.length,
              itemBuilder: (_, index) {
                Product item = controller.allProducts[index];
                if (controller.isItemListScreen) {
                  return listViewBody(item, index);
                } else if (controller.isCartScreen && item.count > 0) {
                  return listViewBody(item, index);
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
