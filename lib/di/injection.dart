import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Aquí registraremos todas nuestras dependencias.
  // Ej: getIt.registerLazySingleton(() => NetworkClient());
  // getIt.registerFactory(() => AuthUseCase(getIt()));
}
