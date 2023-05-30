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

  static String m4(schema) => "${Intl.select(schema, {
            'APPROVED': 'Aprovado',
            'PENDING': 'Pendente',
            'REJECTED': 'Rejeitado',
            'other': 'Other',
          })}";

  static String m5(placeholders, successCreateUser) =>
      "Usuário ${successCreateUser} criado com sucesso";

  static String m6(placeholders, successDeleteUser) =>
      "Usuário ${successDeleteUser} deletado com sucesso";

  static String m7(placeholders, successUpdateUser) =>
      "Usuário ${successUpdateUser} updated com sucesso";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "authErrorsSchema": m0,
        "createPageTitle":
            MessageLookupByLibrary.simpleMessage("Crie um novo usuário"),
        "deletePageTitle":
            MessageLookupByLibrary.simpleMessage("Delete um usuário"),
        "deleteTitle": MessageLookupByLibrary.simpleMessage("Deletar"),
        "emptyListErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Lista vazia, itens não encontrados para essa requisição"),
        "entityErrorMessage": m1,
        "fieldEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "fieldHintEmail":
            MessageLookupByLibrary.simpleMessage("exemplo@exemplo.com"),
        "fieldHintId": MessageLookupByLibrary.simpleMessage(
            "Número de identificação do usuário"),
        "fieldHintName":
            MessageLookupByLibrary.simpleMessage("Gabriel de Godoy Braz"),
        "fieldId": MessageLookupByLibrary.simpleMessage("ID"),
        "fieldInvalidEmail": MessageLookupByLibrary.simpleMessage(
            "O campo deve ser um endereço de e-mail válido"),
        "fieldInvalidId": MessageLookupByLibrary.simpleMessage(
            "O campo deve ser um número inteiro válido"),
        "fieldMinLength": MessageLookupByLibrary.simpleMessage(
            "O campo deve ter pelo menos 6 caracteres"),
        "fieldName": MessageLookupByLibrary.simpleMessage("Nome"),
        "fieldRequired":
            MessageLookupByLibrary.simpleMessage("Campo é obrigatório"),
        "getPageTitle":
            MessageLookupByLibrary.simpleMessage("Procure um usuário"),
        "homePageSubtitle": MessageLookupByLibrary.simpleMessage(
            "Explore as funcionalidades do template:"),
        "homePageTitle": MessageLookupByLibrary.simpleMessage(
            "Bem-vindo ao Clean Flutter Template"),
        "invalidEmailAlert":
            MessageLookupByLibrary.simpleMessage("E-mail inválido."),
        "invalidPasswordAlert":
            MessageLookupByLibrary.simpleMessage("Senha inválida."),
        "noItemsFoundErrorMessage": m2,
        "registerTitle": MessageLookupByLibrary.simpleMessage("Cadastrar"),
        "requestErrorMessage": m3,
        "requiredFieldAlert":
            MessageLookupByLibrary.simpleMessage("Campo obrigatório."),
        "searchTitle": MessageLookupByLibrary.simpleMessage("Procurar"),
        "stateNameSchema": m4,
        "successCreateUser": m5,
        "successDeleteUser": m6,
        "successUpdateUser": m7,
        "updatePageTitle":
            MessageLookupByLibrary.simpleMessage("Dê update em um usuário"),
        "updateTitle": MessageLookupByLibrary.simpleMessage("Update")
      };
}
