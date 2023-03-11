import 'package:appwrite/appwrite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Global providers
/// **This file contains all the providers that are used in the entire app

///Appwrite Base Client provider
///This provider is used to setup the Appwrite Client
final appwriteClientProvider = Provider<Client>(
  name: 'appwriteClientProvider',
  (ref) => Client()
    ..setEndpoint('https://appwrite.koustav.dev/v1')
    ..setProject('6408b73727d253270c65')
    ..setSelfSigned(status: true),
);

///Appwrite Account provider
///This provider is used to access the Appwrite Account API
final appwriteAccountProvider = Provider<Account>(
  name: 'appwriteAccountProvider',
  (ref) => Account(ref.watch(appwriteClientProvider)),
);
