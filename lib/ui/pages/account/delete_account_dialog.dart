part of 'page.dart';

class _DeleteDialog extends ConsumerWidget {
  final _controller = TextEditingController();
  _DeleteDialog();

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(deleteAccountProvider);
    final activeInputs = state is! AsyncLoading;
    // final value = state.value;
    void delete() =>
        ref.read(deleteAccountProvider.notifier).delete(_controller.text);
    final onDelete = activeInputs ? delete : null;

    ref.listen(deleteAccountProvider, (_, state) {
      if (state case AsyncError() || AsyncData(value: false)) {
        Navigator.pop(context);
        context.snackBar(message: 'Failed to delete account', error: true);
      }
    });

    return AlertDialog.adaptive(
      title: const Text('Delete account'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Are you sure you want to delete this account?'),
            const SpaceBetween(),
            TextField(
              autofocus: true,
              controller: _controller,
              maxLines: 5,
              minLines: 1,
              textInputAction: TextInputAction.done,
              onEditingComplete: onDelete,
              decoration: const InputDecoration(
                  labelText: 'Reason',
                  prefixIcon: Icon(Icons.short_text_rounded)),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: onDelete, child: const Text('Delete')),
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')),
      ],
    );
  }
}
