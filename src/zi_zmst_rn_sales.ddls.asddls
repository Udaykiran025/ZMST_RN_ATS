@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'sales fact data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_ZMST_RN_SALES as select from zmst_rn_so_hdr as hdr
association[1..*] to zmst_rn_so_item as _ITEMS on
$projection.OrderId = _ITEMS.order_id
{
    key order_id as OrderId,
    order_no as OrderNo,
    buyer as Buyer,
    currency_code as CurrencyCode,
    created_by as CreatedBy,
    created_on as CreatedOn,
    _ITEMS
}
