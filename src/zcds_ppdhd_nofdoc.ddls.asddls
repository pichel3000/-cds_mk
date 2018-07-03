@AbapCatalog.sqlViewName: 'ZCDS_PPDHD_NF'
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PPDHD without Fin Doc'
define view ZCDS_PPDHD_NOFDOC_VIEW
//    with parameters p_budat:budat,
//                    p_bukrs:bukrs
  as select from ppdhd as ppdhd
        inner join  ppdsh as ppdsh
        on ppdhd.docnum = ppdsh.docnum
      {
        key ppdhd.docnum as docnum,
            ppdhd.evtyp as evtyp, 
            ppdhd.runid as runid, 
            ppdhd.bukrs as bukrs,
            ppdsh.status as status,
            ppdsh.actual as actual,
            ppdhd.budat as budat
      } 
//      where ppdhd.budat = $parameters.p_budat and 
//              ppdhd.bukrs = $parameters.p_bukrs and
//              ppdhd.evtyp =  'PP'               and 
//              ppdsh.status <> '50'              and
//              ppdsh.actual = 'X'