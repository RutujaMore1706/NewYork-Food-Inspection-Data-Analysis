/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      NewYorkFoodInspection_DimensionalModel.DM1
 *
 * Date Created : Monday, February 13, 2023 23:26:47
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: Dim_Date 
 */
 USE Trial1;

CREATE TABLE Dim_Date(
    DateSK               int             NOT NULL,
    FullDateAK           date            NULL,
    DayNumberOfWeek      int             NULL,
    DayNameOfWeek        nvarchar(10)    NULL,
    DayNumberOfMonth     int             NULL,
    DayNumberOfYear      int             NULL,
    WeekNumberOfYear     int             NULL,
    MonthName            nvarchar(10)    NULL,
    MonthNumberOfYear    int             NULL,
    CalendarQuarter      int             NULL,
    CalendarYear         smallint        NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (DateSK)
)

go


IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go

/* 
 * TABLE: Dim_Geography 
 */

CREATE TABLE Dim_Geography(
    GeoSK      int              NOT NULL,
    Street     nvarchar(150)    NULL,
    Boro       nvarchar(25)     NULL,
    ZipCode    nvarchar(10)     NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (GeoSK)
)

go


IF OBJECT_ID('Dim_Geography') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Geography >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Geography >>>'
go

/* 
 * TABLE: Dim_InspectionType 
 */

CREATE TABLE Dim_InspectionType(
    InspectionKeySK    char(10)         NOT NULL,
    InspectionType     nvarchar(150)    NULL,
    Action             nvarchar(80)     NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (InspectionKeySK)
)

go


IF OBJECT_ID('Dim_InspectionType') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_InspectionType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_InspectionType >>>'
go

/* 
 * TABLE: Dim_Restaurant 
 */

CREATE TABLE Dim_Restaurant(
    RestaurantKeySK    nvarchar(10)      NOT NULL,
    CAMIS_ID           nvarchar(40)      NULL,
    DBA                nvarchar(100)     NULL,
    BuildingNo         char(40)          NULL,
    Cuisine            char(30)          NULL,
    Latitude           decimal(12, 9)    NULL,
    Longitude          decimal(12, 9)    NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (RestaurantKeySK)
)

go


IF OBJECT_ID('Dim_Restaurant') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Restaurant >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Restaurant >>>'
go

/* 
 * TABLE: Dim_Violation 
 */

CREATE TABLE Dim_Violation(
    ViolationKeySK          char(10)         NOT NULL,
    ViolationCode           char(20)         NULL,
    ViolationDescription    nvarchar(250)    NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (ViolationKeySK)
)

go


IF OBJECT_ID('Dim_Violation') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Violation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Violation >>>'
go

/* 
 * TABLE: Fact_Inspection 
 */

CREATE TABLE Fact_Inspection(
    InspectionSK        int             NOT NULL,
    RestaurantKeySK     nvarchar(10)    NOT NULL,
    GeoKey              int             NOT NULL,
    InspectionKeySK     char(10)        NOT NULL,
    InspectionDateSK    int             NOT NULL,
    RecordDateSK        int             NOT NULL,
    GradeDateSK         int             NOT NULL,
    ViolationKeySK      char(10)        NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (InspectionSK)
)

go


IF OBJECT_ID('Fact_Inspection') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Inspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Inspection >>>'
go

/* 
 * TABLE: Fact_Score 
 */

CREATE TABLE Fact_Score(
    ScoreSK            char(10)        NOT NULL,
    RestaurantKeySK    nvarchar(10)    NOT NULL,
    Grade              char(2)         NULL,
    Score              char(20)        NULL,
    CriticalFlag       char(25)        NULL,
    CONSTRAINT PK13 PRIMARY KEY NONCLUSTERED (ScoreSK)
)

go


IF OBJECT_ID('Fact_Score') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Score >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Score >>>'
go

/* 
 * TABLE: Fact_Inspection 
 */

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Date1 
    FOREIGN KEY (InspectionDateSK)
    REFERENCES Dim_Date(DateSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Date2 
    FOREIGN KEY (RecordDateSK)
    REFERENCES Dim_Date(DateSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Date3 
    FOREIGN KEY (GradeDateSK)
    REFERENCES Dim_Date(DateSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Violation4 
    FOREIGN KEY (ViolationKeySK)
    REFERENCES Dim_Violation(ViolationKeySK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_InspectionType5 
    FOREIGN KEY (InspectionKeySK)
    REFERENCES Dim_InspectionType(InspectionKeySK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Geography6 
    FOREIGN KEY (GeoKey)
    REFERENCES Dim_Geography(GeoSK)
go

ALTER TABLE Fact_Inspection ADD CONSTRAINT RefDim_Restaurant7 
    FOREIGN KEY (RestaurantKeySK)
    REFERENCES Dim_Restaurant(RestaurantKeySK)
go


/* 
 * TABLE: Fact_Score 
 */

ALTER TABLE Fact_Score ADD CONSTRAINT RefDim_Restaurant8 
    FOREIGN KEY (RestaurantKeySK)
    REFERENCES Dim_Restaurant(RestaurantKeySK)
go


