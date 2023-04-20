part of 'main_bloc.dart';

abstract class MainState {
  MainState({required this.tileList});

  List<Widget> tileList = <TileWidget>[];
}

class MainInitial extends MainState {
  MainInitial({tileList}) : super(tileList: tileList);

  List<Object> get props => [tileList];
}
