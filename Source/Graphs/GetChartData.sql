IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetChartData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetChartData]
GO
--GetChartData
CREATE PROCEDURE [dbo].[GetChartData]
(
	@param1 varchar(40)='', 
	@param2 numeric(12,3)=0,
	@param3 numeric(12,3)=0,
    @param4 char(1)=''
)
as
begin

    if @param4='L'
    begin
        select DISTINCT line from graph_tab where isnull(line,'')<>''
    end

    else
    begin
        select rtrim(scc) as scc,begin_s,end_s from graph_tab
        where scc_t='1' 
        and begin_s >= @param2 and end_s <= @param3
        AND line=@param1

        select rtrim(scc) as scc,begin_s,end_s from graph_tab
        where scc_c='1'  
        and begin_s >= @param2 and end_s <= @param3
        AND line=@param1

        select begin_s,end_s from graph_tab
        where H_W LIKE '%HW%' 
        and begin_s >= @param2 and end_s <= @param3
        AND line=@param1

        select diameter,begin_s,end_s from graph_tab
        where diameter is not null 
        and begin_s >= @param2 and end_s <= @param3
        AND line=@param1

        select coat_year,begin_s,end_s from graph_tab
        where isnull(coat_year,'')<>'' 
        and begin_s >= @param2 and end_s <= @param3
        AND line=@param1

        select wall_thick,begin_s,end_s from graph_tab
        where isnull(wall_thick,'')<>'' 
        and begin_s >= @param2 and end_s <= @param3
        AND line=@param1

        select begin_s,end_s from graph_tab
        where isnull(weight,'')<>'' 
        and begin_s >= @param2 and end_s <= @param3
        AND line=@param1

        select begin_s,end_s from graph_tab
        where rtrim(p_material) in ('PR','GR','DR','RR') 
        and begin_s >= @param2 and end_s <= @param3
        AND line=@param1

        select begin_s,end_s from graph_tab
        where rtrim(p_material) in ('DD','ID','River','Pond') 
        and begin_s >= @param2 and end_s <= @param3
        AND line=@param1

        select rtrim(p_material) as p_material,begin_s,end_s from graph_tab
        where isnull(p_material,'')<>'' 
        and begin_s >= @param2 and end_s <= @param3
        AND line=@param1

        select rtrim(topography) as topography,begin_s,end_s from graph_tab
        where isnull(topography,'')<>'' 
        and begin_s >= @param2 and end_s <= @param3
        AND line=@param1

        select rtrim(drainage) as drainage,begin_s,end_s from graph_tab
        where isnull(drainage,'')<>'' 
        and begin_s >= @param2 and end_s <= @param3
        AND line=@param1

        select rtrim(c_hor_text) as c_hor_text,begin_s,end_s from graph_tab
        where isnull(c_hor_text,'')<>'' 
        and begin_s >= @param2 and end_s <= @param3
        AND line=@param1

        select rtrim(d_cross) as d_cross,begin_s,end_s from graph_tab
        where isnull(d_cross,'')<>'' 
        and begin_s >= @param2 and end_s <= @param3
        AND line=@param1
    end
    
--declare @date datetime,@minhr int,@ctr int,@maxhr int,
--		@max_date datetime,@min_date datetime,@interval int,@hour int
--		
--set		@interval=1
--set		@hour=3
--
--set @date=CONVERT(varchar(4),year(getdate())) + '-' + right ('00'+CONVERT(varchar(2),Month(getdate())),2) + '-' + right('00'+CONVERT(varchar(2),day(getdate())),2)
--set @date='2012-09-09 00:00:00.000'
--
--IF EXISTS (SELECT NAME FROM TEMPDB..SYSOBJECTS WHERE ID = OBJECT_ID('TEMPDB..#keywords')) 
--				DROP TABLE #keywords
--IF EXISTS (SELECT NAME FROM TEMPDB..SYSOBJECTS WHERE ID = OBJECT_ID('TEMPDB..#hour_min_data')) 
--				DROP TABLE #hour_min_data
--IF EXISTS (SELECT NAME FROM TEMPDB..SYSOBJECTS WHERE ID = OBJECT_ID('TEMPDB..#keywordUsage')) 
--				DROP TABLE #keywordUsage				
--
--create table #keywords
--(
--	keyword varchar(500),
--	MAINKEY varchar(500)
--)
--
--create table #hour_min_data
--(
--	hr_min	 varchar(5),
--	max_date datetime
--)
--
--insert into #keywords
--select 'BARACK OBAMA','VOTODEMO'
--union
--select 'INDEPENDENT','VOTODEMO'
--union
--select 'MITT ROMNEY','VOTODEMO'
--union
--select 'NOT SURE','VOTODEMO'
--
----select 'Dayvasos'
----union
----select 'STARBUCKS'
----union
----select '44'
--
--
--
-----get all data-----------------
--select * into #keywordusage from keyworduseagereport (nolock) where keyword in (select MAINKEY from #keywords) and DATE> @date and country_id =1
--
--Select	@max_date=convert(varchar(10),max(date),112),@min_date=convert(varchar(10),min(date),112) from #keywordUsage
--
--select	@max_date=dateadd(d,@interval*2,@max_date)
--Select @interval= case when datediff(d,@min_date,@max_date)<= 36 then 1 else ceiling (datediff(d,@min_date,@max_date)* 1/36) end
--
--
--declare @coundown_st_date datetime
--
--
----if datediff(mi,@min_date,@max_date)<=@hour*60
----begin
--	set	@coundown_st_date=@min_date
----end
----else
----begin
----	set @coundown_st_date=dateadd(mi,(-1)*(@hour*60),@max_date)
----end
--
--set		@coundown_st_date=dateadd(d,(-1)*DATEPART(d,@coundown_st_date)%@interval,@coundown_st_date)
--
--
--while @coundown_st_date<=@max_date
--begin
--	insert into #hour_min_data(hr_min,max_date)
--	--select  right(convert(varchar(8),@coundown_st_date,112),4),@coundown_st_date
--	
--	select right('0'+convert(varchar(2),month(@coundown_st_date)),2)+'-'+right('0'+convert(varchar(2),day(@coundown_st_date)),2),@coundown_st_date
--	
--	set @coundown_st_date=dateadd(d,@interval,@coundown_st_date)
--end
--
--select a.keyword,isnull(b.count,0) as count 
--from	#keywords a
--left outer join
--(
--select keyword,(count) as count from (select upper(subcategory) as keyword,count(*) as count from #keywordUsage group by subcategory) c
--) b 
--on a.keyword=b.keyword
--order by a.keyword
--
--select a.keyword,isnull(b.count,0) as count 
--from	#keywords a
--left outer join
--(
--select keyword,(count) as count from (select upper(subcategory) as keyword,count(distinct phone) as count from #keywordUsage group by subcategory) c
--) b 
--on a.keyword=b.keyword
--order by a.keyword
--
--select keyword from #keywords
--order by keyword
--
--select		d.keyword,d.hr,d.datacount 
--from
--(
--	select		a.keyword,c.hr_min as hr,
--				isnull((select count(*) from #keywordusage ad where ad.subcategory=a.keyword and ad.date<=c.max_date),0) as datacount 
--	from		#keywords a
--	cross join	#hour_min_data c
--) d
--order by d.keyword,d.hr
--
--
--select		d.keyword,d.hr,d.datacount 
--from
--(
--	select		a.keyword,c.hr_min as hr,
--				isnull((select count(distinct phone) from #keywordusage ad where ad.subcategory=a.keyword and ad.date<=c.max_date),0) as datacount 
--	from		#keywords a
--	cross join	#hour_min_data c
--) d
--order by d.keyword,d.hr
--
--
--select isnull(ceiling((MAX(count)*1.0/15)),1) from (select upper(subcategory) as keyword,count(*) as count from #keywordUsage group by subcategory) c

end








