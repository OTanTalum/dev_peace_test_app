part of 'loader_bloc.dart';

abstract class LoaderEvent {}

class LoadingProcess extends LoaderEvent {}

class LoadingDone extends LoaderEvent {}

class LoadingException extends LoaderEvent {}
