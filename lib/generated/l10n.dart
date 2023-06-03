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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Name`
  String get fieldName {
    return Intl.message(
      'Name',
      name: 'fieldName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get fieldEmail {
    return Intl.message(
      'Email',
      name: 'fieldEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get fieldPassword {
    return Intl.message(
      'Password',
      name: 'fieldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get fieldConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'fieldConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get fieldCode {
    return Intl.message(
      'Code',
      name: 'fieldCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enterTitle {
    return Intl.message(
      'Enter',
      name: 'enterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot password',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginTitle {
    return Intl.message(
      'Login',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email, we will send you a verification code.`
  String get forgotPasswordInstructions {
    return Intl.message(
      'Please enter your email, we will send you a verification code.',
      name: 'forgotPasswordInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get sendTitle {
    return Intl.message(
      'Send',
      name: 'sendTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the verification code and new password.`
  String get changePasswordInstructions {
    return Intl.message(
      'Please enter the verification code and new password.',
      name: 'changePasswordInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Password was changed successfully!`
  String get successChangePasswordTitle {
    return Intl.message(
      'Password was changed successfully!',
      name: 'successChangePasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Field {entityErrorMessage} is not valid`
  String entityErrorMessage(Object placeholders, Object entityErrorMessage) {
    return Intl.message(
      'Field $entityErrorMessage is not valid',
      name: 'entityErrorMessage',
      desc: '',
      args: [placeholders, entityErrorMessage],
    );
  }

  /// `List is empty, no items found for this request`
  String get emptyListErrorMessage {
    return Intl.message(
      'List is empty, no items found for this request',
      name: 'emptyListErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `{message}`
  String requestErrorMessage(Object placeholders, Object message) {
    return Intl.message(
      '$message',
      name: 'requestErrorMessage',
      desc: '',
      args: [placeholders, message],
    );
  }

  /// `No items found for {message}`
  String noItemsFoundErrorMessage(Object placeholders, Object message) {
    return Intl.message(
      'No items found for $message',
      name: 'noItemsFoundErrorMessage',
      desc: '',
      args: [placeholders, message],
    );
  }

  /// `{schema, select, codeDeliveryFailure{Failed to send code to email, please try again.} codeMismatch{Code provided is wrong, please try again.} invalidParameter{Some field filled in incorrectly.} usernameExists{There is already an account with this email.} notAuthorized{Incorrect username or password.} userNotConfirmed{Unconfirmed email, confirm it.} signedOut{Incorrect email or password.} limitExceeded{Too many attempts in a row, try again later.} invalidParameter{Email probably already confirmed.} tooManyFailedAttempts{Looks like you tried the code wrong too many times, get in touch.} userNotFound{We couldn't find this registered email.} internalError{We are experiencing internal issues, please try again later.} codeMismatch{Code provided is wrong, please try again.} other{An error occurred while confirming email.}}`
  String authErrorsSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'codeDeliveryFailure':
            'Failed to send code to email, please try again.',
        'codeMismatch': 'Code provided is wrong, please try again.',
        'invalidParameter': 'Some field filled in incorrectly.',
        'usernameExists': 'There is already an account with this email.',
        'notAuthorized': 'Incorrect username or password.',
        'userNotConfirmed': 'Unconfirmed email, confirm it.',
        'signedOut': 'Incorrect email or password.',
        'limitExceeded': 'Too many attempts in a row, try again later.',
        'tooManyFailedAttempts':
            'Looks like you tried the code wrong too many times, get in touch.',
        'userNotFound': 'We couldn\'t find this registered email.',
        'internalError':
            'We are experiencing internal issues, please try again later.',
        'other': 'An error occurred while confirming email.',
      },
      name: 'authErrorsSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `Required field.`
  String get requiredFieldAlert {
    return Intl.message(
      'Required field.',
      name: 'requiredFieldAlert',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email.`
  String get invalidEmailAlert {
    return Intl.message(
      'Invalid email.',
      name: 'invalidEmailAlert',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password.`
  String get invalidPasswordAlert {
    return Intl.message(
      'Invalid password.',
      name: 'invalidPasswordAlert',
      desc: '',
      args: [],
    );
  }

  /// `Invalid code.`
  String get invalidCodeAlert {
    return Intl.message(
      'Invalid code.',
      name: 'invalidCodeAlert',
      desc: '',
      args: [],
    );
  }

  /// `Passwords must be the same.`
  String get invalidEqualPasswordAlert {
    return Intl.message(
      'Passwords must be the same.',
      name: 'invalidEqualPasswordAlert',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
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
