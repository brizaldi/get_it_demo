import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/model/sample_item_detail.dart';
import '../../core/service/sample_service.dart';

class SampleDetailCubit extends Cubit<SampleItemDetail?> {
  SampleDetailCubit(this._service) : super(null);

  final SampleService _service;

  void fetch(int id) async {
    final item = await _service.getItemDetails(id);
    emit(item);
  }
}
