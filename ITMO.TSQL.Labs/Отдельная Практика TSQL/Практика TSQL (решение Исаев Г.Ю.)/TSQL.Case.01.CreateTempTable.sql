USE Practica 
GO

CREATE TABLE NashaBaza.TempTable (
PropId bigint IDENTITY (1,1) PRIMARY KEY NOT NULL,
nCanonId int NOT NULL, -- ����� ����������
dtReportDate date NOT NULL, -- ���� ����� ��������� �������
nTerOtdelenie int NOT NULL, -- ID �������
nTerPodrazdel int NOT NULL, -- ID ���������
vProcent decimal(6,4) NOT NULL -- �������� ����������
)
GO