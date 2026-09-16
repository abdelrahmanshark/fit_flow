// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `FitFlow`
  String get appName {
    return Intl.message('FitFlow', name: 'appName', desc: '', args: []);
  }

  /// `ارتقِ بحركتك`
  String get splashTagline {
    return Intl.message(
      'ارتقِ بحركتك',
      name: 'splashTagline',
      desc: '',
      args: [],
    );
  }

  /// `مدعوم من`
  String get splashPoweredBy {
    return Intl.message(
      'مدعوم من',
      name: 'splashPoweredBy',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get splashGoogle {
    return Intl.message('Google', name: 'splashGoogle', desc: '', args: []);
  }

  /// `اختر هدفك`
  String get onboardingSelectYourGoal {
    return Intl.message(
      'اختر هدفك',
      name: 'onboardingSelectYourGoal',
      desc: '',
      args: [],
    );
  }

  /// `خصّص رحلتك لأداء أدق.`
  String get onboardingCustomizeJourney {
    return Intl.message(
      'خصّص رحلتك لأداء أدق.',
      name: 'onboardingCustomizeJourney',
      desc: '',
      args: [],
    );
  }

  /// `بناء العضلات`
  String get onboardingGoalBuildMuscleTitle {
    return Intl.message(
      'بناء العضلات',
      name: 'onboardingGoalBuildMuscleTitle',
      desc: '',
      args: [],
    );
  }

  /// `التركيز على التضخم والقوة.`
  String get onboardingGoalBuildMuscleSubtitle {
    return Intl.message(
      'التركيز على التضخم والقوة.',
      name: 'onboardingGoalBuildMuscleSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `كن أقوى`
  String get onboardingGoalGetStrongTitle {
    return Intl.message(
      'كن أقوى',
      name: 'onboardingGoalGetStrongTitle',
      desc: '',
      args: [],
    );
  }

  /// `أعطِ الأولوية للرفع الثقيل والطاقة.`
  String get onboardingGoalGetStrongSubtitle {
    return Intl.message(
      'أعطِ الأولوية للرفع الثقيل والطاقة.',
      name: 'onboardingGoalGetStrongSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `لياقة عامة`
  String get onboardingGoalGeneralFitnessTitle {
    return Intl.message(
      'لياقة عامة',
      name: 'onboardingGoalGeneralFitnessTitle',
      desc: '',
      args: [],
    );
  }

  /// `صحة متوازنة ومرونة.`
  String get onboardingGoalGeneralFitnessSubtitle {
    return Intl.message(
      'صحة متوازنة ومرونة.',
      name: 'onboardingGoalGeneralFitnessSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `التوفر الأسبوعي`
  String get onboardingWeeklyAvailability {
    return Intl.message(
      'التوفر الأسبوعي',
      name: 'onboardingWeeklyAvailability',
      desc: '',
      args: [],
    );
  }

  /// `يومان`
  String get onboardingDays2 {
    return Intl.message('يومان', name: 'onboardingDays2', desc: '', args: []);
  }

  /// `٣ أيام`
  String get onboardingDays3 {
    return Intl.message('٣ أيام', name: 'onboardingDays3', desc: '', args: []);
  }

  /// `٤ أيام`
  String get onboardingDays4 {
    return Intl.message('٤ أيام', name: 'onboardingDays4', desc: '', args: []);
  }

  /// `٥+ أيام`
  String get onboardingDays5Plus {
    return Intl.message(
      '٥+ أيام',
      name: 'onboardingDays5Plus',
      desc: '',
      args: [],
    );
  }

  /// `موصى به`
  String get onboardingRecommended {
    return Intl.message(
      'موصى به',
      name: 'onboardingRecommended',
      desc: '',
      args: [],
    );
  }

  /// `دورة تعافٍ مثالية`
  String get onboardingOptimalRecovery {
    return Intl.message(
      'دورة تعافٍ مثالية',
      name: 'onboardingOptimalRecovery',
      desc: '',
      args: [],
    );
  }

  /// `متابعة`
  String get onboardingContinue {
    return Intl.message(
      'متابعة',
      name: 'onboardingContinue',
      desc: '',
      args: [],
    );
  }

  /// `يمكنك تغيير هذا لاحقًا من الملف الشخصي`
  String get onboardingChangeLater {
    return Intl.message(
      'يمكنك تغيير هذا لاحقًا من الملف الشخصي',
      name: 'onboardingChangeLater',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get languageEnglish {
    return Intl.message('English', name: 'languageEnglish', desc: '', args: []);
  }

  /// `العربية`
  String get languageArabic {
    return Intl.message('العربية', name: 'languageArabic', desc: '', args: []);
  }

  /// `اللغة`
  String get languageTooltip {
    return Intl.message('اللغة', name: 'languageTooltip', desc: '', args: []);
  }

  /// `EN`
  String get languageLabelEn {
    return Intl.message('EN', name: 'languageLabelEn', desc: '', args: []);
  }

  /// `AR`
  String get languageLabelAr {
    return Intl.message('AR', name: 'languageLabelAr', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
