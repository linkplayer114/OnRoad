import 'package:client_shared/components/back_button.dart';
import 'package:client_shared/components/empty_state_card_view.dart';
import 'package:client_shared/components/trip_history_item_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:ridy/schema.gql.dart';
import 'package:ridy/trip-history/trip-hitsory.graphql.dart';

import 'package:ridy/trip-history/trip_history_details_view.dart';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../query_result_view.dart';

class TripHistoryListView extends StatefulWidget {
  const TripHistoryListView({Key? key}) : super(key: key);

  @override
  State<TripHistoryListView> createState() => _TripHistoryListViewState();
}

class _TripHistoryListViewState extends State<TripHistoryListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RidyBackButton(text: S.of(context).action_back),
              const SizedBox(height: 16),
              Query$History$Widget(
                builder: (result, {refetch, fetchMore}) {
                  if (result.hasException || result.isLoading) {
                    return Expanded(
                      child: QueryResultView(result, refetch: refetch),
                    );
                  }
                  final orders = result.parsedData?.orders.edges;
                  if (orders?.isEmpty ?? true) {
                    return EmptyStateCard(
                      title: S.of(context).empty_state_title_no_record,
                      description: S.of(context).trip_history_empty_state,
                      icon: Ionicons.cloud_offline,
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: orders!.length,
                        itemBuilder: (context, index) {
                          final item = orders[index].node;
                          return TripHistoryItemView(
                              id: item.id,
                              canceledText: S.of(context).order_status_canceled,
                              title: item.service?.name ?? "-",
                              dateTime: item.createdOn,
                              currency: item.currency,
                              price: item.costAfterCoupon - item.providerShare,
                              isCanceled: item.status ==
                                      Enum$OrderStatus.RiderCanceled ||
                                  item.status ==
                                      Enum$OrderStatus.DriverCanceled,
                              onPressed: (id) {
                                showBarModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return TripHistoryDetailsView(
                                        orderId: id,
                                      );
                                    });
                              });
                        }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
