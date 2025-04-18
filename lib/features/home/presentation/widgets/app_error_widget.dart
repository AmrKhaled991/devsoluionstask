import 'dart:io';
import 'dart:math';

import 'package:devsoluionstask/constent.dart';
import 'package:devsoluionstask/core/errors/cust0m_errors.dart';
import 'package:devsoluionstask/features/widgets/custom_elevated_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final Object? error;
  final String? message;
  final VoidCallback? tryAgain;

  const AppError({super.key, this.error, this.message, this.tryAgain});

  String get _errorMessage {
    if (error is DioException) {
      return ServerError.fromDioError(error as DioException).message;
    } else if (message != null) {
      return message!;
    } else if (error is SocketException) {
      return "Please check your internet connection";
    } else {
      return 'Error happened';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SelectableText(
                _errorMessage,
                textAlign: TextAlign.center,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (tryAgain != null) ...[
                const SizedBox(height: 10),
                CustomElevatedButton(
                  text: "Try Again",
                  onPressed: tryAgain,
                  buttonStyle: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(PRIMARY),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
