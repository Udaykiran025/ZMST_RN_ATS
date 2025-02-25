CLASS zcl_irctc_data_insert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
   methods INSERT_DATA.
ENDCLASS.



CLASS zcl_irctc_data_insert IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  INSERT_DATA( ).
  ENDMETHOD.

   method INSERT_DATA.

    " Insert into Station Master
    data: lt_stations type table of zmst_rn_station,
          ls_station  like line of lt_stations.

    ls_station-client = '100'.
    ls_station-station_code = 'NDLS'.
    ls_station-station_name = 'New Delhi'.
    ls_station-city = 'Delhi'.
    ls_station-state = 'Delhi'.
    ls_station-zones = 'NR'.
*    ls_station-latitude = 28.6139.
*    ls_station-longitude = 77.2090.
    append ls_station to lt_stations.

    ls_station-station_code = 'BCT'.
    ls_station-station_name = 'Mumbai Central'.
    ls_station-city = 'Mumbai'.
    ls_station-state = 'Maharashtra'.
    ls_station-zones = 'WR'.
*    ls_station-latitude = 18.9696.
*    ls_station-longitude = 72.8194.
    append ls_station to lt_stations.

    modify zmst_rn_station from table @lt_stations.

    " Insert into Train Master
    data: lt_trains type table of zmst_rn_train,
          ls_train  like line of lt_trains.

    ls_train-client = '100'.
    ls_train-train_no = '12951'.
    ls_train-train_name = 'Rajdhani Express'.
    ls_train-train_type = 'Express'.
    ls_train-start_station = 'NDLS'.
    ls_train-end_station = 'BCT'.
*    ls_train-days_of_operation = 'Mon, Wed, Fri'.
*    ls_train-total_coaches = 20.
    append ls_train to lt_trains.

    modify zmst_rn_train from table @lt_trains.

    " Insert into Passenger Master
    data: lt_passengers type table of zmst_rn_pass,
          ls_passenger  like line of lt_passengers.

    ls_passenger-client = '100'.
    ls_passenger-passenger_id = 'P001'.
    ls_passenger-full_name = 'Amit Sharma'.
    ls_passenger-gender = 'M'.
    ls_passenger-age = 35.
    ls_passenger-id_proof_type = 'Aadhar'.
    ls_passenger-id_proof_no = '123456789012'.
*    ls_passenger-mobile = '9876543210'.
*    ls_passenger-email = 'amit.sharma@example.com'.
    append ls_passenger to lt_passengers.

    modify zmst_rn_pass from table @lt_passengers.

    " Insert into Booking Header
    data: lt_bookings type table of zmst_rn_booking,
          ls_booking  like line of lt_bookings.

    ls_booking-client = '100'.
    ls_booking-booking_id = 'B001'.
*    ls_booking-user_id = 'U1001'.
    ls_booking-booking_date = '20250219'.
    ls_booking-train_no = '12951'.
    ls_booking-journey_date = '20250220'.
    ls_booking-source_station = 'NDLS'.
    ls_booking-dest_station = 'BCT'.
    ls_booking-total_amount = 4500.
    ls_booking-currency = 'INR'.
    ls_booking-status = 'Booked'.
*    ls_booking-payment_mode = 'UPI'.
*    ls_booking-transaction_id = 'TXN987654'.
    append ls_booking to lt_bookings.

    modify zmst_rn_booking from table @lt_bookings.

    " Insert into Booking Items
    data: lt_booking_items type table of zmst_rn_book_itm,
          ls_booking_item  like line of lt_booking_items.

    ls_booking_item-client = '100'.
    ls_booking_item-booking_id = 'B001'.
    ls_booking_item-passenger_id = 'P001'.
    ls_booking_item-coach_class = 'AC1'.
    ls_booking_item-seat_no = 'A1-21'.
    ls_booking_item-fare = 4500.
    ls_booking_item-currency = 'INR'.
    ls_booking_item-status = 'Confirmed'.
*    ls_booking_item-meal_preference = 'Veg'.
*    ls_booking_item-berth_preference = 'Lower'.
    append ls_booking_item to lt_booking_items.

    modify zmst_rn_book_itm from table @lt_booking_items.

    " Insert into Payment Transactions
*    data: lt_payments type table of zmst_rn_payment,
*          ls_payment  like line of lt_payments.
*
*    ls_payment-client = '100'.
*    ls_payment-transaction_id = 'TXN987654'.
*    ls_payment-booking_id = 'B001'.
*    ls_payment-user_id = 'U1001'.
*    ls_payment-payment_mode = 'UPI'.
*    ls_payment-payment_status = 'Success'.
*    ls_payment-amount = 4500.00.
*    ls_payment-currency = 'INR'.
*    ls_payment-transaction_date = '2025-02-19'.
*    append ls_payment to lt_payments.
*
*    modify zmst_rn_payment from table lt_payments.

*    " Console Output for Success
*    out->write( '✅ Demo Data Inserted Successfully!' ).

    " 🚆 Insert into Ticket Pricing
    data: lt_ticket_pricing type table of zmst_rn_tkt_pr,
          ls_ticket_pricing  like line of lt_ticket_pricing.

    " New Delhi (NDLS) to Mumbai (BCT) - Rajdhani Express
    ls_ticket_pricing-client = '100'.
    ls_ticket_pricing-train_no = '12951'.
    ls_ticket_pricing-station_code = 'NDLS'.
    ls_ticket_pricing-coach_class = 'AC1'.
    ls_ticket_pricing-base_fare = 4000.
    ls_ticket_pricing-tax = 200.
    ls_ticket_pricing-total_fare = ls_ticket_pricing-base_fare + ls_ticket_pricing-tax.
    ls_ticket_pricing-currency = 'INR'.
    append ls_ticket_pricing to lt_ticket_pricing.

    ls_ticket_pricing-coach_class = 'AC2'.
    ls_ticket_pricing-base_fare = 3000.
    ls_ticket_pricing-tax = 150.
    ls_ticket_pricing-total_fare = ls_ticket_pricing-base_fare + ls_ticket_pricing-tax.
    append ls_ticket_pricing to lt_ticket_pricing.

    ls_ticket_pricing-coach_class = 'SL'.
    ls_ticket_pricing-base_fare = 800.
    ls_ticket_pricing-tax = 40.
    ls_ticket_pricing-total_fare = ls_ticket_pricing-base_fare + ls_ticket_pricing-tax.
    append ls_ticket_pricing to lt_ticket_pricing.

    " New Delhi (NDLS) to Chennai (MAS) - Tamil Nadu Express
    ls_ticket_pricing-train_no = '12622'.
    ls_ticket_pricing-coach_class = 'AC1'.
    ls_ticket_pricing-base_fare = 4500.
    ls_ticket_pricing-tax = 225.
    ls_ticket_pricing-total_fare = ls_ticket_pricing-base_fare + ls_ticket_pricing-tax.
    append ls_ticket_pricing to lt_ticket_pricing.

    ls_ticket_pricing-coach_class = 'AC2'.
    ls_ticket_pricing-base_fare = 3500.
    ls_ticket_pricing-tax = 175.
    ls_ticket_pricing-total_fare = ls_ticket_pricing-base_fare + ls_ticket_pricing-tax.
    append ls_ticket_pricing to lt_ticket_pricing.

    ls_ticket_pricing-coach_class = 'SL'.
    ls_ticket_pricing-base_fare = 900.
    ls_ticket_pricing-tax = 45.
    ls_ticket_pricing-total_fare = ls_ticket_pricing-base_fare + ls_ticket_pricing-tax.
    append ls_ticket_pricing to lt_ticket_pricing.

    modify zmst_rn_tkt_pr from table @lt_ticket_pricing.

*    out->write( '✅ Ticket Pricing Data Inserted Successfully!' ).

   ENDMETHOD.

ENDCLASS.
