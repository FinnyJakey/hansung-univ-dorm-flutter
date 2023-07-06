import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hansungunivdorm/services/dio_method.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../models/shared_pref_model.dart';

class ScaffoldHtmlWebView extends StatefulWidget {
  const ScaffoldHtmlWebView({Key? key, required this.idx}) : super(key: key);
  final String idx;

  @override
  State<ScaffoldHtmlWebView> createState() => _ScaffoldHtmlWebViewState();
}

class _ScaffoldHtmlWebViewState extends State<ScaffoldHtmlWebView> {
  bool isLoading = true;
  late WebViewController _webViewController;
  @override
  void initState() {
    _webViewController = WebViewController()
      ..setBackgroundColor(Colors.transparent)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (_) => setState(() {
          isLoading = false;
          _webViewController.setBackgroundColor(Colors.white);
        }),
      ))
      ..loadRequest(
        Uri.parse('https://dorm.hansung.ac.kr/mobile/content/noti.do'),
        method: LoadRequestMethod.post,
        body: Uint8List.fromList(
          utf8.encode("pgMode=View&idx=${widget.idx}"),
        ),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );
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

  getSpecific(String idx) async {
    return await getSpecificNotice(idx);
  }
}
