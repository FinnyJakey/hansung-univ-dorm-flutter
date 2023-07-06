import 'package:equatable/equatable.dart';

import '../../models/score_model.dart';

class ScoreState extends Equatable {
  final List<ScoreModel> scores;
  final bool isLoading;
  final bool headLoading;

  const ScoreState({
    required this.scores,
    required this.isLoading,
    required this.headLoading,
  });

  factory ScoreState.initial() {
    return const ScoreState(scores: [], isLoading: true, headLoading: true);
  }

  ScoreState copyWith(
      {List<ScoreModel>? scores, bool? isLoading, bool? headLoading}) {
    return ScoreState(
      scores: scores ?? this.scores,
      isLoading: isLoading ?? this.isLoading,
      headLoading: headLoading ?? this.headLoading,
    );
  }

  @override
  List<Object?> get props => [scores, isLoading, headLoading];
}
