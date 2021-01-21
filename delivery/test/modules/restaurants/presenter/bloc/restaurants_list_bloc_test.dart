import 'package:delivery/modules/restaurants/domain/entities/restaurant.dart';
import 'package:delivery/modules/restaurants/domain/usecase/get_restaurants_usecase.dart';
import 'package:delivery/modules/restaurants/presenter/bloc/restaurants_list_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class GetRestaurantsUseCaseMock extends Mock implements GetRestaurantsUseCase {}

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  GetRestaurantsUseCaseMock useCaseMock;
  RestaurantsListBloc bloc;

  setUp(() {
    useCaseMock = GetRestaurantsUseCaseMock();
    bloc = RestaurantsListBloc(useCaseMock);
  });

  group('RestaurantsListBloc test', () {
    test('onLoadRestaurants should send true to stream', () async {
      List<Restaurant> list = [];
      when(useCaseMock()).thenAnswer((_) async => list);

      //    await expectLater( bloc.stream, emits(isA< bool >()));

      bloc.stream.listen((response) {
        expect(response, isA<bool>());
      });

      await bloc.onLoadRestaurants();
    });
  });
}
