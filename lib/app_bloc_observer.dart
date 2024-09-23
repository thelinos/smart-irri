import "package:bloc/bloc.dart";
import "package:smart_irri_app/app_logger.dart";

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onCreate(BlocBase<void> bloc) {
    super.onCreate(bloc);
    AppLogger.t("${bloc.runtimeType} created");
  }

  @override
  void onClose(BlocBase<void> bloc) {
    super.onClose(bloc);
    AppLogger.t("${bloc.runtimeType} disposed");
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    AppLogger.e("onError(${bloc.runtimeType}, $error, $stackTrace)");
    super.onError(bloc, error, stackTrace);
  }
}
