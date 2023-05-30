// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_BR locale. All the
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
  String get localeName => 'pt_BR';

  static String m0(schema) => "${Intl.select(schema, {
            'codeDeliveryFailure':
                'Falha ao enviar código para o e-mail, tente novamente.',
            'codeMismatch': 'Código fornecido está errado, tente novamente.',
            'invalidParameter': 'E-mail, provavelmente, já confirmado.',
            'usernameExists': 'Já existe um cadastro com este e-mail.',
            'notAuthorized': 'E-mail não confirmado, confirme-o.',
            'userNotConfirmed': 'E-mail não confirmado, confirme-o.',
            'signedOut': 'E-mail ou senha incorretos.',
            'limitExceeded':
                'Muitas tentativas em sequência, tente novamente mais tarde.',
            'tooManyFailedAttempts':
                'Parece que você tentou errou o código muitas vezes, entre em contato.',
            'userNotFound': 'Não encontramos este e-mail cadastrado.',
            'internalError':
                'Estamos com problemas internos, tente mais tarde.',
            'other': 'Ocorreu algum erro ao confirmar e-mail.',
          })}";

  static String m1(placeholders, entityErrorMessage) =>
      "Campo ${entityErrorMessage} não é válido";

  static String m2(placeholders, message) =>
      "Itens não encontrados para: ${message}";

  static String m3(placeholders, message) => "${message}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "authErrorsSchema": m0,
        "emptyListErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Lista vazia, itens não encontrados para essa requisição"),
        "entityErrorMessage": m1,
        "fieldEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "fieldInvalidEmail": MessageLookupByLibrary.simpleMessage(
            "O campo deve ser um endereço de e-mail válido"),
        "fieldInvalidId": MessageLookupByLibrary.simpleMessage(
            "O campo deve ser um número inteiro válido"),
        "fieldMinLength": MessageLookupByLibrary.simpleMessage(
            "O campo deve ter pelo menos 6 caracteres"),
        "fieldName": MessageLookupByLibrary.simpleMessage("Nome"),
        "fieldPassword": MessageLookupByLibrary.simpleMessage("Senha"),
        "fieldRequired":
            MessageLookupByLibrary.simpleMessage("Campo é obrigatório"),
        "invalidEmailAlert":
            MessageLookupByLibrary.simpleMessage("E-mail inválido."),
        "invalidPasswordAlert":
            MessageLookupByLibrary.simpleMessage("Senha inválida."),
        "noItemsFoundErrorMessage": m2,
        "requestErrorMessage": m3,
        "requiredFieldAlert":
            MessageLookupByLibrary.simpleMessage("Campo obrigatório.")
      };
}
