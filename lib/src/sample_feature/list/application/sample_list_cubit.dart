import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/model/sample_item.dart';
import '../../core/service/sample_service.dart';

class SampleListCubit extends Cubit<List<SampleItem>> {
  SampleListCubit(this._service) : super(<SampleItem>[]);

  final SampleService _service;

  void fetch() async {
    final items = await _service.getItems();
    emit(items);
  }
}
