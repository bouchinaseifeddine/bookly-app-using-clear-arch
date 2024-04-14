import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerBooksListViewBlocConsumer extends StatefulWidget {
  const BestSellerBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<BestSellerBooksListViewBlocConsumer> createState() =>
      _BestSellerBooksListViewBlocConsumerState();
}

class _BestSellerBooksListViewBlocConsumerState
    extends State<BestSellerBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return BestSellerListView(
            books: books,
          );
        } else if (state is NewestBooksFailure) {
          return Center(
            child: Text(state.errorMassage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
