import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/image_repository.dart';
part 'imagerepository.g.dart';

@riverpod
ImageRepository imageRepository(ImageRepositoryRef ref) {
  return ImageRepository(ref);
}
