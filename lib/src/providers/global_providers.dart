import 'package:appwrite/appwrite.dart';
import 'package:chamting_app/src/features/authentication/domain/models/user_model.dart';
import 'package:chamting_app/src/providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Global providers
/// **This file contains all the providers that are used in the entire app

/// User provider
final userProvider = StateNotifierProvider<UserNotifier, User>(
  name: 'userProvider',
  (ref) => UserNotifier(ref),
);

///Appwrite Client provider
///This provider is used to setup the Appwrite Client
final appwriteClientProvider = Provider<Client>((ref) {
  final client = Client();
  return client
    ..setEndpoint('https://appwrite.koustav.dev/v1')
    ..setProject('6408b73727d253270c65')
    ..setSelfSigned(status: true);
}, name: 'appwriteClientProvider');

///Appwrite Account provider
///This provider is used to access the Appwrite Account API
final appwriteAccountProvider = Provider<Account>((ref) {
  final client = ref.watch(appwriteClientProvider);
  return Account(client);
});
