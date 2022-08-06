import 'package:fluent_ui/fluent_ui.dart';

import '../../comman/textStyles/heading_text_style.dart';
import '../../comman/textStyles/text_style.dart';
import '../../comman/widgets/windows_title_bar/windows_title_bar.dart';
import '../../constants/constants.dart';

class HomeView extends StatefulWidget {
  static const routeName = "/home";

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _initialIndex = 0;

  FlyoutController flyoutController = FlyoutController();

  @override
  void dispose() {
    flyoutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: EdgeInsets.zero,
      header: const WindowsTitleBar(),
      content: NavigationView(
        appBar: NavigationAppBar(
          automaticallyImplyLeading: false,
          height: 45,
          actions: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Flyout(
              controller: flyoutController,
              child: IconButton(
                icon: const Icon(
                  FluentIcons.density_default,
                  size: 18.0,
                ),
                onPressed: () => flyoutController.open(),
              ),
              content: (context) {
                return FlyoutContent(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Button(
                          child: const Text("Signout"),
                          onPressed: () {
                            //TODO : implement signout functionality
                            flyoutController.close();
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 8.0),
            child: Text(
              "Chamting",
              style: HeadingTextStyle(
                size: TextSize.large,
                weight: FontWeight.w600,
              ),
            ),
          ),
        ),
        pane: NavigationPane(
          displayMode: PaneDisplayMode.auto,
          selected: _initialIndex,
          onChanged: (val) => setState(() {
            _initialIndex = val;
          }),
          header: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextBox(
              placeholder: "Search",
              decoration: BoxDecoration(color: kTealLight50),
            ),
          ),
          items: [
            PaneItemSeparator(),
            PaneItem(
              selectedTileColor: ButtonState.all(kTealLight),
              icon: const Icon(FluentIcons.people),
              title: const Text('ThunderBlast'),
              infoBadge: const InfoBadge(
                source: Text('2'),
              ),
            ),
            PaneItem(
              selectedTileColor: ButtonState.all(kTealLight),
              icon: const Icon(FluentIcons.people),
              title: const Text('ThunderBlast'),
              infoBadge: const InfoBadge(
                source: Text('9'),
              ),
            ),
          ],
          menuButton: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: const Icon(FluentIcons.add_friend),
              iconButtonMode: IconButtonMode.large,
              onPressed: () {},
              style: ButtonStyle(
                iconSize: ButtonState.all(16.0),
                backgroundColor: ButtonState.all(kTealLight50),
                elevation: ButtonState.all(1.5),
              ),
            ),
          ),
          footerItems: [
            PaneItemSeparator(),
            PaneItem(
              icon: const Icon(FluentIcons.settings),
              title: const Text("Setting"),
            )
          ],
        ),
        content: NavigationBody(
          index: _initialIndex,
          children: [
            ScaffoldPage(
              header: const PageHeader(
                title: Text("ThunderBlast"),
              ),
              content: Container(),
            ),
            ScaffoldPage(
              header: const PageHeader(
                title: Text("ThunderBlast"),
              ),
              content: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
