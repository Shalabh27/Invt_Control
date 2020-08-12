* Version 3.1
LPARAMETERS lcFileName,cCur,lcFFields,lnStartRows,lcSheet,llEmptyCells
* Parameters
* lcFileName		name of the xlsx
					* nom de xlsx
					* numele xlsx-ului
* cCur				name of the table / cursor ; optional ; default ALIAS()
* lcFFields			list of fields to be outputed ; optional ; default all fields
* lnStartRows		starting row (the first lnStartRows - 1 rows are skipped) ; optional ; default 1 (all rows)
					* a partir rangée (les premiers lnStartRows - 1 lignes sont passées) ; optionnel ; défaut 1 (tous les champs lignes)
					* primul rand (primele lnStartRows - 1 randuri ale tabelului din docx sunt omise); optional; implicit 1 (toate randurile)
* lcSheet			sheet name | number	; optional ; default ''
					* nom | nomber de la feuille ; optionnel ; défaut ''
					* numele |numarul foii	; optional ; implicit ''
* llEmptyCells		when .T., the source contains empty cells (slower import); optional ; default .F.
					* lorsque .T., la source contient des cellules vides (d'importation plus lent); optionnel ; défaut .F.
					* cand este .T., documentul sursa contine celule goale (importul este mai lent); optional; implicit .F.
DECLARE Sleep IN WIN32API INTEGER 
DECLARE INTEGER ShellExecute IN shell32.dll INTEGER , STRING , STRING , STRING , STRING , INTEGER
#DEFINE ERRLANG "En"
#IF ERRLANG = "Ro"
	#DEFINE ERRMESS0 "Eroare"
	#DEFINE ERRMESS1 "Nimic de importat"
	#DEFINE ERRMESS2 "Deschideti, va rog, tabelul / cursorul"
	#DEFINE ERRMESS3 "Foaie inexistenta"
	#DEFINE ERRMESS4 "Eroare la deschiderea"
#ELIF ERRLANG = "Fr"
	#DEFINE ERRMESS0 "Erreur"
	#DEFINE ERRMESS1 "Rien a ajouter"
	#DEFINE ERRMESS2 "S'il vous plaît ouvrir la table / curseur"
	#DEFINE ERRMESS3 "Feuille introuvable"
	#DEFINE ERRMESS4 "Erreur d'ouverture"
#ELIF ERRLANG = "Nl" && Koen Piller
    #DEFINE ERRMESS0 "Fout"
    #DEFINE ERRMESS1 "Niets te importeren"
    #DEFINE ERRMESS2 "Open s.v.p. tabel / cursor"
    #DEFINE ERRMESS3 "Blad niet gevonden"
    #DEFINE ERRMESS4 "Fout bij openen"
#ELSE
*#ELSE
	#DEFINE ERRMESS0 "Error"
	#DEFINE ERRMESS1 "Nothing to append"
	#DEFINE ERRMESS2 "Please open table / cursor"
	#DEFINE ERRMESS3 "Sheet not found"
	#DEFINE ERRMESS4 "Error opening"
#ENDIF
***************************************************************
* If you prefer to extract files with Winrar, uncomment this
***************************************************************
*#DEFINE archiveWinRar .T.


LOCAL lcDir,cCurStr,cCurSheet,lSetTalk,lnFFields,laFFields[1],lnColsNoAll,laFieldsAll[1],lnColsNo,laFields[1],lnCurCol,llMemos,llChars,lnSelect
lnSelect = SELECT(0)

IF PCOUNT() < 1 
	MESSAGEBOX(ERRMESS1,16,ERRMESS0)
	RETURN
ELSE
	IF VARTYPE(m.lcFileName) $ "CV"
		lcFileName = FORCEEXT(m.lcFileName,"xlsx")
		IF !FILE(m.lcFileName)
			MESSAGEBOX(ERRMESS1,16,ERRMESS0)
			RETURN
		ENDIF
	ELSE
		MESSAGEBOX(ERRMESS1,16,ERRMESS0)
		RETURN
	ENDIF
ENDIF
IF PCOUNT() >= 2 
	IF VARTYPE(m.cCur) $ "CV"
		IF USED(m.cCur)
			SELECT (m.cCur)
		ELSE
			MESSAGEBOX(ERRMESS2,16,ERRMESS0)
			RETURN
		ENDIF
	ELSE
		cCur = ALIAS()
	ENDIF
ELSE
	cCur = ALIAS()
ENDIF
IF PCOUNT()<3
	lcFFields = ""
ELSE
	IF VARTYPE(m.lcFFields) <> "C"
		lcFFields = ""
	ELSE
		lnFFields = ALINES(laFFields,m.lcFFields,1+4,",")
	ENDIF
ENDIF
IF PCOUNT() < 4
	lnStartRows = 1
ELSE
	IF VARTYPE(m.lnStartRows) <> "N"
		lnStartRows = 1
	ENDIF
ENDIF
IF PCOUNT()<5
	lcSheet = ""
ELSE
	IF NOT (VARTYPE(m.lcSheet) $ "CN")
		lcSheet = ""
	ENDIF
ENDIF

lSetTalk = SET("Talk")
SET TALK OFF 
lnColsNoAll = AFIELDS(m.laFieldsAll,m.cCur)
STORE .F. TO llChars,llMemos
lnColsNo = 0
FOR lnCurCol = 1 TO m.lnColsNoAll
	IF m.laFieldsAll[m.lnCurCol,2] $ "NFYBIDTLCVM"
		IF !EMPTY(m.lcFFields)
			IF ASCAN(m.laFFields,laFieldsAll[m.lnCurCol,1],1,-1,-1,1+2+4)=0
				LOOP
			ENDIF
		ENDIF
		lnColsNo = m.lnColsNo + 1
		DIMENSION laFields[m.lnColsNo,3]
		laFields[m.lnColsNo,1] = laFieldsAll[m.lnCurCol,1]
		laFields[m.lnColsNo,2] = laFieldsAll[m.lnCurCol,2]
		laFields[m.lnColsNo,3] = m.lnCurCol
		IF laFields[m.lnColsNo,2] == "M"
			llMemos = .T.
		ENDIF
		IF laFields[m.lnColsNo,2] $ "MCV"
			llChars = .T.
		ENDIF
	ELSE
		LOOP
	ENDIF
NEXT
lcDir = extract(m.lcFileName)

lcSheet = get_sheet(ADDBS(m.lcDir) + "workbook.xml",m.lcSheet)
IF EMPTY(m.lcSheet)
	MESSAGEBOX(ERRMESS3,16,'Error')
	cleanup(m.lcDir)
	SET TALK &lSetTalk
	SELECT (m.lnSelect)
	RETURN m.lcDBF
ENDIF

IF m.llChars
	cCurStr = get_strings(ADDBS(m.lcDir) + "sharedStrings.xml",m.llMemos)
	IF EMPTY(m.cCurStr)
		cleanup(m.lcDir)
		SET TALK &lSetTalk
		SELECT (m.lnSelect)
		IF USED(m.cCurStr)
			USE IN (m.cCurStr)
		ENDIF
		RETURN .F.
	ENDIF
ELSE
	cCurStr = ''
ENDIF

cCurSheet = get_cells(ADDBS(m.lcDir) + FORCEEXT(m.lcSheet,"xml"),m.cCur,m.cCurStr,@laFields,m.lnStartRows,m.llEmptyCells)
cleanup(m.lcDir)
SET TALK &lSetTalk
SELECT (m.lnSelect)
IF USED(m.cCurStr)
	USE IN (m.cCurStr)
ENDIF
RETURN .T.

*********************
* Extract xml files *
*********************
FUNCTION extract
	LPARAMETERS lcFileName
	LOCAL lcDir,lcZip,oShell,ofile,loErr as Exception,lcSetSaf,lni,lnFF,llRetry,laDir[1],lnDir,lnDir0
	lcDir = ADDBS(SYS(2023)) + SYS(2015)
	lcDir = SYS(5)+CURDIR()+'test'
	lcZip = FORCEEXT(m.lcDir,'.zip')
	COPY FILE (m.lcFileName) TO (m.lcZip)
	MD (m.lcDir)
***************************
* Use Winrar
***************************
#IFDEF archiveWinRar
	ShellExecute(0,"open","WinRAR.exe","E " + m.lcZip + " xl\sharedStrings.xml " + m.lcDir,"",1)
	lnFF = FOPEN(ADDBS(m.lcDir) + "sharedStrings.xml")
	DO WHILE m.lnFF < 0
		sleep(50)
		lnFF = FOPEN(ADDBS(m.lcDir) + "sharedStrings.xml")
	ENDDO
	FCLOSE(m.lnFF)
	ShellExecute(0,"open","WinRAR.exe","E " + m.lcZip + " xl\workbook.xml " + m.lcDir,"",1)
	lnFF = FOPEN(ADDBS(m.lcDir) + "workbook.xml")
	DO WHILE m.lnFF < 0
		sleep(50)
		lnFF = FOPEN(ADDBS(m.lcDir) + "workbook.xml")
	ENDDO
	FCLOSE(m.lnFF)
	ShellExecute(0,"open","WinRAR.exe","E " + m.lcZip + " xl\worksheets\sheet*.xml " + m.lcDir,"",1)
	lnDir0 = 0
	lnDir = ADIR(laDir,ADDBS(m.lcDir ) + "sheet*.xml")

	DO WHILE (m.lnDir <> m.lnDir0) OR (m.lnDir = 0)
		FOR lni = 1 TO m.lnDir
			lnFF = FOPEN(ADDBS(m.lcDir) + m.laDir[m.lni,1])
			DO WHILE m.lnFF < 0
				sleep(50)
				lnFF = FOPEN(ADDBS(m.lcDir) + m.laDir[m.lni,1])
			ENDDO
			FCLOSE(m.lnFF)
		NEXT
		lnDir0 = m.lnDir
		lnDir = ADIR(laDir,ADDBS(m.lcDir ) + "sheet*.xml")
	ENDDO
***************************
* Use Explorer
***************************
#ELSE
	oShell = CREATEOBJECT("shell.application")
	TRY
		FOR lni = 0 TO m.oShell.NameSpace(ADDBS(m.lcZip)+'xl').items.count - 1
			ofile = m.oShell.NameSpace(ADDBS(m.lcZip)+'xl').items.item(m.lni)
			IF INLIST(m.ofile.name,'sharedStrings.xml','workbook.xml')
				oShell.NameSpace( m.lcDir).copyhere( m.ofile)
				lnFF = FOPEN(ADDBS(m.lcDir) + m.ofile.name)
				DO WHILE m.lnFF < 0
					sleep(50)
					lnFF = FOPEN(ADDBS(m.lcDir) + m.ofile.name)
				ENDDO
				FCLOSE(m.lnFF)
			ENDIF
		ENDFOR
		FOR lni = 0 TO m.oShell.NameSpace(ADDBS(m.lcZip)+'xl\worksheets').items.count - 1
			ofile = m.oShell.NameSpace(ADDBS(m.lcZip)+'xl\worksheets').items.item(m.lni)
			IF LOWER(LEFT(m.ofile.name,5)) == 'sheet'
				oShell.NameSpace( m.lcDir).copyhere( m.ofile)
				lnFF = FOPEN(ADDBS(m.lcDir) + m.ofile.name)
				DO WHILE m.lnFF < 0
					sleep(50)
					lnFF = FOPEN(ADDBS(m.lcDir) + m.ofile.name)
				ENDDO
				FCLOSE(m.lnFF)
			ENDIF
		ENDFOR
	CATCH TO loErr
	ENDTRY
#ENDIF
RETURN lcDir
	
****************
* Read strings *
****************
FUNCTION get_strings
	LPARAMETERS lcStr,llMemos
	LOCAL cCurStr,lnF,lnPosSiSeek,lcBuff,lnPosSi,lnPosSi2,lcMemo,lcReturn,lnTextPiece,lnTextPiece2,lcTextPiece,lcVal
	STORE SYS(2015) TO lcReturn, cCurStr
	IF m.llMemos
		CREATE CURSOR (m.cCurStr) (cStr M)
	ELSE
		CREATE CURSOR (m.cCurStr) (cStr c(254))
	ENDIF
	lnF = FOPEN(m.lcStr)
	IF m.lnF >= 0
		lnPosSiSeek = 0
		DO WHILE !FEOF(m.lnF)
			lcBuff = FREAD(m.lnF,8192)
			lnPosSi = AT('<si>',m.lcBuff)
			lnPosSiSeek = m.lnPosSiSeek + m.lnPosSi + 3
			= FSEEK(m.lnF,m.lnPosSiSeek)
			lcBuff = FREAD(m.lnF,8192)
			lnPosSi2 = AT('</si>',m.lcBuff)
			lcMemo = ''
			DO WHILE !FEOF(m.lnF) AND m.lnPosSi2 = 0
				lcMemo = m.lcMemo + m.lcBuff
				lcBuff = FREAD(m.lnF,8192)
				lnPosSi2 = AT('</si>',m.lcMemo)
			ENDDO
			IF m.lnPosSi2 != 0
				lcMemo = m.lcMemo + LEFT(m.lcBuff,m.lnPosSi2 - 1)
				lnPosSiSeek = m.lnPosSiSeek + m.lnPosSi2 + 4
				lnPosSi = FSEEK(m.lnF,m.lnPosSiSeek)
				lcVal = ""
				STORE 1 TO lnTextPiece, lnTextPiece2
				lcTextPiece = STREXTRACT(m.lcMemo,'<t','</t>')
				DO WHILE !EMPTY(m.lcTextPiece)
					lcVal = m.lcVal + STREXTRACT(m.lcTextPiece,[>])
					lnTextPiece = m.lnTextPiece + 1
					lcTextPiece = STREXTRACT(m.lcMemo,'<t','</t>',m.lnTextPiece) 
				ENDDO
				INSERT INTO (m.cCurStr) (cStr) VALUES (htmspec(m.lcVal))
			ELSE
				lcMemo = m.lcMemo + m.lcBuff
				EXIT
			ENDIF
		ENDDO
	ELSE
		lcReturn = ''
		MESSAGEBOX(ERRMESS4 + ' sharedStrings.xml',16,'Error')
	ENDIF
	FCLOSE(m.lnF)
RETURN m.lcReturn

**************
* Read sheet *
**************
FUNCTION get_cells
	LPARAMETERS lcStr,cCurSheet,cCurStr,laField,lnStartRows,llEmptyCells
	LOCAL cCurSheet,lnField,ldDat01,ldDat02,lcSetDec,lcReturn,lnF,lnPosSiSeek,lcBuff,lnPosSi,lnPosSi2,lcMemo,laFieldGat[1],lni,lcCell,lcVal,lnDat,lnTim,lnCurRow,lnCurRow0,lnStartRows0,lcWholeRow,lcWholeTable
	LOCAL lnFirstCol,lnShCol,lnRealI
	lcWholeTable = FILETOSTR(m.lcStr)
	lnCurRow = 1 &&m.lnStartRows
	lnCurRow0 = 1
	lnStartRows0 = lnStartRows
	**************
	lcWholeRow = STREXTRACT(m.lcWholeTable,"<row ","</row>")
	IF EMPTY(m.lcWholeRow)
		MESSAGEBOX(ERRMESS1,16,ERRMESS0)
		RETURN ''
	ENDIF

	lnField = 1 
	lcCell = STREXTRACT(m.lcWholeRow,[<c ],[</c>],m.lnField)
	DO WHILE !EMPTY(m.lcWholeRow) AND (lnCurRow < m.lnStartRows0 OR EMPTY(m.lcCell) OR EMPTY(STREXTRACT(m.lcCell,[<v>],[</v>])))
		lnCurRow0 = m.lnCurRow0 + 1
		IF !EMPTY(m.lcCell) AND !EMPTY(STREXTRACT(m.lcCell,[<v>],[</v>]))
			lnCurRow = m.lnCurRow + 1
		ENDIF
		lcWholeRow = STREXTRACT(m.lcWholeTable,"<row ","</row>",m.lnCurRow0)
		lcCell = STREXTRACT(m.lcWholeRow,[<c ],[</c>])
	ENDDO
	lnStartRows = lnCurRow0
	lnField = ALEN(laField,1)
	ldDat01 = DATE(1900,3,1) - 61
	ldDat02 = DATE(1900,1,1) - 1
	lcSetDec = SET("Decimals")
	lnFirstCol = 0
	SET DECIMALS TO 10
	lcReturn = ''
	lnF = FOPEN(m.lcStr)
	lnCurRow = 0
	IF m.lnF >= 0
		lnPosSiSeek = 0
		DO WHILE !FEOF(m.lnF)
			lcBuff = FREAD(m.lnF,8192)
			lnPosSi = AT('<row r="',m.lcBuff)
			lcMemo = ''
			DO WHILE !FEOF(m.lnF) AND m.lnPosSi = 0
				lcMemo = m.lcMemo + m.lcBuff
				lcBuff = FREAD(m.lnF,8192)
				lnPosSi = AT('<row r="',m.lcMemo)
			ENDDO
			IF m.lnPosSi != 0
				lcMemo = m.lcMemo + LEFT(m.lcBuff,m.lnPosSi - 1)
				lnPosSiSeek = m.lnPosSiSeek + m.lnPosSi + 7
				lnPosSi = FSEEK(m.lnF,m.lnPosSiSeek)
			ELSE
				EXIT
			ENDIF
			
			= FSEEK(m.lnF,m.lnPosSiSeek)
			lcBuff = FREAD(m.lnF,8192)
			lnPosSi2 = AT('</row>',m.lcBuff)
			lcMemo = ''
			DO WHILE !FEOF(m.lnF) AND m.lnPosSi2 = 0
				lcMemo = m.lcMemo + m.lcBuff
				lcBuff = FREAD(m.lnF,8192)
				lnPosSi2 = AT('</row>',m.lcMemo)
			ENDDO
			IF m.lnPosSi2 != 0
				lcMemo = m.lcMemo + LEFT(m.lcBuff,m.lnPosSi2 - 1)
				lnPosSiSeek = m.lnPosSiSeek + m.lnPosSi2 + 5
				lnPosSi = FSEEK(m.lnF,m.lnPosSiSeek)
				lnCurRow = m.lnCurRow + 1
				IF m.lnStartRows > m.lnCurRow
					LOOP
				ENDIF
				SELECT (m.cCurSheet)
				APPEND BLANK
				SCATTER MEMO TO laFieldGat
				lnRealI = 1
				FOR lni = 1 TO lnField
					lcCell = STREXTRACT(m.lcMemo,[<c ],[</c>],m.lnRealI)
					IF AT([<c ],m.lcCell) > 0
						lcCell = LEFT(m.lcCell , AT([<c ],m.lcCell) - 1)
					ENDIF

					IF m.llEmptyCells
						lcShCol = CHRTRAN(STREXTRACT(m.lcCell,'r="','"'),'0123456789','')
						IF LEN(m.lcShCol) = 1
							lnShCol = ASC(m.lcShCol) - 64
						ELSE
							IF LEN(m.lcShCol) = 2
								lnShCol = ASC(RIGHT(m.lcShCol,1)) - 64 + 26 * (ASC(LEFT(m.lcShCol,1)) - 64)
							ELSE && LEN(m.lcShCol) = 3
								lnShCol = ASC(RIGHT(m.lcShCol,1)) - 64 + 26 * (ASC(SUBSTR(m.lcShCol,1,1)) - 64) + 676 * (ASC(LEFT(m.lcShCol,1)) - 64)
							ENDIF
						ENDIF
						IF lni < m.lnShCol
							lni = m.lnShCol
						ENDIF
*!*						IF m.lni = 1 AND m.lnCurRow = m.lnStartRows
*!*							lnFirstCol = m.lnShCol
*!*						ENDIF
						IF m.lni > m.lnField
							SELECT (m.cCurSheet)
							GATHER FROM laFieldGat MEMO
							EXIT
						ENDIF
					ENDIF

					lcVal = STREXTRACT(m.lcCell,[<v>],[</v>])

					lnRealI = m.lnRealI + 1
					IF EMPTY(m.lcVal)
						LOOP
					ENDIF
					IF laField[m.lni,2] $ "CVM"
						SELECT (m.cCurStr)
						TRY 
							IF [t="s"] $ m.lcCell
								GO VAL(m.lcVal) + 1 IN (m.cCurStr)
								laFieldGat[m.lni] = cStr
							ELSE
								laFieldGat[m.lni] = lcVal
							ENDIF
						CATCH TO loErr
							laFieldGat[m.lni] = lcVal
						ENDTRY
					ELSE
						IF laField[m.lni,2] $ "NFBYI"
							laFieldGat[laField[m.lni,3]] = VAL(m.lcVal)
						ELSE
							IF laField[m.lni,2] $ "D"
								lnDat = VAL(m.lcVal)
								IF m.lnDat >= 61
									laFieldGat[laField[m.lni,3]] = m.ldDat01 + m.lnDat
								ELSE
									laFieldGat[laField[m.lni,3]] = m.ldDat02 + m.lnDat
								ENDIF
							ELSE
								IF laField[m.lni,2] $ "T"
									lnTim = VAL(m.lcVal)
									lnDat = FLOOR(m.lnTim)
									laFieldGat[laField[m.lni,3]] = DTOT(m.ldDat01 + m.lnDat) + INT(86400.0 * (m.lnTim - m.lnDat))
								ELSE
									IF laField[m.lni,2] $ "L"
										laFieldGat[laField[m.lni,3]] = m.lcVal == "1"
									ENDIF
								ENDIF
							ENDIF
						ENDIF
					ENDIF
				NEXT
				SELECT (m.cCurSheet)
				GATHER FROM laFieldGat MEMO
			ELSE
				lcMemo = m.lcMemo + m.lcBuff
				EXIT
			ENDIF
		ENDDO
		lcReturn = m.cCurSheet
	ELSE
		MESSAGEBOX(ERRMESS4,16,'Error')
	ENDIF
	FCLOSE(m.lnF)
	SET DECIMALS TO &lcSetDec 
RETURN m.lcReturn

**********************
* Special characters *
**********************
FUNCTION htmspec
	LPARAMETERS cStr
	LOCAL lni,lcStrF,lcChar,lnChar
	lcStrF = m.cStr
	IF AT('&gt;',m.lcStrF)>0
		lcStrF = STRTRAN(m.lcStrF,'&gt;','>')
	ENDIF
	IF AT('&lt;',m.lcStrF)>0
		lcStrF = STRTRAN(m.lcStrF,'&lt;','<')
	ENDIF
	IF AT('&quot;',m.lcStrF)>0
		lcStrF = STRTRAN(m.lcStrF,'&quot;','"')
	ENDIF
	IF AT("&apos;",m.lcStrF)>0
		lcStrF = STRTRAN(m.lcStrF,'&apos;',"'")
	ENDIF
	IF AT([&#],m.lcStrF)>0
		FOR lnChar = 0 TO 255
			lcChar = [&#]+STR(m.lnChar,3)+[;]
			IF AT(m.lcChar,m.lcStrF)>0
				lcStrF = STRTRAN(m.lcStrF,m.lcChar,CHR(lnChar))
			ENDIF
		NEXT
	ENDIF
	IF AT([&#x],m.lcStrF)>0
		FOR lnChar = 0 TO 255
			lcChar = [&#x]+RIGHT(TRANSFORM(m.lnChar,"@0"),2)+[;]
			IF AT(m.lcChar,m.lcStrF)>0
				lcStrF = STRTRAN(m.lcStrF,m.lcChar,CHR(lnChar))
			ENDIF
		NEXT
	ENDIF
	IF AT('&amp;',m.lcStrF)>0
		lcStrF = STRTRAN(m.lcStrF,'&amp;',CHR(38))
	ENDIF

    * suggested by Koen Piller
	lcStrF = STRCONV(m.lcStrF,11)
	RETURN m.lcStrF
ENDFUNC

*****************
* Cleanup
******************
FUNCTION cleanup
	LPARAMETERS lcDir
	LOCAL lcZip,lcSetSaf
	lcZip = FORCEEXT(m.lcDir,'zip')
	lcSetSaf = SET("Safety")
	SET SAFETY OFF
	TRY 
		ERASE (ADDBS(m.lcDir)+'*.*')
		RD (m.lcDir)
	CATCH TO m.loErr
	ENDTRY

	ERASE (m.lcZip)
	SET SAFETY &lcSetSaf
RETURN .T.

*****************
* Read workbook *
*****************
FUNCTION get_sheet
LPARAMETERS lcStr,lcSheet
	LOCAL lnF,lcRealSheet,lcBuff,lcMemo,lni,lcRealSheet,lcCurSheet
	lnF = FOPEN(m.lcStr)
	lcRealSheet = ''
	IF m.lnF >= 0
		lcBuff = FREAD(m.lnf,8192)
		lcMemo = STREXTRACT(m.lcBuff,[<sheets>],[</sheets>])
		IF VARTYPE(m.lcSheet) == "N"
			IF BETWEEN(m.lcSheet,1,OCCURS([name="],m.lcMemo))
				lcRealSheet = 'sheet' + LTRIM(STR(m.lcSheet))
			ENDIF
		ELSE
			IF EMPTY(m.lcSheet)
				lcRealSheet = 'sheet1'
			ELSE
				FOR lni = 1 TO OCCURS([name="],m.lcMemo)
					lcCurSheet = STREXTRACT(m.lcMemo,[name="],["],m.lni)
					IF LOWER(ALLTRIM(m.lcCurSheet)) == LOWER(ALLTRIM(m.lcSheet))
						lcRealSheet = 'sheet' + TRANSFORM(m.lni)
						EXIT
					ENDIF
				NEXT
			ENDIF
		ENDIF
	ELSE
		MESSAGEBOX(ERRMESS4 + ' workbook.xml',16,'Error')
	ENDIF
	FCLOSE(m.lnF)
RETURN m.lcRealSheet
