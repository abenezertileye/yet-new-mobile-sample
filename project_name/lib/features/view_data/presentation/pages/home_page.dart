import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/features/view_data/data/data_source/remote_data_source.dart';
import 'package:project_name/features/view_data/data/repository/schedule_repository_impl.dart';
import 'package:project_name/features/view_data/presentation/bloc/schedule_bloc.dart';
import 'package:project_name/features/view_data/presentation/bloc/schedule_event.dart';
import 'package:project_name/features/view_data/presentation/bloc/schedule_state.dart';
import 'package:project_name/features/view_data/presentation/pages/widgets/schedule_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleBloc(RepositoryProvider.of(context))
        ..add(FetchSchedulesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Schedules',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.blueAccent,
          elevation: 4.0,
        ),
        body: BlocBuilder<ScheduleBloc, ScheduleState>(
          builder: (context, state) {
            if (state is ScheduleLoading) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                ),
              );
            } else if (state is ScheduleLoaded) {
              return ListView.builder(
                itemCount: state.schedules.length,
                itemBuilder: (context, index) {
                  final schedule = state.schedules[index];
                  print('schedule: ${schedule}');
                  return ScheduleCard(
                    schedule: schedule,
                  );
                },
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
