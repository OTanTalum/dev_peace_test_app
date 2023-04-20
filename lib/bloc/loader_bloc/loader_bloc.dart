import 'package:bloc/bloc.dart';

part 'loader_event.dart';
part 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  LoaderBloc() : super(LoaderDone()) {
    on<LoadingProcess>((event, emit) async {
      emit(LoaderInProgress());
      await Future.delayed(const Duration(seconds: 2))
          .then((value) => emit(LoaderDone()));
    });

    on<LoadingDone>((event, emit) async {
      emit(LoaderDone());
    });

    on<LoadingException>((event, emit) async {
      emit(LoaderHasException());
    });
  }
}
