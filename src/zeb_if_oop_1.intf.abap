interface ZEB_IF_OOP_1
  public .


  data AIV_1 type HITRATIO_ALV .

  methods SUM
    importing
      !IV_NUM1 type HITRATIO_ALV
      !IV_NUM2 type HITRATIO_ALV
    exporting
      !EV_RESULT type HITRATIO_ALV .
endinterface.
