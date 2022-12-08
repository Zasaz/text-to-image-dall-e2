import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'imagerepository.dart';

final fetchImageProvider =
    FutureProvider.family.autoDispose((ref, String imageText) {
  final imageRepo = ref.watch(imageRepositoryProvider);
  return imageRepo.fetchImageData(imageText);
});
// @riverpod
// Future<ImageModel> fetchGeneratedImage(FetchGenImageRef ref, String imageText) {
//   final imageRepo = ref.watch(imageRepositoryProvider);
//   return imageRepo.fetchImageData(imageText);
// }
