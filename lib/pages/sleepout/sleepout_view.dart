import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:hansungunivdorm/providers/providers.dart';

class SleepOutView extends StatefulWidget {
  const SleepOutView({Key? key}) : super(key: key);

  @override
  State<SleepOutView> createState() => _SleepOutViewState();
}

class _SleepOutViewState extends State<SleepOutView> {
  final ScrollController _scrollController = ScrollController();

  int page = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SleepOutProvider>().clearSleepOuts();
      context.read<SleepOutProvider>().getSleepOuts(page: page++);
    });

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        context.read<SleepOutProvider>().getSleepOuts(page: page++);
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
    final sleepoutState = context.watch<SleepOutState>();
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: sleepoutState.sleepouts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  horizontalTitleGap: 4.0,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text.rich(
                          TextSpan(
                            text:
                                "${sleepoutState.sleepouts[index].duringDate} | ${sleepoutState.sleepouts[index].duringCount}일",
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${sleepoutState.sleepouts[index].number} | ${sleepoutState.sleepouts[index].name} | ${sleepoutState.sleepouts[index].postDate}",
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
            sleepoutState.isLoading
                ? const SpinKitFadingCircle(
                    size: 20,
                    color: Colors.grey,
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
