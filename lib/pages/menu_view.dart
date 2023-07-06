import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hansungunivdorm/models/shared_pref_model.dart';
import 'package:hansungunivdorm/pages/contact/contact_view.dart';
import 'package:hansungunivdorm/pages/faq/faq_view.dart';
import 'package:hansungunivdorm/pages/notice/notice_view.dart';
import 'package:hansungunivdorm/pages/postsleep/postsleep_view.dart';
import 'package:hansungunivdorm/pages/reward/reward_view.dart';
import 'package:hansungunivdorm/pages/score/score_view.dart';
import 'package:hansungunivdorm/pages/sleepout/sleepout_view.dart';
import 'package:hansungunivdorm/pages/widgets/failure_dialog.dart';
import 'package:hansungunivdorm/pages/widgets/login_widgets.dart';
import 'package:hansungunivdorm/providers/providers.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'info/info_view.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final List<String> _menuTitle = [
    '공지사항',
    '연락처',
    'FAQ',
    '상벌규정',
    '상벌점현황',
    '외박현황',
    '외박신청'
  ];
  final List<Widget> _menu = [
    const NoticeView(),
    const ContactView(),
    const FaqView(),
    const RewardView(),
    const ScoreView(),
    const SleepOutView(),
    // TODO: PostSleepView(),
    Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('제가 더이상 기숙사에 살지 않아 외박신청을 누를 시'),
            Text('배정된 기숙사가 없다고 나와서'),
            Text('외박신청 구현에 어려움을 겪고 있습니다.'),
            Text('\n'),
            Text('외박신청 구현을 도와주실 분을 찾습니다.'),
          ],
        ),
      ),
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final loginState = context.watch<LoginState>();
    final themeState = context.watch<ThemeState>();
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SharedPrefModel.darkMode
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          _menuTitle[_currentIndex],
          style: TextStyle(
            fontSize: 18.0,
            color: themeState.currentTheme.hintColor
                .withOpacity(0.8), // ThemeState
          ),
        ),
        automaticallyImplyLeading: false,
        leading: Builder(builder: (context) {
          return CupertinoButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            child: Icon(
              Icons.table_rows_rounded,
              color: Theme.of(context).hintColor.withOpacity(0.8),
            ),
          );
        }),
        actions: [
          CupertinoButton(
            onPressed: () => showMaterialModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                ),
              ),
              enableDrag: false,
              context: context,
              builder: (context) => SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 3,
                child: const InfoView(),
              ),
            ),
            child: Icon(
              Icons.info_outline,
              color: Theme.of(context).hintColor.withOpacity(0.8),
            ),
          ),
          CupertinoButton(
            onPressed: () {
              SharedPrefModel.setDarkMode(
                  themeState.currentTheme == ThemeData.light() ? true : false);
              context.read<ThemeProvider>().changeTheme();
            },
            child: themeState.currentTheme == ThemeData.light()
                ? const Icon(
                    Icons.dark_mode_outlined,
                    color: Colors.black,
                  )
                : const Icon(
                    Icons.wb_sunny_outlined,
                    color: Colors.yellow,
                  ),
          ),
        ],
      ),
      drawerEdgeDragWidth: 0.0,
      drawer: Drawer(
        child: ListView(
          children: [
            loginState.isLogin
                ? Logined(context, loginState.name)
                : NotLogined(context),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.view_list_rounded),
                  SizedBox(width: 10.0),
                  Text('공지사항'),
                ],
              ),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.contact_phone_rounded),
                  SizedBox(width: 10.0),
                  Text('연락처'),
                ],
              ),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.question_answer_rounded),
                  SizedBox(width: 10.0),
                  Text('FAQ'),
                ],
              ),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.rule_rounded),
                  SizedBox(width: 10.0),
                  Text('상벌규정'),
                ],
              ),
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.co_present_rounded),
                  SizedBox(width: 10.0),
                  Text('상벌점현황'),
                ],
              ),
              onTap: () {
                if (!loginState.isLogin) {
                  failureDialog('로그인 후 사용 가능해요!', '확인했어요!', context);
                  return;
                }
                setState(() {
                  _currentIndex = 4;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.sensor_door_rounded),
                  SizedBox(width: 10.0),
                  Text('외박현황'),
                ],
              ),
              onTap: () {
                if (!loginState.isLogin) {
                  failureDialog('로그인 후 사용 가능해요!', '확인했어요!', context);
                  return;
                }
                setState(() {
                  _currentIndex = 5;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.post_add_rounded),
                  SizedBox(width: 10.0),
                  Text('외박신청'),
                ],
              ),
              onTap: () {
                if (!loginState.isLogin) {
                  failureDialog('로그인 후 사용 가능해요!', '확인했어요!', context);
                  return;
                }
                setState(() {
                  _currentIndex = 6;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _menu[_currentIndex],
    );
  }
}
