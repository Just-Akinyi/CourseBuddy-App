// import 'package:coursebuddy/services/auth_service.dart';
// import 'package:coursebuddy/screens/login.dart'; // adjust path if needed
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// // Mock AuthService for testing
// class MockAuthService extends Mock implements AuthService {}

// void main() {
//   late MockAuthService mockAuthService;

//   setUp(() {
//     mockAuthService = MockAuthService();
//   });

//   testWidgets('LoginScreen shows sign-in button and triggers sign-in',
//       (tester) async {
//     // Inject the mock AuthService by subclassing LoginScreen or refactor for DI if needed
//     await tester.pumpWidget(
//       MaterialApp(
//         home: Builder(
//           builder: (context) {
//             return LoginScreenTestWrapper(authService: mockAuthService);
//           },
//         ),
//       ),
//     );

//     expect(find.text('Sign in with Google'), findsOneWidget);
//     expect(find.byType(SignInButton), findsOneWidget);

//     when(() => mockAuthService.signInWithGoogle(any()))
//         .thenAnswer((_) async => Future.value());

//     await tester.tap(find.byType(SignInButton));
//     await tester.pump(); // Start loading state

//     expect(find.text('Signing in...'), findsOneWidget);

//     verify(() => mockAuthService.signInWithGoogle(any())).called(1);
//   });
// }

// /// Helper widget to inject mock AuthService
// class LoginScreenTestWrapper extends StatefulWidget {
//   final AuthService authService;

//   const LoginScreenTestWrapper({Key? key, required this.authService})
//       : super(key: key);

//   @override
//   State<LoginScreenTestWrapper> createState() => _LoginScreenTestWrapperState();
// }

// class _LoginScreenTestWrapperState extends State<LoginScreenTestWrapper> {
//   bool _busy = false;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Center(
//         child: AbsorbPointer(
//           absorbing: _busy,
//           child: Opacity(
//             opacity: _busy ? 0.6 : 1,
//             child: SignInButton(
//               Buttons.google,
//               text: _busy ? "Signing in..." : "Sign in with Google",
//               onPressed: () async {
//                 if (_busy) return;
//                 setState(() => _busy = true);
//                 try {
//                   await widget.authService.signInWithGoogle(context);
//                 } finally {
//                   if (mounted) setState(() => _busy = false);
//                 }
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:flutter_test/flutter_test.dart';
// // import 'package:mocktail/mocktail.dart';
// // import 'package:sign_in_button/sign_in_button.dart';
// // import 'package:coursebuddy/services/auth_service.dart';
// // import 'package:coursebuddy/ui/login_screen.dart'; // adjust path if needed

// // class MockAuthService extends Mock implements AuthService {}

// // void main() {
// //   late MockAuthService mockAuthService;

// //   setUp(() {
// //     mockAuthService = MockAuthService();
// //   });

// //   testWidgets('LoginScreen shows button and triggers sign-in', (tester) async {
// //     when(() => mockAuthService.signInWithGoogle(any()))
// //         .thenAnswer((_) async => Future.value());

// //     await tester.pumpWidget(
// //       MaterialApp(
// //         home: LoginScreen(authService: mockAuthService),
// //       ),
// //     );

// //     expect(find.text('Sign in with Google'), findsOneWidget);
// //     expect(find.byType(SignInButton), findsOneWidget);

// //     await tester.tap(find.byType(SignInButton));
// //     await tester.pump(); // Trigger setState for _busy = true

// //     expect(find.text('Signing in...'), findsOneWidget);
// //     verify(() => mockAuthService.signInWithGoogle(any())).called(1);
// //   });
// // }
