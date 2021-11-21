import 'dart:async';
import 'package:team_app/Models/booking_model.dart';
import 'package:team_app/Pages/ubooking_list_page.dart';
import 'package:team_app/services/booking_service.dart';

class BookingController {
  final BookingServices services;
  List<Booking> bookings = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  BookingController(this.services);

  Future<List<Booking>> fecthBookings() async {
    onSyncController.add(true);
    bookings = await services.getBookings();
    onSyncController.add(false);
    return bookings;
  }

  void addBooking(BookingItem items) async {
    services.addBooking(items);
  }
}