CREATE TABLE [dbo].[Test_Trace] (
    [RowNumber]       INT            IDENTITY (1, 1) NOT NULL,
    [EventClass]      INT            NULL,
    [TextData]        NTEXT          NULL,
    [NTUserName]      NVARCHAR (128) NULL,
    [ClientProcessID] INT            NULL,
    [ApplicationName] NVARCHAR (128) NULL,
    [LoginName]       NVARCHAR (128) NULL,
    [SPID]            INT            NULL,
    [Duration]        BIGINT         NULL,
    [StartTime]       DATETIME       NULL,
    [Reads]           BIGINT         NULL,
    [Writes]          BIGINT         NULL,
    [CPU]             INT            NULL,
    [Success]         INT            NULL,
    [State]           INT            NULL,
    [Error]           INT            NULL,
    [ObjectName]      NVARCHAR (128) NULL,
    [DatabaseName]    NVARCHAR (128) NULL,
    PRIMARY KEY CLUSTERED ([RowNumber] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
EXECUTE sp_addextendedproperty @name = N'Build', @value = 2039, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Test_Trace';


GO
EXECUTE sp_addextendedproperty @name = N'MajorVer', @value = 8, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Test_Trace';


GO
EXECUTE sp_addextendedproperty @name = N'MinorVer', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Test_Trace';

