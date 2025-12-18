import 'package:dartz/dartz.dart';

abstract class ImageRepo {
  Future<Either<Error, String>> uploadImage(String imagePath);
}