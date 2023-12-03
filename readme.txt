for navigation to another screen and passing arguments without passing through the constructor
    => first: you have to define your route tables in main.dart file (your route names can be everything you want)
    => second: you have to call Navigator.of(context).pushNamed('your route name you want to move',{your arguments you want to passing})
       within a method that you triger onTap property. in this case is selectCategory method in category_item.dart file.
    => third: you have to give your arguments that has passed in the destination route by the help of 
       final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;. so you can extract and assign keys within
       routeArgs variable and access to the arguments.

some notes for avoidig route name mismatching:
    => first: instead of writing for example 'category_meal' for route name of CategoryMealScreen you can have a constant within the 
       CategoryMealScreen like this: static const routeName = 'category_meal'; 
    => second: access to the defined const within the main.dart file like this:
       CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
    => third: also you can achive the same way of getting route name inside the selectCategory method which is responsible for navigation
    => you can also have another file wich is just for your routes.(a dart file class with all your const route names)  

Removing home: property form MaterialApp inside the dart file:
    => first: you can have a default landing route in your routes which is responsible for moving to the home like this:
       '/' : (ctx) => your home screen

overflow:hidden in flutter
   => ClipRRect() is used for containing something inside itself.

using onUnknownRoute for undefined routes
   => if you want to redirect to for example 404 screen in case of not finding your desired route you can use this property in MaterialApp like this
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },

BottomNavigationBar example (sould be statefull) look at the tabs_screen.dart for sample
   => first: passing BottomNavigationBar inside your Scaffold as bottomNavigationBar property
   => second: pass your tabs you want to show in item property of bottomNavigationBar
   => third: this screen shoud be mark as your landing screen (main.dart file) and must be statefull because we want to change the content screen content based on 
      navigationBarItem indexes

