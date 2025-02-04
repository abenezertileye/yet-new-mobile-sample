import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/features/auth/presentation/bloc/user_bloc.dart';
import 'package:project_name/features/auth/presentation/bloc/user_event.dart';
import 'package:project_name/features/auth/presentation/bloc/user_state.dart';
import 'package:project_name/features/view_data/presentation/pages/root_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/features/auth/presentation/bloc/user_bloc.dart';
import 'package:project_name/features/auth/presentation/bloc/user_event.dart';
import 'package:project_name/features/auth/presentation/bloc/user_state.dart';
import 'package:project_name/features/view_data/presentation/pages/root_page.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: BlocProvider(
        create: (context) => UserBloc(RepositoryProvider.of(context)),
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Signup successful: ${state.response}')),
              );
              // Navigate to the root page
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => RootPage()),
              );
            } else if (state is UserFailure) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: firstNameController,
                    decoration: const InputDecoration(labelText: 'First Name'),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: lastNameController,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final firstName = firstNameController.text.trim();
                        final lastName = lastNameController.text.trim();
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();

                        BlocProvider.of<UserBloc>(context).add(
                          UserSignupEvent(firstName, lastName, email, password),
                        );
                      },
                      child: const Text('Sign Up'),
                    ),
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
