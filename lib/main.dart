import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradingapp_api_test/feature1/data/datasource/remote_data_source/api_remote_data_source_imp.dart';
import 'package:tradingapp_api_test/feature1/data/repositories/bot_repository_impl.dart';
import 'package:tradingapp_api_test/feature1/domin/respositories/bot_repository.dart';
import 'package:tradingapp_api_test/feature1/domin/usecases/add_bot.dart';
import 'package:tradingapp_api_test/feature1/domin/usecases/get_all_bots.dart';
import 'package:tradingapp_api_test/feature1/presentation/cubit/bot/bot_cubit.dart';
import 'package:tradingapp_api_test/routes.dart';
import 'injection_container.dart' as di;
import 'package:http/http.dart' as http;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const AppRoot());

}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
      providers: [
         BlocProvider<BotCubit>(create: (_) =>
             BotCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trading API Test',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        onGenerateRoute: Routers.generateRoute,

      ),
    );
  }
}
