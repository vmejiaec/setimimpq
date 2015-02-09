ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [SIGDOC_Data], FILENAME = '$(DefaultDataPath)$(DatabaseName).mdf', FILEGROWTH = 10 %) TO FILEGROUP [PRIMARY];

