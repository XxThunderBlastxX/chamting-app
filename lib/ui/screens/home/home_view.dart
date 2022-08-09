import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/connectivity/connectivity_bloc.dart';
import '../../../constants/constants.dart';
import '../../comman/widgets/chat/chat_app_bar.dart';
import '../../comman/widgets/chat/chat_body.dart';
import '../../comman/widgets/chat/chat_pane.dart';
import '../../comman/widgets/error_widget/internet_err.dart';
import '../../comman/widgets/windows_title_bar/windows_title_bar.dart';

class HomeView extends StatefulWidget {
  static const routeName = "/home";

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: EdgeInsets.zero,
      header: const WindowsTitleBar(),
      content: BlocListener<ConnectivityBloc, ConnectivityState>(
        listener: (context, state) {
          if (state is ConnectivityTrue) {
            setState(() => internetConnected = true);
          } else if (state is ConnectivityErr) {
            setState(() => internetConnected = false);
          }
        },
        child: BlocProvider.value(
          value: BlocProvider.of<ConnectivityBloc>(context)
            ..add(ConnectivityCheckEvent()),
          child: Stack(
            children: [
              internetConnected == false
                  ? const InternetInfoBar()
                  : const SizedBox(),
              NavigationView(
                appBar: ChatAppBar(),
                pane: ChatPane(
                  initialIndex: _initialIndex,
                  changeIndexFunc: (newIndex) =>
                      setState(() => _initialIndex = newIndex),
                ),
                content: ChatBody(initialIndex: _initialIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
