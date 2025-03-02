import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
    // required this.currentFilter,
  });

  // final Map<Filter, bool> currentFilter;
//   @override
// //   ConsumerState<FiltersScreen> createState() {
//     return _FiltersScreentState();
//   }
// }

// class _FiltersScreentState extends ConsumerState<FiltersScreen> {
//   var _glutenFreeFilterSet = false;
//   var _lactosFreeFilterSet = false;
//   var _vegiterianFreeFilterSet = false;
//   var _veganFreeFilterSet = false;

  // @override
  // void initState() {
  //   super.initState();
  //  final activeProvider = ref.read(filtersProvider);
  //   _glutenFreeFilterSet =activeProvider[Filter.glutenFree]!;
  //   _lactosFreeFilterSet = activeProvider[Filter.lactosFree]!;
  //   _vegiterianFreeFilterSet = activeProvider[Filter.vegiterian]!;
  //   _veganFreeFilterSet = activeProvider[Filter.vegan]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final activeFilter = ref.watch(filtersProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text("your Filters"),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifire) {
      //   Navigator.of(context).pop();
      //   if(identifire == 'meals'){
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const TabsScreen()));//to show the sidebar onfilter screent
      //   }
      // },),
      body:
      // PopScope(
      //   canPop: false,
      //   // ignore: deprecated_member_use
      //   onPopInvoked: (bool didPop) async {
      //     if (didPop) return ;
      //     ref.read(filtersProvider.notifier).setFilters(
      //       {
      //       Filter.glutenFree: _glutenFreeFilterSet,
      //       Filter.lactosFree: _lactosFreeFilterSet,
      //       Filter.vegiterian: _vegiterianFreeFilterSet,
      //       Filter.vegan: _veganFreeFilterSet,
      //     }
      //     );
      //     Navigator.of(context).pop(); 
      //   },

         Column(
          children: [
            SwitchListTile(
              value: activeFilter[Filter.glutenFree]!,
              onChanged: (isChecked) {
                // setState(() {
                //   _glutenFreeFilterSet = isChecked;
                // });

                ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);  
              },
              title: Text(
                'Gluten Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only Include gluten_free meals.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilter[Filter.lactosFree]!,
              onChanged: (isChecked) {
                // setState(() {
                //   _lactosFreeFilterSet = isChecked;
                // });

                ref.read(filtersProvider.notifier).setFilter(Filter.lactosFree, isChecked);
              },
              title: Text(
                'Lectos Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only Include lectos_free meals.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilter[Filter.vegiterian]!,
              onChanged: (isChecked) {
                // setState(() {
                //   _vegiterianFreeFilterSet = isChecked;
                // });
                ref.read(filtersProvider.notifier).setFilter(Filter.vegiterian, isChecked);
              },
              title: Text(
                'Vegiterian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only Include vegiterian meals.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilter[Filter.vegan]!,
              onChanged: (isChecked) {
                // setState(() {
                //   _veganFreeFilterSet = isChecked;
                // });
                ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only Include vegan meals.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      );
  }
}
