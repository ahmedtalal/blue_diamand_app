class LoginUseCase {
  static final LoginUseCase _loginUseCase = LoginUseCase._internal();
  LoginUseCase._internal();
  static LoginUseCase get instance => _loginUseCase;
}
