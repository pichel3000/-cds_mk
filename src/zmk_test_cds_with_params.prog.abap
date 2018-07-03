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
      lv_matnr TYPE matnr VALUE '33926',
      lv_lang  TYPE sy-langu VALUE 'E'.

    cl_demo_input=>new(
      )->add_field( CHANGING field = lv_matnr
      )->add_field( CHANGING field = lv_lang
      )->request( ).

    SELECT *
           FROM ZCDS_DD1_IP_TEST( p_matnr = @lv_matnr,
                                  p_lang  = @lv_lang )
           INTO TABLE @DATA(result).
    cl_demo_output=>display( result ).
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  demo=>main( ).
