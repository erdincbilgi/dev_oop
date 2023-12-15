class ZEB_CL_OOP_1 definition
  public
  create public .

public section.

  interfaces ZEB_IF_OOP_1 .
  interfaces ZEB_IF_OOP_2 .

  data ERROR type STRING .
protected section.

  methods DIFF_NUMBER
    importing
      !IV_NUM1_DF type HITRATIO_ALV
      !IV_NUM2_DF type HITRATIO_ALV
    changing
      !CV_NUM type HITRATIO_ALV .
private section.
ENDCLASS.



CLASS ZEB_CL_OOP_1 IMPLEMENTATION.


  method DIFF_NUMBER.
*    DATA:  lv_exception          TYPE REF TO cx_root.
*
*    TRY.
*        CV_NUM = iv_num1_df / iv_num2_df.
*      CATCH cx_sy_zerodivide. "cx_root INTO lv_exception.
*        error = 'Bölme Hatası'.
*        CV_NUM = 0.
**        RAISE EXCEPTION TYPE cx_shm_build_failed
**          EXPORTING
**            previous = lv_exception.
*    ENDTRY.

  endmethod.


  METHOD zeb_if_oop_1~sum.

    ev_result = iv_num1 + iv_num2.
    zeb_if_oop_1~aiv_1 = ev_result.

  ENDMETHOD.


  method ZEB_IF_OOP_2~SUB.

    rv_return = iv_num1 - iv_num2.
    ZEB_IF_OOP_2~asv_1 = rv_return.

  endmethod.
ENDCLASS.
