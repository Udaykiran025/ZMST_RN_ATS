@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SALES COMPOSITE, CUBE VIEW FOR SALES DATA'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Analytics.dataCategory: #CUBE

define view entity ZI_ZMST_RN_SALES_CUBE
  as select from ZI_ZMST_RN_SALES
  association [1] to ZI_ZMST_RN_BPA     as _BusinessPartner on $projection.Buyer = _BusinessPartner.BpId
  association [1] to ZI_ZMST_RN_PRODUCT as _product         on $projection.Product = _product.ProductId
{
  key ZI_ZMST_RN_SALES.OrderId,
  key ZI_ZMST_RN_SALES._ITEMS.item_id  as IteamId,
      ZI_ZMST_RN_SALES.OrderNo,
      ZI_ZMST_RN_SALES.Buyer,
      ZI_ZMST_RN_SALES.CreatedBy,
      ZI_ZMST_RN_SALES.CreatedOn,
      /* Associations */
      ZI_ZMST_RN_SALES._ITEMS.product  as Product,
      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode: 'CurrencyCode'
      ZI_ZMST_RN_SALES._ITEMS.amount   as GrossAmount,
      ZI_ZMST_RN_SALES._ITEMS.currency as CurrencyCode,
      @DefaultAggregation: #SUM
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      ZI_ZMST_RN_SALES._ITEMS.qty      as Quantity,
      ZI_ZMST_RN_SALES._ITEMS.uom      as UnitOfMeasure,
      _product,
      _BusinessPartner
}
