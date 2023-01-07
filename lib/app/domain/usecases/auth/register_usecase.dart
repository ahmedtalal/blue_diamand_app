class RegisterUseCase {
  static final RegisterUseCase _registerUseCase = RegisterUseCase._internal();
  RegisterUseCase._internal();
  static RegisterUseCase get instance => _registerUseCase;
}
