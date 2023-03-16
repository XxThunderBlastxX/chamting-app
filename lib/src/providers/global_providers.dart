import 'package:appwrite/appwrite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app/constants/enums.dart';
import 'connectivity_provider.dart';

/// Global providers
/// **This file contains all the providers that are used in the entire app

///Appwrite Base Client provider
///This provider is used to setup the Appwrite Client
final Provider<Client> appwriteClientProvider = Provider<Client>(
  name: 'appwriteClientProvider',
  (ProviderRef<Client> ref) => Client()
    ..setEndpoint('https://appwrite.koustav.dev/v1')
    ..setProject('6408b73727d253270c65')
    ..setSelfSigned(status: true),
);

///Appwrite Account provider
///This provider is used to access the Appwrite Account API
final Provider<Account> appwriteAccountProvider = Provider<Account>(
  name: 'appwriteAccountProvider',
  (ProviderRef<Account> ref) => Account(ref.watch(appwriteClientProvider)),
);

///Network notifier provider
///This provider is used to check the network status and notifies regarding any sort of change
///in the network status
///This provider is used in the [NetworkWidgetWrapper] widget
final StreamNotifierProvider<NetworkNotifier, ConnectionStatus>
    connectivityNotifierProvider =
    StreamNotifierProvider<NetworkNotifier, ConnectionStatus>(
  NetworkNotifier.new,
);
