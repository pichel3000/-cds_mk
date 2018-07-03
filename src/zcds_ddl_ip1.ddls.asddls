@AbapCatalog.sqlViewName: 'ZCDS_DDL_IP1'
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view with input parameters'
define view ZCDS_DD1_IP_TEST
    with parameters matnr:abap.numc(18),
                    Lang:abap.char(1)
  as select from mara as mara
        inner join  makt as makt
        on mara.matnr = makt.matnr
      {
        key mara.matnr as material,
              makt.maktx as description,
              $parameters.Lang as language
      } where mara.matnr = $parameters.matnr and 
              makt.spras = $parameters.Lang;