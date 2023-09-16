USE [master]
GO

/****** Object:  Database [SistVBX]    Script Date: 7/8/2023 10:21:53 ******/
CREATE DATABASE [SistVBX]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistVBX', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER2019\MSSQL\DATA\SistVBX.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistVBX_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER2019\MSSQL\DATA\SistVBX_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistVBX].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [SistVBX] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [SistVBX] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [SistVBX] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [SistVBX] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [SistVBX] SET ARITHABORT OFF 
GO

ALTER DATABASE [SistVBX] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [SistVBX] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [SistVBX] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [SistVBX] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [SistVBX] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [SistVBX] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [SistVBX] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [SistVBX] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [SistVBX] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [SistVBX] SET  ENABLE_BROKER 
GO

ALTER DATABASE [SistVBX] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [SistVBX] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [SistVBX] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [SistVBX] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [SistVBX] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [SistVBX] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [SistVBX] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [SistVBX] SET RECOVERY FULL 
GO

ALTER DATABASE [SistVBX] SET  MULTI_USER 
GO

ALTER DATABASE [SistVBX] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [SistVBX] SET DB_CHAINING OFF 
GO

ALTER DATABASE [SistVBX] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [SistVBX] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [SistVBX] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [SistVBX] SET QUERY_STORE = OFF
GO

ALTER DATABASE [SistVBX] SET  READ_WRITE 
GO
