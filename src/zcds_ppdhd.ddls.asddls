@AbapCatalog.sqlViewName: 'ZCDS_PPDHD'
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PPDHD without Fin Doc'
define view ZCDS_PPDHD_VIEW
    with parameters p_belnr:belnr_d,
                    p_gjahr:gjahr,
                    p_bukrs:bukrs,
                    p_budat:budat
  as select from bkpf as bkpf
        inner join ppdhd as ppdhd
        on bkpf.awkey = ppdhd.docnum
        inner join ppdsh as ppdsh
        on ppdsh.docnum = ppdhd.docnum
      {
        key ppdhd.docnum as docnum,
            ppdhd.evtyp as evtyp, 
            ppdhd.runid as runid, 
            ppdhd.bukrs as bukrs,
            ppdsh.status as status,
            ppdsh.actual as actual
      } where bkpf.belnr = $parameters.p_belnr  and 
              bkpf.gjahr = $parameters.p_gjahr  and
              bkpf.bukrs = $parameters.p_bukrs  and 
              ppdhd.budat = $parameters.p_budat and
              ppdhd.evtyp  =  'PP'              and
              ppdsh.status <> '50'              and
              ppdsh.actual = 'X'
             