import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyReceiptsPage extends StatelessWidget {
  const MyReceiptsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: const Text('My Receipts'),
            bottom: PreferredSize(
                preferredSize:
                    const Size(double.maxFinite, edgeInsertValue * 2),
                child: Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(
                        left: edgeInsertValue,
                        right: edgeInsertValue,
                        // top: edgeInsertValue,
                        bottom: edgeInsertValue / 1.5),
                    child: Text('177 receipts found',
                        style: context.textTheme.titleSmall))),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.clear_all_rounded)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.search_rounded)),
            ],
          ),
          SliverList.separated(
            separatorBuilder: (context, index) => const Divider(height: 0),
            itemCount: 200,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
                titleAlignment: ListTileTitleAlignment.center,
                isThreeLine: true,
                leading: CircleAvatar(
                    backgroundColor: context.colorScheme.secondaryContainer,
                    child: Text((index + 1).toString())),
                // trailing: const Text('Tsh 300,000.00'),
                title: const Text('KEVIN FRANCIS KAMBONA'),
                subtitle: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Tsh 300,000.00',
                      style: context.textTheme.labelLarge?.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: '\n2024-04-27 13:54:45',
                      style: context.textTheme.bodySmall),
                ])),
              );
            },
          )
        ],
      ),
    );
  }
}
