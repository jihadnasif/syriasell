import 'package:syria_sell/core/class/StatusRequest.dart';

StatusRequest hindlingData(response) {
  if (response is StatusRequest) {
    return response;
  }

  if (response is Map && response['status'] == 'success') {
    return StatusRequest.success;
  }

  return StatusRequest.failure;
}
