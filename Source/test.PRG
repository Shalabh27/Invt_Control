*!*	Create table Graph_tab (SCC c(40),SCC_p c(1),SCC_T c(1),SCC_C c(1),CRI_P c(40),CRI_T c(40),CRI_C c(40),CRI_SUMM c(40),;
*!*		begin_S N(12,3),end_s N(12,3),ENV_LEN N(12,3),longitude N(12,7), latitude N(12,7),diameter N(5),coat_year Int, soil_code c(10),;
*!*		landuse c(20), p_material c(20), drainage c(20),topography c(20), c_hor_text c(20), p_h N(4,2), resistive N(4,2), pipe_manu c(20),;
*!*		type_scl c(20), wall_thick Float(10,5), long_seam c(20), pipe_grade c(20),;
*!*		h_w c(10), casing c(10), Weight c(10), D_Cross c(2), ir N(12,3), ps_on N(12,3), ps_off N(12,3), notes c(40))
	
Set Deleted On
Set Exact On
Create Cursor temp1 (begin_S  N(12,3))

Select begin_S From pipe_pipe Into Cursor t1
Select temp1
Append From Dbf('t1')

Select end_s As begin_S From pipe_pipe Into Cursor t1
Select temp1
Append From Dbf('t1')

Select begin_S From survey Into Cursor t1 Where Isnull(begin_S)=.F.
Select temp1
Append From Dbf('t1')

Select end_s As "begin_s" From survey Into Cursor t1 Where Isnull(end_s)=.F.
Select temp1
Append From Dbf('t1')

*---------------
Select begin_S From pipe_coat Into Cursor t1 Where Isnull(begin_S)=.F.
Select temp1
Append From Dbf('t1')

Select end_s As "begin_s" From pipe_coat Into Cursor t1 Where Isnull(end_s)=.F.
Select temp1
Append From Dbf('t1')

Select begin_S From pipe_case Into Cursor t1 Where Isnull(begin_S)=.F.
Select temp1
Append From Dbf('t1')

Select end_s As "begin_s" From pipe_case Into Cursor t1 Where Isnull(end_s)=.F.
Select temp1
Append From Dbf('t1')

Select begin_S From pipe_weight Into Cursor t1 Where Isnull(begin_S)=.F.
Select temp1
Append From Dbf('t1')

Select end_s As "begin_s" From pipe_weight Into Cursor t1 Where Isnull(end_s)=.F.
Select temp1
Append From Dbf('t1')


Select begin_S From cips_road Into Cursor t1 Where Isnull(begin_S)=.F.
Select temp1
Append From Dbf('t1')

Select end_s As "begin_s" From cips_road Into Cursor t1 Where Isnull(end_s)=.F.
Select temp1
Append From Dbf('t1')

*---------------
Select Distinct *, 00000000.000 As end_s  From temp1 Into Cursor temp1 Readwrite ;
	ORDER By begin_S

Select temp1
Scan
	skip
	abc1=begin_S
	SKIP -1
*	Select Min(begin_S) As "end_s" From temp1 Where abc1<begin_S Into Cursor t2
	Select temp1
	Replace end_s With abc1
Endscan

SET STEP ON 

Select temp1
Delete For end_s = 0.000

Select begin_S, "a" As tp From temp1 ;
	UNION Select end_s As begin_S , "a" As tp From temp1 ;
	UNION Select chainage As begin_S, "b" As "tp" From cips_cips Into Cursor temp3 Order By 1

Select Distinct begin_S, 00000000.000 As end_s  From temp3 Into Cursor temp1 Readwrite ;
	ORDER By begin_S

Scan
	abc1=begin_S
	Select Min(begin_S) As "end_s" From temp1 Where abc1<begin_S Into Cursor t2
	Select temp1
	Replace end_s With t2.end_s
Ends

Select temp1
Delete For end_s = 0.000

Select Distinct begin_S, begin_S As end_s From temp3 Into Cursor temp2 Where tp = "b"

Select temp1
Append From Dbf("temp2")

Select * From temp1 Into Cursor temp1 Order By begin_S, end_s

If !Used("pipe_Case")
	Select 0
	Use pipe_case
Endif

If !Used("cips_cips")
	Select 0
	Use cips_cips
Endif

If !Used("cips_road")
	Select 0
	Use cips_road
Endif

If !Used("soil_mst")
	Select 0
	Use soil_mst
Endif

If !Used("scc_asph")
	Select 0
	Use scc_asph
Endif

If !Used("scc_tape")
	Select 0
	Use scc_tape
Endif

Select 0
Select begin_S, end_s, 000000.000 As start_dr  , 000000.000 As end_dr , road From cips_road ;
	into Curs cips_dr Where !Isnull(cips_road.road) Order By begin_S Readwrite
Replace All start_dr With ((begin_S + end_s)/2)-660
Replace All end_dr With ((begin_S + end_s)/2)+660

SELECT temp1

oExcel = CreateObject("Excel.Application")
*oWorkbook = oExcel.Application.Workbooks.Open("C:\test.xls")
oWorkbook = oExcel.Application.Workbooks.Add("C:\test.xlt")

*mcol = "B"+ALLTRIM(STR(4))
*oExcel.Range(mcol).Value = 1234

*!*	mrow=4
*!*	mcol = 3
*!*	oExcel.cells(mrow,mcol).Value = 1234

WITH oExcel.ActiveWorkBook.ActiveSheet
  .Range(.Cells(1,1), .Cells(50000,30)).Value = 203
    .Range(.Cells(1,1), .Cells(50000,30)).Font.Bold = .t.
    .Range(.Cells(1,1), .Cells(50000,30)).NumberFormatLocal = "#,##0"
endwith

oExcel.visible = .t.