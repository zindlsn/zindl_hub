import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:zindl_hub/0_data/models/trello_card.dart';

class TrelloRepository {
  String token =
      "a68203c8cace37478811e0556206336bf8f5061ca920d52387181ff68d5cea27";
  String key = "161f0491e308fd704589a93b6cea4128";
  final String _trelloBaseUrl = "api.trello.com";
  late Map<String, dynamic>? parameters;

  late Uri _allTrelloBoardsUrl;
/*
  final String _trelloBoard =
      "https://api.trello.com/1/actions/0pURCUG3/happy-life";
  final String _apiKey = "29c7bdb83c1e045ac588332dd3201d95";
*/
  static Client? _client;

  /// All boards:
  ///
  /// https://api.trello.com/1/members/me/boards/5d7bb3735e6e7611192ce08f/board?key=161f0491e308fd704589a93b6cea4128&token=a68203c8cace37478811e0556206336bf8f5061ca920d52387181ff68d5cea27
  ///
  Future<Response> connectAsync() async {
    parameters = {"token": token, "key": key};
    _allTrelloBoardsUrl =
        Uri.https(_trelloBaseUrl, "/1/members/me/boards", parameters);

    Client client = Client();
    return await _connectAsync(client);
  }

  Future<Response> _connectAsync(Client client) async {
    return await client.get(_allTrelloBoardsUrl);
  }

  Future<TrelloCard> getTrelloCardById(String id) async {
    _client ??= Client();
    parameters = {"token": token, "key": key};
    var getCardUrl = Uri.https(_trelloBaseUrl, "1/cards/$id", parameters);
    final response = await _client!.get(getCardUrl);
    return TrelloCard.fromJson(json.decode(response.body));
  }
}

/*
    return HttpClientResponse().statusCode = 
    try {
      client.getUrl(Uri.https(_trelloBoard)).then((HttpClientRequest request) {
        request.headers.add("key", _apiKey);
        return request.close();
      }).then((HttpClientResponse response) {
        var resp = response.statusCode;
        log(resp.toString());
        return resp;
      });
    } catch (e) {
      log(e.toString());
      return Future.value();
    }
  }*/