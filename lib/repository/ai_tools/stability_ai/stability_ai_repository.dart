import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/services/services.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://api.stability.ai';
const apiKey = 'sk-P0F5L4GRNjc2ocPCF2wpUjFywTD4zmMRbNhYHiY44WRP5t2K';

class StabilityAiRepository {
  final _httpService = HttpService(
    baseUrl: AppEnvironment.getApiURL(
      apiType: AppKeyNames.stabilityAiApi,
    ),
    authToken: 'sk-P0F5L4GRNjc2ocPCF2wpUjFywTD4zmMRbNhYHiY44WRP5t2K',
  );
  final _baseEndPoint = '/v1/generation/stable-diffusion-v1-5/text-to-image';

  Future<Responser<String>> textToImageOpenJourney({
    required String inputText,
  }) async {
    try {
      print('Stability AI API CALL 1');

      var headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer sk-P0F5L4GRNjc2ocPCF2wpUjFywTD4zmMRbNhYHiY44WRP5t2K',
        'Cookie':
            '__cf_bm=g1aCe6yAYOiHhmFbLW2xeDKe3fcrHpP_BFWcJG7O5Ek-1682780362-0-AUGY9Ws8aTKZC9bp0psJbntd097qjgkhlCX8Wtc2SMWI6cu+UlDluvGhjE6Zm8lEqaTA1w2OtEl+SXC+mTqtlLE='
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://api.stability.ai/v1/generation/stable-diffusion-v1-5/text-to-image'));
      request.body = json.encode({
        "text_prompts": [
          {"text": inputText}
        ],
        "cfg_scale": 7,
        "clip_guidance_preset": "FAST_BLUE",
        "height": 512,
        "width": 512,
        "samples": 1,
        "steps": 30
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print('Stability AI API CALL PASS');
        final jsonData = await response.stream.bytesToString();
        final responseData = json.decode(jsonData);
        final base64 = responseData["artifacts"][0]['base64'];
        print('Stability AI API CALL PASS 1');
        print(base64);
        return base64;
      } else {
        print('Stability AI API CALL FAIL');

        print(response.reasonPhrase);
      }
      // print('Stability AI API CALL 1');

      // final payload = json.encode({
      //   "text_prompts": [
      //     {"text": "A"}
      //   ],
      //   "cfg_scale": 7,
      //   "clip_guidance_preset": "FAST_BLUE",
      //   "height": 512,
      //   "width": 512,
      //   "samples": 1,
      //   "steps": 30
      // });
      // // print(payload);
      // String url = '$baseUrl/v1/generation/stable-diffusion-v1-5/text-to-image';
      // var response = await http.post(
      //   Uri.parse(url),
      //   headers: {
      //     "Authorization": 'Bearer $apiKey',
      //     "Content-Type": "application/json",
      //     "Accept": "*/*"
      //   },
      //   body: payload,
      // );
      // var res = await _httpService.makePostRequest(
      //   _baseEndPoint,
      //   payload,
      //   needResponseData: true,
      // ) as Response;
      // print('Stability AI API CALL 002');

      // if (res.statusCode > 299) {
      //   print('Stability AI API CALL FAIL');

      //   return Responser(
      //     message: AppStrings.failure,
      //     isSuccess: false,
      //   );
      // }
      // print('Stability AI API CALL 004');

      // print(res.body);
      // print('Stability AI API CALL 005');

      // return Responser(
      //   message: AppStrings.success,
      //   isSuccess: true,
      //   data: res.bodyBytes,
      // );

      // Map jsonResponse = jsonDecode(response.body);

      // if (jsonResponse['error'] != null) {
      //   throw HttpException(jsonResponse['error']["message"]);
      // }
      // jsonResponse["choices"][index]["message"]["content"];
      // print('Stability AI API CALL 2');

      // print(jsonResponse);
      // print('Stability AI API CALL 3');

      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: null,
      );
    } catch (error) {
      return ErrorHandler.error(error);
    }
  }
}
