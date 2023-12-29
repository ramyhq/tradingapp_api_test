import 'package:dartz/dartz.dart';
import 'package:tradingapp_api_test/commons/failure/failure.dart';
import 'package:tradingapp_api_test/feature1/data/datasource/remote_data_source/api_remote_data_source.dart';
import 'package:tradingapp_api_test/feature1/data/models/bot_model.dart';
import 'package:tradingapp_api_test/feature1/domin/respositories/bot_repository.dart';

class BotRepositoryImpl implements BotRepository {
  final BotModelRemoteDatasource remoteDataSource;

  BotRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BotModel>>> fetchAllBots() async {

    try {
      final allBotsList = await remoteDataSource.fetchAllBots();
      return Right(allBotsList);
    } catch (e) {
      return Left(ServerFailure(
          message:
              'Failure in BotRepositoryImpl >> getAllBots() and MESSAGE IS:${e.toString()}'));
    }


  }

  @override
  Future<Either<Failure, Map<String,dynamic>>> addBot(Map<String, dynamic> data) async {
    try {

      final allBotsList = await remoteDataSource.addBot( data);
      return Right(allBotsList);
    } catch (e) {
      return Left(ServerFailure(
          message:
          'Failure in BotRepositoryImpl >> getAllBots() and MESSAGE IS:${e.toString()}'));
    }


  }


}
