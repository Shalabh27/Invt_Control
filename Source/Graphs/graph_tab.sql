IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[graph_tab]') AND type in (N'U'))
DROP TABLE [dbo].[graph_tab]
GO
CREATE TABLE [dbo].[graph_tab](
    [LINE] [nvarchar](100) NULL,
	[SCC] [char](40) NULL,
	[SCC_P] [char](1) NULL,
	[SCC_T] [char](1) NULL,
	[SCC_C] [char](1) NULL,
	[CRI_P] [char](40) NULL,
	[CRI_T] [char](40) NULL,
	[CRI_C] [char](40) NULL,
	[CRI_SUMM] [char](40) NULL,
	[BEGIN_S] [numeric](12, 3) NULL,
	[END_S] [numeric](12, 3) NULL,
	[ENV_LEN] [numeric](12, 3) NULL,
	[LONGITUDE] [numeric](12, 7) NULL,
	[LATITUDE] [numeric](12, 7) NULL,
	[DIAMETER] [numeric](5, 0) NULL,
	[COAT_YEAR] [int] NULL,
	[SOIL_CODE] [char](10) NULL,
	[LANDUSE] [char](20) NULL,
	[P_MATERIAL] [char](20) NULL,
	[DRAINAGE] [char](20) NULL,
	[TOPOGRAPHY] [char](20) NULL,
	[C_HOR_TEXT] [char](20) NULL,
	[P_H] [numeric](4, 2) NULL,
	[RESISTIVE] [numeric](4, 2) NULL,
	[PIPE_MANU] [char](20) NULL,
	[TYPE_SCL] [char](20) NULL,
	[WALL_THICK] [real] NULL,
	[LONG_SEAM] [char](20) NULL,
	[PIPE_GRADE] [char](20) NULL,
	[H_W] [char](10) NULL,
	[CASING] [char](10) NULL,
	[WEIGHT] [char](10) NULL,
	[D_CROSS] [char](2) NULL,
	[IR] [numeric](12, 3) NULL,
	[PS_ON] [numeric](12, 3) NULL,
	[PS_OFF] [numeric](12, 3) NULL,
	[NOTES] [char](40) NULL	
) 