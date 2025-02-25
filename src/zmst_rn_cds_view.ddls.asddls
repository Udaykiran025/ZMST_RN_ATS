@AbapCatalog.sqlViewName: 'ZMSTRNCDSVIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'old approch'
@Metadata.ignorePropagatedAnnotations: true
define view zmst_rn_cds_view as select from zmst_rn_bpa
{
    key bp_id as BpId,
    bp_role as BpRole,
    company_name as CompanyName,
    street as Street,
    country as Country,
    region as Region,
    city as City
}
