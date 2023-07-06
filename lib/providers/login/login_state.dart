import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String id;
  final String pw;
  final String jsessionid;
  final String name;
  final bool isLogin;

  const LoginState({
    required this.id,
    required this.pw,
    required this.jsessionid,
    required this.name,
    required this.isLogin,
  });

  factory LoginState.initial() {
    return const LoginState(
        id: '', pw: '', jsessionid: '', name: '', isLogin: false);
  }

  LoginState copyWith({
    String? id,
    String? pw,
    String? jsessionid,
    String? name,
    bool? isLogin,
  }) {
    return LoginState(
      id: id ?? this.id,
      pw: pw ?? this.pw,
      jsessionid: jsessionid ?? this.jsessionid,
      name: name ?? this.name,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  @override
  List<Object?> get props => [id, pw, jsessionid, name, isLogin];
}
