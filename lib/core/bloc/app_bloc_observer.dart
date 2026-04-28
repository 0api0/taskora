import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    developer.log('onCreate --> ${bloc.runtimeType}', name: 'bloc.observer');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    developer.log(
      'onEvent --> ${bloc.runtimeType}, event: $event',
      name: 'bloc.observer',
    );
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    developer.log(
      'onChange --> ${bloc.runtimeType}, change: $change',
      name: 'bloc.observer',
    );
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    developer.log(
      'onTransition --> ${bloc.runtimeType}, transition: $transition',
      name: 'bloc.observer',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    developer.log(
      'onError --> ${bloc.runtimeType}, error: $error',
      name: 'bloc.observer',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    developer.log('onClose --> ${bloc.runtimeType}', name: 'bloc.observer');
    super.onClose(bloc);
  }
}
