
if exists (select * from sysobjects where id = object_id('GetNewID') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
drop procedure GetNewID
go

Create PROCEDURE [dbo].[GetNewID]
@tablename nvarchar(100),
@idname nvarchar(100),
@maxid int output
AS
BEGIN
	if @tablename is NULL or @idname is NULL or @tablename = '' or @idname=''
	begin
		set @maxid = -1
		return 0
	end 
	
	--查询，如果有+1，如果没有插入，返回
	SELECT @maxid = maxid  FROM Sys_TableMaxID WHERE tablename = @tablename and idname =@idname
	if  @maxid is NULL or @maxid < 0 
	begin
		set @maxid = 1000000000
		insert into Sys_TableMaxID(tablename,idname,maxid)values(@tablename,@idname,@maxid)
	end
	else
	begin
		set @maxid = @maxid + 1
		update Sys_TableMaxID set maxid=@maxid where tablename = @tablename and idname =@idname
	end 
	return 1
END
go




if exists (select * from sysobjects where id = object_id('InsertPostionOffer') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
drop procedure InsertPostionOffer
go

Create PROCEDURE [dbo].InsertPostionOffer  
@salary nvarchar(50),
@city nvarchar(50),
@companyLogo nvarchar(200),
@companyname nvarchar(80),
@link nvarchar(200),
@jobCategory nvarchar(50),
@industryCategory nvarchar(50),
@difficulty nvarchar(20),
@PublishedTime datetime

AS
BEGIN
	declare @IsActive varchar(1)
	set @IsActive='1'
	declare @tablename varchar(40)
	declare @company_ID int
	declare @IndustryCategory_ID int
	declare @PositionOffer_ID int
	
	
	--公司和行业类别
	if (@companyname is not null) and (@companyname<>'')
	begin
		select @company_ID = Company_ID  from JL_Company where CompanyName = @companyname and IsActive = @IsActive
		if @@rowcount = 0
			begin 
			--插入公司
			set @tablename = 'JL_Company'
			exec GetNewID @tablename, 'Company_ID', @company_ID out
			
			insert into JL_Company(Company_ID,CompanyName,CompanyLogo,Location,IsActive)
			values(@company_ID,@companyname,@companyLogo,null,@IsActive) 
			end
	end

	if (@industryCategory is not null) and (@industryCategory<>'')
	begin
		select @IndustryCategory_ID=IndustryCategory_ID from Sys_IndustryCategory where IndustryCategory = @industryCategory and IsActive = @IsActive
		if @@rowcount = 0
		begin 
		--插入行业类别
	    
		set @tablename = 'Sys_IndustryCategory'
		exec GetNewID @tablename, 'IndustryCategory_ID', @IndustryCategory_ID out
		insert into Sys_IndustryCategory(IndustryCategory_ID,IndustryCategory,IsActive)
		values(@IndustryCategory_ID,@industryCategory,@IsActive) 
		end
	end

	--插入职位发布信息 
	set @tablename = 'JL_PositionOffer'
	exec GetNewID @tablename, 'PositionOffer_ID', @PositionOffer_ID out
	insert into JL_PositionOffer(PositionOffer_ID,Company_ID,IndustryCategory_ID,Salary,city,JobCategory,PublishedTime,Difficulty,PositionOfferLink,IsActive)
	values
	(@PositionOffer_ID,@company_ID,@IndustryCategory_ID,@salary,@city,@jobCategory,@PublishedTime,@difficulty,@link,@IsActive)
	
	return 1
END
go





if exists (select * from sysobjects where id = object_id('InsertPropaganda') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
drop procedure InsertPropaganda
go

Create PROCEDURE [dbo].InsertPropaganda  
@companyLogo nvarchar(200),
@link nvarchar(200),
@dateTime nvarchar(80),
@address nvarchar(100),
@title nvarchar(100),
@pdateTime datetime
AS
BEGIN
	declare @IsActive varchar(1)
	set @IsActive='1'
	declare @tablename varchar(40)
	
	declare @Propaganda_ID int
	
	

	
	--插入职位发布信息 
	set @tablename = 'JL_Propaganda'
	exec GetNewID @tablename, 'Propaganda_ID', @Propaganda_ID out
	insert into JL_Propaganda(Propaganda_ID,PropagandaTitle,PropagandaTime,PropagandaAddress,PropagandaLink,PropagandaDateTime,IsActive)
	values
	(@Propaganda_ID,@title,@dateTime,@address,@link,@pdateTime,@IsActive)

	
	return 1
END
go