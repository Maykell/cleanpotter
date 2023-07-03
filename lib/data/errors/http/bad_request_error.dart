import 'package:cleanpotter/data/errors/http/base_http_error.dart';

class BadRequestError extends HttpError {
  BadRequestError({super.message = 'a bad request occurs'});
}
