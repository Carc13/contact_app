import 'package:get_it/get_it.dart';

import './data/in_memory/in_memory_datasource.dart';
import './repositories/contact_repository.dart';
import './repositories/contact_repository_impl.dart';
import './view_model/contact_view_model.dart';

final GetIt getIt =  GetIt.instance;

Future<void> init() async {

  getIt.registerFactory(
    () => ContactViewModel(
      repository: getIt()
    )
  );

  getIt.registerLazySingleton<ContactRepository>(
    () => ContactRepositoryImpl(
      datasource: getIt()
    )
  );

  getIt.registerLazySingleton<InMemoryDatasource>(
    () => InMemoryDatasource(),
  );

}