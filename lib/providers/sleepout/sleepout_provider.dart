import 'package:hansungunivdorm/models/sleepout_model.dart';
import 'package:hansungunivdorm/providers/sleepout/sleepout_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../services/dio_method.dart';
import '../login/login_state.dart';

class SleepOutProvider extends StateNotifier<SleepOutState> with LocatorMixin {
  SleepOutProvider() : super(SleepOutState.initial());

  void clearSleepOuts() {
    state = state.copyWith(sleepouts: [], isLoading: true);
  }

  void getSleepOuts({required int page}) async {
    List<SleepOutModel> sleepouts = [];

    // Existing SleepOuts
    sleepouts.addAll(state.sleepouts);

    // Scores
    sleepouts
        .addAll(await getSleepOutsList(read<LoginState>().jsessionid, page));

    if (sleepouts.last.number == '1') {
      state = state.copyWith(isLoading: false);
    }

    state = state.copyWith(sleepouts: sleepouts);
  }
}
