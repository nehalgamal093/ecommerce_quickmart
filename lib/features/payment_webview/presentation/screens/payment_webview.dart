import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/resources/constants/strings_manager.dart';

class PaymentWebView extends StatefulWidget {
  final String clientSecret;
  static const String routeName = '/pay';
  const PaymentWebView({super.key, required this.clientSecret});

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          '${dotenv.env['PAY_MOB_CHECKOUT']!}?publicKey=${dotenv.env['PUBLIC_KEY']!}&clientSecret=${widget.clientSecret}'));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(StringsManager.webPayment),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
