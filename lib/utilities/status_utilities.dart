import 'package:flutter/material.dart';
import 'package:flutter_practise_user_firebase/models/request/request_status_model.dart';
import 'package:flutter_practise_user_firebase/widgets/common/loading_indicator_dialog_widget.dart';

class StatusUtilities {
  static void handleStatus(BuildContext context, RequestStatus status) {
    handleStatusMessage(context, status);
    handleStatusFetching(context, status);
  }

  static void handleStatusMessage(BuildContext context, RequestStatus status) {
    if (status.message != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(status.message!),
          ),
        );
      });
      return;
    }
  }

  static void handleStatusFetching(BuildContext context, RequestStatus status) {
    status.value == RequestStatusValue.fetching
        ? LoadingIndicatorDialogWidget(context).show()
        : LoadingIndicatorDialogWidget(context).hide();
  }
}
