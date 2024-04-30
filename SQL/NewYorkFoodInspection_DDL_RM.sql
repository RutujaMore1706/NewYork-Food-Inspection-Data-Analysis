USE [stg_NYFoodInspection]
GO

/****** Object:  Table [dbo].[stg_NYFoodInspection]    Script Date: 13-02-2023 23:13:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[stg_NYFoodInspection](
	[CAMIS] [int] NULL,
	[DBA] [nvarchar](95) NULL,
	[BORO] [varchar](13) NULL,
	[BUILDING] [nvarchar](10) NULL,
	[STREET] [varchar](40) NULL,
	[ZIPCODE] [char](5) NULL,
	[PHONE] [char](12) NULL,
	[CUISINE DESCRIPTION] [varchar](30) NULL,
	[INSPECTION DATE] [char](10) NULL,
	[ACTION] [varchar](130) NULL,
	[VIOLATION CODE] [char](5) NULL,
	[VIOLATION DESCRIPTION] [nvarchar](254) NULL,
	[CRITICAL FLAG] [char](14) NULL,
	[SCORE] [tinyint] NULL,
	[GRADE] [char](1) NULL,
	[GRADE DATE] [char](10) NULL,
	[RECORD DATE] [char](10) NULL,
	[INSPECTION TYPE] [varchar](59) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Community Board] [smallint] NULL,
	[Council District] [char](2) NULL,
	[Census Tract] [char](6) NULL,
	[BIN] [int] NULL,
	[BBL] [bigint] NULL,
	[NTA] [char](4) NULL,
	[DI_CreateDate ] [datetime] NULL,
	[DI_WorkflowFileName] [char](37) NULL,
	[Converted_GradeDate] [date] NULL,
	[Converted_InspectionDate] [date] NULL,
	[Converted_RecordDate] [date] NULL
) ON [PRIMARY]
GO


