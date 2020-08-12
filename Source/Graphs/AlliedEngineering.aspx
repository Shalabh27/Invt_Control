<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AlliedEngineering.aspx.vb"
    Inherits="AlliedEngineering" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="UserControl/wbCountry.ascx" TagName="Country" TagPrefix="SS" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Allied Engineering</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link href="css/default/default_main.css" rel="stylesheet" type="text/css" />
    <link href="css/default/default_forms.css" rel="stylesheet" type="text/css" />
    <link href="css/default/default_grids_tables.css" rel="stylesheet" type="text/css" />
    <link href="css/default/default_titles_menus.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery/Common.js" type="text/javascript"></script>
    <style type="text/css">
        *
        {
            margin: 0;
            padding: 0;
        }
        body
        {
            background-color: #FFFFFF;
        }
        .style1
        {
            width: 350px;
        }
        .style2
        {
            width: 18%;
        }
        .style3
        {
            width: 86px;
        }
        a:link
        {
            color: #666;
            text-decoration: none;
        }
        a:visited
        {
            text-decoration: none;
            color: #666;
        }
        a:hover
        {
            text-decoration: none;
            color: #8CC63E;
        }
        a:active
        {
            text-decoration: none;
            color: #666;
        }
    </style>
    <script language="javascript" type="text/javascript">
  
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <input id="hdQ" runat="server" type="hidden" value="0" />
    <ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" AsyncPostBackTimeout="900"
        EnableScriptGlobalization="true" EnableScriptLocalization="true" ID="ScriptManager1" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; height: 100%;
                text-align: center;">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%;">
                            <tr>
                                <td colspan="10" style="height: 21px; text-align: center; color: Red;">
                                    <h1>
                                        <b><span>Visual Report</span></b>
                                    </h1>
                                </td>
                            </tr>
                            <%--<div style="width:99%;height:99%;border-right: #D40000 1px solid; border-left: #D40000 1px solid;
                                border-bottom: #D40000 1px solid;border-top: #D40000 1px solid;">--%>
                                <%--<fieldset style="widows: 98%;border-right: #D40000 1px solid; border-left: #D40000 1px solid;
                                border-bottom: #D40000 1px solid;border-top: #D40000 1px solid;">--%>
                            <tr>
                            <table cellpadding="0" cellspacing="0" style="width: 99%; height: 99%;border-right: #000000 1px solid; border-left: #000000 1px solid;
                                border-bottom: #000000 1px solid;border-top: #000000 1px solid;">
                                <tr>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;">
                                    <asp:Label ID="lblLine" CssClass="labeltext_bold" runat="server" Text="Line">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;">
                                    <ajaxToolkit:ComboBox ID="cmbLine" runat="server" AutoPostBack="False" DropDownStyle="Simple"
                                        AutoCompleteMode="Append" CaseSensitive="False" ItemInsertLocation="OrdinalText"
                                        CssClass="WindowsStyle" Width="144">
                                    </ajaxToolkit:ComboBox>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;">
                                </td>
                            </tr>
                            
                            <tr >
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;padding-top:5px;">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;padding-top:5px;">
                                    <asp:Label ID="lblChainageStart" CssClass="labeltext_bold" runat="server" Text="Chainage Start">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;padding-top:5px;">
                                    <asp:TextBox TabIndex="2" runat="server" ID="txtChainageStart" CssClass="Input_TextBox" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;padding-top:5px;">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;padding-top:5px;">
                                    <asp:Label ID="lblChainageEnd" CssClass="labeltext_bold" runat="server" Text="Chainage End">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;padding-top:5px;">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;padding-top:5px;">
                                    <asp:TextBox TabIndex="2" runat="server" ID="txtChainageEnd" CssClass="Input_TextBox" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;padding-top:5px;">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;padding-top:5px;">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;padding-top:5px;">
                                </td>
                            </tr>
                            
                            <tr>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;">
                                    <asp:Label ID="lblChartType" CssClass="labeltext_bold" runat="server" Text="Chart/Graph Type">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;">
                                    <asp:Label ID="lblAll" CssClass="labeltext_bold" runat="server" Text="All">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;">
                                    <asp:CheckBox ID="chkAll" runat="server" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;">
                                    <asp:Label ID="lblHCA" CssClass="labeltext_bold" runat="server" Text="HCA">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;">
                                    <asp:CheckBox ID="chkHCA" runat="server" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;">
                                    <asp:Label ID="lblSusceptibility" CssClass="labeltext_bold" runat="server" Text="Susceptibility">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;">
                                    <asp:CheckBox ID="chkSusceptibility" runat="server" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%;">
                                    <asp:Label ID="lblNonSusceptibility" CssClass="labeltext_bold" runat="server" Text="Non Susceptibility">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;">
                                    <asp:CheckBox ID="chkNonSusceptibility" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                    <asp:Label ID="lblDia" CssClass="labeltext_bold" runat="server" Text="Dia.">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    <asp:CheckBox ID="chkDia" runat="server" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                    <asp:Label ID="lblYearofCoating" CssClass="labeltext_bold" runat="server" Text="Year of Coating">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%;">
                                    <asp:CheckBox ID="chkYearofCoating" runat="server" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                    <asp:Label ID="lblSYMS" CssClass="labeltext_bold" runat="server" Text="% SYMS">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    <asp:CheckBox ID="chkSYMS" runat="server" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                    <asp:Label ID="lblWeights" CssClass="labeltext_bold" runat="server" Text="Weights">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    <asp:CheckBox ID="chkWeights" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                    <asp:Label ID="lblParentMaterial" CssClass="labeltext_bold" runat="server" Text="Parent Material">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    <asp:CheckBox ID="chkParentMaterial" runat="server" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                    <asp:Label ID="lblTopography" CssClass="labeltext_bold" runat="server" Text="Topography">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    <asp:CheckBox ID="chkTopography" runat="server" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                    <asp:Label ID="lblDrainage" CssClass="labeltext_bold" runat="server" Text="Drainage">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    <asp:CheckBox ID="chkDrainage" runat="server" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                    <asp:Label ID="lblDominantTexture" CssClass="labeltext_bold" runat="server" Text="Dominant Texture">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    <asp:CheckBox ID="chkDominantTexture" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                    <asp:Label ID="lblDepth" CssClass="labeltext_bold" runat="server" Text="Depth">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    <asp:CheckBox ID="chkDepth" runat="server" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                    <asp:Label ID="lblCIPS" CssClass="labeltext_bold" runat="server" Text="CIPS">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    <asp:CheckBox ID="chkCIPS" runat="server" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                    <asp:Label ID="lblDCVG" CssClass="labeltext_bold" runat="server" Text="DCVG">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    <asp:CheckBox ID="chkDCVG" runat="server" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                    <asp:Label ID="lblDirectCrossing" CssClass="labeltext_bold" runat="server" Text="Direct Crossing">
                                    </asp:Label>
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    <asp:CheckBox ID="chkDirectCrossing" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                    
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 15%">
                                <asp:Button ID="btnGenerate" runat="server" Text="Generate" CssClass="Action_Button_Global_Search"
                                        Width="100" OnClick="btnGenerate_OnClick" />
                                </td>
                                <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 5px; text-align: left; color: Black; width: 5%">
                                </td>
                                <td style="height: 5px; text-align: left; color: Black; width: 15%">
                                </td>
                                <td style="height: 5px; text-align: left; color: Black; width: 15%">
                                </td>
                                <td style="height: 5px; text-align: left; color: Black; width: 5%">
                                </td>
                                <td style="height: 5px; text-align: left; color: Black; width: 15%">
                                    
                                </td>
                                <td style="height: 5px; text-align: left; color: Black; width: 5%">
                                </td>
                                <td style="height: 5px; text-align: left; color: Black; width: 15%">
                                </td>
                                <td style="height: 5px; text-align: left; color: Black; width: 5%">
                                </td>
                                <td style="height: 5px; text-align: left; color: Black; width: 15%">                                
                                </td>
                                <td style="height: 5px; text-align: left; color: Black; width: 5%">
                                </td>
                            </tr>
                            </table>
                            </tr>
                            <%--</fieldset>--%>
                            <%--</div>--%>
                            <tr>
                                <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                </td>--%>
                                <td colspan="9">
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 100%">
                                                <asp:Chart ID="msHCA" runat="server" Width="900" Height="181px" Visible="false">
                                                    <Legends>
                                                        <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                            Font="Trebuchet MS, 8.25pt, style=Bold">
                                                        </asp:Legend>
                                                    </Legends>
                                                    <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="msBarChartArea">
                                                            <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                WallWidth="0" IsClustered="False" />
                                                            <AxisY LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisY>
                                                            <AxisX LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisX>
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                            </td>
                                        </tr>
                                </td>
                            </tr>
                            <tr>
                                <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                <td colspan="9">
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 100%">
                                                <asp:Chart ID="msTerrainSusceptibility" runat="server" Width="900px" Height="181px" Visible="false">
                                                    <Legends>
                                                        <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                            Font="Trebuchet MS, 8.25pt, style=Bold">
                                                        </asp:Legend>
                                                    </Legends>
                                                    <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="msBarChartArea">
                                                            <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                WallWidth="0" IsClustered="False" />
                                                            <AxisY LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisY>
                                                            <AxisX LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisX>
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                            </td>
                                        </tr>
                                </td>
                            </tr>
                            <tr>
                                <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                <td colspan="9">
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 100%">
                                                <asp:Chart ID="msCIPSSusceptibility1" runat="server" Width="900px" Height="181px" Visible="false">
                                                    <Legends>
                                                        <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                            Font="Trebuchet MS, 8.25pt, style=Bold">
                                                        </asp:Legend>
                                                    </Legends>
                                                    <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="msBarChartArea">
                                                            <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                WallWidth="0" IsClustered="False" />
                                                            <AxisY LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisY>
                                                            <AxisX LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisX>
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                            </td>
                                        </tr>
                                </td>
                            </tr>
                            <tr>
                                <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                <td colspan="9">
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 100%">
                                                <asp:Chart ID="msCIPSSusceptibility2" runat="server" Width="900px" Height="181px" Visible="false">
                                                    <Legends>
                                                        <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                            Font="Trebuchet MS, 8.25pt, style=Bold">
                                                        </asp:Legend>
                                                    </Legends>
                                                    <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="msBarChartArea">
                                                            <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                WallWidth="0" IsClustered="False" />
                                                            <AxisY LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisY>
                                                            <AxisX LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisX>
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                            </td>
                                        </tr>
                                </td>
                            </tr>
                            <tr>
                                <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                <td colspan="9">
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 100%">
                                                <asp:Chart ID="msDCVGSusceptibility" runat="server" Width="900px" Height="181px" Visible="false">
                                                    <Legends>
                                                        <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                            Font="Trebuchet MS, 8.25pt, style=Bold">
                                                        </asp:Legend>
                                                    </Legends>
                                                    <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="msBarChartArea">
                                                            <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                WallWidth="0" IsClustered="False" />
                                                            <AxisY LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisY>
                                                            <AxisX LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisX>
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                            </td>
                                        </tr>
                                </td>
                            </tr>
                            <tr>
                                <%-- <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                <td colspan="9">
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 100%">
                                                <asp:Chart ID="msNonSusceptibilityHeavyWall" runat="server" Width="900px" Height="181px" Visible="false">
                                                    <Legends>
                                                        <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                            Font="Trebuchet MS, 8.25pt, style=Bold">
                                                        </asp:Legend>
                                                    </Legends>
                                                    <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="msBarChartArea">
                                                            <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                WallWidth="0" IsClustered="False" />
                                                            <AxisY LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisY>
                                                            <AxisX LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisX>
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                            </td>
                                        </tr>
                                </td>
                            </tr>
                            <tr>
                                <%-- <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                <td colspan="9">
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 100%">
                                                <asp:Chart ID="msNonSusceptibilityCoating" runat="server" Width="610px" Height="381px" Visible="false">
                                                    <Legends>
                                                        <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                            Font="Trebuchet MS, 8.25pt, style=Bold">
                                                        </asp:Legend>
                                                    </Legends>
                                                    <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="msBarChartArea">
                                                            <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                WallWidth="0" IsClustered="False" />
                                                            <AxisY LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisY>
                                                            <AxisX LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisX>
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                            </td>
                                        </tr>
                                </td>
                            </tr>
                            <tr>
                                <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                <td colspan="9">
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 100%">
                                                <asp:Chart ID="msNonSusceptibilityYear" runat="server" Width="900px" Height="181px" Visible="false">
                                                    <Legends>
                                                        <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                            Font="Trebuchet MS, 8.25pt, style=Bold">
                                                        </asp:Legend>
                                                    </Legends>
                                                    <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="msBarChartArea">
                                                            <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                WallWidth="0" IsClustered="False" />
                                                            <AxisY LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisY>
                                                            <AxisX LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisX>
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                            </td>
                                        </tr>
                                </td>
                            </tr>
                            <tr>
                                <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                <td colspan="9">
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 100%">
                                                <asp:Chart ID="msNonSusceptibilityCasing" runat="server" Width="610px" Height="381px" Visible="false">
                                                    <Legends>
                                                        <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                            Font="Trebuchet MS, 8.25pt, style=Bold">
                                                        </asp:Legend>
                                                    </Legends>
                                                    <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="msBarChartArea">
                                                            <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                WallWidth="0" IsClustered="False" />
                                                            <AxisY LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisY>
                                                            <AxisX LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisX>
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                            </td>
                                        </tr>
                                </td>
                            </tr>
                            <tr>
                                <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                <td colspan="9">
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 100%">
                                                <asp:Chart ID="msDia" runat="server" Width="900px" Height="381px" Visible="false">
                                                    <Legends>
                                                        <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                            Font="Trebuchet MS, 8.25pt, style=Bold">
                                                        </asp:Legend>
                                                    </Legends>
                                                    <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="msBarChartArea">
                                                            <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                WallWidth="0" IsClustered="False" />
                                                            <AxisY LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisY>
                                                            <AxisX LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisX>
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                            </td>
                                        </tr>
                                </td>
                            </tr>
                            <tr>
                                <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                <td colspan="9">
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 100%">
                                                <asp:Chart ID="msYearofCoating" runat="server" Width="900px" Height="381px" Visible="false">
                                                    <Legends>
                                                        <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                            Font="Trebuchet MS, 8.25pt, style=Bold">
                                                        </asp:Legend>
                                                    </Legends>
                                                    <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="msBarChartArea">
                                                            <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                WallWidth="0" IsClustered="False" />
                                                            <AxisY LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisY>
                                                            <AxisX LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisX>
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                            </td>
                                        </tr>
                                </td>
                            </tr>
                            <tr>
                                <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                <td colspan="9">
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 100%">
                                                <asp:Chart ID="msWallThickness" runat="server" Width="900px" Height="381px" Visible="false">
                                                    <Legends>
                                                        <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                            Font="Trebuchet MS, 8.25pt, style=Bold">
                                                        </asp:Legend>
                                                    </Legends>
                                                    <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="msBarChartArea">
                                                            <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                WallWidth="0" IsClustered="False" />
                                                            <AxisY LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisY>
                                                            <AxisX LineColor="64, 64, 64, 64">
                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                            </AxisX>
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                            </td>
                                        </tr>
                                </td>
                            </tr>
                            <tr>
                                <tr>
                                    <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                    <td colspan="9">
                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                            <tr>
                                                <td style="width: 100%">
                                                    <asp:Chart ID="msSYMS" runat="server" Width="610px" Height="381px" Visible="false">
                                                        <Legends>
                                                            <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                Font="Trebuchet MS, 8.25pt, style=Bold">
                                                            </asp:Legend>
                                                        </Legends>
                                                        <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="msBarChartArea">
                                                                <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                    WallWidth="0" IsClustered="False" />
                                                                <AxisY LineColor="64, 64, 64, 64">
                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                </AxisY>
                                                                <AxisX LineColor="64, 64, 64, 64">
                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                </AxisX>
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                </td>
                                            </tr>
                                    </td>
                                </tr>
                                <tr>
                                    <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                    <td colspan="9">
                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                            <tr>
                                                <td style="width: 100%">
                                                    <asp:Chart ID="msWeights" runat="server" Width="900px" Height="181px" Visible="false">
                                                        <Legends>
                                                            <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                Font="Trebuchet MS, 8.25pt, style=Bold">
                                                            </asp:Legend>
                                                        </Legends>
                                                        <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="msBarChartArea">
                                                                <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                    WallWidth="0" IsClustered="False" />
                                                                <AxisY LineColor="64, 64, 64, 64">
                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                </AxisY>
                                                                <AxisX LineColor="64, 64, 64, 64">
                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                </AxisX>
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                </td>
                                            </tr>
                                    </td>
                                </tr>
                                <tr>
                                    <tr>
                                        <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                        <td colspan="9">
                                            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                <tr>
                                                    <td style="width: 100%">
                                                        <asp:Chart ID="msParentMaterialRoads" runat="server" Width="900px" Height="181px" Visible="false">
                                                            <Legends>
                                                                <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                    Font="Trebuchet MS, 8.25pt, style=Bold">
                                                                </asp:Legend>
                                                            </Legends>
                                                            <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                            <ChartAreas>
                                                                <asp:ChartArea Name="msBarChartArea">
                                                                    <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                        WallWidth="0" IsClustered="False" />
                                                                    <AxisY LineColor="64, 64, 64, 64">
                                                                        <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                        <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                    </AxisY>
                                                                    <AxisX LineColor="64, 64, 64, 64">
                                                                        <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                        <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                    </AxisX>
                                                                </asp:ChartArea>
                                                            </ChartAreas>
                                                        </asp:Chart>
                                                    </td>
                                                </tr>
                                        </td>
                                    </tr>
                                    <tr>
                                        <tr>
                                            <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                            <td colspan="9">
                                                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                    <tr>
                                                        <td style="width: 100%">
                                                            <asp:Chart ID="msParentMaterialWater" runat="server" Width="900px" Height="181px" Visible="false">
                                                                <Legends>
                                                                    <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                        Font="Trebuchet MS, 8.25pt, style=Bold">
                                                                    </asp:Legend>
                                                                </Legends>
                                                                <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                                <ChartAreas>
                                                                    <asp:ChartArea Name="msBarChartArea">
                                                                        <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                            WallWidth="0" IsClustered="False" />
                                                                        <AxisY LineColor="64, 64, 64, 64">
                                                                            <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                            <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                        </AxisY>
                                                                        <AxisX LineColor="64, 64, 64, 64">
                                                                            <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                            <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                        </AxisX>
                                                                    </asp:ChartArea>
                                                                </ChartAreas>
                                                            </asp:Chart>
                                                        </td>
                                                    </tr>
                                            </td>
                                        </tr>
                                        <tr>
                                            <tr>
                                                <tr>
                                                    <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                                    <td colspan="9">
                                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                            <tr>
                                                                <td style="width: 100%">
                                                                    <asp:Chart ID="msParentMaterialSoilType" runat="server" Width="900px" Height="181px" Visible="false">
                                                                        <Legends>
                                                                            <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                                Font="Trebuchet MS, 8.25pt, style=Bold">
                                                                            </asp:Legend>
                                                                        </Legends>
                                                                        <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                                        <ChartAreas>
                                                                            <asp:ChartArea Name="msBarChartArea">
                                                                                <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                                    WallWidth="0" IsClustered="False" />
                                                                                <AxisY LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisY>
                                                                                <AxisX LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisX>
                                                                            </asp:ChartArea>
                                                                        </ChartAreas>
                                                                    </asp:Chart>
                                                                </td>
                                                            </tr>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <%-- <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                                    <td colspan="9">
                                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                            <tr>
                                                                <td style="width: 100%">
                                                                    <asp:Chart ID="msTopography" runat="server" Width="900px" Height="181px" Visible="false">
                                                                        <Legends>
                                                                            <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                                Font="Trebuchet MS, 8.25pt, style=Bold">
                                                                            </asp:Legend>
                                                                        </Legends>
                                                                        <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                                        <ChartAreas>
                                                                            <asp:ChartArea Name="msBarChartArea">
                                                                                <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                                    WallWidth="0" IsClustered="False" />
                                                                                <AxisY LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisY>
                                                                                <AxisX LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisX>
                                                                            </asp:ChartArea>
                                                                        </ChartAreas>
                                                                    </asp:Chart>
                                                                </td>
                                                            </tr>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <%-- <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                                    <td colspan="9">
                                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                            <tr>
                                                                <td style="width: 100%">
                                                                    <asp:Chart ID="msDrainage" runat="server" Width="900px" Height="181px" Visible="false">
                                                                        <Legends>
                                                                            <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                                Font="Trebuchet MS, 8.25pt, style=Bold">
                                                                            </asp:Legend>
                                                                        </Legends>
                                                                        <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                                        <ChartAreas>
                                                                            <asp:ChartArea Name="msBarChartArea">
                                                                                <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                                    WallWidth="0" IsClustered="False" />
                                                                                <AxisY LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisY>
                                                                                <AxisX LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisX>
                                                                            </asp:ChartArea>
                                                                        </ChartAreas>
                                                                    </asp:Chart>
                                                                </td>
                                                            </tr>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                                    <td colspan="9">
                                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                            <tr>
                                                                <td style="width: 100%">
                                                                    <asp:Chart ID="msDominantTexture" runat="server" Width="900px" Height="181px" Visible="false">
                                                                        <Legends>
                                                                            <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                                Font="Trebuchet MS, 8.25pt, style=Bold">
                                                                            </asp:Legend>
                                                                        </Legends>
                                                                        <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                                        <ChartAreas>
                                                                            <asp:ChartArea Name="msBarChartArea">
                                                                                <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                                    WallWidth="0" IsClustered="False" />
                                                                                <AxisY LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisY>
                                                                                <AxisX LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisX>
                                                                            </asp:ChartArea>
                                                                        </ChartAreas>
                                                                    </asp:Chart>
                                                                </td>
                                                            </tr>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <%--<td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                                    <td colspan="9">
                                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                            <tr>
                                                                <td style="width: 100%">
                                                                    <asp:Chart ID="msDepth" runat="server" Width="610px" Height="381px" Visible="false">
                                                                        <Legends>
                                                                            <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                                Font="Trebuchet MS, 8.25pt, style=Bold">
                                                                            </asp:Legend>
                                                                        </Legends>
                                                                        <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                                        <ChartAreas>
                                                                            <asp:ChartArea Name="msBarChartArea">
                                                                                <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                                    WallWidth="0" IsClustered="False" />
                                                                                <AxisY LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisY>
                                                                                <AxisX LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisX>
                                                                            </asp:ChartArea>
                                                                        </ChartAreas>
                                                                    </asp:Chart>
                                                                </td>
                                                            </tr>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <%-- <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                                    <td colspan="9">
                                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                            <tr>
                                                                <td style="width: 100%">
                                                                    <asp:Chart ID="msCIPS" runat="server" Width="610px" Height="381px" Visible="false">
                                                                        <Legends>
                                                                            <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                                Font="Trebuchet MS, 8.25pt, style=Bold">
                                                                            </asp:Legend>
                                                                        </Legends>
                                                                        <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                                        <ChartAreas>
                                                                            <asp:ChartArea Name="msBarChartArea">
                                                                                <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                                    WallWidth="0" IsClustered="False" />
                                                                                <AxisY LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisY>
                                                                                <AxisX LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisX>
                                                                            </asp:ChartArea>
                                                                        </ChartAreas>
                                                                    </asp:Chart>
                                                                </td>
                                                            </tr>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <%-- <td style="height: 21px; text-align: left; color: Black; width: 5%">
                                    </td>--%>
                                                    <td colspan="9">
                                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                            <tr>
                                                                <td style="width: 100%">
                                                                    <asp:Chart ID="msDCVG" runat="server" Width="610px" Height="381px" Visible="false">
                                                                        <Legends>
                                                                            <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                                Font="Trebuchet MS, 8.25pt, style=Bold">
                                                                            </asp:Legend>
                                                                        </Legends>
                                                                        <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                                        <ChartAreas>
                                                                            <asp:ChartArea Name="msBarChartArea">
                                                                                <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                                    WallWidth="0" IsClustered="False" />
                                                                                <AxisY LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisY>
                                                                                <AxisX LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisX>
                                                                            </asp:ChartArea>
                                                                        </ChartAreas>
                                                                    </asp:Chart>
                                                                </td>
                                                            </tr>
                                                    </td>
                                                </tr>
                                                <tr>                                                    
                                                    <td colspan="9">
                                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                            <tr>
                                                                <td style="width: 100%">
                                                                    <asp:Chart ID="msDirectCrossingPR" runat="server" Width="900px" Height="181px" Visible="false">
                                                                        <Legends>
                                                                            <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                                Font="Trebuchet MS, 8.25pt, style=Bold">
                                                                            </asp:Legend>
                                                                        </Legends>
                                                                        <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                                        <ChartAreas>
                                                                            <asp:ChartArea Name="msBarChartArea">
                                                                                <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                                    WallWidth="0" IsClustered="False" />
                                                                                <AxisY LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisY>
                                                                                <AxisX LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisX>
                                                                            </asp:ChartArea>
                                                                        </ChartAreas>
                                                                    </asp:Chart>
                                                                </td>
                                                            </tr>
                                                    </td>
                                                </tr>
                                                <tr>                                                    
                                                    <td colspan="9">
                                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                            <tr>
                                                                <td style="width: 100%">
                                                                    <asp:Chart ID="msDirectCrossingGR" runat="server" Width="900px" Height="181px" Visible="false">
                                                                        <Legends>
                                                                            <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                                Font="Trebuchet MS, 8.25pt, style=Bold">
                                                                            </asp:Legend>
                                                                        </Legends>
                                                                        <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                                        <ChartAreas>
                                                                            <asp:ChartArea Name="msBarChartArea">
                                                                                <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                                    WallWidth="0" IsClustered="False" />
                                                                                <AxisY LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisY>
                                                                                <AxisX LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisX>
                                                                            </asp:ChartArea>
                                                                        </ChartAreas>
                                                                    </asp:Chart>
                                                                </td>
                                                            </tr>
                                                    </td>
                                                </tr>
                                                <tr>                                                    
                                                    <td colspan="9">
                                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                            <tr>
                                                                <td style="width: 100%">
                                                                    <asp:Chart ID="msDirectCrossingRR" runat="server" Width="900px" Height="181px" Visible="false">
                                                                        <Legends>
                                                                            <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                                Font="Trebuchet MS, 8.25pt, style=Bold">
                                                                            </asp:Legend>
                                                                        </Legends>
                                                                        <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                                        <ChartAreas>
                                                                            <asp:ChartArea Name="msBarChartArea">
                                                                                <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                                    WallWidth="0" IsClustered="False" />
                                                                                <AxisY LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisY>
                                                                                <AxisX LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisX>
                                                                            </asp:ChartArea>
                                                                        </ChartAreas>
                                                                    </asp:Chart>
                                                                </td>
                                                            </tr>
                                                    </td>
                                                </tr>
                                                <tr>                                                    
                                                    <td colspan="9">
                                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                            <tr>
                                                                <td style="width: 100%">
                                                                    <asp:Chart ID="msDirectCrossingDR" runat="server" Width="900px" Height="181px" Visible="false">
                                                                        <Legends>
                                                                            <asp:Legend Enabled="False" IsTextAutoFit="False" Name="Default" BackColor="Transparent"
                                                                                Font="Trebuchet MS, 8.25pt, style=Bold">
                                                                            </asp:Legend>
                                                                        </Legends>
                                                                        <BorderSkin SkinStyle="Emboss"></BorderSkin>
                                                                        <ChartAreas>
                                                                            <asp:ChartArea Name="msBarChartArea">
                                                                                <Area3DStyle PointGapDepth="0" Rotation="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False"
                                                                                    WallWidth="0" IsClustered="False" />
                                                                                <AxisY LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisY>
                                                                                <AxisX LineColor="64, 64, 64, 64">
                                                                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="false" />
                                                                                    <MajorGrid Enabled="false" LineColor="64, 64, 64, 64" />
                                                                                </AxisX>
                                                                            </asp:ChartArea>
                                                                        </ChartAreas>
                                                                    </asp:Chart>
                                                                </td>
                                                            </tr>
                                                    </td>
                                                </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <%--<asp:Timer ID="Timer1" runat="server" Interval="10000" OnTick="Timer1_Tick">
                </asp:Timer>--%>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
