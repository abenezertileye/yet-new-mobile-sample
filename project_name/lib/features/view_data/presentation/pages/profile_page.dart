import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/features/view_data/presentation/bloc/schedule_bloc.dart';
import 'package:project_name/features/view_data/presentation/bloc/schedule_event.dart';
import 'package:project_name/features/view_data/presentation/bloc/schedule_state.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleBloc(RepositoryProvider.of(context))
        ..add(FetchUserDataEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: BlocBuilder<ScheduleBloc, ScheduleState>(
          builder: (context, state) {
            if (state is ScheduleLoading) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                ),
              );
            } else if (state is ScheduleLoaded) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/profile_picture.png'),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Abenezer T',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('e.com'),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Add your edit profile functionality here
                        },
                        child: Text('Edit Profile'),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ScheduleError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.red, size: 50),
                    SizedBox(height: 10),
                    Text('Error: ${state.message}',
                        style: TextStyle(fontSize: 18, color: Colors.red)),
                  ],
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_alarm, color: Colors.grey, size: 50),
                    SizedBox(height: 10),
                    Text('No schedules available.',
                        style: TextStyle(fontSize: 18, color: Colors.black54)),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
