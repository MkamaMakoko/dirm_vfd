import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/objects/_.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'resend_dialog.dart';
part 'delete_account_dialog.dart';

@RoutePage()
class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final textTheme = context.textTheme.bodyMedium;
    final state = ref.watch(userProvider);
    final value = state.value;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.medium(
            title: Text('Account Information'),
            actions: [
              // IconButton(
              //     onPressed: () {}, icon: const Icon(Icons.refresh_rounded)),
            ],
          ),
          if (value case UserInfo user)
            SliverList(
                delegate: SliverChildListDelegate.fixed([
              Card.outlined(
                margin: const EdgeInsets.all(edgeInsertValue / 2),
                child: Padding(
                  padding: const EdgeInsets.all(edgeInsertValue / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('User Information',
                          style: context.textTheme.titleMedium),
                      const SpaceBetween(),
                      Text('Email: ${user.email}', style: textTheme),
                      Text('Message: ${user.message}', style: textTheme),
                      Text('Status: ${user.status}', style: textTheme),
                      Text('Email: ${user.username}', style: textTheme),
                    ],
                  ),
                ),
              ),
              const SpaceBetween(times: .5),
              if (user.clientInformation.message.isNotEmpty) ...[
                Card.outlined(
                  margin: const EdgeInsets.all(edgeInsertValue / 2),
                  child: Padding(
                    padding: const EdgeInsets.all(edgeInsertValue / 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Client Message',
                            style: context.textTheme.titleMedium),
                        const SpaceBetween(),
                        Text('Message: ${user.clientInformation.message}',
                            style: textTheme),
                      ],
                    ),
                  ),
                ),
                const SpaceBetween(times: .5),
              ],
              Card.outlined(
                margin: const EdgeInsets.all(edgeInsertValue / 2),
                child: Padding(
                  padding: const EdgeInsets.all(edgeInsertValue / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Client Information',
                          style: context.textTheme.titleMedium),
                      const SpaceBetween(),
                      Text(
                          'Business name: ${user.clientInformation.businessName}',
                          style: textTheme),
                      Text('Client Id: ${user.clientInformation.clientId}',
                          style: textTheme),
                      Text('Email: ${user.clientInformation.email}',
                          style: textTheme),
                      Text('Mobile number: ${user.clientInformation.mobile}',
                          style: textTheme),
                      Text(
                          'Physical address: ${user.clientInformation.physicalAddress}',
                          style: textTheme),
                      Text('Region: ${user.clientInformation.region}',
                          style: textTheme),
                      Text('District: ${user.clientInformation.district}',
                          style: textTheme),
                      Text('Street: ${user.clientInformation.street}',
                          style: textTheme),
                      Text(
                          'Registration date: ${user.clientInformation.registrationDate}',
                          style: textTheme),
                      Text('Status: ${user.clientInformation.status}',
                          style: textTheme),
                      Text('Verified: ${user.clientInformation.verified}',
                          style: textTheme),
                    ],
                  ),
                ),
              ),
              const SpaceBetween(times: .5),
              ButtonBar(
                children: [
                  // FilledButton.icon(
                  //     onPressed: () => showAdaptiveDialog(
                  //         context: context,
                  //         builder: (context) => _ResendDialog(user.email)),
                  //     icon: const Icon(Icons.send_rounded),
                  //     label: const Text('Resend confrimation link')),
                  // FilledButton.tonalIcon(
                  //     onPressed: () {},
                  //     icon: const Icon(Icons.verified_rounded),
                  //     label: const Text('Check Email verification')),
                  FilledButton.icon(
                      onPressed: () => showAdaptiveDialog(
                          context: context,
                          builder: (context) => _DeleteDialog()),
                      icon: const Icon(Icons.delete_forever_rounded),
                      label: const Text('Delete account')),
                ],
              )
            ]))
        ],
      ),
    );
  }
}
