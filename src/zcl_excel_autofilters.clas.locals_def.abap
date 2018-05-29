*"* use this source file for any type declarations (class
*"* definitions, interfaces or data types) you need for method
*"* implementation or private method's signature
TYPES: BEGIN OF ts_objects,
       sheet_guid   TYPE uuid,
       autofilter   TYPE REF TO zcl_excel_autofilter,
       END OF ts_objects,

       tt_objects TYPE HASHED TABLE OF ts_objects WITH UNIQUE KEY sheet_guid.
