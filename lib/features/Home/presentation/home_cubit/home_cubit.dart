import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:my_store/features/Home/domain/item_repository.dart';
import 'package:my_store/features/main%20screen/domain/hive_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<Item> itemsList = [];
  final HiveServices hiveServices; // Access the singleton
  late final Box<Item> itemsBox;
  late final ItemRepository repo;

  HomeCubit({required this.hiveServices}) : super(HomeStateInitial());

  Future<void> init() async {
    try {
      // itemsBox = await Hive.openBox<Item>('itemsBox');
      // await itemsBox.clear();
      emit(HomeStateLoading());
      repo = getIt<ItemRepository>();

      // Fetch items from repository
      itemsList = hiveServices.getItems();

      // Save fetched items to Hive
      for (Item item in itemsList) {
        await itemsBox.put(item.id, item);
      }

      // Emit loaded state with items list
      emit(HomeStateLoaded(itemsList: itemsList));
    } catch (e) {
      emit(const HomeStateError(message: 'Failed to load items'));
    }
  }
}
