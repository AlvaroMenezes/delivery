import 'package:delivery/di/injection.dart';
import 'package:delivery/features/restaurant_list/data/model/restaurant_model.dart';
import 'package:delivery/features/restaurant_list/domain/entities/restaurant.dart';
import 'package:delivery/features/restaurant_list/domain/usecase/get_restaurants_usecase.dart';
import 'package:delivery/features/restaurant_list/presenter/bloc/restaurants_list_bloc.dart';
import 'package:delivery/features/restaurant_list/presenter/ui/restaurants_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class GetRestaurantsUseCaseMock extends Mock implements GetRestaurantsUseCase {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetRestaurantsUseCase useCase;
  late RestaurantsListBloc bloc;
  late Restaurant restaurant;
  late Widget app;
  setUp(() {
    app = MaterialApp(home: Scaffold(body: RestaurantList()));
    useCase = GetRestaurantsUseCaseMock();
    bloc = RestaurantsListBloc(useCase);
    setupDependenceInjection();
    GetIt.I.allowReassignment = true;
    GetIt.I.registerFactory<RestaurantsListBloc>(() => bloc);

    restaurant = RestaurantModel.fromJson({
      'name': 'A',
      'logo': 'B',
      'score': 'C',
      'colorScore': 'D',
      'delivery': 'E',
      'cousine': 'F',
      'photoPlate': 'G',
      'plateName': 'H',
      'description': 'I',
      'price': 'J'
    });

    when(useCase()).thenAnswer((_) async => [restaurant]);
  });

  tearDown(() {
    bloc.dispose();
  });

  testWidgets('Verify  visibility  fields', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle(Duration(milliseconds: 200));
    expect(find.byKey(Key('THUMB-LOGO')), findsOneWidget);
    expect(find.byKey(Key('NAME')), findsOneWidget);
    expect(find.byKey(Key('SCORE')), findsOneWidget);
    expect(find.byKey(Key('COUSINE')), findsOneWidget);
    expect(find.byKey(Key('CARD-ITEM-0')), findsOneWidget);
  });

  testWidgets('Verify fields content', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle(Duration(milliseconds: 200));

    Finder name = find.byKey(Key('NAME'));
    Text text = tester.firstWidget(name);

    expect(text.data, 'A');
    expect(text.style!.color, Color(0xFF090909));
    expect(text.style!.fontSize, 18);

    Finder thumb = find.byKey(Key('THUMB-LOGO'));
    FadeInImage image = tester.widget(thumb);
    expect(image.placeholder, AssetImage('assets/placeholder.png'));

    ///...
  });

  testWidgets('Select restaurant and open detail page',
      (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle(Duration(milliseconds: 200));

    Finder detail = find.byKey(Key('DETAIL-PAGE'));
    expect(detail, findsNothing);

    Finder card = find.byKey(Key('CARD-ITEM-0'));

    await tester.tap(card);
    await tester.pump();
    await tester.pump();

    Finder detailpage = find.byKey(Key('DETAIL-PAGE'));

    expect(detailpage, findsOneWidget);
  });
}
