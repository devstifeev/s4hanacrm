class ZCL_EXCEL_AUTOFILTERS definition
  public
  final
  create public .

public section.
  type-pools ABAP .

  constants C_AUTOFILTER type STRING value '_xlnm._FilterDatabase' ##NO_TEXT.

  methods ADD
    importing
      !IO_SHEET type ref to ZCL_EXCEL_WORKSHEET
    returning
      value(RO_AUTOFILTER) type ref to ZCL_EXCEL_AUTOFILTER .
  methods CLEAR .
  methods GET
    importing
      !I_SHEET_GUID type UUID
    returning
      value(RO_AUTOFILTER) type ref to ZCL_EXCEL_AUTOFILTER .
  methods IS_EMPTY
    returning
      value(R_EMPTY) type FLAG .
  methods REMOVE
    importing
      !I_SHEET_GUID type UUID .
  methods SIZE
    returning
      value(R_SIZE) type I .
protected section.
private section.

  data AUTOFILTERS type TT_OBJECTS .
ENDCLASS.



CLASS ZCL_EXCEL_AUTOFILTERS IMPLEMENTATION.


method ADD.
  DATA: ls_autofilters TYPE ts_objects,
        l_guid         TYPE uuid.
  l_guid = io_sheet->get_guid( ) .
  READ TABLE autofilters INTO ls_autofilters WITH TABLE KEY sheet_guid = l_guid.
  IF sy-subrc = 0.
    ro_autofilter = ls_autofilters-autofilter.
  ELSE.
    CREATE OBJECT ro_autofilter
      EXPORTING
        io_sheet = io_sheet.
    ls_autofilters-autofilter = ro_autofilter.
    ls_autofilters-sheet_guid = l_guid.
    INSERT ls_autofilters INTO TABLE autofilters .
  ENDIF.
  endmethod.


method CLEAR.

  REFRESH autofilters.

  endmethod.


method GET.

  DATA: ls_autofilters TYPE ts_objects.

  READ TABLE autofilters INTO ls_autofilters WITH TABLE KEY sheet_guid = i_sheet_guid.
  IF sy-subrc = 0.
    ro_autofilter = ls_autofilters-autofilter.
  ELSE.
    CLEAR ro_autofilter.
  ENDIF.

  endmethod.


method IS_EMPTY.
  IF autofilters IS INITIAL.
    r_empty = abap_true.
  ENDIF.
  endmethod.


method REMOVE.
  DATA: ls_autofilters TYPE ts_objects.

  DELETE autofilters WHERE sheet_guid = i_sheet_guid.

  endmethod.


method SIZE.
  DESCRIBE TABLE autofilters LINES r_size.
  endmethod.
ENDCLASS.
