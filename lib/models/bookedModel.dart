class BookModel {
  String error;
  String message;
  List<Booked> booked;

  BookModel({this.error, this.message, this.booked});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        error: json['error'],
        message: json['message'],
        booked: (json['reservation'] as List)
            .map((data) => Booked.fromJson(data))
            .toList());
  }
}

class Booked {
  String reservationId;
  String userId;
  int serviceId;
  String reservationStatus;
  int seatNo;
  String createdAt;
  String serviceType;
  String startHour;
  String endHour;
  int availableSeats;

  Booked(
      {this.reservationId,
      this.userId,
      this.serviceId,
      this.reservationStatus,
      this.seatNo,
      this.createdAt,
      this.serviceType,
      this.startHour,
      this.endHour,
      this.availableSeats});

  factory Booked.fromJson(Map<String, dynamic> json) {
    return new Booked(
      reservationId: json['reservation_id'],
      userId: json['user_id'],
      serviceId: json['service_id'],
      reservationStatus: json['reservation_status'],
      seatNo: json['seats_number'],
      createdAt: json['created_at'],
      serviceType: json['service_type'],
      startHour: json['start_hours'],
      endHour: json['end_hours'],
      availableSeats: json['available_seats'],
    );
  }
}
