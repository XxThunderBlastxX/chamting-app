import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/user/user_bloc.dart';
import '../../../screens/register/register_view.dart';
import '../loading/loading.dart';
import 'chat.dart';
import 'chat_setting.dart';

class ChatBody extends NavigationBody {
  final int initialIndex;

  ChatBody({Key? key, required this.initialIndex})
      : super(
          key: key,
          index: initialIndex,
          children: [
            ScaffoldPage(
              header: PageHeader(
                title: const Text("ThunderBlast"),
                leading: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 0.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 28,
                  ),
                ),
              ),
              content: Chat(),
            ),
            ScaffoldPage(
              header: const PageHeader(
                title: Text("ThunderBlast"),
              ),
              content: Container(),
            ),
            BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserLoadingState) {
                  showDialog(
                      context: context, builder: (context) => LoadingWindow());
                } else if (state is UserSuccessSignOutState) {
                  Navigator.of(context)
                      .pushReplacementNamed(RegisterView.routeName);
                }
              },
              builder: (context, state) {
                return ScaffoldPage(
                  header: const PageHeader(
                    title: Text("Setting"),
                  ),
                  content: ChatSetting(
                    signOut: () =>
                        context.read<UserBloc>().add(UserSignOutEvent()),
                  ),
                );
              },
            ),
          ],
        );
}
