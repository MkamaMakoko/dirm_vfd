part of 'page.dart';

class _SearchAnchor extends StatelessWidget {
  const _SearchAnchor();

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
        builder: (context, controller) {
          return const Padding(
            padding: EdgeInsets.all(edgeInsertValue),
            child: Icon(Icons.search_rounded),
          );
        },
        suggestionsBuilder: (context, controller) {
          return [
            for (int index = 0; index < 12; index++)
              ListTile(title: Text('Result number $index'))
          ];
        },
        viewHintText: 'Global search');
  }
}
