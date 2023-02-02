part of 'anime_cubit.dart';

abstract class AnimeState extends Equatable {
  const AnimeState();

  @override
  List<Object> get props => [];
}

class AnimeInitial extends AnimeState {}

class AnimeLoading extends AnimeState {}

class AnimeLoaded<T> extends AnimeState {
  final T data;

  const AnimeLoaded(this.data);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnimeLoaded && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class AnimeStateFailure extends AnimeState {
  final String message;

  const AnimeStateFailure(this.message);
}

class AnimeCallUnauthorized extends AnimeState {}
