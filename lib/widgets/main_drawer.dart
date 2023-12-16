import 'package:flutter/material.dart';

class MaintainDrawer extends StatelessWidget {
  const MaintainDrawer({super.key, required this.onSelectScreen});
final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_rounded,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking up!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListTile( //optimised for outputting the items in a list
            leading: Icon(Icons.restaurant_rounded,color: Theme.of(context).colorScheme.onBackground,),
            title: Text('Meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,fontSize: 24),),
            onTap: () {onSelectScreen('meals');},
          ),
          ListTile( //optimised for outputting the items in a list
            leading: Icon(Icons.settings,color: Theme.of(context).colorScheme.onBackground,),
            title: Text('Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,fontSize: 24),),
            onTap: () {onSelectScreen('filters');},
          )
        ],
      ),
    );
  }
}
