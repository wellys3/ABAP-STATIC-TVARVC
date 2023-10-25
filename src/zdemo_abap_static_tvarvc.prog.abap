*&---------------------------------------------------------------------*
*& Report ZDEMO_ABAP_STATIC_TVARVC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdemo_abap_static_tvarvc.

START-OF-SELECTION.

  CALL METHOD zcl_tvarv=>get_parameter_value
    EXPORTING
      variable_name = 'ZDEMO_ABAP_STATIC_TVARVC_01'
    RECEIVING
      param         = DATA(ld_tvarvc_1).

  WRITE:/ ld_tvarvc_1.

  CALL METHOD zcl_tvarv=>get_selectopt_value
    EXPORTING
      variable_name = 'ZDEMO_ABAP_STATIC_TVARVC_02'
    RECEIVING
      ranges        = DATA(lit_tvarvc).

  LOOP AT lit_tvarvc INTO DATA(lwa_tvarvc).
    WRITE:/ lwa_tvarvc-low.
  ENDLOOP.

  CALL METHOD zcl_tvarv=>get_tvarv_value
    EXPORTING
      variable_name  = 'ZDEMO_ABAP_STATIC_TVARVC_03'
      selection_type = 'P'
    RECEIVING
      ranges         = DATA(lit_tvarvc2).

  LOOP AT lit_tvarvc2 INTO DATA(lwa_tvarvc2).
    WRITE:/ lwa_tvarvc2-low.
  ENDLOOP.
