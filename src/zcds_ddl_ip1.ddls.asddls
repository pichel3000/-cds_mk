@AbapCatalog.sqlViewName: 'ZCDS_DDL_IP1'
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view with input parameters'
define view ZCDS_DD1_IP_TEST
    with parameters p_matnr:abap.numc(18),
                    p_lang:abap.char(1)
  as select from mara as mara
        inner join  makt as makt
        on mara.matnr = makt.matnr
      {
        key mara.matnr as material,
              makt.maktx as description,
              $parameters.p_lang as language
      } where mara.matnr = $parameters.p_matnr and 
              makt.spras = $parameters.p_lang;