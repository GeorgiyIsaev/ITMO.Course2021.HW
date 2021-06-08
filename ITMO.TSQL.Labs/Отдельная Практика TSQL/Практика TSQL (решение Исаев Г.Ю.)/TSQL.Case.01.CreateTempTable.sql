USE Practica 
GO

CREATE TABLE NashaBaza.TempTable (
PropId bigint IDENTITY (1,1) PRIMARY KEY NOT NULL,
nCanonId int NOT NULL, -- номер показателя
dtReportDate date NOT NULL, -- дата конца отчетного периода
nTerOtdelenie int NOT NULL, -- ID региона
nTerPodrazdel int NOT NULL, -- ID отделения
vProcent decimal(6,4) NOT NULL -- Значение показателя
)
GO