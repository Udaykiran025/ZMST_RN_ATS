@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'My Travel Processor Projection'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZMST_RN_BOOKSUPPL_PROCESSOR as projection on zmst_rn_booksuppl
{
  key travel_id,
  key booking_id,
  key booking_supplement_id,
  supplement_id,
  price,
  currency_code,
  last_changed_at,
  /* Associations */
  _booking: redirected to parent ZMST_RN_BOOKING_PROCESSOR,
  _Product,
  _supplementText,
  _travel
}
