import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/routes/router.gr.dart';
import 'package:dirm_vfd/ui/widgets/in_button_progress_indicator.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class InitialSignUpPage extends ConsumerWidget {
  const InitialSignUpPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    const autoValidateMode = AutovalidateMode.onUserInteraction;
    ref.listen(signUpProvider, (_, state) {
      if (state case AsyncData(value: SignUpState(:final String message))) {
        showAdaptiveDialog(
            context: context,
            builder: (context) => AlertDialog.adaptive(
                  title: const Text('Registered'),
                  content: Text(message),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.router.navigate(const InitialLoginRoute());
                        },
                        child: const Text('Login'))
                  ],
                ));
      }
      if (state case AsyncError(:final error, :final stackTrace)) {
        if (kDebugMode) print(stackTrace);
        context.snackBar(message: error.toString(), error: true);
      }
    });
    final state = ref.watch(signUpProvider);
    final notifier = ref.watch(signUpProvider.notifier);
    final activeInputs = state is! AsyncLoading;
    final value = state.value;
    final canSubmit = (value?.canSubmit ?? false) && activeInputs;
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            autofocus: true,
            autovalidateMode: autoValidateMode,
            enabled: activeInputs,
            initialValue: value?.businessName,
            onChanged: notifier.changeBusinessName,
            validator: (_) => value?.nameValidator,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Business name',
              prefixIcon: Icon(Icons.business_rounded),
            ),
          ),
          const SpaceBetween(),
          TextFormField(
            autovalidateMode: autoValidateMode,
            enabled: activeInputs,
            initialValue: value?.tin,
            onChanged: notifier.changeTIN,
            validator: (_) => value?.tinValidator,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'TIN',
              prefixIcon: Icon(Icons.numbers_rounded),
            ),
          ),
          const SpaceBetween(),
          TextFormField(
            autovalidateMode: autoValidateMode,
            enabled: activeInputs,
            initialValue: value?.email,
            onChanged: notifier.changeEmail,
            validator: (_) => value?.emailValidator,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              prefixIcon: Icon(Icons.email_rounded),
            ),
          ),
          const SpaceBetween(),
          TextFormField(
            autovalidateMode: autoValidateMode,
            enabled: activeInputs,
            initialValue: value?.phoneNumber,
            onChanged: notifier.changePhoneNumber,
            validator: (_) => value?.phoneNumberValidator,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              prefixText: '+255',
              border: OutlineInputBorder(),
              labelText: 'Phone number',
              prefixIcon: Icon(Icons.contact_phone_rounded),
            ),
          ),
          const SpaceBetween(),
          TextFormField(
            autovalidateMode: autoValidateMode,
            enabled: activeInputs,
            initialValue: value?.password,
            onChanged: notifier.changePassword,
            validator: (_) => value?.passwordValidator,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              prefixIcon: Icon(Icons.key_rounded),
            ),
          ),
          const SpaceBetween(),
          TextFormField(
            autovalidateMode: autoValidateMode,
            enabled: activeInputs,
            initialValue: value?.confirmPassword,
            onChanged: notifier.changeConfirmPassword,
            validator: (_) => value?.confirmPasswordValidator,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            obscureText: true,
            onEditingComplete: canSubmit ? notifier.submit : null,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Confirm password',
              prefixIcon: Icon(Icons.key_rounded),
            ),
          ),
          const SpaceBetween(),
          SizedBox(
              width: double.maxFinite,
              child: FilledButton.icon(
                onPressed: canSubmit ? notifier.submit : null,
                label: Text(switch (state) {
                  AsyncError() => 'Retry',
                  AsyncLoading() => 'Please wait...',
                  _ => 'Sign up',
                }),
                icon: switch (state) {
                  AsyncLoading() => const InButtonProgressIndicator(),
                  _ => const Icon(Icons.login_rounded)
                },
              )),
          const SpaceBetween(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              // const SpaceBetween(times: .1),
              TextButton(
                  onPressed: activeInputs
                      ? () => context.router.navigate(const InitialLoginRoute())
                      : null,
                  child: const Text('Login'))
            ],
          )
        ],
      ),
    );
  }
}
