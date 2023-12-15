interface ZEB_IF_OOP_2
  public .


  class-data ASV_1 type HITRATIO_ALV .

  methods SUB
    importing
      !IV_NUM1 type HITRATIO_ALV
      !IV_NUM2 type HITRATIO_ALV
    returning
      value(RV_RETURN) type HITRATIO_ALV .
endinterface.
