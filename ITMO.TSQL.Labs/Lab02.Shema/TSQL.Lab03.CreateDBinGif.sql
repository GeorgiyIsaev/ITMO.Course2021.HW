/*Создать базу данных соответсвующую картинке*/
CREATE DATABASE MyDB
ON
PRIMARY
	( NAME = N'MyDB_Prm',
	FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MyDB_Prm.mdf' ,
	SIZE = 4MB,
	MAXSIZE = UNLIMITED ,
	FILEGROWTH = 10% ), 
FILEGROUP MyDB_FG1_filegtoup
	( NAME = N'MyDB_FG1',
	FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MyDB_FG1.ndf' ,
	SIZE =  1MB,
	MAXSIZE = UNLIMITED ,
	FILEGROWTH = 10% ),
	(NAME = N'MyDB_FG2',
	FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MyDB_FG2.ndf' ,
	SIZE =  1MB,
	MAXSIZE = UNLIMITED ,
	FILEGROWTH = 10% )
LOG ON 
	( NAME = N'MyDB',
	FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MyDB.ldf' ,
	SIZE =  1MB,
	MAXSIZE = 2048GB ,
	FILEGROWTH = 10%)
COLLATE SQL_Latin1_General_CP1_CI_AS
GO

/*Изменить БД установив в ней файловую группу по умолчанию*/

ALTER DATABASE MyDB
MODIFY FILEGROUP MyDB_FG1 DEFAULT;