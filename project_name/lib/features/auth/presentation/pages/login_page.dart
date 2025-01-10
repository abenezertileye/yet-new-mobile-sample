import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/features/auth/presentation/bloc/user_bloc.dart';
import 'package:project_name/features/auth/presentation/bloc/user_event.dart';
import 'package:project_name/features/auth/presentation/bloc/user_state.dart';
import 'package:project_name/features/view_data/presentation/pages/root_page.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocProvider(
        create: (context) => UserBloc(RepositoryProvider.of(context)),
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login successful: ${state.response}')),
              );
              // Navigate to the root page
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => RootPage()),
              );
            } else if (state is UserFailure) {
              print(state.error);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.error}')),
              );
            }
          },
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final email = emailController.text;
                      final password = passwordController.text;
                      BlocProvider.of<UserBloc>(context).add(
                        UserLoginEvent(email, password),
                      );
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
