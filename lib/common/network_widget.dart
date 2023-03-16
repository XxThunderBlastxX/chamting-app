import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../src/app/constants/enums.dart';
import '../src/providers/global_providers.dart';

class ConnectivityWrapper extends StatelessWidget {
  final Widget onlineChild;
  final Widget offlineChild;
  const ConnectivityWrapper({
    Key? key,
    required this.onlineChild,
    required this.offlineChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      AsyncValue<ConnectionStatus> status =
          ref.watch(connectivityNotifierProvider);
      return status.when(
        data: (ConnectionStatus status) {
          if (status == ConnectionStatus.online) {
            return onlineChild;
          } else {
            return offlineChild;
          }
        },
        loading: () => offlineChild,
        error: (Object error, StackTrace stack) => offlineChild,
      );
    });
  }
}
