import 'package:bloc/bloc.dart';
import 'package:bloc_sample/service/api_state.dart';


class AddAnimeCubit extends Cubit<APIState> {
  AddAnimeCubit() : super(AppEventInitial());
}
