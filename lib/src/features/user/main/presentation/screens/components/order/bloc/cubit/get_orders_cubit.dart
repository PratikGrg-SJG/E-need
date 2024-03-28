import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit() : super(GetOrdersState());
}
