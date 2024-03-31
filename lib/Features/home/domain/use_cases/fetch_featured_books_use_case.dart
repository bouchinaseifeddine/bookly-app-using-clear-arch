import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    // in this case we dont need the use case
    // but when we need to add extra code like (request permission / check for something ..)
    // we can add it here
    return homeRepo.fetchFeaturedBooks();
  }
}
