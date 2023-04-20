import 'package:bloc/bloc.dart';
import 'package:devpeace_test_app/widgets/tile_widget.dart';
import 'package:flutter/cupertino.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial(tileList: List<TileWidget>.empty())) {
    on<MainEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AddTileButton>((event, emit) {
      int listLenght = state.tileList.length + 1;
      List newList = <TileWidget>[];

      newList.addAll(state.tileList);
      newList.add(TileWidget(
        name: "Tile $listLenght",
      ));
      emit(MainInitial(tileList: newList));
    });

    on<RemoveTileButton>((event, emit) {
      List newList = <TileWidget>[];
      newList.addAll(state.tileList);
      if (newList.isNotEmpty) {
        newList.removeLast();
      } else {
        Exception("Element is Missing");
      }
      emit(MainInitial(tileList: newList));
    });
  }
}
