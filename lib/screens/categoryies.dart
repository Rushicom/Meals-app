import 'package:flutter/material.dart';
import 'package:meals/data/dumy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoryiesScreen extends StatefulWidget {
  const CategoryiesScreen({
    super.key,
    // required this.onToggoleFaourite,
    required this.availableMeals,
  });

  // final void Function(Meal meal) onToggoleFaourite;
  final List<Meal> availableMeals;

  @override
  State<CategoryiesScreen> createState() => _CategoryiesScreenState();
}

class _CategoryiesScreenState extends State<CategoryiesScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      //to apply animation
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward(); // to play the animation.
  }

  @override
  void dispose() {
    // to dispost animation

    _animationController.dispose();
    super.dispose();
  }

  void _selectCategories(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          // onToggoleFaourite: onToggoleFaourite,
        ),
      ),
    ); // or Navigator.push(context, route)it also used. it is used to route the screen and push the screen it this widget user can also see the top most screeen. in the flutter navigation basically work with screen stacks
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // set the no of columns
            childAspectRatio: 3 / 2, // sizeing  of gridview items
            crossAxisSpacing: 20, // spacing between the column
            mainAxisSpacing: 20,
          ),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategories(context, category);
                },
              ),
          ],
        ),
        // builder: (context, child) => SlideTransition( //different approch
        //       position: _animationController.drive(
        //         Tween(
        //           begin: const Offset(0, 0.3),
        //           end: const Offset(0, 0),
        //         ),
        //       ),
        //       child: child,
        //     )

         builder: (context, child) => SlideTransition(
              position: Tween(
                  begin: const Offset(0, 0.3),
                  end: const Offset(0, 0),
                ).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceInOut)),// in this we use ecplicate animation
              child: child,
            )
        // Padding(
        //   padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
        //   child: child,
        // ),
        );
  }
}
