import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:hansungunivdorm/providers/providers.dart';

class ScoreView extends StatefulWidget {
  const ScoreView({Key? key}) : super(key: key);

  @override
  State<ScoreView> createState() => _ScoreViewState();
}

class _ScoreViewState extends State<ScoreView> {
  final ScrollController _scrollController = ScrollController();

  int page = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ScoreProvider>().clearScores();
      context.read<ScoreProvider>().getScores(page: page++);
    });

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        context.read<ScoreProvider>().getScores(page: page++);
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
    final scoreState = context.watch<ScoreState>();
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Theme.of(context).dialogBackgroundColor,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  // color: Colors.white,
                ),
                child: scoreState.headLoading
                    ? const SpinKitFadingCircle(
                        size: 20.0,
                        color: Colors.grey,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                scoreState.scores[0].totalPlus,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "상점",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                scoreState.scores[0].totalMinus,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "벌점",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                scoreState.scores[0].totalScore,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "총점",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: scoreState.scores.length,
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
                            text: scoreState.scores[index].reason,
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
                                    "${scoreState.scores[index].number} | ${scoreState.scores[index].name} | ${scoreState.scores[index].score} | ${scoreState.scores[index].date}",
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
            scoreState.isLoading
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
