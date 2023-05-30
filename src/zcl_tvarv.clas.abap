CLASS zcl_tvarv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CONSTANTS c_type_parameter TYPE tvarvc-type VALUE 'P'. "Parameter
    CONSTANTS c_type_selectopt TYPE tvarvc-type VALUE 'S'. "Select Options (Ranges)

    CLASS-METHODS get_parameter_value
      IMPORTING
        variable_name TYPE tvarvc-name
      RETURNING
        VALUE(param)  TYPE tvarv-low.

    CLASS-METHODS get_selectopt_value
      IMPORTING
        variable_name TYPE tvarvc-name
      RETURNING
        VALUE(ranges) TYPE efg_tab_ranges.

    CLASS-METHODS get_tvarv_value
      IMPORTING
        variable_name  TYPE tvarvc-name
        selection_type TYPE tvarvc-type
      RETURNING
        VALUE(ranges)  TYPE efg_tab_ranges.

PROTECTED SECTION.
PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tvarv IMPLEMENTATION.
  METHOD get_parameter_value.

    DATA(tvarv_tab) = get_tvarv_value(
      EXPORTING
        variable_name    = variable_name
        selection_type    = c_type_parameter ).


    IF line_exists( tvarv_tab[ 1 ] ).
      param = tvarv_tab[ 1 ]-low.
    ENDIF.

  ENDMETHOD.

  METHOD get_tvarv_value.

    SELECT sign opti low high INTO TABLE ranges
        FROM tvarvc
        WHERE name eq variable_name
        AND type eq selection_type.

  ENDMETHOD.

  METHOD  get_selectopt_value.

    ranges = get_tvarv_value(
     EXPORTING
       variable_name    = variable_name
       selection_type    = c_type_selectopt ).

  ENDMETHOD.

ENDCLASS.
