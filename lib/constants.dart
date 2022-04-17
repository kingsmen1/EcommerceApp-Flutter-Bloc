import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//bloc loading
Center loading(){
  return const Center(child: CircularProgressIndicator(),);
}

//bloc error
Text error (){
  return const Text('Something went wrong');
}