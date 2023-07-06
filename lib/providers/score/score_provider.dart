import 'package:hansungunivdorm/providers/login/login_state.dart';
import 'package:hansungunivdorm/providers/score/score_state.dart';
import 'package:hansungunivdorm/services/dio_method.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../models/score_model.dart';

class ScoreProvider extends StateNotifier<ScoreState> with LocatorMixin {
  ScoreProvider() : super(ScoreState.initial());

  void clearScores() {
    state = state.copyWith(scores: [], isLoading: true, headLoading: true);
  }

  Future<void> getScores({required int page}) async {
    List<ScoreModel> scores = [];

    // Existing Scores
    scores.addAll(state.scores);

    // Scores
    scores.addAll(await getScoreList(read<LoginState>().jsessionid, page));

    if (scores.last.number == '1') {
      state = state.copyWith(isLoading: false);
    }

    state = state.copyWith(scores: scores, headLoading: false);
  }
}
