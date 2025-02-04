LOCAL lcXLBook AS STRING, lnSQLHand AS INTEGER, ;
    lcSQLCmd AS STRING, lnSuccess AS INTEGER, ;
    lcConnstr AS STRING
CLEAR


SET STEP ON 

lcXLBook = 'd:\shalabh\Socity.xlsx' && 'd:\test.xlsx' 
mSheet_nm = 'Sheet1'
** mfile_nm

*!*	lcConnstr = [Driver=] + ;
*!*	    [{Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};] + ;
*!*	    [DBQ=] + lcXLBook

*!*	lcConnstr = [Driver=] + ;
*!*	    [{Microsoft Excel Driver (*.xls)};] + ;
*!*	    [DBQ=] + lcXLBook

* !* OLD DB Provider link -> https://www.microsoft.com/en-us/download/confirmation.aspx?id=14839
* !* https://docs.microsoft.com/en-us/previous-versions/visualstudio/foxpro/mt490121(v=msdn.10)?redirectedfrom=MSDN

lnSQLHand = SQLSTRINGCONNECT([Provider=Microsoft.ACE.OLEDB.16.0;Data Source="] + lcXLBook + [";Extended Properties="Excel 16.0 Xml;HDR=] + "NO" + [;";])


*!*	lcConnstr = [Driver=] + ;
*!*	    [{'exceltest'};] + ;
*!*	    [DBQ=] + lcXLBook

IF !FILE( lcXLBook )
   * ? [Excel file not found]
    RETURN .F.
ENDIF
*-- Attempt a connection to the .XLSX WorkBook.
*-- NOTE: If the specified workbook is not found,
*-- it will be created by this driver! You cannot rely on a
*-- connection failure - it will never fail. Ergo, success
*-- is not checked here. Used FILE() instead.

?lcConnstr 

lnSQLHand = SQLSTRINGCONNECT( lcConnstr )

AERROR(laERROR)

*-- Connect successful if we are here. Extract data...
lcSQLCmd = [Select * FROM "&mSheet_nm$"]
lnSuccess = SQLEXEC( lnSQLHand, lcSQLCmd, [xlResults] )
*? [SQL Cmd Success:], IIF( lnSuccess > 0, 'Good!', 'Failed' )
IF lnSuccess < 0
    LOCAL ARRAY laErr[1]
    AERROR( laErr )
   * ? laErr(3)
    SQLDISCONNECT( lnSQLHand )
    RETURN .F.
ENDIF