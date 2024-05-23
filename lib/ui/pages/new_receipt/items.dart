part of 'page.dart';

class _Items extends StatelessWidget {
  const _Items();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => const Divider(height: 0),
        itemCount: 3,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            trailing: IconButton(
                onPressed: () {}, icon: const Icon(Icons.clear_rounded)),
            title: const Text('VFD account & lamp printer'),
            subtitle: const Text('Lorem ipsum'),
            // onTap: () {},
          );
        });
  }
}
