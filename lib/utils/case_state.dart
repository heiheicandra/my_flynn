class Case<T> {
  final T? data;
  final String error;

  Case({
    this.data,
    String? error,
  }) : error = error ?? "";
}

class InitialCase<T> extends Case<T> {}

class LoadingMoreCase<T> extends Case<T> {}

class LoadingCase<T> extends Case<T> {}

class ErrorCase<T> extends Case<T> {
  ErrorCase(String error) : super(error: error);
}

class LoadedCase<T> extends Case<T> {
  LoadedCase(T result) : super(data: result);
}

class RefreshCase<T> extends Case<T> {
  RefreshCase(T result) : super(data: result);
}
