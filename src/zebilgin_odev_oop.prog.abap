*&---------------------------------------------------------------------*
*& Report ZEBILGIN_ODEV_OOP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEBILGIN_ODEV_OOP.

SELECTION-SCREEN BEGIN OF BLOCK bl1 WITH FRAME TITLE text-001.

  PARAMETERS : p_d1 TYPE HITRATIO_ALV. "d. "LENGTH 5.
  PARAMETERS : p_d2 TYPE HITRATIO_ALV.
  PARAMETERS : p_d3 TYPE HITRATIO_ALV.
  PARAMETERS : p_d4 TYPE HITRATIO_ALV.
SELECTION-SCREEN END OF BLOCK bl1.

START-OF-SELECTION.

  DATA : lo_test1_1 TYPE REF TO zeb_cl_oop_1,
         lo_test1_2 TYPE REF TO zeb_cl_oop_1,
         lo_test2 TYPE REF TO zeb_cl_oop_2,
         lv_result_1 TYPE HITRATIO_ALV,
         lv_result_2 TYPE HITRATIO_ALV,
         lv_return_1 TYPE HITRATIO_ALV,
         lv_return_2 TYPE HITRATIO_ALV,
         lv_return_3 TYPE HITRATIO_ALV.

  CREATE OBJECT: lo_test1_1.
  CREATE OBJECT: lo_test1_2.
  CREATE OBJECT: lo_test2.

  lo_test1_1->zeb_if_oop_1~sum(
    EXPORTING
      iv_num1   = p_d1
      iv_num2   = p_d2
    IMPORTING
      ev_result = lv_result_1
  ).

  lo_test1_1->zeb_if_oop_2~sub(
    EXPORTING
      iv_num1   = p_d1
      iv_num2   = p_d2
    RECEIVING
      rv_return = lv_return_1
  ).

  lo_test1_2->zeb_if_oop_1~sum(
    EXPORTING
      iv_num1   = p_d3
      iv_num2   = p_d4
    IMPORTING
      ev_result = lv_result_2
  ).

  lo_test1_2->zeb_if_oop_2~sub(
    EXPORTING
      iv_num1   = p_d3
      iv_num2   = p_d4
    RECEIVING
      rv_return = lv_return_2
  ).

*    DATA:  ex          TYPE REF TO cx_root.
*    TRY.
  lo_test2->call(
    EXPORTING
      iv_num1_cll   = p_d3
      iv_num2_cll   = p_d4
    IMPORTING
      ev_result_cll = lv_return_3
      EXCEPTIONS
        others     = 1
  ).
*      CATCH cx_root INTO ex.
*        RAISE EXCEPTION TYPE lo_test2
*          EXPORTING
*            previous = ex.
*    ENDTRY.

  WRITE : / "p_d1,
*            p_d2,
*            p_d3,
*            p_d4,
            lo_test1_1->zeb_if_oop_1~aiv_1 ,"'-',
            lo_test1_1->zeb_if_oop_2~asv_1 ,
            lo_test2->zeb_if_oop_1~aiv_1 ,
            lo_test2->zeb_if_oop_2~asv_1 ,
            "
            lv_result_1,
            lv_result_2,
            lv_return_1,
            lv_return_2,
            lv_return_3,
            lo_test2->error.
