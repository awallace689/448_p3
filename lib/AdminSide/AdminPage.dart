import 'package:flutter/material.dart';
import 'package:project4/UserSide/Home.dart';
import 'package:project4/UserSide/Myshop.dart';
import 'AppointmentPage.dart';
import 'Contacts.dart';

/// When user login page chooses to display admin page, this is the main stateful widget
/// that is controlling all the activities in administration page.
class AdminPage extends StatefulWidget {

  AdminPage({Key key, this.title}) : super(key: key);


  final String title; 

  @override

  /// Create a stateful obejct that will be mounted in the element tree.
  _AdminPageState createState() => _AdminPageState();
}

///Contains the contents of the admin page.
class _AdminPageState extends State<AdminPage> {

  /// The current tap of the navigation bar.
  int _selectedIndex = 0;

  /// Holds all the constrcutors of different taps' widgets.
  final _widgetOptions = [AppointmentPage(), Myshop(), ContactsPage()];

  /// Retruns a widget based on the current index of the navigation bar
  /// that belongs to a specific tap.
  _handleTap(int index) {

    return(_widgetOptions.elementAt(index));
  }

  /// Marks and triggers the build function to re-render the page,
  /// and update  _selectedIndex to the index the user just taps.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// This method is rerun every time setState is called, for instance as done
  /// by the _incrementCounter method above.
  ///
  /// The Flutter framework has been optimized to make rerunning build methods
  /// fast, so that you can just rebuild anything that needs updating rather
  /// than having to individually change instances of widgets.
  @override
  Widget build(BuildContext context) {

    /// Returns a scaffold widget that provides a layout structure for different
    /// pages.
    return Scaffold(


      /// One of the property belongs to the scaffold widget constructor,
      /// and it takes a center widget which then render a widget returned by
      /// the _handleTap function as its child property.
      body: Center(child: _handleTap(_selectedIndex)),

      ///One of the property belongs to the sacffold widget constructor,
      /// and it adds a navigation bar to the bottom of the page.
      bottomNavigationBar : BottomNavigationBar(

        ///Needs to be specified when more than 3 taps are being used.
        type:BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[

          ///Displays a tap with a built in calendar icon with the text Appoinment.
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), title: Text('Appointment')),

          ///Displays a tap with a built in info icon with the text My shop.
          BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('My shop')),

          ///Displays a tap with a built in contact calendar icon with the text Contacts.
          BottomNavigationBarItem(icon: Icon(Icons.perm_contact_calendar), title: Text('Contacts')),
        ],

        /// One onf the property of the BottomNavigationBar widget constructor,
        /// it places color on the taps' icons based on the _selectedIndex.
        currentIndex: _selectedIndex,

        /// One onf the property of the BottomNavigationBar widget constructor,
        /// tap is being displayed in red.
        fixedColor: Colors.red,

        /// One onf the property of the BottomNavigationBar widget constructor,
        /// it senses the tap action by the user and call the function
        /// _onItemTapped.
        onTap: _onItemTapped,
      ),
    );
  }
}
