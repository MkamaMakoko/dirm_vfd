import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/routes/router.gr.dart';
import 'package:dirm_vfd/ui/widgets/in_button_progress_indicator.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class InitialLoginPage extends ConsumerWidget {
  static const autoValidateMode = AutovalidateMode.onUserInteraction;

  const InitialLoginPage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    ref.listen(loginProvider, (_, state) {
      if (state case AsyncError(:final error, :final stackTrace)) {
        print(stackTrace);
        context.snackBar(message: error.toString(), error: true);
      }
    });
    final state = ref.watch(loginProvider);
    final notifier = ref.watch(loginProvider.notifier);
    final activeInputs = state is! AsyncLoading;
    final value = state.value;
    final canSubmit = (value?.canSubmit ?? false) && activeInputs;
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: value?.email ?? '',
            onChanged: notifier.changeEmail,
            enabled: activeInputs,
            autovalidateMode: autoValidateMode,
            validator: (_) => value?.emailValidator,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              prefixIcon: Icon(Icons.alternate_email_rounded),
            ),
          ),
          const SpaceBetween(),
          TextFormField(
            initialValue: value?.password ?? '',
            onChanged: notifier.changePassword,
            enabled: activeInputs,
            autovalidateMode: autoValidateMode,
            validator: (_) => value?.passwordValidator,
            textInputAction: TextInputAction.done,
            onEditingComplete: canSubmit ? notifier.submit : null,
            maxLines: 1,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              prefixIcon: Icon(Icons.password_rounded),
            ),
          ),
          const SpaceBetween(),
          SizedBox(
              width: double.maxFinite,
              child: FilledButton.icon(
                onPressed: canSubmit ? notifier.submit : null,
                label: Text(switch (state) {
                  AsyncLoading() => 'Please wait...',
                  AsyncError() => 'Retry',
                  _ => 'Login'
                }),
                icon: switch (state) {
                  AsyncLoading() => const InButtonProgressIndicator(),
                  _ => const Icon(Icons.login_rounded),
                },
              )),
          const SpaceBetween(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account?'),
              // const SpaceBetween(times: .1),
              TextButton(
                  onPressed: activeInputs
                      ? () =>
                          context.router.navigate(const InitialSignUpRoute())
                      : null,
                  child: const Text('Sign up'))
            ],
          )
        ],
      ),
    );
  }
}
