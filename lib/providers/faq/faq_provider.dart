import 'package:hansungunivdorm/providers/faq/faq_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../services/dio_method.dart';

class FaqProvider extends StateNotifier<FaqState> {
  FaqProvider() : super(FaqState.initial());

  Future<void> getFaqs() async {
    if (!state.isLoading) {
      return;
    }
    List<dynamic> faqs = await getFaqList();
    state = state.copyWith(faqList: faqs, isLoading: false);
  }
}
