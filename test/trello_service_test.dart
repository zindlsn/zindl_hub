import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:zindl_hub/1_domain/repositories/trello_repository.dart';

//import 'trello_service_test.mocks.dart';

class MockTrelloService extends TrelloRepository {}

late MockTrelloService mockTrelloService;
//late MockClient mockClient;

@GenerateMocks([Client])
void main() {
  setUp(() => () {
        //mockClient = MockClient();
        //mockTrelloService = MockTrelloService();
      });

  expect(1, 1);
}
