// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(schema) => "${Intl.select(schema, {
            'codeDeliveryFailure':
                'Failed to send code to email, please try again.',
            'codeMismatch': 'Code provided is wrong, please try again.',
            'invalidParameter': 'Email probably already confirmed.',
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
          })}";

  static String m1(placeholders, entityErrorMessage) =>
      "Field ${entityErrorMessage} is not valid";

  static String m2(placeholders, message) => "No items found for ${message}";

  static String m3(placeholders, message) => "${message}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "authErrorsSchema": m0,
        "changePasswordInstructions": MessageLookupByLibrary.simpleMessage(
            "Please enter the verification code and new password."),
        "emptyListErrorMessage": MessageLookupByLibrary.simpleMessage(
            "List is empty, no items found for this request"),
        "enterTitle": MessageLookupByLibrary.simpleMessage("Enter"),
        "entityErrorMessage": m1,
        "fieldCode": MessageLookupByLibrary.simpleMessage("Code"),
        "fieldConfirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "fieldEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "fieldName": MessageLookupByLibrary.simpleMessage("Name"),
        "fieldPassword": MessageLookupByLibrary.simpleMessage("Password"),
        "forgotPasswordInstructions": MessageLookupByLibrary.simpleMessage(
            "Please enter your email, we will send you a verification code."),
        "forgotPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Forgot password"),
        "invalidCodeAlert":
            MessageLookupByLibrary.simpleMessage("Invalid code."),
        "invalidEmailAlert":
            MessageLookupByLibrary.simpleMessage("Invalid email."),
        "invalidEqualPasswordAlert":
            MessageLookupByLibrary.simpleMessage("Passwords must be the same."),
        "invalidPasswordAlert":
            MessageLookupByLibrary.simpleMessage("Invalid password."),
        "noItemsFoundErrorMessage": m2,
        "requestErrorMessage": m3,
        "requiredFieldAlert":
            MessageLookupByLibrary.simpleMessage("Required field."),
        "sendTitle": MessageLookupByLibrary.simpleMessage("Send")
      };
}
