import 'package:cleanpotter/data/errors/http/base_http_error.dart';

class InternalServerError extends HttpError {
  InternalServerError({super.message = 'a internal server error occours'});
}
