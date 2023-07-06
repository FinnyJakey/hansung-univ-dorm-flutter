import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../widgets/faq_widget.dart';

class FaqView extends StatefulWidget {
  const FaqView({Key? key}) : super(key: key);

  @override
  State<FaqView> createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
  @override
  void initState() {
    context.read<FaqProvider>().getFaqs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final faqState = context.watch<FaqState>();
    return Scaffold(
      body: faqState.isLoading
          ? const Center(
              child: SpinKitFadingCircle(
                size: 20.0,
                color: Colors.grey,
              ),
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return faqWidget(faqState.faqList[index]['title'],
                    faqState.faqList[index]['content']);
              },
              itemCount: faqState.faqList.length,
            ),
    );
  }
}
