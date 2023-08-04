import 'dart:convert';

import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/services/services.dart';
import 'package:nova_social/utils/utils.dart';

class StableDiffusionApiRepository {
  final _httpService = HttpService(
    baseUrl: AppEnvironment.getApiURL(
      apiType: AppKeyNames.stableDiffusionApi,
    ),
  );

  final _baseEndPoint = '/text2img';

  Future<Responser<RepoStableDiffusionApiTextToImageResponse>>
      textToImageStableDiffusion({
    required String inputText,
  }) async {
    final payload = RepoStableDiffusionApiTextToImageRequest(
      key: 'FxQsPEtTfZQ3Ql3k1WL8eggQm9Jw0Nmg7kfFCAxo55t0ImwsGA2UwZjKUGyB',
      prompt: inputText,
      width: '512',
      height: '512',
      samples: "1",
      numInferenceSteps: "20",
      seed: null,
      guidanceScale: 7.5,
      safetyChecker: "yes",
      webhook: null,
      trackId: null,
    ).toJson();
    payload.removeWhere((key, value) => value == null);
    try {
      var res = await _httpService.makePostRequest(
        _baseEndPoint,
        jsonEncode(payload),
      );
      final data = RepoStableDiffusionApiTextToImageResponse.fromJson(res);
      if (data.status != 'success') {
        return Responser(
          message: AppStrings.failure,
          isSuccess: false,
        );
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: data,
      );
    } catch (error) {
      return ErrorHandler.error(error);
    }
  }
}
