import 'package:equatable/equatable.dart';

import '../../models/sleepout_model.dart';

class SleepOutState extends Equatable {
  final List<SleepOutModel> sleepouts;
  final bool isLoading;

  const SleepOutState({
    required this.sleepouts,
    required this.isLoading,
  });

  factory SleepOutState.initial() {
    return const SleepOutState(sleepouts: [], isLoading: true);
  }

  SleepOutState copyWith({
    List<SleepOutModel>? sleepouts,
    bool? isLoading,
  }) {
    return SleepOutState(
      sleepouts: sleepouts ?? this.sleepouts,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [sleepouts, isLoading];
}