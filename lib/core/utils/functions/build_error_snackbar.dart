import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar(
    FeaturedBooksPaginationFailure state, BuildContext context) {
  return SnackBar(
    content: Row(
      children: <Widget>[
        const Icon(
          Icons.error_outline,
          color: Color.fromARGB(255, 158, 36, 28),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            state.errorMassage,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.white,
    duration: const Duration(seconds: 5),
    action: SnackBarAction(
      label: 'Close',
      textColor: Colors.black,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );
}
