import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_test_calismasi/model/character_model.dart';
import 'package:flutter_test_calismasi/service/character_service.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CharacterService characterService;

  HomeBloc({required this.characterService}) : super(HomeState.initial()) {
    on<FetchDataEvent>(_fetchData);
  }

  Future<void> _fetchData(
    FetchDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final characters = await characterService.fetchCharacters();

    emit(state.copyWith(
      characterModelList: characters,
      isLoading: false,
    ));
  }
}
