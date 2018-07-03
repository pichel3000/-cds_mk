*&---------------------------------------------------------------------*
*& Report  zmk_test_cds_with_params
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zmk_test_cds_with_params.

CLASS demo DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS main.
ENDCLASS.

CLASS demo IMPLEMENTATION.
  METHOD main.
    DATA:
      lr_budat TYPE RANGE OF budat,
      ls_budat LIKE LINE OF lr_budat,
      lr_bukrs TYPE RANGE OF bukrs,
      ls_bukrs LIKE LINE OF lr_bukrs.

    ls_budat-option = 'BT'.
    ls_budat-sign = 'I'.
    ls_budat-low = '20150101'.
    ls_budat-high = '20181231'.
    APPEND ls_budat TO lr_budat.

    ls_bukrs-option = 'BT'.
    ls_bukrs-sign = 'I'.
    ls_bukrs-low = '1'.
    ls_bukrs-high = '99'.
    APPEND ls_bukrs TO lr_bukrs.

    SELECT *
      FROM zcds_ppdhd_nofdoc_view
      WHERE budat IN @lr_budat AND
            bukrs in @lr_bukrs AND
            evtyp = 'PP'   AND
            status <> '50' AND
            actual = 'X'
      INTO TABLE @DATA(result).

*      SELECT ppdhd~docnum, evtyp, runid, bukrs
*      FROM ppdhd
*      INNER JOIN ppdsh ON ppdsh~docnum = ppdhd~docnum
*          WHERE ppdhd~budat  IN @lr_budat AND ppdhd~bukrs  IN @lr_bukrs
*            AND ppdhd~evtyp  =  'PP'     AND ppdsh~status NE '50'  " no archived records
*            AND ppdsh~actual = 'X'
*      INTO TABLE @DATA(result).

    cl_demo_output=>display( result ).

  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  demo=>main( ).
