import 'package:cleanpotter/injection_container.dart';
import 'package:cleanpotter/presentation/screens/characters/bloc/characters_bloc.dart';
import 'package:cleanpotter/presentation/screens/characters/characters_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final routerManager = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            CharactersScreen(bloc: serviceLocator<CharactersBloc>()),
      ),
    ],
  );
}
