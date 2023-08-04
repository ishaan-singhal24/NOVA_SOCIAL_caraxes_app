import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/repository/ai_tools/prodia/prodia_repository.dart';
import 'package:nova_social/utils/utils.dart';

class ProdiaNotifier with ChangeNotifier {
  late ProdiaRepository _prodiaRepository;
  RepoProdiaGetJobResponse? result;

  static ProdiaNotifier initialize(ProdiaRepository repo) {
    late ProdiaNotifier instance;
    try {
      instance = ProdiaNotifier();
    } catch (e) {
      Logger.logError('Initialization failed ProdiaNotifier', e);
      instance = ProdiaNotifier();
    }
    instance._prodiaRepository = repo;
    return instance;
  }

  Future<void> textToImageStableDiffusion({required String inputText}) async {
    final response =
        await _prodiaRepository.textToImageStableDiffusionCreateJob(
      inputText: inputText,
    );
    if (response.isSuccess) {
      String status = response.data?.status ?? 'queued';
      while (status != 'succeeded' && status != 'failed') {
        await Future.delayed(const Duration(seconds: 3), () async {
          final res = await _prodiaRepository.textToImageStableDiffusionGetJob(
            jobId: response.data?.job ?? '',
          );
          if (res.isSuccess) {
            status = res.data?.status ?? 'queued';
            if (status != 'queued') {
              result = res.data;
            }
          }
        });
        notifyListeners();
      }
    }
  }
}
