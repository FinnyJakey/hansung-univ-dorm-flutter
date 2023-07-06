import 'package:equatable/equatable.dart';

class FaqState extends Equatable {
  final List<dynamic> faqList;
  final bool isLoading;

  const FaqState({
    required this.faqList,
    required this.isLoading,
  });

  factory FaqState.initial() {
    return const FaqState(faqList: [], isLoading: true);
  }

  @override
  List<Object?> get props => [faqList, isLoading];

  FaqState copyWith({
    List<dynamic>? faqList,
    bool? isLoading,
  }) {
    return FaqState(
      faqList: faqList ?? this.faqList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
