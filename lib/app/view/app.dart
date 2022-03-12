// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quizzy/app/router/router.dart';
import 'package:quizzy/l10n/l10n.dart';
import 'package:quizzy/services/services.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      builder: (context, child) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => QuizService(),
          ),
          RepositoryProvider(
            create: (context) => ConnectivityService(),
          ),
        ],
        child: child!,
      ),
    );
  }
}
