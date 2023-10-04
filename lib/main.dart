import 'package:flutter/material.dart';
import 'package:findhappytails/authscreen/forgotpassword.dart';
import 'package:findhappytails/authscreen/signin.dart';
import 'package:findhappytails/bottomsheet/bottombar.dart';
import 'package:findhappytails/faq.dart';
import 'package:findhappytails/homescreen/addnewadress.dart';
import 'package:findhappytails/homescreen/adopt.dart';
import 'package:findhappytails/homescreen/checkoutscreen.dart';
import 'package:findhappytails/homescreen/popularviewall.dart';
import 'package:findhappytails/homescreen/setting.dart';
import 'package:findhappytails/homescreen/shoping.dart';
import 'package:findhappytails/homescreen/success.dart';
import 'package:findhappytails/notification.dart';
import 'package:findhappytails/onbonding/onbonding.dart';
import 'package:findhappytails/orderscreen/orderdetails.dart';
import 'package:findhappytails/orderscreen/orders.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:provider/provider.dart';

import 'authscreen/register.dart';
import 'pets/newpet.dart';
import 'pets/petdetailes.dart';
import 'pets/pets.dart';
import 'splash/plashscreen.dart';
import 'welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorNotifier()),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        routes: {
          '/Onbonding': (context) => const Onbonding(),
          '/Welcome': (context) => const Welcome(),
          '/SignIn': (context) => const SignIn(),
          '/Register': (context) => const Register(),
          '/Forgotpassword': (context) => const Forgotpassword(),
          '/Bottomhome': (context) => const Bottomhome(),
          '/Shopping': (context) => const Shoping(),
          '/ViewAll': (context) => const ViewAll(),
          '/Adopt': (context) => const Adopt(),
          '/CheckOut': (context) => const CheckOut(),
          '/Succsess': (context) => const Succsess(),
          '/OrderDetails': (context) => const OrderDetails(),
          '/PetDetails': (context) => const PetDetails(),
          '/NewPet': (context) => const NewPet(),
          '/AddNewAddress': (context) => const AddNewAddress(),
          '/Pets': (context) => const Pets(),
          '/Settings': (context) => const Settings(),
          '/FAQ': (context) => const FAQ(),
          '/Notif': (context) => const Notif(),
          '/Orders': (context) => const Orders(),
        },
        home: const SplashScreen(),
      ),
    );
  }
}
