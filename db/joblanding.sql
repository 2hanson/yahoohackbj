/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2013/5/18 21:11:31                           */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('JL_Company')
            and   type = 'U')
   drop table JL_Company
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('JL_JobLandingSchedule')
            and   name  = 'Relationship_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index JL_JobLandingSchedule.Relationship_5_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('JL_JobLandingSchedule')
            and   type = 'U')
   drop table JL_JobLandingSchedule
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('JL_PositionOffer')
            and   name  = 'Relationship_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index JL_PositionOffer.Relationship_3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('JL_PositionOffer')
            and   name  = 'Relationship_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index JL_PositionOffer.Relationship_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('JL_PositionOffer')
            and   type = 'U')
   drop table JL_PositionOffer
go

if exists (select 1
            from  sysobjects
           where  id = object_id('JL_Propaganda')
            and   type = 'U')
   drop table JL_Propaganda
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('JL_SameCompany')
            and   name  = 'JL_SameCompany2_FK'
            and   indid > 0
            and   indid < 255)
   drop index JL_SameCompany.JL_SameCompany2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('JL_SameCompany')
            and   name  = 'JL_SameCompany_FK'
            and   indid > 0
            and   indid < 255)
   drop index JL_SameCompany.JL_SameCompany_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('JL_SameCompany')
            and   type = 'U')
   drop table JL_SameCompany
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('JL_TimeLine')
            and   name  = 'Relationship_8_FK'
            and   indid > 0
            and   indid < 255)
   drop index JL_TimeLine.Relationship_8_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('JL_TimeLine')
            and   name  = 'Relationship_7_FK'
            and   indid > 0
            and   indid < 255)
   drop index JL_TimeLine.Relationship_7_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('JL_TimeLine')
            and   name  = 'Relationship_6_FK'
            and   indid > 0
            and   indid < 255)
   drop index JL_TimeLine.Relationship_6_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('JL_TimeLine')
            and   type = 'U')
   drop table JL_TimeLine
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_IndustryCategory')
            and   type = 'U')
   drop table Sys_IndustryCategory
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_TableMaxID')
            and   type = 'U')
   drop table Sys_TableMaxID
go

/*==============================================================*/
/* Table: JL_Company                                            */
/*==============================================================*/
create table JL_Company (
   Company_ID           int                  not null,
   CompanyName          varchar(80)          not null,
   CompanyLogo          varchar(200)         null,
   Location             varchar(100)         null,
   IsActive             char(1)              not null,
   constraint PK_JL_COMPANY primary key nonclustered (Company_ID)
)
go

/*==============================================================*/
/* Table: JL_JobLandingSchedule                                 */
/*==============================================================*/
create table JL_JobLandingSchedule (
   JLSchedule_ID        int                  not null,
   IndustryCategory_ID  int                  null,
   ScheduleDescription  varchar(200)         null,
   IsActive             char(1)              not null,
   place                varchar(80)          null,
   weight               float                null,
   stype                char(1)              null,
   constraint PK_JL_JOBLANDINGSCHEDULE primary key nonclustered (JLSchedule_ID)
)
go

/*==============================================================*/
/* Index: Relationship_5_FK                                     */
/*==============================================================*/
create index Relationship_5_FK on JL_JobLandingSchedule (
IndustryCategory_ID ASC
)
go

/*==============================================================*/
/* Table: JL_PositionOffer                                      */
/*==============================================================*/
create table JL_PositionOffer (
   PositionOffer_ID     int                  not null,
   Company_ID           int                  not null,
   IndustryCategory_ID  int                  null,
   Salary               varchar(50)          null,
   city                 varchar(50)          null,
   JobCategory          varchar(50)          null,
   PublishedTime        datetime             null,
   Difficulty           varchar(20)          null,
   PositionOfferLink    varchar(200)         null,
   IsActive             char(1)              not null,
   constraint PK_JL_POSITIONOFFER primary key nonclustered (PositionOffer_ID)
)
go

/*==============================================================*/
/* Index: Relationship_1_FK                                     */
/*==============================================================*/
create index Relationship_1_FK on JL_PositionOffer (
Company_ID ASC
)
go

/*==============================================================*/
/* Index: Relationship_3_FK                                     */
/*==============================================================*/
create index Relationship_3_FK on JL_PositionOffer (
IndustryCategory_ID ASC
)
go

/*==============================================================*/
/* Table: JL_Propaganda                                         */
/*==============================================================*/
create table JL_Propaganda (
   Propaganda_ID        int                  not null,
   PropagandaTitle      varchar(100)         not null,
   PropagandaTime       varchar(80)          null,
   PropagandaAddress    varchar(100)         null,
   PropagandaLink       varchar(200)         null,
   IsActive             char(1)              not null,
   city                 varchar(50)          null,
   PropagandaDateTime   datetime             null,
   constraint PK_JL_PROPAGANDA primary key nonclustered (Propaganda_ID)
)
go

/*==============================================================*/
/* Table: JL_SameCompany                                        */
/*==============================================================*/
create table JL_SameCompany (
   JL__Company_ID       int                  not null,
   Company_ID           int                  not null,
   constraint PK_JL_SAMECOMPANY primary key (JL__Company_ID, Company_ID)
)
go

/*==============================================================*/
/* Index: JL_SameCompany_FK                                     */
/*==============================================================*/
create index JL_SameCompany_FK on JL_SameCompany (
JL__Company_ID ASC
)
go

/*==============================================================*/
/* Index: JL_SameCompany2_FK                                    */
/*==============================================================*/
create index JL_SameCompany2_FK on JL_SameCompany (
Company_ID ASC
)
go

/*==============================================================*/
/* Table: JL_TimeLine                                           */
/*==============================================================*/
create table JL_TimeLine (
   TimeLineNode_ID      int                  not null,
   Propaganda_ID        int                  null,
   JLSchedule_ID        int                  not null,
   PositionOffer_ID     int                  null,
   TimeLineLocation     datetime             not null,
   TimeLineNodeDescription varchar(200)         null,
   IsActive             char(1)              not null,
   constraint PK_JL_TIMELINE primary key nonclustered (TimeLineNode_ID)
)
go

/*==============================================================*/
/* Index: Relationship_6_FK                                     */
/*==============================================================*/
create index Relationship_6_FK on JL_TimeLine (
JLSchedule_ID ASC
)
go

/*==============================================================*/
/* Index: Relationship_7_FK                                     */
/*==============================================================*/
create index Relationship_7_FK on JL_TimeLine (
PositionOffer_ID ASC
)
go

/*==============================================================*/
/* Index: Relationship_8_FK                                     */
/*==============================================================*/
create index Relationship_8_FK on JL_TimeLine (
Propaganda_ID ASC
)
go

/*==============================================================*/
/* Table: Sys_IndustryCategory                                  */
/*==============================================================*/
create table Sys_IndustryCategory (
   IndustryCategory_ID  int                  not null,
   IndustryCategory     varchar(50)          not null,
   IsActive             char(1)              not null,
   constraint PK_SYS_INDUSTRYCATEGORY primary key nonclustered (IndustryCategory_ID)
)
go

/*==============================================================*/
/* Table: Sys_TableMaxID                                        */
/*==============================================================*/
create table Sys_TableMaxID (
   tablename            varchar(100)         not null,
   idname               varchar(100)         not null,
   maxid                int                  not null,
   constraint PK_SYS_TABLEMAXID primary key nonclustered (tablename)
)
go

