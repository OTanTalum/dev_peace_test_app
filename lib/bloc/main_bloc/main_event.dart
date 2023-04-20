part of 'main_bloc.dart';

abstract class MainEvent {
  const MainEvent();
}

class AddTileButton extends MainEvent {}

class RemoveTileButton extends MainEvent {}
