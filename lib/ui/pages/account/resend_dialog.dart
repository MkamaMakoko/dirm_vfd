part of 'page.dart';

class _ResendDialog extends ConsumerWidget {
  final String email;
  const _ResendDialog(this.email);

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(resendVerificationProvider(email: email), (_, state) {
      final message = switch (state) {
        AsyncData(value: true) => 'Email verification sent',
        AsyncData(value: false) || AsyncError() => 'Failed',
        _ => null,
      };
      if (message case String message) {
        context.snackBar(message: message, error: message == 'Failed');
        Navigator.pop(context);
      }
    });
    return AlertDialog.adaptive(
      title: const Text('Resending email verification...'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Sending email to $email'),
          const LinearProgressIndicator(),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'))
      ],
    );
  }
}
