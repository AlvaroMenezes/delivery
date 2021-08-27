import 'package:delivery/features/restaurant_list/domain/entities/restaurant.dart';
import 'package:delivery/features/restaurant_list/domain/usecase/get_restaurants_usecase.dart';
import 'package:delivery/features/restaurant_list/presenter/bloc/restaurants_list_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class GetRestaurantsUseCaseMock extends Mock implements GetRestaurantsUseCase {}

void main() async {
  late GetRestaurantsUseCase useCase;
  late RestaurantsListBloc bloc;
  setUp(() {
    useCase = GetRestaurantsUseCaseMock();
    bloc = RestaurantsListBloc(useCase);
  });

  group('Restaurants List Bloc', () {
    test('onLoadRestaurants should return list of restaurants', () async {
      List<Restaurant> list = [
        Restaurant('', '', '', '', '', '', '', '', '', '')
      ];

      when(useCase()).thenAnswer((_) async => list);

      expectLater(bloc.restaurants.length, 0);

      bloc.onLoadRestaurants();

      expectLater(bloc.stream, emits(true));

      bloc.stream.listen((e) {
        expect(e, true);
        expect(bloc.restaurants.length, 1);
      });
    });
  });

  tearDown(() {
    bloc.dispose();
  });
}
