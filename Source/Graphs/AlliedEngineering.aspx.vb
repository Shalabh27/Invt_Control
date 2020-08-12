Imports System.Data
Imports System.Data.SqlClient
Imports CrystalDecisions.Shared
Imports CrystalDecisions.CrystalReports.Engine
Imports SCBusinessLogic
Imports SSsolutions.FrameWork
Imports System.IO
Imports System.Math
Imports System.Web.UI.DataVisualization.Charting
Partial Class AlliedEngineering
    Inherits System.Web.UI.Page

    Protected Sub BindChartData()

        Dim conStr As String
        Dim objCon As SqlConnection
        'Instaniate connection object
        conStr = ConfigurationManager.ConnectionStrings("connString").ToString()
        objCon = New SqlConnection(conStr)
        objCon.Open()

        Dim objSqlAdp As New SqlDataAdapter("exec GetChartData @param1=" & "'" & cmbLine.SelectedValue & "',@param2=" & txtChainageStart.Text & ",@param3=" & txtChainageEnd.Text & "", objCon)
        'Dim objSqlAdp As New SqlDataAdapter("exec GetChartData", objCon)

        Dim objDs As New DataSet

        objSqlAdp.Fill(objDs)
        objCon.Close()
        'Terrain Susceptibility
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(0).Rows.Count > 0 And (chkAll.Checked Or chkSusceptibility.Checked) Then
                msTerrainSusceptibility.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                
                msTerrainSusceptibility.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msTerrainSusceptibility.Series.Clear()
                msTerrainSusceptibility.Series.Add("msBarChartSeries")
                'msTerrainSusceptibility.Series("msBarChartSeries").SmartLabelStyle.Enabled = False
                'msTerrainSusceptibility.Series("msBarChartSeries").LabelAngle = 90
                msTerrainSusceptibility.Series("msBarChartSeries").CustomProperties = "LebelText=A1"
                msTerrainSusceptibility.Series("msBarChartSeries").CustomProperties = "LabelStyle=Bottom"
                msTerrainSusceptibility.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msTerrainSusceptibility.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msTerrainSusceptibility.ChartAreas("msBarChartArea").AxisY.Title = "Terrain Susceptibility"
                msTerrainSusceptibility.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msTerrainSusceptibility.Series("msBarChartSeries")("PointWidth") = "0.5"
                msTerrainSusceptibility.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msTerrainSusceptibility.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(0).Rows

                    Dim a As Integer = msTerrainSusceptibility.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))
                    Select Case dr("scc").ToString.Substring(dr("scc").ToString.Length - 3, 3)
                        Case "AL1"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(a).AxisLabel = "AL1"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(0, 112, 192)
                        Case "AL2"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(a).AxisLabel = "AL1"

                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 192, 0)
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).AxisLabel = "AL1"
                        Case "AL3"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 51, 153)
                        Case "AL4"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 0)
                        Case "AL5"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(165, 165, 165)
                        Case "AL6"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(146, 205, 220)
                        Case "SP1"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 0, 0)
                        Case "SP2"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(227, 108, 10)
                        Case "TL1"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(251, 212, 180)
                        Case "TL2"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(0, 176, 80)
                        Case "TL3"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(247, 150, 70)
                        Case "TL4"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(216, 216, 216)
                        Case "TL5"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(141, 179, 226)
                        Case "TL6"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 153)
                        Case "TL7"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(66, 116, 176)
                        Case "TL8"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(217, 149, 148)
                        Case "TH1"
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(209, 223, 243)
                        Case Else
                            msTerrainSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 255)
                    End Select
                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'CP Susceptibility1
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(1).Rows.Count > 0 And (chkAll.Checked Or chkSusceptibility.Checked) Then
                msCIPSSusceptibility1.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msCIPSSusceptibility1.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msCIPSSusceptibility1.Series.Clear()
                msCIPSSusceptibility1.Series.Add("msBarChartSeries")
                msCIPSSusceptibility1.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msCIPSSusceptibility1.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msCIPSSusceptibility1.ChartAreas("msBarChartArea").AxisY.Title = "CIPS Susceptibility"
                msCIPSSusceptibility1.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msCIPSSusceptibility1.Series("msBarChartSeries")("PointWidth") = "0.5"
                msCIPSSusceptibility1.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msCIPSSusceptibility1.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(1).Rows
                    '               
                    msCIPSSusceptibility1.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))
                    If dr("scc").ToString().Contains("ON") Then

                        msCIPSSusceptibility1.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(192, 0, 0)
                    ElseIf dr("scc").ToString().Contains("OFF") Then

                        msCIPSSusceptibility1.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(192, 0, 0)
                    Else
                        msCIPSSusceptibility1.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 255)
                    End If

                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'CP Susceptibility2
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(1).Rows.Count > 0 And (chkAll.Checked Or chkSusceptibility.Checked) Then
                msCIPSSusceptibility2.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msCIPSSusceptibility2.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msCIPSSusceptibility2.Series.Clear()
                msCIPSSusceptibility2.Series.Add("msBarChartSeries")
                msCIPSSusceptibility2.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msCIPSSusceptibility2.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msCIPSSusceptibility2.ChartAreas("msBarChartArea").AxisY.Title = "CIPS Susceptibility"
                msCIPSSusceptibility2.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msCIPSSusceptibility2.Series("msBarChartSeries")("PointWidth") = "0.5"
                msCIPSSusceptibility2.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msCIPSSusceptibility2.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(1).Rows
                    '               
                    msCIPSSusceptibility2.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))
                    If dr("scc").ToString().Contains("DIFF") Then

                        msCIPSSusceptibility2.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 192, 0)
                    Else
                        msCIPSSusceptibility2.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 255)
                    End If

                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'DCVG Susceptibility
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(1).Rows.Count > 0 And (chkAll.Checked Or chkSusceptibility.Checked) Then
                msDCVGSusceptibility.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msDCVGSusceptibility.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msDCVGSusceptibility.Series.Clear()
                msDCVGSusceptibility.Series.Add("msBarChartSeries")
                msDCVGSusceptibility.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msDCVGSusceptibility.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msDCVGSusceptibility.ChartAreas("msBarChartArea").AxisY.Title = "DCVG Susceptibility"
                msDCVGSusceptibility.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msDCVGSusceptibility.Series("msBarChartSeries")("PointWidth") = "0.5"
                msDCVGSusceptibility.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msDCVGSusceptibility.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(1).Rows
                    '               
                    msDCVGSusceptibility.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))
                    If dr("scc").ToString().Contains("DIFF") Then

                        msDCVGSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 51, 0)
                    Else
                        msDCVGSusceptibility.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 255)
                    End If

                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Non-Susceptibility
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(2).Rows.Count > 0 And (chkAll.Checked Or chkNonSusceptibility.Checked) Then
                msNonSusceptibilityHeavyWall.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msNonSusceptibilityHeavyWall.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msNonSusceptibilityHeavyWall.Series.Clear()
                msNonSusceptibilityHeavyWall.Series.Add("msBarChartSeries")
                msNonSusceptibilityHeavyWall.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msNonSusceptibilityHeavyWall.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msNonSusceptibilityHeavyWall.ChartAreas("msBarChartArea").AxisY.Title = "Heavy Wall"
                msNonSusceptibilityHeavyWall.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msNonSusceptibilityHeavyWall.Series("msBarChartSeries")("PointWidth") = "0.5"
                msNonSusceptibilityHeavyWall.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msNonSusceptibilityHeavyWall.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(2).Rows
                    msNonSusceptibilityHeavyWall.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))

                    msNonSusceptibilityHeavyWall.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(191, 191, 191)

                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Diameter
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(3).Rows.Count > 0 And (chkAll.Checked Or chkDia.Checked) Then
                msDia.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msDia.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msDia.Series.Clear()
                msDia.Series.Add("msBarChartSeries")
                msDia.Series("msBarChartSeries").ChartType = SeriesChartType.StepLine
                'msDia.ChartAreas("msBarChartArea").AxisY.Interval = 8
                'msDia.ChartAreas("msBarChartArea").AxisX.Interval = 8
                msDia.ChartAreas("msBarChartArea").AxisX.Title = "Diameter"
                msDia.ChartAreas("msBarChartArea").AxisX.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msDia.Series("msBarChartSeries")("PointWidth") = "0.1"
                msDia.ChartAreas("msBarChartArea").AxisX.Minimum = txtChainageStart.Text
                msDia.ChartAreas("msBarChartArea").AxisX.Maximum = txtChainageEnd.Text
                msDia.ChartAreas("msBarChartArea").AxisY.Minimum = 0
                msDia.ChartAreas("msBarChartArea").AxisY.Maximum = 40
                For Each dr As DataRow In objDs.Tables(3).Rows
                    msDia.Series("msBarChartSeries").Points.AddXY(dr("begin_s"), dr("diameter"))

                    msDia.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(0, 0, 0)

                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Year of Construction/Year of Coating
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(4).Rows.Count > 0 And (chkAll.Checked Or chkYearofCoating.Checked) Then
                msYearofCoating.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msYearofCoating.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msYearofCoating.Series.Clear()
                msYearofCoating.Series.Add("msBarChartSeries")
                msYearofCoating.Series("msBarChartSeries").ChartType = SeriesChartType.StepLine
                'msDia.ChartAreas("msBarChartArea").AxisY.Interval = 10
                'msYearofCoating.ChartAreas("msBarChartArea").AxisX.Interval = 8
                msYearofCoating.ChartAreas("msBarChartArea").AxisX.Title = "Year of Coating"
                msYearofCoating.ChartAreas("msBarChartArea").AxisX.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msYearofCoating.Series("msBarChartSeries")("PointWidth") = "0.1"
                msYearofCoating.ChartAreas("msBarChartArea").AxisX.Minimum = txtChainageStart.Text
                msYearofCoating.ChartAreas("msBarChartArea").AxisX.Maximum = txtChainageEnd.Text
                msYearofCoating.ChartAreas("msBarChartArea").AxisY.Minimum = 1930
                msYearofCoating.ChartAreas("msBarChartArea").AxisY.Maximum = 2030
                For Each dr As DataRow In objDs.Tables(4).Rows
                    msYearofCoating.Series("msBarChartSeries").Points.AddXY(dr("begin_s"), dr("coat_year"))

                    msYearofCoating.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(0, 0, 0)

                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Wall Thickness
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(5).Rows.Count > 0 Then
                msWallThickness.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msWallThickness.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msWallThickness.Series.Clear()
                msWallThickness.Series.Add("msBarChartSeries")
                msWallThickness.Series("msBarChartSeries").ChartType = SeriesChartType.StepLine
                'msDia.ChartAreas("msBarChartArea").AxisY.Interval = 10
                'msWallThickness.ChartAreas("msBarChartArea").AxisX.Interval = 2
                msWallThickness.ChartAreas("msBarChartArea").AxisX.Title = "Wall Thickness"
                msWallThickness.ChartAreas("msBarChartArea").AxisX.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msWallThickness.Series("msBarChartSeries")("PointWidth") = "0.1"
                msWallThickness.ChartAreas("msBarChartArea").AxisX.Minimum = txtChainageStart.Text
                msWallThickness.ChartAreas("msBarChartArea").AxisX.Maximum = txtChainageEnd.Text
                msWallThickness.ChartAreas("msBarChartArea").AxisY.Minimum = 0
                msWallThickness.ChartAreas("msBarChartArea").AxisY.Maximum = 16
                For Each dr As DataRow In objDs.Tables(5).Rows
                    msWallThickness.Series("msBarChartSeries").Points.AddXY(dr("begin_s"), dr("wall_thick"))

                    msWallThickness.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(0, 0, 0)

                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Weights
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(6).Rows.Count > 0 And (chkAll.Checked Or chkWeights.Checked) Then
                msWeights.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msWeights.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msWeights.Series.Clear()
                msWeights.Series.Add("msBarChartSeries")
                msWeights.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msWeights.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msWeights.ChartAreas("msBarChartArea").AxisY.Title = "Weights"
                msWeights.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msWeights.Series("msBarChartSeries")("PointWidth") = "0.5"
                msWeights.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msWeights.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(6).Rows
                    msWeights.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))

                    msWeights.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 0)

                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Parent Material
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(7).Rows.Count > 0 And (chkAll.Checked Or chkParentMaterial.Checked) Then
                msParentMaterialRoads.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msParentMaterialRoads.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msParentMaterialRoads.Series.Clear()
                msParentMaterialRoads.Series.Add("msBarChartSeries")
                msParentMaterialRoads.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msParentMaterialRoads.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msParentMaterialRoads.ChartAreas("msBarChartArea").AxisY.Title = "Roads"
                msParentMaterialRoads.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msParentMaterialRoads.Series("msBarChartSeries")("PointWidth") = "0.5"
                msParentMaterialRoads.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msParentMaterialRoads.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(7).Rows
                    msParentMaterialRoads.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))

                    msParentMaterialRoads.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(191, 191, 191)

                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Parent Material
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(8).Rows.Count > 0 And (chkAll.Checked Or chkParentMaterial.Checked) Then
                msParentMaterialWater.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msParentMaterialWater.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msParentMaterialWater.Series.Clear()
                msParentMaterialWater.Series.Add("msBarChartSeries")
                msParentMaterialWater.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msParentMaterialWater.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msParentMaterialWater.ChartAreas("msBarChartArea").AxisY.Title = "Water Feature"
                msParentMaterialWater.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msParentMaterialWater.Series("msBarChartSeries")("PointWidth") = "0.5"
                msParentMaterialWater.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msParentMaterialWater.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(8).Rows
                    msParentMaterialWater.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))

                    msParentMaterialWater.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(191, 191, 191)

                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Parent Material
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(9).Rows.Count > 0 And (chkAll.Checked Or chkParentMaterial.Checked) Then
                msParentMaterialSoilType.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msParentMaterialSoilType.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msParentMaterialSoilType.Series.Clear()
                msParentMaterialSoilType.Series.Add("msBarChartSeries")
                msParentMaterialSoilType.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msParentMaterialSoilType.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msParentMaterialSoilType.ChartAreas("msBarChartArea").AxisY.Title = "Soil Type"
                msParentMaterialSoilType.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msParentMaterialSoilType.Series("msBarChartSeries")("PointWidth") = "0.5"
                msParentMaterialSoilType.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msParentMaterialSoilType.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(9).Rows
                    msParentMaterialSoilType.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))
                    If dr("p_material").ToString().Contains("Glaciofluvial") Then
                        msParentMaterialSoilType.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(192, 0, 0)
                    ElseIf dr("p_material").ToString().Contains("Fluvial") Then
                        msParentMaterialSoilType.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(250, 191, 143)
                    ElseIf dr("p_material").ToString().Contains("Moraine Till - Clay") Then
                        msParentMaterialSoilType.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 192, 143)
                    ElseIf dr("p_material").ToString().Contains("Moraine Till - Sand") Then
                        msParentMaterialSoilType.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 102)
                    ElseIf dr("p_material").ToString().Contains("Moraine Till - Rock") Then
                        msParentMaterialSoilType.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(178, 178, 178)
                    ElseIf dr("p_material").ToString().Contains("Organic ( over Clay)") Then
                        msParentMaterialSoilType.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(84, 141, 212)
                    ElseIf dr("p_material").ToString().Contains("Lacustrine") Then
                        msParentMaterialSoilType.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(217, 149, 148)
                    ElseIf dr("p_material").ToString().Contains("Organic ( over gravel)") Then
                        msParentMaterialSoilType.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(204, 153, 148)
                    ElseIf dr("p_material").ToString().Contains("Bedrock") Then
                        msParentMaterialSoilType.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(147, 137, 83)
                    ElseIf dr("p_material").ToString().Contains("Alluvial") Then
                        msParentMaterialSoilType.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(153, 51, 83)
                    ElseIf dr("p_material").ToString().Contains("Eolian") Then
                        msParentMaterialSoilType.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(128, 128, 0)
                    ElseIf dr("p_material").ToString().Contains("Colluvial") Then
                        msParentMaterialSoilType.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(204, 102, 0)
                    Else
                        msParentMaterialSoilType.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 255)
                    End If
                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Topography
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(10).Rows.Count > 0 And (chkAll.Checked Or chkTopography.Checked) Then
                msTopography.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msTopography.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msTopography.Series.Clear()
                msTopography.Series.Add("msBarChartSeries")
                msTopography.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msTopography.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msTopography.ChartAreas("msBarChartArea").AxisY.Title = "Topography"
                msTopography.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msTopography.Series("msBarChartSeries")("PointWidth") = "0.5"
                msTopography.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msTopography.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(10).Rows
                    msTopography.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))
                    If dr("topography").ToString().Contains("L") Then
                        msTopography.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(250, 191, 143)
                    ElseIf dr("topography").ToString().Contains("I") Then
                        msTopography.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(245, 123, 23)
                    ElseIf dr("topography").ToString().Contains("D") Then
                        msTopography.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(229, 184, 183)
                    ElseIf dr("topography").ToString().Contains("SS") Then
                        msTopography.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(153, 0, 0)
                    ElseIf dr("topography").ToString().Contains("L-I") Then
                        msTopography.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(204, 153, 178)
                    ElseIf dr("topography").ToString().Contains("L-D") Then
                        msTopography.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(196, 188, 150)
                    ElseIf dr("topography").ToString().Contains("R") Then
                        msTopography.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 0)
                    Else
                        msTopography.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 255)
                    End If
                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Drainage
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(11).Rows.Count > 0 And (chkAll.Checked Or chkDrainage.Checked) Then
                msDrainage.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msDrainage.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msDrainage.Series.Clear()
                msDrainage.Series.Add("msBarChartSeries")
                msDrainage.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msDrainage.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msDrainage.ChartAreas("msBarChartArea").AxisY.Title = "Drainage"
                msDrainage.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msDrainage.Series("msBarChartSeries")("PointWidth") = "0.5"
                msDrainage.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msDrainage.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(11).Rows
                    msDrainage.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))
                    If dr("drainage").ToString().Contains("W") Then
                        msDrainage.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 0, 0)
                    ElseIf dr("drainage").ToString().Contains("I") Then
                        msDrainage.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(250, 191, 143)
                    ElseIf dr("drainage").ToString().Contains("I-P") Then
                        msDrainage.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(217, 149, 148)
                    ElseIf dr("drainage").ToString().Contains("P") Then
                        msDrainage.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(227, 108, 10)
                    ElseIf dr("drainage").ToString().Contains("P-VP") Then
                        msDrainage.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 153, 102)
                    ElseIf dr("drainage").ToString().Contains("VP") Then
                        msDrainage.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(196, 188, 150)
                    Else
                        msDrainage.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 255)
                    End If
                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Dominant Texture
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(12).Rows.Count > 0 And (chkAll.Checked Or chkDominantTexture.Checked) Then
                msDominantTexture.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msDominantTexture.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msDominantTexture.Series.Clear()
                msDominantTexture.Series.Add("msBarChartSeries")
                msDominantTexture.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msDominantTexture.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msDominantTexture.ChartAreas("msBarChartArea").AxisY.Title = "Dominant Texture C"
                msDominantTexture.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msDominantTexture.Series("msBarChartSeries")("PointWidth") = "0.5"
                'msDominantTexture.Series("msBarChartSeries")("DrawingStyle") = "Point"
                msDominantTexture.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msDominantTexture.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(12).Rows
                    msDominantTexture.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))
                    If dr("c_hor_text").ToString().Contains("Sand") Then
                        msDominantTexture.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(128, 128, 0)
                    ElseIf dr("c_hor_text").ToString().Contains("Silt") Then
                        msDominantTexture.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(204, 204, 143)
                    ElseIf dr("c_hor_text").ToString().Contains("Clay") Then
                        msDominantTexture.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(165, 0, 33)
                    ElseIf dr("c_hor_text").ToString().Contains("Silty Clay") Then
                        msDominantTexture.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(153, 51, 102)
                    ElseIf dr("c_hor_text").ToString().Contains("Loam") Then
                        msDominantTexture.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(204, 0, 204)
                    ElseIf dr("c_hor_text").ToString().Contains("Sandy Loam") Then
                        msDominantTexture.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(204, 102, 255)
                    ElseIf dr("c_hor_text").ToString().Contains("Sandy Clay Loam") Then
                        msDominantTexture.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(102, 102, 153)
                    ElseIf dr("c_hor_text").ToString().Contains("Silty Clay Loam") Then
                        msDominantTexture.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(0, 255, 255)
                    ElseIf dr("c_hor_text").ToString().Contains("Limestone") Then
                        msDominantTexture.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(102, 51, 0)
                    ElseIf dr("c_hor_text").ToString().Contains("Bedrock") Then
                        msDominantTexture.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(147, 137, 83)
                    ElseIf dr("c_hor_text").ToString().Contains("Caliche") Then
                        msDominantTexture.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(204, 153, 0)
                    ElseIf dr("c_hor_text").ToString().Contains("Gravel") Then
                        msDominantTexture.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(0, 153, 204)
                    ElseIf dr("c_hor_text").ToString().Contains("Very Fine Sand") Then
                        msDominantTexture.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(0, 204, 153)
                    Else
                        msDominantTexture.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 255)
                    End If
                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Direct Crossing 
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(13).Rows.Count > 0 And (chkAll.Checked Or chkDirectCrossing.Checked) Then
                msDirectCrossingPR.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msDirectCrossingPR.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msDirectCrossingPR.Series.Clear()
                msDirectCrossingPR.Series.Add("msBarChartSeries")
                msDirectCrossingPR.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msDirectCrossingPR.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msDirectCrossingPR.ChartAreas("msBarChartArea").AxisY.Title = "Direct Crossing"
                msDirectCrossingPR.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msDirectCrossingPR.Series("msBarChartSeries")("PointWidth") = "0.5"
                'msDominantTexture.Series("msBarChartSeries")("DrawingStyle") = "Point"
                msDirectCrossingPR.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msDirectCrossingPR.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(13).Rows
                    msDirectCrossingPR.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))
                    If dr("d_cross").ToString().Contains("PR") Then
                        msDirectCrossingPR.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 51, 0)
                    Else
                        msDirectCrossingPR.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 255)
                    End If
                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Direct Crossing 
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(13).Rows.Count > 0 And (chkAll.Checked Or chkDirectCrossing.Checked) Then
                msDirectCrossingGR.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msDirectCrossingGR.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msDirectCrossingGR.Series.Clear()
                msDirectCrossingGR.Series.Add("msBarChartSeries")
                msDirectCrossingGR.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msDirectCrossingGR.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msDirectCrossingGR.ChartAreas("msBarChartArea").AxisY.Title = "Direct Crossing"
                msDirectCrossingGR.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msDirectCrossingGR.Series("msBarChartSeries")("PointWidth") = "0.5"
                'msDominantTexture.Series("msBarChartSeries")("DrawingStyle") = "Point"
                msDirectCrossingGR.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msDirectCrossingGR.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(13).Rows
                    msDirectCrossingGR.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))
                    If dr("d_cross").ToString().Contains("GR") Then
                        msDirectCrossingGR.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 0, 255)
                    Else
                        msDirectCrossingGR.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 255)
                    End If
                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Direct Crossing 
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(13).Rows.Count > 0 And (chkAll.Checked Or chkDirectCrossing.Checked) Then
                msDirectCrossingRR.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msDirectCrossingRR.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msDirectCrossingRR.Series.Clear()
                msDirectCrossingRR.Series.Add("msBarChartSeries")
                msDirectCrossingRR.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msDirectCrossingRR.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msDirectCrossingRR.ChartAreas("msBarChartArea").AxisY.Title = "Direct Crossing"
                msDirectCrossingRR.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msDirectCrossingRR.Series("msBarChartSeries")("PointWidth") = "0.5"
                'msDominantTexture.Series("msBarChartSeries")("DrawingStyle") = "Point"
                msDirectCrossingRR.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msDirectCrossingRR.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(13).Rows
                    msDirectCrossingRR.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))
                    If dr("d_cross").ToString().Contains("RR") Then
                        msDirectCrossingRR.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 0)
                    Else
                        msDirectCrossingRR.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 255)
                    End If
                    pointIndex = pointIndex + 1

                Next
            End If
        End If

        'Direct Crossing 
        If objDs.Tables.Count > 0 Then
            If objDs.Tables(13).Rows.Count > 0 And (chkAll.Checked Or chkDirectCrossing.Checked) Then
                msDirectCrossingDR.Visible = True
                Dim pointIndex As Integer = 0
                ' Populate series data
                msDirectCrossingDR.ChartAreas("msBarChartArea").Area3DStyle.Enable3D = False
                msDirectCrossingDR.Series.Clear()
                msDirectCrossingDR.Series.Add("msBarChartSeries")
                msDirectCrossingDR.Series("msBarChartSeries").ChartType = SeriesChartType.RangeBar
                'msDirectCrossingDR.ChartAreas("msBarChartArea").AxisY.Interval = 10
                msDirectCrossingDR.ChartAreas("msBarChartArea").AxisY.Title = "Direct Crossing"
                msDirectCrossingDR.ChartAreas("msBarChartArea").AxisY.TitleFont = New System.Drawing.Font(System.Drawing.FontFamily.GenericSerif, 15.25F, System.Drawing.FontStyle.Bold)
                msDirectCrossingDR.Series("msBarChartSeries")("PointWidth") = "0.5"
                'msDominantTexture.Series("msBarChartSeries")("DrawingStyle") = "Point"
                msDirectCrossingDR.ChartAreas("msBarChartArea").AxisY.Minimum = txtChainageStart.Text
                msDirectCrossingDR.ChartAreas("msBarChartArea").AxisY.Maximum = txtChainageEnd.Text
                For Each dr As DataRow In objDs.Tables(13).Rows
                    msDirectCrossingDR.Series("msBarChartSeries").Points.AddXY(1, dr("begin_s"), dr("end_s"))
                    If dr("d_cross").ToString().Contains("DR") Then
                        msDirectCrossingDR.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 192, 0)
                    Else
                        msDirectCrossingDR.Series("msBarChartSeries").Points(pointIndex).Color = Drawing.Color.FromArgb(255, 255, 255)
                    End If
                    pointIndex = pointIndex + 1

                Next
            End If
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Bind_Line()
            txtChainageStart.Text = 799579.58
            txtChainageEnd.Text = 978435.0
            BindChartData()
        End If
    End Sub
    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
        BindChartData()
    End Sub
    Public Sub Bind_Line()     
        'cmbBusinessType.Items.Add(New ListItem("ALL", "ALL"))
        Dim conStr As String
        Dim objCon As SqlConnection
        'Instaniate connection object
        conStr = ConfigurationManager.ConnectionStrings("connString").ToString()
        objCon = New SqlConnection(conStr)

        Dim objSqlAdp As New SqlDataAdapter("exec GetChartData @param4='L'", objCon)

        Dim objDs As New DataSet
        objCon.Open()
        objSqlAdp.Fill(objDs)
        objCon.Close()

        If objDS.Tables.Count > 0 Then
            If objDS.Tables(0).Rows.Count > 0 Then
                cmbLine.Items.Add(New ListItem("-----SELECT-----", "-----SELECT-----"))
                For Each dr As DataRow In objDS.Tables(0).Rows
                    cmbLine.Items.Add(New ListItem(dr("line").ToString(), dr("line").ToString()))
                Next
            End If
        End If
    End Sub

    Public Sub btnGenerate_OnClick()
        BindChartData()
    End Sub
End Class
