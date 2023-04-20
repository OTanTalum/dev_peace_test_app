part of 'loader_bloc.dart';

abstract class LoaderState {}

class LoaderInProgress extends LoaderState {}

class LoaderDone extends LoaderState {}

class LoaderHasException extends LoaderState {}
