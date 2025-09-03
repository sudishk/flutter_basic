import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var amountController = TextEditingController();
  Razorpay? razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay = Razorpay();
    razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, (PaymentSuccessResponse success){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment successfully ${success.paymentId}")));
    });
    razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, (PaymentFailureResponse error){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment failed ${error.message}")));

    });
    razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, (ExternalWalletResponse wallet){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment successfully ${wallet.walletName}")));

    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          TextField(controller: amountController, decoration: InputDecoration(hint: Text("Enter amount")),),
          ElevatedButton(onPressed: () {
            var amount = int.parse(amountController.text) * 100;

            var options = {
              'key': 'rzp_test_R7xQYpa54gC33c',
              'amount': "$amount",
              'order_id': "",
              'name': 'Acme Corp.',
              'description': 'Fine T-Shirt',
              'prefill': {
                'contact': '8888888888',
                'email': 'test@razorpay.com'
              }
            };
            razorpay?.open(options);
          }, child: Text("Pay Now"))
        ],
      ),
    ));
  }
  @override
  void dispose() {
    super.dispose();
    razorpay?.clear();
  }
}
