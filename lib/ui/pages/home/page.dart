import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/objects/_.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/routes/router.gr.dart';
import 'package:dirm_vfd/ui/widgets/search_anchor.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'menu_button.dart';
part 'drawer.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(userProvider, (_, state) {
      if (state case AsyncValue(value: null)) {
        context.router.replaceAll([const InitialRoute()]);
      }
    });
    return Scaffold(
      drawer: const _Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text(appTitle),
            leading: Builder(
                builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(Icons.person_rounded))),
            actions: const [AppSearchAnchor()],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(edgeInsertValue / 2),
            sliver: SliverGrid(
                delegate: SliverChildListDelegate.fixed([
                  const _BigMenuButton(
                    label: 'New receipt',
                    iconData: Icons.create_rounded,
                    route: NewReceiptRoute(),
                  ),
                  const _BigMenuButton(
                    label: 'My receipts',
                    iconData: Icons.receipt_long_rounded,
                    route: MyReceiptsRoute(),
                  ),
                  const _BigMenuButton(
                    label: 'Customers',
                    iconData: Icons.people_rounded,
                    route: CustomersRoute(),
                  ),
                  _BigMenuButton(
                    label: 'Products & Services',
                    iconData: Icons.shopping_cart_rounded,
                    route: ItemsRoute(pickMode: false),
                  ),
                  const _BigMenuButton(
                    label: 'Z Reports',
                    iconData: Icons.show_chart_rounded,
                    route: ZReportsRoute(),
                  ),
                  const _BigMenuButton(
                    label: 'My VFD',
                    iconData: Icons.print_rounded,
                    route: null,
                  ),
                ]),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: edgeInsertValue / 4,
                    crossAxisSpacing: edgeInsertValue / 4)),
          ),
        ],
      ),
    );
  }
}
