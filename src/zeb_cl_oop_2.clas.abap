class ZEB_CL_OOP_2 definition
  public
  inheriting from ZEB_CL_OOP_1
  final
  create public .

public section.

  methods CALL
    importing
      !IV_NUM1_CLL type HITRATIO_ALV
      !IV_NUM2_CLL type HITRATIO_ALV
    exporting
      !EV_RESULT_CLL type HITRATIO_ALV .
protected section.

  methods DIFF_NUMBER
    redefinition .
private section.
ENDCLASS.



CLASS ZEB_CL_OOP_2 IMPLEMENTATION.


  METHOD call.
*    data : liv_num1 TYPE i,
*           liv_num2 TYPE i,
*           lcv_num TYPE HITRATIO_ALV.


    diff_number(
      EXPORTING
        iv_num1_df = iv_num1_cll
        iv_num2_df = iv_num2_cll
      CHANGING
        cv_num     = ev_result_cll
*      EXCEPTIONS
*        others     = 1
    ).

    IF sy-subrc <> 0.
*     MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*       WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.

    "CALL METHOD SUPER->DIFF_NUMBER

  ENDMETHOD.


  METHOD diff_number.
*    CALL METHOD super->diff_number
*      EXPORTING
*        iv_num1_df = iv_num1_df
*        iv_num2_df = iv_num2_df
*      CHANGING
*        cv_num     = cv_num
*       EXCEPTIONS
*       exc        = 1
*       others     = 2
      .
*    IF sy-subrc <> 0.
*      MESSAGE e000(z_b_message) WITH 'Bölme işleminde hata oluştu'.
*    ENDIF.


    DATA:  lv_exception          TYPE REF TO cx_root.

    TRY.
        CV_NUM = iv_num1_df / iv_num2_df.
      CATCH cx_sy_zerodivide. "cx_root INTO lv_exception.
        error = 'Bölme Hatası'.
        CV_NUM = 0.
*        RAISE EXCEPTION TYPE cx_shm_build_failed
*          EXPORTING
*            previous = lv_exception.
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
