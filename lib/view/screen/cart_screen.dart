import 'package:cart_app_getx/until/constants.dart';
import 'package:cart_app_getx/view/screen/shipping_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/product_controller.dart';
import '../widget/product_list_view.dart';

final ProductController controller = Get.put(ProductController());

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.navigateToListItemScreen,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text("My Cart", style: TextStyle(color: Colors.black),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          children: [
            const Expanded(child: ProductListView()),
            Container(
              height: 250,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                        child: Text('Order Summery - '+controller.itemCount.value.toString()+' items', style: TextStyle(fontSize: 18),)),
                  ),
                  const Divider(),
                  Obx(
                        () {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Grand Total'),
                            Text('৳ '+controller.price.value.toString()),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Promo'),
                    InkWell(
                        onTap:(){
                          OepnPromoDialog(context);
                        },
                        child: Text('Apply now', style: TextStyle(color: Colors.blueAccent),)),
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Saved'),
                        Text('৳ 0.0'),
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Obx(
                        () {
                      return Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total payable'),
                                Text('৳ '+controller.price.value.toString()),
                              ],
                            ),
                          );
                    },
                  ),
                  SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      OepnPromoDialog(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          children: [
                            Image.asset('asset/images/coupon.png'),
                            Text(' Apply promo code'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Obx(
                      () {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Payable",
                                  style: kItemNameStyle.copyWith(fontSize: 12),
                                ),
                                Text('৳ '+controller.price.value.toString(),
                                    style: kItemNameStyle)
                              ],
                            ),
                            Container(
                              width:200,
                              child: ElevatedButton(
                                  onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShippingAddressScreen()));
                                  },
                                  child: const Text("Check out")),
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  OepnPromoDialog(BuildContext context) {
    print(',,,,,,,,,,,,,,,,,,,,,');
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: contentBox(context),
          );
        });
  }

  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20,top: 45
              + 20, right: 20,bottom: 20
          ),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Apply Promo Code',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              SizedBox(height: 15,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Promo Code',
                ),
              ),
              SizedBox(height: 8,),
              Container(
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300)
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Discount on Diagnosistics',style: TextStyle(fontSize: 18, color: Colors.blueAccent)),
                            Image.asset('asset/images/tick.png'),
                          ],
                        ),//
                    ),
                    Text('Discount on Diagnosistics\nEnjoy 20% discount on your next order. upto \$100, minimum order value.',style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(height: 22,),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Apply',style: TextStyle(fontSize: 18),)),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 45,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(45)),
                child: Image.asset("asset/images/promo_code.png")
            ),
          ),
        ),
      ],
    );
  }
}
