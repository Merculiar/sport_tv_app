import 'package:go_router/go_router.dart';
import 'package:sport_tv_app/router/routes.dart';
import 'package:sport_tv_app/screens/connect_screen.dart';
import 'package:sport_tv_app/screens/match_details_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/${Routes.connect.name}',
  redirect: (context, state) {
    return state.location;
  },
  routes: [
    GoRoute(
      path: '/${Routes.connect.name}',
      name: Routes.connect.name,
      builder: (context, state) => const ConnectScreen(),
    ),
    GoRoute(
      path: '/${Routes.matchDetails.name}',
      name: Routes.matchDetails.name,
      builder: (context, state) => const MatchDetailsScreen(),
    ),
  ],
);
