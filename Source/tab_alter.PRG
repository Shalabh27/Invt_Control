*ALTER table material_mst ADD invt_qty n(10,2)
*REPLACE ALL invt_qty WITH 0

SET PATH to "Data\"

IF !USED('Company')
	SELECT 0
	USE company
endif

REPLACE active_dt WITH CTOD('01/01/2015')