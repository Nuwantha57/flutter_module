import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'services/platform_channel_service.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/home/presentation/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Home Module',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: FutureBuilder<Map<String, dynamic>?>(
        future: PlatformChannelService().getUserDataFromNative(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasData && snapshot.data != null) {
            return BlocProvider(
              create: (_) => HomeCubit()..loadUserData(snapshot.data!),
              child: const HomeScreen(),
            );
          }

          return const Scaffold(
            body: Center(child: Text('No user data available')),
          );
        },
      ),
    );
  }
}
