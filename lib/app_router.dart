import 'package:go_router/go_router.dart';
import 'features/auth/presentation/login_page.dart';
import 'features/auth/presentation/signup_page.dart';
// import 'features/posts/presentation/timeline_page.dart';

final router = GoRouter(
  routes: [
    // GoRoute(path: '/', builder: (context, state) => const TimelinePage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupPage()),
  ],
);
