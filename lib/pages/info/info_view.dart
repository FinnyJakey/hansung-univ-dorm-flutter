import 'package:flutter/material.dart';

import 'scaffold_url_webview.dart';

class InfoView extends StatelessWidget {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35.0),
              image: const DecorationImage(
                image: NetworkImage('https://github.com/FinnyJakey.png'),
              ),
            ),
            width: 150,
            height: 150,
            margin: const EdgeInsets.all(20.0),
          ),
          const Text(
            "@finny_jakey",
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                foregroundColor: Colors.grey,
                elevation: 0,
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: Theme.of(context).dialogBackgroundColor,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScaffoldUrlWebView(
                      url: 'https://blog.naver.com/egel10c_/222986300996'),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "개인정보 처리방침",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).hintColor.withOpacity(1.0),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                    color: Theme.of(context).hintColor,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                foregroundColor: Colors.grey,
                elevation: 0,
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: Theme.of(context).dialogBackgroundColor,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScaffoldUrlWebView(
                      url: 'https://www.instagram.com/finny_jakey/'),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "개발자에게 문의하기",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).hintColor.withOpacity(1.0),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 16,
                    color: Theme.of(context).hintColor,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
