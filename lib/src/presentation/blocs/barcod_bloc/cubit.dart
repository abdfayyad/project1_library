import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app1111/src/presentation/blocs/barcod_bloc/states.dart';

class BarCodeCubit extends Cubit<BarCodeStates>{
  BarCodeCubit() : super(BarCodeIniatialState());

  static BarCodeCubit get(context)=>BlocProvider.of(context);

}