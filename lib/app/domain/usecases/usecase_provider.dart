
class UseCaseProvider {
  static UseCaseProvider? _useCaseProvider;
  UseCaseProvider._internal();
  static UseCaseProvider instance() {
    if (_useCaseProvider == null) {
      return _useCaseProvider = UseCaseProvider._internal();
    }
    return _useCaseProvider!;
  }

  T creator<T>(T t) {
    return t;
  }
}
