part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<CharacterModel>? characterModelList,
    required bool isLoading,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        characterModelList: [],
        isLoading: false,
      );
}
