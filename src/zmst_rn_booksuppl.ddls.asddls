@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplements as child of comp tree'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zmst_rn_booksuppl as select from /DMO/I_BookSuppl_M
association to parent ZMST_RN_BOOKING as _booking on
    $projection.booking_id = _booking.BookingId and
    $projection.travel_id = _booking.TravelId
association[1..1] to zmst_rn_travel as _travel on
    $projection.travel_id = _travel.TravelId
association[1..1] to /DMO/I_Supplement as _Product on
    $projection.supplement_id = _Product.SupplementID
association[1..*] to /DMO/I_SupplementText as _supplementText on
    $projection.supplement_id = _supplementText.SupplementID
{
    key travel_id,
    key booking_id,
    key booking_supplement_id,
    supplement_id,
    @Semantics.amount.currencyCode: 'currency_code'
    price,
    currency_code,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at,
    /* Associations */
   _travel,
    _Product,
    _supplementText,
    _booking
}
