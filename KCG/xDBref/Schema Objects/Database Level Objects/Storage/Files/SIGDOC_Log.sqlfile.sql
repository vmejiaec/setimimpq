ALTER DATABASE [$(DatabaseName)]
    ADD LOG FILE (NAME = [SIGDOC_Log], FILENAME = '$(DefaultLogPath)$(DatabaseName)_log.ldf', FILEGROWTH = 5 %);

