import 'package:chamting_app/src/providers/global_providers.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../src/app/constants/enums.dart';

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
    return Consumer(builder: (context, ref, child) {
      final status = ref.watch(connectivityNotifierProvider);
      return status.when(
        data: (status) {
          if (status == ConnectionStatus.online) {
            return onlineChild;
          } else {
            return offlineChild;
          }
        },
        loading: () => offlineChild,
        error: (error, stack) => offlineChild,
      );
    });
  }
}
