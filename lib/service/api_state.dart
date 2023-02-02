abstract class APIState {}

class AppEventInitial extends APIState {}

class APILoading extends APIState {}

class APILoaded<T> extends APIState {
  final T data;

  APILoaded(this.data);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is APILoaded && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class APIStateFailure extends APIState {
  final String message;

  APIStateFailure(this.message);
}

class APICallUnauthorized extends APIState {}