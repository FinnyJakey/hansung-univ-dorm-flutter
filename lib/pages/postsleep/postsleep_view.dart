// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:hansung_dorm/providers/login/login_state.dart';
// import 'package:provider/provider.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class PostSleepView extends StatefulWidget {
//   const PostSleepView({Key? key}) : super(key: key);
//
//   @override
//   State<PostSleepView> createState() => _PostSleepViewState();
// }
//
// class _PostSleepViewState extends State<PostSleepView> {
//   bool isLoading = true;
//   late WebViewController _webViewController;
//
//   @override
//   void initState() {
//     _webViewController = WebViewController()
//       ..setBackgroundColor(Colors.transparent)
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(NavigationDelegate(
//         onPageFinished: (_) => setState(() {
//           isLoading = false;
//           _webViewController.setBackgroundColor(Colors.white);
//         }),
//       ))
//       ..loadRequest(
//         Uri.parse('https://dorm.hansung.ac.kr/mobile/content/slee.do'),
//         headers: {'Cookie': context.read<LoginState>().jsessionid},
//       );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           WebViewWidget(controller: _webViewController),
//           isLoading
//               ? const Center(
//                   child: SpinKitFadingCircle(
//                     color: Colors.grey,
//                     size: 20,
//                   ),
//                 )
//               : const SizedBox.shrink(),
//         ],
//       ),
//     );
//   }
// }
