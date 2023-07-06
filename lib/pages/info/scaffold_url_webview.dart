import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../models/shared_pref_model.dart';

class ScaffoldUrlWebView extends StatefulWidget {
  const ScaffoldUrlWebView({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<ScaffoldUrlWebView> createState() => _ScaffoldUrlWebViewState();
}

class _ScaffoldUrlWebViewState extends State<ScaffoldUrlWebView> {
  bool isLoading = true;
  late WebViewController _webViewController;

  @override
  void initState() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (_) => setState(() {
          isLoading = false;
        }),
      ))
      ..loadRequest(Uri.parse(widget.url));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SharedPrefModel.darkMode
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        iconTheme: const IconThemeData(opacity: 0.7),
        leading: CupertinoButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(
            Icons.chevron_left_rounded,
            color: Theme.of(context).hintColor.withOpacity(0.8),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _webViewController),
          isLoading
              ? const Center(
                  child: SpinKitFadingCircle(
                    color: Colors.grey,
                    size: 20,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
