import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:my_store/features/main%20screen/domain/hive_services.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  List<Item> itemsList = [];
  HiveServices hiveServices;
  List<Item> filteredItems = [];

  SearchCubit({required this.hiveServices}) : super(SearchInitial());

  Future<void> init() async {
    try {
      hiveServices = HiveServices();
      itemsList = hiveServices.getItems();
    } catch (e) {
      print('Error retrieving items: $e');
    }
  }

  void search(String query) {
    if (query.isEmpty) {
      filteredItems = itemsList;
      emit(SearchLoaded(itemsList: itemsList));
    } else {
      filteredItems = itemsList.where((item) {
        return item.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
      }).toList();
      emit(SearchLoaded(itemsList: filteredItems));
    }
  }
}
