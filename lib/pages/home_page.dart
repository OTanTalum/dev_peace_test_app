import 'package:devpeace_test_app/bloc/loader_bloc/loader_bloc.dart';
import 'package:devpeace_test_app/bloc/main_bloc/main_bloc.dart';
import 'package:devpeace_test_app/widgets/exception_windows.dart';
import 'package:devpeace_test_app/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final ScrollController _controller = ScrollController();

  double getHeight(state, context) {
    return (MediaQuery.of(context).size.height / 2) -
                ((state.tileList.length ~/ 2) * 25) <
            175
        ? 175.0
        : (MediaQuery.of(context).size.height / 2) -
            ((state.tileList.length ~/ 2) * 25);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
        bloc: BlocProvider.of<MainBloc>(context),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Test App"),
            ),
            body: Stack(children: [
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  controller: _controller,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          height: getHeight(state, context),
                          duration: const Duration(milliseconds: 200),
                          child: Image.asset(
                            "assets/img/logo.png",
                            scale: 2,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Wrap(
                            runSpacing: 12,
                            spacing: 24.0,
                            runAlignment: WrapAlignment.start,
                            alignment: WrapAlignment.start,
                            children: state.tileList,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              BlocBuilder(
                  bloc: BlocProvider.of<LoaderBloc>(context),
                  builder: (context, state) {
                    if (state is LoaderInProgress) {
                      return const LoaderWidget();
                    } else if (state is LoaderHasException) {
                      return ExceptionsWindows(onTap: () {
                        context.read<LoaderBloc>().add(LoadingDone());
                      });
                    } else {
                      return const SizedBox();
                    }
                  })
            ]),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      if (BlocProvider.of<LoaderBloc>(context).state
                              is LoaderInProgress ||
                          BlocProvider.of<LoaderBloc>(context).state
                              is LoaderHasException) return;
                      if (state.tileList.isEmpty) {
                        context.read<LoaderBloc>().add(LoadingException());
                      }
                      context.read<MainBloc>().add(RemoveTileButton());
                      _controller.jumpTo(_controller.position.maxScrollExtent);
                    },
                    tooltip: 'remove',
                    child: const Icon(Icons.remove),
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (BlocProvider.of<LoaderBloc>(context).state
                              is LoaderInProgress ||
                          BlocProvider.of<LoaderBloc>(context).state
                              is LoaderHasException) return;
                      if ((state.tileList.length + 1) % 4 == 0) {
                        context.read<LoaderBloc>().add(LoadingProcess());
                      }
                      context.read<MainBloc>().add(AddTileButton());
                      _controller.jumpTo(_controller.position.maxScrollExtent);
                    },
                    tooltip: 'add',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        });
  }
}
