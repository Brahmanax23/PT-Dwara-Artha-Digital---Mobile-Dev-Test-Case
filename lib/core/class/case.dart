class Case<T> {
  final T? data;
  final String failure;

  Case({
    this.data,
    String? failure,
  }) : failure = failure ?? 'Terjadi Kesalahan';
}

class InitialCase<T> extends Case<T> {
  InitialCase() : super();
}

class LoadingCase<T> extends Case<T> {
  LoadingCase() : super();
}

class InitLoadingCase<T> extends Case<T> {
  InitLoadingCase() : super();
}

class OnSearchingCase<T> extends Case<T> {
  OnSearchingCase() : super();
}

class ExceptionCase<T> extends Case<T> {
  ExceptionCase(Exception e)
      : super(
          failure: e.toString(),
        );
}

class ErrorCase<T> extends Case<T> {
  ErrorCase(String failure)
      : super(
          failure: failure,
        );
}

class LoadedCase<T> extends Case<T> {
  LoadedCase(T result)
      : super(
          data: result,
        );
}

class FailedCase<T> extends Case<T> {
  FailedCase(T result)
      : super(
          data: result,
        );
}
