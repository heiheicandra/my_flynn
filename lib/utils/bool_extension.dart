extension BoolExtension on bool? {
  T either<T>({required T Function() trueV, required T Function() falseV}) {
    final value = this ?? false;
    if (value) {
      return trueV();
    } else {
      return falseV();
    }
  }
}
