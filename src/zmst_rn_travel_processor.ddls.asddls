@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'My Travel Processor Projection'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity zmst_rn_travel_PROCESSOR as projection on zmst_rn_travel
{
     @ObjectModel.text.element: [ 'Description' ]
    key TravelId,
    @ObjectModel.text.element: [ 'AgencyName' ]
    @Consumption.valueHelpDefinition: [{ 
                entity.name: '/DMO/I_Agency',
                entity.element: 'AgencyID'
     }]
    AgencyId,
      @Semantics.text: true
    _Agency.Name as AgencyName,
    @ObjectModel.text.element: [ 'CustomerName' ]
    @Consumption.valueHelpDefinition: [{ 
                entity.name: '/DMO/I_Customer',
                entity.element: 'CustomerID'
     }]
    CustomerId,
     @Semantics.text: true
    _Customer.LastName as CustomerName,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
     @Semantics.text: true
    Description,
    @ObjectModel.text.element: [ 'StatusText' ]
    @Consumption.valueHelpDefinition: [{ 
                entity.name: '/DMO/I_Overall_Status_VH',
                entity.element: 'OverallStatus'
     }]
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    @Semantics.text: true
    StatusText,
    Criticality,
    /* Associations */
    _Agency,
    _Booking,
    _currency,
    _Customer,
    _OverallStatus
}
