import '../model/sample_item.dart';
import '../model/sample_item_detail.dart';

class SampleService {
  Future<List<SampleItem>> getItems() async {
    // Consume API
    await Future.delayed(const Duration(seconds: 1));
    return const [SampleItem(1), SampleItem(2), SampleItem(3)];
  }

  Future<SampleItemDetail> getItemDetails(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    return SampleItemDetail(id, 'Sample');
  }
}
