part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initFood();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);

  // core
}

void _initFood() {
  //* DataSource
  serviceLocator
    ..registerFactory<RestaurantRemoteDataSource>(
        () => RestaurantRemoteDataSourceImpl(serviceLocator()))
    //* Repository
    ..registerFactory<FoodRepository>(
        () => FoodRepositoryImpl(serviceLocator()))
    //* Usecases
    ..registerFactory(() => GetFoods(serviceLocator()))
    //* Bloc
    ..registerLazySingleton(
      () => FoodBloc(
        getFoods: serviceLocator(),
      ),
    );
}
