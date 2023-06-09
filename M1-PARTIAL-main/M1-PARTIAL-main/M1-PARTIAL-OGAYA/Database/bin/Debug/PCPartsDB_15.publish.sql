﻿/*
Deployment script for PCPartsDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "PCPartsDB"
:setvar DefaultFilePrefix "PCPartsDB"
:setvar DefaultDataPath "C:\Users\dawor\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\dawor\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Altering Procedure [dbo].[spParts_Build]...';


GO
ALTER PROCEDURE [dbo].[spParts_Build]
    @CaseId INT,
    @FanId INT,
    @CpuId INT,
    @GpuId INT,
    @RamId INT,
    @MoboId INT,
    @PsuId INT,
    @SsdId INT,
    @TotalPrice DECIMAL(10, 2) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @PartTable TABLE ([Name] NVARCHAR(MAX), [UnitPrice] DECIMAL(10, 2));

    SET @TotalPrice = 0;

    DELETE FROM PC;

    IF @CaseId IS NOT NULL
    BEGIN
        INSERT INTO @PartTable ([Name], [UnitPrice])
        SELECT [Name], [UnitPrice] FROM [dbo].[CASES] WHERE [Id] = @CaseId;
        SET @TotalPrice += (SELECT [UnitPrice] FROM [dbo].[CASES] WHERE [Id] = @CaseId);
    END

    IF @FanId IS NOT NULL
    BEGIN
        INSERT INTO @PartTable ([Name], [UnitPrice])
        SELECT [Name], [UnitPrice] FROM [dbo].[FANS] WHERE [Id] = @FanId;
        SET @TotalPrice += (SELECT [UnitPrice] FROM [dbo].[FANS] WHERE [Id] = @FanId);
    END

    IF @CpuId IS NOT NULL
    BEGIN
        INSERT INTO @PartTable ([Name], [UnitPrice])
        SELECT [Name], [UnitPrice] FROM [dbo].[CPU] WHERE [Id] = @CpuId;
        SET @TotalPrice += (SELECT [UnitPrice] FROM [dbo].[CPU] WHERE [Id] = @CpuId);
    END

    IF @GpuId IS NOT NULL
    BEGIN
        INSERT INTO @PartTable ([Name], [UnitPrice])
        SELECT [Name], [UnitPrice] FROM [dbo].[GPU] WHERE [Id] = @GpuId;
        SET @TotalPrice += (SELECT [UnitPrice] FROM [dbo].[GPU] WHERE [Id] = @GpuId);
    END

    IF @RamId IS NOT NULL
    BEGIN
        INSERT INTO @PartTable ([Name], [UnitPrice])
        SELECT [Name], [UnitPrice] FROM [dbo].[RAM] WHERE [Id] = @RamId;
        SET @TotalPrice += (SELECT [UnitPrice] FROM [dbo].[RAM] WHERE [Id] = @RamId);
    END

    IF @MoboId IS NOT NULL
    BEGIN
        INSERT INTO @PartTable ([Name], [UnitPrice])
        SELECT [Name], [UnitPrice] FROM [dbo].[MOBO] WHERE [Id] = @MoboId;
        SET @TotalPrice += (SELECT [UnitPrice] FROM [dbo].[MOBO] WHERE [Id] = @MoboId);
    END

    IF @PsuId IS NOT NULL
    BEGIN
        INSERT INTO @PartTable ([Name], [UnitPrice])
        SELECT [Name], [UnitPrice] FROM [dbo].[PSU] WHERE [Id] = @PsuId;
        SET @TotalPrice += (SELECT [UnitPrice] FROM [dbo].[PSU] WHERE [Id] = @PsuId);
    END

IF @SsdId IS NOT NULL
BEGIN
    INSERT INTO @PartTable ([Name], [UnitPrice])
    SELECT [Name], [UnitPrice] FROM [dbo].[SSD] WHERE [Id] = @SsdId;
    SET @TotalPrice += (SELECT [UnitPrice] FROM [dbo].[SSD] WHERE [Id] = @SsdId);
END

SELECT [Name], [UnitPrice] FROM @PartTable;
END
GO
PRINT N'Update complete.';


GO
