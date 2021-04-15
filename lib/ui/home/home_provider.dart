import 'package:a_2_z_store/repositories/asosRepository.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  AsosRepository _asosRepository = AsosRepository();

  HomeProvider();
}
