import 'package:go_router/go_router.dart';
import 'package:studyvault/first_year_page/first_year_page.dart';
import 'package:studyvault/first_year_page/page_notes_section.dart';
import 'package:studyvault/landing_page.dart';
import 'package:studyvault/loadingscreen.dart';
import 'package:studyvault/splashscreen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const LandingPage(),
      ),
      GoRoute(
        path: '/IMPTOPIC',
        builder: (context, state) => const Loadingscreen(),
      ),
      GoRoute(
        path: '/comingsoon',
        builder: (context, state) => const Loadingscreen(),
      ),
       GoRoute(
        path: '/firstyearpage',
        builder: (context, state) => const FirstYearPage(),
      ),
      GoRoute(
        path: '/landingpage',
        builder: (context, state) => const LandingPage(),
      ),
        GoRoute(
        path: '/initialpage',
        builder: (context, state) => const FirstYearPage(),
      ),
      GoRoute(
        path: '/notespage',
        builder: (context, state) => const NotesSection(),
      ),
    ],
  );
}