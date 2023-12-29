import 'package:get_it/get_it.dart';
import 'package:tradingapp_api_test/feature1/data/datasource/remote_data_source/api_remote_data_source.dart';
import 'package:tradingapp_api_test/feature1/data/datasource/remote_data_source/api_remote_data_source_imp.dart';
import 'package:tradingapp_api_test/feature1/data/repositories/bot_repository_impl.dart';
import 'package:tradingapp_api_test/feature1/domin/respositories/bot_repository.dart';
import 'package:tradingapp_api_test/feature1/domin/usecases/add_bot.dart';
import 'package:tradingapp_api_test/feature1/domin/usecases/get_all_bots.dart';
import 'package:tradingapp_api_test/feature1/presentation/cubit/bot/bot_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //bloc,cubit
  sl.registerFactory<BotCubit>(
    //get new instance
    () => BotCubit(),
  );

  // //Usecase
  //Bot UseCase
  sl.registerFactory<GetAllBotsUseCase>(
      () => GetAllBotsUseCase(repository: sl.call()));

  sl.registerFactory<AddBotUseCase>(
      () => AddBotUseCase(repository: sl.call()));


  // Repository
  sl.registerFactory<BotRepository>(
      () => BotRepositoryImpl(remoteDataSource: sl.call()));

  // Remote datasource
  sl.registerFactory<BotModelRemoteDatasource>(
      () => BotModelRemoteDatasourceImpl());



}
