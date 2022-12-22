import 'package:cart_app_getx/until/constants.dart';
import 'package:cart_app_getx/view/screen/success_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../controller/product_controller.dart';

final ProductController controller = Get.put(ProductController());

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<PaymentScreen> {
  bool agree = false;
  String? payment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Payment",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 500,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'You are buying from',
                        style: TextStyle(
                            fontSize: 15),
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
                        'Grameen Comunications',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 8,
                ),
                Obx(
                  () {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Text(
                        '৳ ' + controller.price.value.toString(),
                        style:
                            TextStyle(fontSize: 50, color: Colors.blueAccent),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Text('All inclusive')
              ],
            ),
          ),
          Container(
            height: 300,
            child: Column(
              children: [
                Column(
                  children: [
                    RadioListTile(
                      title: Wrap(
                        children: [
                          Image.asset('asset/images/bKash.png'),
                          Text(' bKash Payment'),
                        ],
                      ),
                      value: "bKash",
                      groupValue: payment,
                      onChanged: (value) {
                        setState(() {
                          payment = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Wrap(
                        children: [
                          Image.asset('asset/images/card.png'),
                          Text(' Credit Card'),
                        ],
                      ),
                      value: "Credit",
                      groupValue: payment,
                      onChanged: (value) {
                        setState(() {
                          payment = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Wrap(
                        children: [
                          Image.asset('asset/images/nagat.png'),
                          Text(' Nagat Payment'),
                        ],
                      ),
                      value: "Nagat",
                      groupValue: payment,
                      onChanged: (value) {
                        setState(() {
                          payment = value.toString();
                        });
                      },
                    )
                  ],
                ),
                const Divider(),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentSuccessScreen()));
                          },
                          child: const Text("Pay Now")),
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
