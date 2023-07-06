import 'package:hansungunivdorm/models/shared_pref_model.dart';
import 'package:hansungunivdorm/services/dio_method.dart';
import 'package:state_notifier/state_notifier.dart';

import 'login_state.dart';

class LoginProvider extends StateNotifier<LoginState> {
  LoginProvider() : super(LoginState.initial());

  Future<void> initLogin() async {
    Map<String, dynamic> result =
        await loginDorm(SharedPrefModel.id, SharedPrefModel.pw);
    if (result['return']) {
      state = state.copyWith(
        id: SharedPrefModel.id,
        pw: SharedPrefModel.pw,
        name: result['name'],
        jsessionid: result['jsessionid'],
        isLogin: true,
      );
      SharedPrefModel.setAccount(SharedPrefModel.id, SharedPrefModel.pw);
    }
  }

  Future<void> login(String id, String pw) async {
    Map<String, dynamic> result = await loginDorm(id, pw);
    if (result['return']) {
      state = state.copyWith(
        id: id,
        pw: pw,
        name: result['name'],
        jsessionid: result['jsessionid'],
        isLogin: true,
      );
      SharedPrefModel.setAccount(id, pw);
    } else {
      state = state.copyWith(
          id: '', pw: '', name: '', jsessionid: '', isLogin: false);
      SharedPrefModel.setAccount('', '');
    }
  }

  Future<void> logout() async {
    await logoutDorm();
    state = state.copyWith(
        id: '', pw: '', name: '', jsessionid: '', isLogin: false);
    SharedPrefModel.clearAccount();
  }
}
