*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 01.06.2017 at 08:32:42
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZLNKEREGION.....................................*
DATA:  BEGIN OF STATUS_ZLNKEREGION                   .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZLNKEREGION                   .
CONTROLS: TCTRL_ZLNKEREGION
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZLNKEREGION                   .
TABLES: ZLNKEREGION                    .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
