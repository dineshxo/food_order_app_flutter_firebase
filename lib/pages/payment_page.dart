import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_order/components/main_button.dart';
import 'package:food_order/pages/delivery_page.dart';
import 'package:u_credit_card/u_credit_card.dart';

class PaymentPage extends StatefulWidget {
  final double total;
  const PaymentPage({super.key, required this.total});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String cardNumber = '';
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void pay() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Confirm Pay",
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeliveryPage(),
                ),
              ),
              child: const Text(
                "Pay",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardUi(
                      width: double.infinity,
                      cardHolderFullName: cardHolderName,
                      cardNumber: cardNumber,
                      validFrom: '',
                      validThru: expiryDate,
                      topLeftColor: Colors.blue,
                    ),
                    CreditCardForm(
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      onCreditCardModelChange: (data) {
                        setState(() {
                          cardNumber = data.cardNumber;
                          expiryDate = data.expiryDate;
                          cardHolderName = data.cardHolderName;
                          cvvCode = data.cvvCode;
                        });
                      },
                      formKey: formKey,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total: \$${widget.total.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MainButton(
                    onTap: () {
                      pay();
                    },
                    text: "Pay Now",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
