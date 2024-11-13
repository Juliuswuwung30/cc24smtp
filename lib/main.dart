import 'package:cc24smtp/registrationpage.dart';
import 'package:flutter/material.dart';
import 'package:cc24smtp/registrationsuccesfull.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'Registration Page',
      builder: (context, state) => const RegistrationPage(),
    ),
    GoRoute(
      path: '/success',
      name: 'Registration Successful',
      builder: (context, state) {
        var username = state.queryParams['username'].toString();
        var fullusername = state.queryParams['fullusername'].toString();
        var nim = state.queryParams['nim'].toString();

        return RegistrationSuccesfull(username: username, fullusername: fullusername, nim: nim);
      }),
  ]);

void main() {
  runApp(
    MaterialApp.router(routerConfig: router,)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'compro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );  
    }
}
