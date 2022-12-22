import 'package:cart_app_getx/until/constants.dart';
import 'package:cart_app_getx/view/screen/payment_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../controller/product_controller.dart';

final ProductController controller = Get.put(ProductController());

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => InitState();
}
class InitState extends State<ShippingAddressScreen> {
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("Shipping Address", style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height-200,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment:Alignment.centerLeft,
                      child: Text('Shipping information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                ),
                Divider(),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Name',style: TextStyle(fontSize: 15)),
                      InkWell(
                          onTap:(){
                          },
                          child: Text('Sadakatul Ajam md. Shakil', style: TextStyle(fontSize: 15),)),
                    ],
                  ),
                ),
                SizedBox(height: 8,),Divider(),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Email',style: TextStyle(fontSize: 15)),
                      InkWell(
                          onTap:(){
                          },
                          child: Text('sadakatul.shakil@gmail.com', style: TextStyle(fontSize: 15),)),
                    ],
                  ),
                ),
                SizedBox(height: 8,),Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Address',style: TextStyle(fontSize: 15)),
                      InkWell(
                          onTap:(){
                          },
                          child: Text('Mohammadpur, Kadirabad housing', style: TextStyle(fontSize: 15),)),
                    ],
                  ),
                ),
                SizedBox(height: 8,),Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Post',style: TextStyle(fontSize: 15)),
                      InkWell(
                          onTap:(){
                          },
                          child: Text('1215', style: TextStyle(fontSize: 15),)),
                    ],
                  ),
                ),
                SizedBox(height: 12,),Divider(thickness: 3, color: Colors.grey.shade300,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment:Alignment.centerLeft,
                      child: Text('Invoice information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Email',style: TextStyle(fontSize: 15)),
                      InkWell(
                          onTap:(){
                          },
                          child: Text('sadakatul.shakil@gmail.com', style: TextStyle(fontSize: 15),)),
                    ],
                  ),
                ),
                SizedBox(height: 12,),Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mobile no',style: TextStyle(fontSize: 15)),
                      InkWell(
                          onTap:(){
                          },
                          child: Text('+8801751330394', style: TextStyle(fontSize: 15),)),
                    ],
                  ),
                ),
                SizedBox(height: 12,),Divider(thickness: 3, color: Colors.grey.shade300,),
                Row(
                  children: [
                    Material(
                      child: Checkbox(
                        value: agree,
                        onChanged: (value) {
                          setState(() {
                            agree = value ?? false;
                          });
                        },
                      ),
                    ),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                'I have read & agree with ',
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                            TextSpan(
                                text: 'TERMS AND CONDITIONS',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.blue,
                                    height: 1.5,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => WebViewPage('https://cocomaya.com.bd/terms-conditions/', 'Terms & Conditions')));
                                    print('Terms of Conditions"');
                                  }),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            child: Column(
              children: [
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
                                  agree?Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PaymentScreen())):showToastMessage('please agree our terms & conditions');
                                },
                                child: const Text("Confirm")),
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


