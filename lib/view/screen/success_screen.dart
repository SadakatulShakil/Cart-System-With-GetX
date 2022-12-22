import 'package:cart_app_getx/until/constants.dart';
import 'package:cart_app_getx/view/widget/product_list_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../controller/product_controller.dart';

final ProductController controller = Get.put(ProductController());

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<PaymentSuccessScreen> {
  bool agree = false;
  String? payment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 200,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Image.asset('asset/images/success.png'),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Order Placed Successfully',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'One of our representatives will confirm your order shortly. You will receive an invoice through SMS.',
                        style: TextStyle(fontSize: 13),
                      )),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      color: Colors.grey,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Back to Home", style: TextStyle(fontSize: 20),),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      color: Colors.blueAccent,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("View Order",style: TextStyle(fontSize: 20)),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0 //message font size
        );
  }
}
