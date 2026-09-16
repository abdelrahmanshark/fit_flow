import 'package:fit_flow/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeLanguageCubit extends Cubit<Locale> {
  ChangeLanguageCubit(super.initialLocale);

  Future<void> changeLanguage(Locale locale) async {
    await S.load(locale);
    emit(locale);
  }
}
