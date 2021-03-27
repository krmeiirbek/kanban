// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "approved" : MessageLookupByLibrary.simpleMessage("Approved"),
    "error_login" : MessageLookupByLibrary.simpleMessage("Minimum is 4 characters"),
    "error_password" : MessageLookupByLibrary.simpleMessage("Minimum is 8 characters"),
    "hint_login" : MessageLookupByLibrary.simpleMessage("Enter your login"),
    "hint_password" : MessageLookupByLibrary.simpleMessage("Enter your password"),
    "in_progress" : MessageLookupByLibrary.simpleMessage("In progress"),
    "log_in" : MessageLookupByLibrary.simpleMessage("Log in"),
    "login_failed" : MessageLookupByLibrary.simpleMessage("Login Failed"),
    "needs_review" : MessageLookupByLibrary.simpleMessage("Needs review"),
    "on_hold" : MessageLookupByLibrary.simpleMessage("On hold"),
    "title" : MessageLookupByLibrary.simpleMessage("Kanban")
  };
}
