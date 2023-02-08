import 'package:bloc_sample/features/add_anime/view/add_anime_view.dart';
import 'package:bloc_sample/features/anime/view/anime_view.dart';
import 'package:bloc_sample/features/auth/view/login_view.dart';
import 'package:go_router/go_router.dart';


/// To Navigate anywhere to anywhere use [context.go(/animePage)]
/// to push the screen [context.push()]
/// to pop the screen [context.pop()]
/// to pushReplacement the screen [context.pushReplacement(/animePage)]
///https://codewithandrea.com/articles/flutter-navigation-gorouter-go-vs-push/

final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
        name: 'login'
    ),
    GoRoute(
        path: '/animeList', // root of the route
        builder: (context, state) => const AnimeScreen(),
        name: 'animePage'
    ),
    GoRoute(
        path: '/addAnime',
        builder: (context, state) => const AddAnimeScreen(),
        name: 'addAnime'
    ),

  ],
);