import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mapping/config/config.dart';
import 'package:mapping/core/initialization/initialization.dart';
import 'package:mapping/core/widget/app.dart';
import 'package:mapping/core/widget/app_error.dart';

void main() => runZonedGuarded<void>(
      () async {
        try {
          await $initializeApp();
        } on Object catch (error, stackTrace) {
          await getIt.get<ErrorHandler>().send(error, stackTrace);
          runApp(const AppError());
          return;
        }
        runApp(const App());
      },
      (Object error, StackTrace stackTrace) {
        getIt.get<ErrorHandler>().send(error, stackTrace);
      },
    );
