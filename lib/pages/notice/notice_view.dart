import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hansungunivdorm/pages/notice/scaffold_html_webview.dart';
import 'package:provider/provider.dart';
import 'package:hansungunivdorm/providers/providers.dart';

class NoticeView extends StatefulWidget {
  const NoticeView({Key? key}) : super(key: key);

  @override
  State<NoticeView> createState() => _NoticeViewState();
}

class _NoticeViewState extends State<NoticeView> {
  final ScrollController _scrollController = ScrollController();

  int page = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NoticeProvider>().clearNotices();
      context.read<NoticeProvider>().getGeneralNotices(page: page++);
    });
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        context.read<NoticeProvider>().getGeneralNotices(page: page++);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final noticeState = context.watch<NoticeState>();
    return Scaffold(
      body: RefreshIndicator(
        color: Theme.of(context).hintColor.withOpacity(0.8),
        strokeWidth: 1.0,
        onRefresh: () async {
          page = 1;
          context.read<NoticeProvider>().clearNotices();
          if (defaultTargetPlatform == TargetPlatform.android) {
            context.read<NoticeProvider>().getGeneralNotices(page: page++);
          }
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: noticeState.notices.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    horizontalTitleGap: 4.0,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ScaffoldHtmlWebView(
                            idx: noticeState.notices[index].idx),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  noticeState.notices[index].fixed
                                      ? const WidgetSpan(
                                          alignment: PlaceholderAlignment.top,
                                          child: Icon(
                                            Icons.mic_none,
                                            size: 20.0,
                                          ),
                                        )
                                      : const WidgetSpan(
                                          child: SizedBox.shrink()),
                                  TextSpan(
                                    text: noticeState.notices[index].title,
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  noticeState.notices[index].attachment
                                      ? const WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: Icon(
                                            Icons.attach_file,
                                            size: 20.0,
                                            color: Colors.blueAccent,
                                          ),
                                        )
                                      : const WidgetSpan(
                                          child: SizedBox.shrink()),
                                ],
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "${noticeState.notices[index].name} | ${noticeState.notices[index].date} | ${noticeState.notices[index].count}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 1,
                    indent: 20.0,
                    endIndent: 20.0,
                  );
                },
              ),
              noticeState.isLoading
                  ? const SpinKitFadingCircle(
                      size: 20,
                      color: Colors.grey,
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
