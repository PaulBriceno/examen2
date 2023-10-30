import 'package:examen_paul_briceno/screens/m_categorias_screen.dart';
import 'package:examen_paul_briceno/screens/m_productos_screen.dart';
import 'package:examen_paul_briceno/screens/m_proveedores_screen.dart';
import 'package:examen_paul_briceno/screens/screens.dart';
import 'package:examen_paul_briceno/screens/login_screen.dart';
import 'package:examen_paul_briceno/screens/signup_screen.dart';
import 'package:examen_paul_briceno/screens/home_page.dart';
import 'package:get/get.dart';
import 'package:examen_paul_briceno/screens/x_productos.dart';

var pages = [
  GetPage(// Vamos a la pagina de login
    name: "/login",
    page: () => LoginScreen(),
  ),
  GetPage(// Vamos a la pagina de registro
    name: "/signup",
    page: () => SignupScreen(),
  ),
    GetPage(// Vamos a la pagina inicial
    name: "/home",
    page: () => HomePage(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 500),
  ),

      GetPage(// Vamos a la pagina Proveedores
    name: "/MProveedoresScreen",
    page: () => MProveedoresScreen(),
    transition: Transition.rightToLeftWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),

      GetPage(// Vamos a la pagina Categorias
    name: "/MCategoriasScreen",
    page: () => MCategoriasScreen(),
    transition: Transition.rightToLeftWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),

      GetPage(// Vamos a la pagina Productos
    name: "/MProductosScreen",
    page: () => MProductosScreen(),
    transition: Transition.rightToLeftWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
];