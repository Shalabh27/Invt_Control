SET PROCEDURE TO appendfromxlsx

*!*	CREATE CURSOR exceltest (name1 CHR(20),class int) && Create curs of same columns as exist in excel
*!*	do appendfromxlsx WITH 'd:\test.xlsx'  && Provide Name and Path of Excel File (XLSX) 


CREATE CURSOR tmp_users_cursor; 
 (id N(5), name Character(20), phone INT(30), email C(30), ;
  address C(100)) && Create curs of same columns as exist in excel
do appendfromxlsx WITH 'd:\user_D_1.xlsx'  && Provide Name and Path of Excel File (XLSX) 



brows
