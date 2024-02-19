import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart';

class CommonUtil {
  static const String apiUrl = 'https://api.stripe.com/v1/payment.intent';
  // static const String apiUrl =
  //     'pk_test_51OguneLV7pIEJINT4PXcYuvgqlG4YVLPDxaal4LzuHdyNLcuaj4Bao5bOacVpVREeWIW0yZsWAFnxygDwMccTCPA00jCRUbnsa';
  static const String stripeUserCreate = "/add/user";
  static const String checkout = "/checkout";

  static backendCall(User user, String endPoint) async {
    String token = user.getIdToken().toString();
    return post(Uri.parse(apiUrl + endPoint), headers: {
      // "Accept": "application/json",
      "Content-Type": "application/json",
      // "Content-Type": "application/x-www-form-urlencoded",
      "Authorization": "Bearer $token"
      // "Authorization":
      //     "Bearer sk_test_51OguneLV7pIEJINToQY33mQGtjvh3pBN2Rb9T20YOkOlO5nMCIq38gddmNDT8ACwDYbYgid8GGWNROqIEbrbbana00GTU0dmwa"
    });
  }

  static Future<String> checkoutFlow(User user) async {
    String error = "";
    try {
      Response response = await backendCall(user, checkout);
      var json = jsonDecode(response.body);
      SetupPaymentSheetParameters parameters = SetupPaymentSheetParameters(
          customerId: json["customer"],
          customerEphemeralKeySecret: json["ephemeralKey"],
          paymentIntentClientSecret: json["paymentIntent"],
          merchantDisplayName: "Shoppers");
      Stripe.instance.initPaymentSheet(paymentSheetParameters: parameters);
      await Future.delayed(const Duration(seconds: 2));
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      log("Stripe error${e.error.message}");
      error = e.error.message.toString();
    } catch (e, stackTrace) {
      log("Error with backend api call", stackTrace: stackTrace, error: e);
      error = "Network error, try after some time";
    }
    return error;
  }

  static showAlert(BuildContext context, String heading, String body) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(heading),
              content: Text(body),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, 'ok'),
                    child: const Text('Ok'))
              ],
            ));
  }
}
