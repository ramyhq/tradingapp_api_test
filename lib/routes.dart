import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradingapp_api_test/feature1/presentation/cubit/bot/bot_cubit.dart';
import 'package:tradingapp_api_test/feature1/presentation/pages/add_bot_page.dart';
import 'package:tradingapp_api_test/feature1/presentation/pages/home_page.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(
              builder: (_) => HomePage());
        }

      case 'add_bots_page':
        {
          return MaterialPageRoute(
              builder: (_) => AddBotsPage());
        }

      default:
        return MaterialPageRoute(builder: (_) => const ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body: const Center(
        child: Text('Error Page '),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget  {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getting Bots...'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

