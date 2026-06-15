sealed class NetworkResult<T> {
  const NetworkResult();

  bool get isSuccess => this is NetworkSuccess<T>;
  bool get isFailure => this is NetworkFailure<T>;

  T? get dataOrNull =>
      switch (this) {
        NetworkSuccess<T>(:final data) => data,
        NetworkFailure<T>() => null,
      };

  String? get errorOrNull =>
      switch (this) {
        NetworkSuccess<T>() => null,
        NetworkFailure<T>(:final message) => message,
      };
}

final class NetworkSuccess<T> extends NetworkResult<T> {
  const NetworkSuccess(this.data);

  final T data;
}

final class NetworkFailure<T> extends NetworkResult<T> {
  const NetworkFailure(this.message);

  final String message;
}
