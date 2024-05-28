part of 'page.dart';

class _BigMenuButton extends StatelessWidget {
  final String label;
  final IconData iconData;
  final PageRouteInfo? route;
  const _BigMenuButton(
      {required this.iconData, required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap:route!=null? () => context.router.push(route!):null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: edgeInsertValue * 4,
              color: context.colorScheme.primary,
            ),
            Text(label,
                style: context.textTheme.labelLarge,
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
