import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:client_shared/components/empty_state_card_view.dart';
import 'package:client_shared/components/back_button.dart';
import 'package:intl/intl.dart';
import 'package:ridy/history/history.graphql.dart';
import 'package:ridy/query_result_view.dart';
import 'package:client_shared/theme/theme.dart';

import 'package:ridy/l10n/messages.dart';
import 'package:ridy/reservations/resrvations.graphql.dart';

class ReservationListView extends StatelessWidget {
  const ReservationListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RidyBackButton(text: S.of(context).action_back),
            Query$Reservations$Widget(builder: (result, {refetch, fetchMore}) {
              if (result.isLoading || result.hasException) {
                return Expanded(
                    child: QueryResultView(result, refetch: refetch));
              }
              final reservations = result.parsedData!.orders.edges;
              if (reservations.isEmpty) {
                return EmptyStateCard(
                    title: S.of(context).reservation_empty_state_title,
                    description: S.of(context).reservation_empty_state_body,
                    icon: Ionicons.notifications_off);
              }
              return Expanded(
                child: Mutation$CancelBooking$Widget(
                    options: WidgetOptions$Mutation$CancelBooking(
                        onCompleted: (result, parsedData) => refetch?.call(),
                        onError: (error) =>
                            showOperationErrorMessage(context, error)),
                    builder: (runMutation, result) {
                      return ListView.builder(
                          itemCount: reservations.length,
                          itemBuilder: (context, index) {
                            return ReservationItem(
                              reservation: reservations[index].node,
                              onCancelSelected: (id) {
                                runMutation(
                                    Variables$Mutation$CancelBooking(id: id));
                              },
                            );
                          });
                    }),
              );
            })
          ],
        ),
      )),
    );
  }
}

class ReservationItem extends StatelessWidget {
  final Query$Reservations$orders$edges$node reservation;
  final Function(String) onCancelSelected;
  const ReservationItem(
      {required this.reservation, required this.onCancelSelected, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: CustomTheme.primaryColors.shade100),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: CustomTheme.primaryColors.shade100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: CustomTheme.primaryColors.shade400, width: 0.5),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x14000000),
                    offset: Offset(0, 3),
                    blurRadius: 5)
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Ionicons.time,
                  color: CustomTheme.primaryColors.shade800,
                ),
                const SizedBox(width: 4),
                Text(
                  DateFormat('dd.MMM.yyyy')
                      .format(reservation.expectedTimestamp),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                Text(
                  DateFormat('HH:mm a').format(reservation.expectedTimestamp),
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Icon(
                        Ionicons.navigate,
                        color: CustomTheme.neutralColors.shade500,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          reservation.addresses.first,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(overflow: TextOverflow.ellipsis),
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 4, bottom: 4),
                    child: DottedLine(
                      direction: Axis.vertical,
                      dashColor: CustomTheme.neutralColors,
                      lineLength: 20,
                      lineThickness: 2.0,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Ionicons.location,
                        color: CustomTheme.neutralColors.shade500,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          reservation.addresses.last,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      )
                    ],
                  )
                ]),
          ),
          const Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(),
              CupertinoButton(
                  padding: const EdgeInsets.only(bottom: 12),
                  minSize: 0,
                  child: Row(
                    children: [
                      Icon(
                        Ionicons.close,
                        color: CustomTheme.neutralColors.shade500,
                      ),
                      Text(
                        S.of(context).action_cancel_ride,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  onPressed: () => onCancelSelected(reservation.id)),
              const Spacer()
            ],
          )
        ],
      ),
    );
  }
}
