import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/features/auth/data/data_source/remote_data_source.dart';
import 'package:project_name/features/auth/data/repository/user_repository_impl.dart';
import 'package:project_name/features/auth/domain/user_repository.dart';
import 'package:project_name/features/auth/presentation/pages/login_page.dart';
import 'package:project_name/features/view_data/data/data_source/remote_data_source.dart';
import 'package:project_name/features/view_data/data/repository/schedule_repository_impl.dart';
import 'package:project_name/features/view_data/domain/schedule_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepositoryImpl(
              UserDataSource(baseUrl: 'http://192.168.8.137:3000')),
        ),
        RepositoryProvider<ScheduleRepository>(
          create: (context) => ScheduleRepositoryImpl(
            dataSource:
                ScheduleDataSource(baseUrl: 'http://192.168.8.137:3000'),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginScreen(),
      ),
    );
  }
}
