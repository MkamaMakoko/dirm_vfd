part of 'page.dart';

class _Drawer extends ConsumerWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context, ref) {
    final userState = ref.watch(userProvider);
    const tileStyle = ListTileStyle.drawer;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisSize: MainAxisSize.min,
        children: [
          if (userState case AsyncValue(:final UserInfo value))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(edgeInsertValue / 2),
                  margin: const EdgeInsets.all(edgeInsertValue / 2),
                  decoration: BoxDecoration(
                    // border: Border.all(
                    //     color: context.colorScheme.secondaryContainer),
                    borderRadius: BorderRadius.circular(edgeInsertValue),
                    color:
                        context.colorScheme.secondaryContainer.withOpacity(.20),
                  ),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: edgeInsertValue * 2,
                              backgroundImage: value
                                      .clientInformation.logo.isEmpty
                                  ? null
                                  : NetworkImage(value.clientInformation.logo),
                              child: value.clientInformation.logo.isEmpty
                                  ? const Icon(Icons.person_rounded,
                                      size: edgeInsertValue * 2.5)
                                  : null,
                            ),
                            const SpaceBetween(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(value.clientInformation.businessName,
                                    style: context.textTheme.titleMedium),
                                Text(value.username,
                                    style: context.textTheme.labelMedium),
                                Text(value.clientInformation.email,
                                    style: context.textTheme.bodyMedium),
                              ],
                            ),
                          ],
                        ),
                        if (value.clientInformation.message.isNotEmpty) ...[
                          const SpaceBetween(times: 2),
                          Text('Message', style: context.textTheme.titleSmall),
                          Text(value.clientInformation.message)
                        ],
                        // Text(value.clientInformation.status),
                        // Text(value.message),
                        // Text(value.username),
                      ],
                    ),
                  ),
                ),
                ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      label: const Text('More'),
                      icon: const Icon(Icons.admin_panel_settings_rounded),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      label: const Text('Logout'),
                      icon: const Icon(Icons.logout_rounded),
                    ),
                  ],
                )
              ],
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const AboutListTile(icon: Icon(Icons.info_rounded)),
              ListTile(
                style: tileStyle,
                leading: const Icon(Icons.launch_rounded),
                title: const Text('Privacy policy'),
                onTap: () {},
              ),
              ListTile(
                style: tileStyle,
                leading: const Icon(Icons.launch_rounded),
                title: const Text('Terms & conditions'),
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  edgeInsertValue,
                  edgeInsertValue * 2,
                  edgeInsertValue,
                  edgeInsertValue,
                ),
                child: Text('DirmVFD | Smartest & Simpliest EFD',
                    style: context.textTheme.labelSmall),
              )
            ],
          )
        ],
      ),
    );
  }
}
