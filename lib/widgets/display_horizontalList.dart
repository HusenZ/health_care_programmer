import 'package:flutter/material.dart';
import 'package:health_care/view/appointment_booking.dart';
import 'package:health_care/view/faqs.dart';

class DisplayHorizontalList extends StatefulWidget {
  const DisplayHorizontalList({super.key});

  @override
  State<DisplayHorizontalList> createState() => _DisplayHorizontalListState();
}

class _DisplayHorizontalListState extends State<DisplayHorizontalList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(
                child: Text(
                  'Appointment Booking',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'FAQs',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                AppointmentBooking(),
                FaqsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
