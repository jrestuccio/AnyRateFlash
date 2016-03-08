-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: cls
-- Source Schemata: cls
-- Created: Tue Mar  8 00:40:58 2016
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;;

-- ----------------------------------------------------------------------------
-- Schema cls
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `cls` ;
CREATE SCHEMA IF NOT EXISTS `cls` ;

-- ----------------------------------------------------------------------------
-- Table cls.TFX_CorporateCustomers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_CorporateCustomers` (
  `C_CustomerID` INT NOT NULL AUTO_INCREMENT,
  `C_LoginCode` VARCHAR(15) NULL,
  `C_CustomerChainID` INT NULL,
  `C_CustomerName` VARCHAR(600) NULL,
  `Address1` VARCHAR(600) NULL DEFAULT 'N/A',
  `Address2` VARCHAR(600) NULL,
  `City` VARCHAR(200) NULL,
  `State` CHAR(2) NULL,
  `Zip` VARCHAR(20) NULL,
  `Phone` VARCHAR(10) NULL,
  PRIMARY KEY (`C_CustomerID`));

-- ----------------------------------------------------------------------------
-- Table cls.TFX_Customers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `LoginCode` VARCHAR(15) NULL,
  `CustomerChainID` INT NULL,
  `CustomerName` VARCHAR(600) NULL,
  `CustomerSiteID` INT NULL,
  `Address1` VARCHAR(600) NULL DEFAULT 'N/A',
  `Address2` VARCHAR(600) NULL,
  `City` VARCHAR(200) NULL,
  `State` CHAR(2) NULL,
  `Zip` VARCHAR(20) NULL,
  `Phone` BIGINT NULL,
  `HostHotelID` INT NULL,
  `C_CustomerID` INT NULL,
  `CountryCode` CHAR(2) NULL,
  PRIMARY KEY (`CustomerID`));

-- ----------------------------------------------------------------------------
-- Table cls.TFX_Contacts
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_Contacts` (
  `ContactID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(100) NOT NULL,
  `LastName` VARCHAR(100) NOT NULL,
  `EMail` VARCHAR(100) NOT NULL,
  `UserID` VARCHAR(100) NOT NULL,
  `Password` VARCHAR(20) NOT NULL,
  `Phone` BIGINT NULL,
  `Ext` BIGINT NULL,
  `Expires` DATETIME NOT NULL,
  PRIMARY KEY (`ContactID`));

-- ----------------------------------------------------------------------------
-- Table cls.TFX_HotelChains
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_HotelChains` (
  `HotelChainID` INT NOT NULL AUTO_INCREMENT,
  `ChainShortName` VARCHAR(10) NOT NULL,
  `ChainName` VARCHAR(400) NOT NULL,
  `OwnedByID` INT NULL,
  PRIMARY KEY (`HotelChainID`));

-- ----------------------------------------------------------------------------
-- Table cls.TFX_Hotels
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_Hotels` (
  `HotelChainID` INT NULL,
  `HotelID` INT NOT NULL AUTO_INCREMENT,
  `SiteID` INT NULL,
  `ShortName` VARCHAR(7) NULL,
  `Name` VARCHAR(400) NOT NULL,
  `Address` VARCHAR(400) NULL,
  `Address2` VARCHAR(400) NULL,
  `City` VARCHAR(200) NOT NULL,
  `State` VARCHAR(100) NOT NULL DEFAULT 'N/A',
  `Zip` VARCHAR(20) NULL,
  `Country` VARCHAR(200) NOT NULL,
  `DateCreated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Phone` BIGINT NULL,
  PRIMARY KEY (`HotelID`),
  CONSTRAINT `FK_TFX_Hotels_TFX_HotelChains`
    FOREIGN KEY (`HotelChainID`)
    REFERENCES `cls`.`TFX_HotelChains` (`HotelChainID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table cls.TFX_CustomerShoppingHotels
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_CustomerShoppingHotels` (
  `CustomerID` INT NOT NULL,
  `HotelID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`, `HotelID`),
  CONSTRAINT `FK_TFX_CustomerShoppingHotels_TFX_Customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `cls`.`TFX_Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TFX_CustomerShoppingHotels_TFX_Hotels`
    FOREIGN KEY (`HotelID`)
    REFERENCES `cls`.`TFX_Hotels` (`HotelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table cls.TFX_SiteParameterRoles
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_SiteParameterRoles` (
  `SiteParameterRoleID` INT NOT NULL,
  `RoleDesc` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`SiteParameterRoleID`));

-- ----------------------------------------------------------------------------
-- Table cls.TFX_SiteParameters
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_SiteParameters` (
  `HotelID` INT NOT NULL,
  `SiteID` INT NOT NULL,
  `ParameterRoleID` INT NOT NULL,
  `ParameterValue` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`HotelID`, `SiteID`, `ParameterRoleID`),
  CONSTRAINT `FK_TFX_SiteParameters_TFX_SiteParameterRoles`
    FOREIGN KEY (`ParameterRoleID`)
    REFERENCES `cls`.`TFX_SiteParameterRoles` (`SiteParameterRoleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table cls.TFX_Sites
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_Sites` (
  `SiteID` INT NOT NULL,
  `SiteDesc` VARCHAR(300) NOT NULL,
  `IsBranded` TINYINT(1) NOT NULL DEFAULT 0,
  `SearchTypeID` INT NOT NULL DEFAULT 1,
  `HaveDetailedRates` TINYINT(1) NULL DEFAULT 0,
  `IsAvailable` TINYINT(1) NULL,
  `IsActive` TINYINT(1) NULL,
  PRIMARY KEY (`SiteID`));

-- ----------------------------------------------------------------------------
-- Table cls.TFX_CustomerShoppingSites
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_CustomerShoppingSites` (
  `CustomerID` INT NOT NULL,
  `SiteID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`, `SiteID`),
  CONSTRAINT `FK_TFX_CustomerShoppingSites_TFX_Customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `cls`.`TFX_Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TFX_CustomerShoppingSites_TFX_Sites`
    FOREIGN KEY (`SiteID`)
    REFERENCES `cls`.`TFX_Sites` (`SiteID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table cls.TFX_V2_SiteTimeOuts
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_V2_SiteTimeOuts` (
  `SiteID` INT NOT NULL,
  `TimeOut` INT NOT NULL,
  PRIMARY KEY (`SiteID`));

-- ----------------------------------------------------------------------------
-- Table cls.tfx_V2_ErrorCodes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`tfx_V2_ErrorCodes` (
  `ErrorCode` CHAR(8) NOT NULL,
  `ErrorCodeID` INT NOT NULL,
  `ErrorDesc` VARCHAR(500) NOT NULL,
  `ErrorSQL` VARCHAR(1000) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table cls.tfx_V2_RateTypes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`tfx_V2_RateTypes` (
  `RateTypeID` INT NOT NULL,
  `RateTypeDesc` VARCHAR(50) NOT NULL,
  `RateTypeDescShort` VARCHAR(10) NOT NULL);

-- ----------------------------------------------------------------------------
-- Table cls.tfx_V2_Queue
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`tfx_V2_Queue` (
  `RequestID` INT NOT NULL AUTO_INCREMENT,
  `HotelID` INT NOT NULL,
  `SiteID` INT NOT NULL,
  `ArrivalDate` DATETIME NOT NULL,
  `LOS` INT NOT NULL,
  `DictionaryID` INT NULL,
  `RoomTypeID` INT NULL,
  `NumOfGuest` INT NULL,
  `SearchProductID` INT NULL,
  `SearchEngineID` INT NULL,
  `SearchStartDate` DATETIME NULL,
  `SearchStopDate` DATETIME NULL,
  `RetryCount` INT NOT NULL DEFAULT 0,
  `MaxRetries` INT NOT NULL DEFAULT 2,
  `ErrorCode` VARCHAR(8) NULL,
  `SessionID` VARCHAR(50) NOT NULL,
  `MachineName` VARCHAR(50) NULL,
  `EmailAddress` VARCHAR(100) NULL,
  `ProxyUsed` VARCHAR(50) NULL,
  `InProgress` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`RequestID`, `SessionID`));

-- ----------------------------------------------------------------------------
-- Table cls.tfx_V2_UnfilteredRates
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`tfx_V2_UnfilteredRates` (
  `RequestID` INT NOT NULL,
  `HotelID` INT NOT NULL,
  `SiteID` INT NOT NULL,
  `ArrivalDate` DATETIME NOT NULL,
  `LOS` INT NOT NULL,
  `Rate` DECIMAL(19,4) NOT NULL,
  `RateDesc` VARCHAR(1500) NULL,
  `ErrorCode` CHAR(8) NOT NULL,
  `CurrencyCode` VARCHAR(10) NULL DEFAULT 'USD',
  `TimeInserted` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

-- ----------------------------------------------------------------------------
-- Table cls.TFX_Proxies
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_Proxies` (
  `Proxy` VARCHAR(30) NOT NULL,
  `Port` INT NOT NULL,
  `Expires` DATETIME NOT NULL,
  `ProxyGroup` INT NOT NULL,
  PRIMARY KEY (`Proxy`, `Port`, `Expires`, `ProxyGroup`));

-- ----------------------------------------------------------------------------
-- Table cls.tfx_V2_ScriptEngines
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`tfx_V2_ScriptEngines` (
  `ScriptEngineID` INT NOT NULL,
  `ScriptEngineDesc` VARCHAR(200) NOT NULL,
  `ScriptEngineExt` VARCHAR(5) NULL,
  `ScriptEngineApp` VARCHAR(20) NULL);

-- ----------------------------------------------------------------------------
-- Table cls.TFX_SearchRequestQ
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_SearchRequestQ` (
  `RequestQID` INT NOT NULL AUTO_INCREMENT,
  `HotelID` INT NOT NULL,
  `SiteID` INT NOT NULL,
  `ArrivalDate` DATETIME NOT NULL,
  `ArrivalDay` VARCHAR(3) NULL,
  `LOS` INT NOT NULL,
  `RateTypeID` INT NOT NULL,
  `RoomTypeID` INT NULL,
  `Guests` INT NOT NULL,
  `RunStartDate` DATETIME NULL,
  `RunCompleteDate` DATETIME NULL,
  `RequestDate` DATETIME NOT NULL,
  `MachineName` VARCHAR(50) NULL,
  `RetryCount` INT NULL,
  `RetriesBeforeFail` INT NULL,
  `ErrorCodeID` INT NULL,
  `IsIncidental` TINYINT(1) NULL,
  `SessionID` VARCHAR(100) NULL,
  `EmailAddress` VARCHAR(50) NULL,
  `IsTestRun` TINYINT(1) NULL,
  `Activated` TINYINT(1) NULL,
  PRIMARY KEY (`RequestQID`));

-- ----------------------------------------------------------------------------
-- Table cls.TFX_FlashJobStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_FlashJobStatus` (
  `SessionID` VARCHAR(50) NOT NULL,
  `StartDate` DATETIME NOT NULL,
  `EndDate` DATETIME NULL,
  `JobSize` INT NULL,
  `Status` CHAR(1) NULL);

-- ----------------------------------------------------------------------------
-- Table cls.TFX_CustomerRegions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_CustomerRegions` (
  `RegionID` INT NOT NULL AUTO_INCREMENT,
  `RegionName` VARCHAR(600) NULL,
  `RegionShortName` VARCHAR(50) NULL,
  `C_CustomerID` INT NOT NULL,
  PRIMARY KEY (`RegionID`),
  CONSTRAINT `FK_TFX_CustomerRegions_TFX_CorporateCustomers`
    FOREIGN KEY (`C_CustomerID`)
    REFERENCES `cls`.`TFX_CorporateCustomers` (`C_CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table cls.TFX_L_ContactRegions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_L_ContactRegions` (
  `ContactID` INT NOT NULL,
  `RegionID` INT NOT NULL,
  PRIMARY KEY (`ContactID`, `RegionID`),
  CONSTRAINT `FK_TFX_L_ContactRegions_TFX_Contacts`
    FOREIGN KEY (`ContactID`)
    REFERENCES `cls`.`TFX_Contacts` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TFX_L_ContactRegions_TFX_CustomerRegions`
    FOREIGN KEY (`RegionID`)
    REFERENCES `cls`.`TFX_CustomerRegions` (`RegionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table cls.TFX_L_ContactCustomers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_L_ContactCustomers` (
  `ContactID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`ContactID`, `CustomerID`),
  CONSTRAINT `FK_TFX_L_ContactCustomers_TFX_Contacts`
    FOREIGN KEY (`ContactID`)
    REFERENCES `cls`.`TFX_Contacts` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TFX_L_ContactCustomers_TFX_Customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `cls`.`TFX_Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table cls.TFX_L_RegionCustomers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cls`.`TFX_L_RegionCustomers` (
  `RegionID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`RegionID`, `CustomerID`),
  CONSTRAINT `FK_TFX_L_RegionCustomers_TFX_CustomerRegions`
    FOREIGN KEY (`RegionID`)
    REFERENCES `cls`.`TFX_CustomerRegions` (`RegionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- View cls.usp_SetSitesAvailable
-- ----------------------------------------------------------------------------
-- USE `cls`;
-- 
-- 
-- CREATE  OR REPLACE PROC usp_SetSitesAvailable
-- AS
-- UPDATE TFX_Sites SET IsAvailable = 1
-- 
-- 
-- ;

-- ----------------------------------------------------------------------------
-- View cls.usp_SetSitesUnavailable
-- ----------------------------------------------------------------------------
-- USE `cls`;
-- 
-- 
-- CREATE  OR REPLACE PROC usp_SetSitesUnavailable
-- AS
-- UPDATE TFX_Sites SET IsAvailable = 0
-- 
-- 
-- ;

-- ----------------------------------------------------------------------------
-- View cls.usp_V2_CheckForSingleSearch
-- ----------------------------------------------------------------------------
-- USE `cls`;
-- 
-- CREATE 	 OR REPLACE PROC usp_V2_CheckForSingleSearch
-- 
-- AS
-- 
-- DECLARE	@RequestQID INT
-- 
-- SET NOCOUNT ON
-- 
-- 
-- 
-- --SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
-- BEGIN TRANSACTION 
-- 
-- SET 	@RequestQID =
-- 	(SELECT TOP 1 	RequestID 
-- 	 FROM		TFX_V2_Queue WITH (NOLOCK) --(READPAST)
-- 	 WHERE		(InProgress = 0) -- OR InProgress IS NULL)
-- 	 AND		SearchStartDate IS NULL
-- 	 AND		MachineName IS NULL
-- 	 AND		SessionID IS NOT NULL
-- 	 --AND 		SiteID <> 99
-- 	)
-- 
-- 
-- IF 	@RequestQID IS NULL
-- BEGIN
-- SET 	@RequestQID =
-- 	(SELECT TOP 1 	RequestID 
-- 	 FROM		TFX_V2_Queue --WITH (NOLOCK) --(READPAST)
-- 	 WHERE		(InProgress = 0) -- OR InProgress IS NULL)
-- 	 AND		SearchStartDate IS NOT NULL
-- 	 AND		ErrorCode NOT IN ('SUCC_RTE', 'SOLD OUT', 'EMSG_MI1')
-- 	 AND		RetryCount <= MaxRetries
-- 	 AND		SessionID IS NOT NULL
-- 	 --AND 		SiteID <> 99
-- 	)
-- 
-- END
-- 
-- 
-- IF 	@RequestQID IS NULL
-- BEGIN
-- SET 	@RequestQID =
-- 	(SELECT TOP 1 	RequestID 
-- 	 FROM		TFX_V2_Queue WITH (NOLOCK) --(READPAST)
-- 	 WHERE		(InProgress = 0) -- OR InProgress IS NULL)
-- 	 AND		SearchStartDate IS NULL
-- 	 AND		MachineName IS NULL
-- 	 --AND 		SiteID <> 99
-- 	)
-- END
-- 
-- /* Update 	TFX_V2_Queue
-- Set	InProgress = 1,
-- 	SearchStartDate = GetDate()
-- Where 	RequestID = @RequestQID
-- */
-- 
-- IF 	@RequestQID IS NULL
-- BEGIN
-- SET 	@RequestQID =
-- 	(SELECT TOP 1 	RequestID 
-- 	 FROM		TFX_V2_Queue WITH (NOLOCK) --(READPAST)
-- 	 WHERE		(InProgress = 0) -- OR InProgress IS NULL)
-- 	 AND		SearchStartDate IS NOT NULL
-- 	 AND		ErrorCode NOT IN ('SUCC_RTE', 'SOLD OUT', 'EMSG_MI1')
-- 	 AND		RetryCount <= MaxRetries
-- 	 --AND 		SiteID <> 99
-- 	)
-- 
-- END
-- 
-- 
-- 
-- IF 	@RequestQID IS NULL
-- BEGIN
-- 	SET @RequestQID = 0
-- END
-- 
-- 
-- 
-- Update 	TFX_V2_Queue WITH (ROWLOCK)
-- Set	InProgress = 1,
-- 	SearchStartDate = GetDate()
-- Where 	RequestID = @RequestQID
-- 
-- COMMIT TRANSACTION
-- --SET TRANSACTION ISOLATION LEVEL READ COMMITTED
-- 
-- 
-- 
-- 
-- 
-- --COMMIT TRANSACTION
-- 
-- PRINT @RequestQID
-- 
-- /*
-- CREATE	TABLE #REQUEST (
-- 	RequestQID int)
-- 
-- INSERT #REQUEST (RequestQID)
-- VALUES (@RequestQID)
-- 
-- SELECT * FROM #REQUEST
-- 
-- DROP TABLE #REQUEST
-- */
-- 
-- SELECT @RequestQID as RequestQID
-- 
-- 
-- 
-- --SELECT	CONVERT(varchar(20), @RequestQID) as RequestQID--@RequestQID as RequestQID
-- --RETURN @RequestQID
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- ;

-- ----------------------------------------------------------------------------
-- View cls.usp_GetHotelParametersV2_Proxy
-- ----------------------------------------------------------------------------
-- USE `cls`;
-- 
-- 
-- CREATE	 OR REPLACE PROC [dbo].[usp_GetHotelParametersV2_Proxy]
-- 	@HotelID int,
-- 	@SiteID int
-- AS
-- SET NOCOUNT ON
-- 
-- BEGIN TRAN
-- 
-- CREATE   TABLE 	#Info(	
-- 			HotelID			int,
-- 			SiteID			int,
-- 			ParameterRoleID		int,
-- 			RoleDesc		varchar(100),
-- 			ParameterValue		varchar(200))
-- 	
-- -- Initially populate the table with one of each
-- -- Put place holders for the HotelSiteInfo
-- 			
-- INSERT INTO	#Info
-- SELECT DISTINCT
--  		@HotelID,
-- 		0,
-- 		r.SiteParameterRoleID,
-- 		r.RoleDesc,
-- 		''
-- FROM		--TFX_SiteParameters p,
-- 		TFX_SiteParameterRoles r
-- --WHERE		p.parameterroleid = r.siteparameterroleid --p.HotelID = @HotelID
-- --AND		p.SiteID = 0
-- --AND		p.parameterroleid = r.siteparameterroleid
-- 
-- -- Now, put the default values in if the exist
-- UPDATE		#Info
-- SET		#Info.ParameterValue = TFX_SiteParameters.ParameterValue,
-- 		SiteID = 0
-- 		
-- FROM		TFX_SiteParameters JOIN #Info ON TFX_SiteParameters.ParameterRoleID = #Info.ParameterRoleID
-- WHERE		TFX_SiteParameters.HotelID = @HotelID 
-- AND		TFX_SiteParameters.SiteID = 0
-- 
-- -- Now, put the sepecific values in if the exist
-- UPDATE		#Info
-- SET		#Info.ParameterValue = TFX_SiteParameters.ParameterValue,
-- 		SiteID = @SiteID
-- 		
-- FROM		TFX_SiteParameters JOIN #Info ON TFX_SiteParameters.ParameterRoleID = #Info.ParameterRoleID
-- WHERE		TFX_SiteParameters.HotelID = @HotelID 
-- AND		TFX_SiteParameters.SiteID = @SiteID
-- AND		TFX_SiteParameters.ParameterValue <> ''
-- 
-- COMMIT TRAN
-- 
-- DECLARE	@Proxy varchar(200)
-- 
-- 
-- SELECT	@Proxy = ParameterValue 
-- FROM	#Info
-- WHERE	ParameterRoleID = 16
-- 
-- IF	@Proxy IS NOT NULL
-- BEGIN
-- 	SELECT  @proxy  = (select top 1 proxy from TFX_proxies
-- 	WHERE proxygroup = @proxy
-- 	And Expires > GetDate()
-- 	Order by NewID())
-- 
-- UPDATE	#Info
-- SET	ParameterValue = @proxy
-- WHERE	ParameterRoleID = 16
-- 
-- END
-- 
-- UPDATE	#Info
-- SET	ParameterValue = ''
-- WHERE	ParametervALUE  IS NULL
-- 
-- DECLARE @Occupancy int
-- select @Occupancy = (Select top 1 Numofguest from TFX_V2_queue
-- where HotelID = @HotelID
-- and SiteID = @SiteID
-- and inprogress=1)
-- 
-- UPDATE #info
-- Set ParameterValue = @occupancy
-- where parameterroleid = 19
-- 
-- --added for forking JPR html
-- UPDATE #info
-- Set ParameterValue = '/home/stoosh/AnyRateNG/'
-- where parameterroleid = 17 or ParameterRoleID = 18
-- 
-- 
-- UPDATE #info
-- Set ParameterValue = 0
-- where ParameterRoleID = 11
-- 
-- --select * from #Info
-- 
-- -- Lastly, return everything
-- SELECT		ParameterRoleID,
-- 		ParameterValue
-- FROM		#Info
-- ORDER BY 	ParameterRoleID
-- DROP TABLE #Info
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- ;

-- ----------------------------------------------------------------------------
-- View cls.usp_getCustomersByEmail
-- ----------------------------------------------------------------------------
-- USE `cls`;
-- 
-- 
-- CREATE  OR REPLACE PROC usp_getCustomersByEmail
-- 		@Login	varchar(100)
-- 
-- -------------------------------------------------------------------
-- --CREATED: 05.24.2004 BMC
-- --DESC:    Get a list of customers this client has access to
-- --	   directly or indirectly through regional access 
-- -------------------------------------------------------------------
-- 
-- AS
-- 
-- SET NOCOUNT ON
-- 
-- SELECT DISTINCT
--  	--Direct Access from contactCustomers
--  	c.CustomerID,
-- 	c.CustomerName
-- FROM	TFX_Customers c,
--  	tfx_Contacts ct,
--  	tfx_l_contactCustomers lcc
-- WHERE	ct.userID = @Login
-- 	AND	ct.ContactID = lcc.ContactID
-- 	AND	lcc.CustomerID = c.CustomerID
-- 
-- UNION
--  
-- SELECT DISTINCT
--  	--Indirect Access from contactRegions
--  	c.CustomerID,
-- 	c.CustomerName
-- FROM	TFX_Customers c,
-- 	tfx_Contacts ct,
--  	tfx_l_ContactRegions lcr,
--  	tfx_l_RegionCustomers lrc
-- WHERE	ct.userID = @Login
--  
-- 	AND	lcr.ContactID = ct.ContactID
-- 	AND	lcr.RegionID = lrc.RegionID
-- 	AND	c.CustomerID = lrc.CustomerID
-- 	 
-- ORDER BY c.CustomerName
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- ;

-- ----------------------------------------------------------------------------
-- View cls.USP_V2_MakeFlashSearchV2
-- ----------------------------------------------------------------------------
-- USE `cls`;
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- CREATE   OR REPLACE PROC [dbo].[USP_V2_MakeFlashSearchV2]
-- 	@sessionID 	varchar(100),	--Flash sessionID
-- 	@email		varchar(50),	--eMail of user requesting search
-- 	@HotelID	int,		--Property for search
-- 	@SearchSiteID	int,		--Website to search
-- 	@startDate	datetime,	--search start date
-- 	@endDate	datetime,	--search stop date
-- 	@LOS1		int,		--Length of Stay
-- 	@LOS2		int,		-- "
-- 	@LOS3		int,		-- "
-- 	@LOS4		int,		-- "
-- 	@bMon		bit,		--Monday search flag
-- 	@bTue		bit,		--Tuesday  "
-- 	@bWed		bit,		--Wed
-- 	@bThu		bit,		--Thu
-- 	@bFri		bit,		--Fri
-- 	@bSat		bit,		--Sat
-- 	@bSun		bit		--Sun
-- 
-- 
-- AS
-- 
-- ---------------------------------------------------------------------------------
-- --UPDATE: 3.15.2010 LM
-- --DESC:   Added LOS4 
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------
-- --UPDATE: 8.18.2005 BMC
-- --DESC:   Insert a completed search with error code and a search result when
-- --	the property is not available for the website  
-- ---------------------------------------------------------------------------------
-- --CREATED: 8.16.2005 BMC
-- --DESC:   Modifies usp_MakeFlashSearch  
-- --	Takes parameters from FlashLight webpage and generates search entries
-- --	in tfx_V2_Queue to search one hotel one site.
-- ---------------------------------------------------------------------------------
-- 
-- SET NOCOUNT ON
-- SET DATEFIRST 1
-- 
-- --Set Booleans
-- DECLARE @True		bit		--TRUE
-- DECLARE @False 		bit		--FALSE
-- 
-- DECLARE @WorkDate	datetime	--Temporary date for comparison
-- 
-- SELECT @True = 1, @False = 0
-- 
-- CREATE TABLE #TEMP_Q (
-- HotelID		int		not null,
-- SiteID		int		not null,
-- ArrDate		smalldatetime	not null,
-- LOS		int		not null,
-- SessionID	varchar(100)	not null,
-- EmailAddress	varchar(50)	not null
-- )
-- 
-- 
-- --Create the search entries
-- SELECT @WorkDate = @StartDate
-- 
-- WHILE @WorkDate <= @EndDate
-- BEGIN
-- --------------------------------------------------
-- --NOTE: There has to be a better way to do this!
-- --------------------------------------------------
-- --PRINT CONVERT(varchar(10), @WorkDate) + '  ' + convert(char(6), @hotelID) + convert(char(6), @SiteID)
-- 	
-- 	--Monday
-- 	IF DATEPART(dw, @WorkDate) = 1 AND @bMon = @True
-- 	BEGIN
-- 		INSERT #TEMP_Q VALUES(
-- 			@HotelID, @searchSiteID, @WorkDate, @LOS1, @SessionID, @Email
-- 		)
-- 		
-- 		IF @LOS2 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS2, @SessionID, @Email
-- 			)
-- 		END
-- 
-- 		IF @LOS3 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS3, @SessionID, @Email
-- 			)
-- 		END
-- 		
-- 		IF @LOS4 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS4, @SessionID, @Email
-- 			)
-- 		END
-- 	END
-- 	--Tuesday
-- 	IF DATEPART(dw, @WorkDate) = 2 AND @bTue = @True
-- 	BEGIN
-- 		INSERT #TEMP_Q VALUES(
-- 			@HotelID, @searchSiteID, @WorkDate, @LOS1, @SessionID, @Email
-- 		)
-- 		
-- 		IF @LOS2 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS2, @SessionID, @Email
-- 			)
-- 		END
-- 
-- 		IF @LOS3 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS3, @SessionID, @Email
-- 			)
-- 		END
-- 
-- 		IF @LOS4 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS4, @SessionID, @Email
-- 			)
-- 		END
-- 	END
-- 	--Wednesday
-- 	IF DATEPART(dw, @WorkDate) = 3 AND @bWed = @True
-- 	BEGIN
-- 		INSERT #TEMP_Q VALUES(
-- 			@HotelID, @searchSiteID, @WorkDate, @LOS1, @SessionID, @Email
-- 		)
-- 		
-- 		IF @LOS2 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS2, @SessionID, @Email
-- 			)
-- 		END
-- 
-- 		IF @LOS3 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS3, @SessionID, @Email
-- 			)
-- 		END
-- 
-- 		IF @LOS4 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS4, @SessionID, @Email
-- 			)
-- 		END
-- 	END
-- 	--Thursday
-- 	IF DATEPART(dw, @WorkDate) = 4 AND @bThu = @True
-- 	BEGIN
-- 		INSERT #TEMP_Q VALUES(
-- 			@HotelID, @searchSiteID, @WorkDate, @LOS1, @SessionID, @Email
-- 		)
-- 		
-- 		IF @LOS2 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS2, @SessionID, @Email
-- 			)
-- 		END
-- 
-- 		IF @LOS3 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS3, @SessionID, @Email
-- 			)
-- 		END
-- 
-- 		IF @LOS4 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS4, @SessionID, @Email
-- 			)
-- 		END
-- 	END
-- 	--Friday
-- 	IF DATEPART(dw, @WorkDate) = 5 AND @bFri = @True
-- 	BEGIN
-- 		INSERT #TEMP_Q VALUES(
-- 			@HotelID, @searchSiteID, @WorkDate, @LOS1, @SessionID, @Email
-- 		)
-- 		
-- 		IF @LOS2 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS2, @SessionID, @Email
-- 			)
-- 		END
-- 
-- 		IF @LOS3 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS3, @SessionID, @Email
-- 			)
-- 		END
-- 
-- 		IF @LOS4 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS4, @SessionID, @Email
-- 			)
-- 		END
-- 	END
-- 		--Saturday
-- 	IF DATEPART(dw, @WorkDate) = 6 AND @bSat = @True
-- 	BEGIN
-- 		INSERT #TEMP_Q VALUES(
-- 			@HotelID, @searchSiteID, @WorkDate, @LOS1, @SessionID, @Email
-- 		)
-- 		
-- 		IF @LOS2 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS2, @SessionID, @Email
-- 			)
-- 		END
-- 
-- 		IF @LOS3 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS3, @SessionID, @Email
-- 			)
-- 		END
-- 
-- 		IF @LOS4 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS4, @SessionID, @Email
-- 			)
-- 		END
-- 	END
-- 	--Sunday
-- 	IF DATEPART(dw, @WorkDate) = 7 AND @bSun = @True
-- 	BEGIN
-- 		INSERT #TEMP_Q VALUES(
-- 			@HotelID, @searchSiteID, @WorkDate, @LOS1, @SessionID, @Email
-- 		)
-- 		
-- 		IF @LOS2 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS2, @SessionID, @Email
-- 			)
-- 		END
-- 
-- 		IF @LOS3 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS3, @SessionID, @Email
-- 			)
-- 		END
-- 
-- 		IF @LOS4 > 0
-- 		BEGIN
-- 			INSERT #TEMP_Q VALUES(
-- 				@HotelID, @searchSiteID, @WorkDate, @LOS4, @SessionID, @Email
-- 			)
-- 		END
-- 	END
-- SELECT @WorkDate = DATEADD(d, 1, @WorkDate)
-- END
-- 
-- SELECT * FROM #TEMP_Q ORDER BY HotelID, SiteID	
-- 
-- --Check for N/A, if N/A then insert completed search + result
-- DECLARE 
-- 	@Q_HotelID	int,
-- 	@SiteID		int,
-- 	@ArrDate	smalldatetime,
-- 	@LOS		int,
-- 	@Q_SessionID	varchar(100),
-- 	@EmailAddress	varchar(50)
-- 
-- DECLARE Q_Cursor CURSOR FOR
-- 	SELECT HotelID, SiteID, ArrDate, LOS, SessionID, EMailAddress FROM #TEMP_Q
-- 
-- OPEN Q_Cursor
-- 
-- FETCH NEXT FROM Q_Cursor 
-- INTO @Q_HotelID, @SiteID, @ArrDate, @LOS, @Q_SessionID, @EmailAddress
-- 
-- WHILE @@FETCH_STATUS = 0
-- BEGIN
-- 	
-- 	IF (
-- 		SELECT 	ParameterValue 
-- 		FROM 	TFX_SiteParameters 
-- 		WHERE 	HotelID = @HotelID 
-- 			AND SiteID = @SiteID
-- 			AND ParameterRoleID = 5) = 'N/A'
-- 	BEGIN
-- 		--Insert the search request
-- 		INSERT TFX_V2_Queue ( 
-- 			HotelID, 
-- 			SiteID, 
-- 			ArrivalDate, 
-- 			LOS,
-- 			DictionaryID,
-- 			RoomTypeID, 
-- 			NumOfGuest,
-- 			SearchProductID,
-- 			SearchEngineID,
-- 			SearchStartDate,
-- 			SearchStopDate,
-- 			RetryCount,
-- 			MaxRetries,
-- 			ErrorCode,
-- 			SessionID,
-- 			MachineName,
-- 			EmailAddress,
-- 			ProxyUsed,
-- 			InProgress 
-- 		) VALUES (
-- 			@Q_HotelID,
-- 			@SiteID,
-- 			@ArrDate,
-- 			@LOS,
-- 			1,
-- 			1,
-- 			1,
-- 			1,
-- 			1,
-- 			GETDATE(),
-- 			GETDATE(),
-- 			0,
-- 			1,
-- 			'EMSG_MI1',
-- 			@Q_SessionID,
-- 			NULL,
-- 			@EMailAddress,
-- 			NULL,
-- 			0
-- 		)
-- 		--Insert the search Result
-- 		INSERT TFX_V2_UnfilteredRates (
-- 			RequestID,
-- 			HotelID,
-- 			SiteID,
-- 			ArrivalDate,
-- 			LOS,
-- 			Rate,
-- 			RateDesc,
-- 			ErrorCode,
-- 			CurrencyCode,
-- 			TimeInserted 
-- 		 ) VALUES (
-- 			@@IDENTITY,
-- 			@Q_HotelID,
-- 			@SiteID,
-- 			@ArrDate,
-- 			@LOS,
-- 			-1,
-- 			'Not Available',
-- 			'EMSG_MI1',
-- 			NULL,
-- 			GETDATE()
-- 		)
-- 		
-- 	END ELSE BEGIN
-- 
-- 		INSERT TFX_V2_Queue ( 
-- 			HotelID, 
-- 			SiteID, 
-- 			ArrivalDate, 
-- 			LOS,
-- 			DictionaryID,
-- 			RoomTypeID, 
-- 			NumOfGuest,
-- 			SearchProductID,
-- 			SearchEngineID,
-- 			SearchStartDate,
-- 			SearchStopDate,
-- 			RetryCount,
-- 			MaxRetries,
-- 			ErrorCode,
-- 			SessionID,
-- 			MachineName,
-- 			EmailAddress,
-- 			ProxyUsed,
-- 			InProgress )
-- 		SELECT
-- 			@HotelID,
-- 			@SiteID,
-- 			@ArrDate,
-- 			@LOS,
-- 			1,
-- 			1,
-- 			1,
-- 			1,
-- 			1,
-- 			NULL,
-- 			NULL,
-- 			0,
-- 			2,
-- 			NULL,
-- 			@Q_SessionID,
-- 			NULL,
-- 			@EMailAddress,
-- 			NULL,
-- 			0
-- 	END
-- 
-- 	FETCH NEXT FROM Q_Cursor 
-- 	INTO @Q_HotelID, @SiteID, @ArrDate, @LOS, @Q_SessionID, @EmailAddress
-- 
-- END
-- 
-- CLOSE Q_Cursor
-- DEALLOCATE Q_Cursor
-- 
-- /*
-- INSERT TFX_V2_Queue ( 
-- 	HotelID, 
-- 	SiteID, 
-- 	ArrivalDate, 
-- 	LOS,
-- 	DictionaryID,
-- 	RoomTypeID, 
-- 	NumOfGuest,
-- 	SearchProductID,
-- 	SearchEngineID,
-- 	SearchStartDate,
-- 	SearchStopDate,
-- 	RetryCount,
-- 	MaxRetries,
-- 	ErrorCode,
-- 	SessionID,
-- 	MachineName,
-- 	EmailAddress,
-- 	ProxyUsed,
-- 	InProgress )
-- SELECT
-- 	HotelID,
-- 	SiteID,
-- 	ArrDate,
-- 	LOS,
-- 	1,
-- 	1,
-- 	1,
-- 	1,
-- 	1,
-- 	NULL,
-- 	NULL,
-- 	0,
-- 	1,
-- 	NULL,
-- 	SessionID,
-- 	NULL,
-- 	EMailAddress,
-- 	NULL,
-- 	0
-- FROM #TEMP_Q
-- 
-- */
-- 
-- DROP TABLE #TEMP_Q
-- 
-- RETURN
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- ;

-- ----------------------------------------------------------------------------
-- View cls.usp_v2_FlashReport14LingNew
-- ----------------------------------------------------------------------------
-- USE `cls`;
-- 
-- CREATE    OR REPLACE PROC dbo.usp_v2_FlashReport14LingNew
-- 	@SessionID	varchar(100),
-- 	@CustomerID	int,
-- 	@Ratetype	varchar(50),
-- 	@RateProfile	varchar(50)
-- AS
-- ---------------------------------------------------------------------
-- --CREATED: 2006.05.02 BMC
-- --DESC:    Ripped from usp_v2_FlashReport12, and modified for having
-- --	   Multiple LOS and to use the V2 dictionary.
-- --	   Older comments are from the previous File.
-- ---------------------------------------------------------------------
-- --CHANGED: 2007.03.27 BMC
-- --DESC:	   Make sure the SiteID and HotelID match as well as the requestID
-- --	   Because if the Q table gets reset, then the requestIDs no longer
-- --	   uniquely identify searches
-- ---------------------------------------------------------------------
-- --CHANGED: 2007.02.08 BMC
-- --DESC:	   LOS was not being compared when removing undesired results
-- --	   (3 statements)
-- ---------------------------------------------------------------------
-- --CHANGED: 2005.10.17 JS
-- --DESC:  Do currency Conversion to USD and then to Local
-- ---------------------------------------------------------------------
-- --CHANGED: 8.30.05 BMC
-- --DESC:  Use -9 instead of -99 rate for missing searches
-- ---------------------------------------------------------------------
-- --CHANGED: 8.26.05 BMC
-- --DESC:	 Don't delete the -1 search results after applying the dictionary
-- ---------------------------------------------------------------------
-- --CREATED: 8.16.05 BMC
-- --DESC:  Pulls data for report type 12 for a flash generated search on the V2 system
-- --	 Flags the host and determines if competitors have a higher or
-- --	 lower price.
-- --	 Adjusts rate types based on dictionary.  Ripped from usp_FlashReport12
-- --NOTE:  Any changes to dictionary configuration will require like
-- --	 changes to this procedure until V2 dictionary is enabled.
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------
-- --CHANGED: 7.20.2009 LM
-- --DESC:	Change rateTypes select by customer
-- --	Fill in for missing Rate, RateDesc, ErrorCode, CurrencyCode, TimeInsertedUpdate when Rate is NULL
-- ---------------------------------------------------------------------
-- 
-- 
-- SET NOCOUNT ON
-- SET DATEFIRST 1
-- 
-- --Holds the search results for manipulation
-- 
-- CREATE TABLE #RESULTS (
-- RequestID 	int,
-- HotelID 	int,
-- SiteID 		int,
-- ArrivalDate 	smalldatetime,
-- LOS 		int,
-- Rate 		money NULL,
-- RateDesc 	varchar(2000)NULL,
-- ErrorCode 	char(8) NULL,
-- CurrencyCode 	varchar(10) NULL,
-- TimeInserted 	datetime NULL, 
-- RateType 	varchar(10)
-- 
-- )
-- 
-- --get the RateType from @Ratetype 
-- CREATE TABLE #RATETYPE(
-- 	RateType varchar(10),
-- 	RateTypeID int
-- )
-- 
-- DECLARE @RateTypeShortDesc varchar(10)
-- DECLARE @RateTypeID int
-- 
-- DECLARE RateType_Cursor CURSOR FOR
-- 	SELECT 	RateTypeDescShort, RateTypeID 
-- 	FROM 	TFX_V2_RateTypes 
-- 	
-- OPEN RateType_Cursor
-- 
-- FETCH NEXT FROM RateType_Cursor
-- 	INTO @RateTypeShortDesc, @RateTypeID
-- 
-- WHILE @@FETCH_STATUS = 0 
-- BEGIN
-- 	IF  @RateType LIKE  '%' + LTRIM(@RateTypeShortDesc) +'%'
-- 	BEGIN 
-- 		INSERT #RATETYPE (RateType, RateTypeID) VALUES(@RateTypeShortDesc, @RateTypeID )
-- 	END
-- 
-- 	FETCH NEXT FROM RateType_Cursor
-- 	INTO @RateTypeShortDesc, @RateTypeID
-- END
-- --SELECT * from #RATETYPE
-- 
-- CLOSE RateType_Cursor
-- DEALLOCATE RateType_Cursor
-- 
-- --get some data to play with, rateType is selected from user
-- 
-- INSERT #RESULTS (
-- 	RequestID, 
-- 	HotelID,
-- 	SiteID,
-- 	ArrivalDate,
-- 	LOS,
-- 	Rate,
-- 	RateDesc,
-- 	ErrorCode,
-- 	CurrencyCode,
-- 	TimeInserted,
-- 	RateType 
-- )
-- 
-- SELECT  DISTINCT 
-- 	q.RequestID,
-- 	q.HotelID,
-- 	q.SiteID,
-- 	q.ArrivalDate,
-- 	q.LOS,
-- 	NULL as Rate,
-- 	NULL as RateDesc,
-- 	NULL AS ErrorCode,
-- 	NULL as CurrencyCode,
-- 	NULL as TimeInserted,
-- 	r.RateType 
-- 
-- FROM 	TFX_V2_Queue q,
-- 	--TFX_V2_UnfilteredRates u,
-- 	#RATETYPE r
-- WHERE	q.sessionID = @SessionID
-- --and     u.RequestID = q.RequestID
-- --AND	u.HotelID = q.HotelID
-- --AND	u.SiteID = q.SiteID
-- 
-- --SELECT * FROM #RESULTS
-- --get some data to play with, rateType should be multiple
-- 
-- Select 
-- 	u.RequestID,
-- 	u.HotelID,
-- 	u.SiteID,
-- 	u.ArrivalDate,
-- 	u.LOS,
-- 	u.Rate,
-- 	u.RateDesc,
-- 	u.ErrorCode,
-- 	u.CurrencyCode,
-- 	u.TimeInserted,
-- 	NULL AS RATETYPE 
-- INTO 	#RAWRATES 
-- from 	TFX_V2_UnfilteredRates u,
-- 	TFX_V2_Queue q 
-- Where 	q.sessionID = @SessionID
-- and 	u.RequestID = q.RequestID
-- AND	u.HotelID = q.HotelID
-- AND	u.SiteID = q.SiteID
-- 
-- -- Update all rates to correct ISO Code
-- UPDATE	r
-- SET	r.CurrencyCode = c.CurrencyCode
-- FROM	#RAWRATES r, TFX_CurrencyTranslations c
-- WHERE	r.SiteID = c.SiteID
-- AND	 RTRIM(LTRIM(r.CurrencyCode)) = RTRIM(LTRIM(c.Word))	
-- 
-- 
-- --SELECT SiteID, HotelID, '*' + CurrencyCode + '*'  FROM #RAWRATES --<<<< DEBUG!!!
-- 
-- -- Assume USD where the currency = XXX
-- -- Because 'XXX as curr-code is only used
-- -- when search is error or sold out in which
-- -- case the rate = 0 anyway!
-- UPDATE	#RAWRATES
-- SET 	CurrencyCode = 'USD'
-- WHERE	CurrencyCode = 'XXX'
-- 
-- --SELECT top 100 * FROM #RESULTS --DEBUG
-- 
-- -- Convert everything to USD
-- -- This should be step 1 in a 2 step conversion
-- -- for now we are going to end here because
-- -- as of yet we have no way of knowing which
-- -- currency a customer wants their report in
-- UPDATE	r
-- SET	r.Rate = (r.Rate * e.ExchangeRate),
-- 	r.CurrencyCode = 'USD'
-- FROM	#RAWRATES r,
-- 	TFX_CurrencyExchange e
-- WHERE	r.CurrencyCode = e.CurrencyCode
-- AND 	r.ErrorCode in ('SUCC_RTE', 'SOLD_OUT')
-- 
-- 
-- --SELECT top 100 * FROM #RAWRATES where ErrorCode <> 'EMSG_MI1' --DEBUG
-- 
-- -- Step 2 in currency conversion...
-- -- Translate from USD back to a foreign
-- -- curr. To do this we need to derive the 
-- -- CustomerID so we can look this up in the
-- -- We have the SessionID, which we can use to
-- -- Look up the contact ID in the TFX_FlashLog
-- -- With the ontactID we can check what the 
-- -- customerID is and then go into the spree
-- -- (for now we are going into:
-- -- tfx_V2_L_ContactShoppingCurrencies)
-- UPDATE	r
-- SET	r.Rate = (r.Rate / e.ExchangeRate),
-- 	r.CurrencyCode = lc.CurrencyCode
-- FROM	#RAWRATES r,
-- 	TFX_CurrencyExchange e,
-- 	TFX_FlashLog fl,
-- 	TFX_V2_L_ContactShoppingCurrencies lc
-- WHERE	fl.SessionID = @sessionID
-- AND	lc.ContactID = fl.ContactID
-- AND	e.CurrencyCode = lc.CurrencyCode
-- AND 	r.ErrorCode in ('SUCC_RTE', 'SOLD_OUT')
-- 
-- --SELECT top 100 * FROM #RAWRATES where ErrorCode <> 'EMSG_MI1' --DEBUG
-- 
-- 
-- --SELECT * FROM #RAWRATES
-- --RETURN 
-- -- IN order to supply custom dictionaries to Flash, we need to look up the ContactID
-- -------------------------------------------
-- --Apply Dictionary to the rates in #RESULTS
-- -------------------------------------------
-- DECLARE @Lexicon int
-- 
-- SELECT @Lexicon = PreferenceValue
-- from TFX_CustomerPreferences p, TFX_FlashLog f
-- Where f.SessionID = @SessionID
-- and DateDiff(d, Rundate, GetDate()) = 0
-- and p.ContactID = f.ContactID
-- and p.PreferenceRoleID = 6
-- 
-- IF @Lexicon IS NULL
-- Begin
-- 
-- 	IF @RateProfile = 'ALL'
-- 	BEGIN
-- 		Set @Lexicon = 1
-- 	END
-- 	IF @RateProfile = 'CORP'
-- 	BEGIN
-- 		Set @Lexicon = 5
-- 	END
-- 	IF @RateProfile = 'ADV'
-- 	BEGIN
-- 		Set @Lexicon = 17
-- 	END
-- 	IF @RateProfile = 'RESTRICTED'
-- 	BEGIN
-- 		Set @Lexicon = 33
-- 	END
-- 
-- END
-- 
-- 
-- IF @Lexicon IS NULL
-- BEGIN
-- 	SET @Lexicon = 1
-- END
-- 
-- UPDATE 	r
-- 	SET 	RateType  = ll.RateTypeID 
-- 	FROM	TFX_V2_Lexicon l,
-- 		TFX_V2_L_LexiconRateTypes ll,
-- 		#RAWRATES r
-- 	WHERE 	r.RateDesc LIKE '%' + l.Word + '%'
-- 		AND l.wordid = ll.wordid
-- 		AND ll.RateTypeID <> 0
-- 		AND ll.LexiconID = @Lexicon --1
-- 
-- 
-- 
-- UPDATE 	#RAWRATES
-- 	SET RateType = 1
-- 	WHERE RateType IS NULL
-- 
-- --Drop rates other than type 1
-- --DELETE #RAWRATES WHERE RateType <> 1 AND ErrorCode <> 'EMSG_MI1'
-- 
-- --Dump 'errors' where there is a good rate
-- DELETE 	r1
-- FROM 	#RAWRATES r1
-- WHERE	r1.ErrorCode <> 'SUCC_RTE'
-- 	AND EXISTS (
-- 		SELECT * FROM #RAWRATES r2
-- 		WHERE 	r1.ArrivalDate = r2.ArrivalDate
-- 			AND r1.HotelID = r2.HotelID
-- 			AND r1.SiteID = r2.SiteID
-- 			AND r1.LOS = r2.LOS
-- 			AND r2.ErrorCode = 'SUCC_RTE'
-- 	)
-- 
-- --SELECT HotelID, SiteID, RateType, rate, RateDesc, ArrivalDate, errorCode FROM #RAWRATES ORDER BY HotelID, SiteID, ArrivalDate
-- 
-- --Flag higher rates
-- UPDATE r1
-- SET	RateType = 999
-- FROM	#RAWRATES r1, #RAWRATES r2
-- WHERE	r1.ArrivalDate = r2.ArrivalDate
-- 	AND r1.HotelID = r2.HotelID
-- 	AND r1.SiteID = r2.SiteID
-- 	AND r1.LOS = r2.LOS
-- 	AND r1.RateType = r2.RateType --ling
-- 	AND r2.Rate < r1.Rate
-- 
-- --DELETE #RAWRATES WHERE RateType = 999
-- 
-- --Dump rates where rates are the same but description is different
-- UPDATE r1
-- SET	RateType = 999
-- FROM	#RAWRATES r1, #RAWRATES r2
-- WHERE	r1.ArrivalDate = r2.ArrivalDate
-- 	AND r1.HotelID = r2.HotelID
-- 	AND r1.SiteID = r2.SiteID
-- 	AND r1.LOS = r2.LOS
-- 	AND r2.Rate = r1.Rate
-- 	AND r1.RateType = r2.RateType	
-- 	AND r2.RateDesc < r1.RateDesc
-- 
-- DELETE #RAWRATES WHERE RateType = 999
-- 
-- --SELECT * FROM #RAWRATES ORDER By HotelID, SiteID, ArrivalDate
-- -- Update #RESULTS
-- Update r
-- Set 	
-- 	r.Rate = e.Rate,
-- 	r.RateDesc = e.RateDesc,	
-- 	r.ErrorCode = e.ErrorCode,
-- 	r.CurrencyCode = e.CurrencyCode,
-- 	r.TimeInserted = e.TimeInserted
-- FROM 	#RESULTS  r,
--      	#RAWRATES e,
-- 	#RATETYPE t
-- Where r.HotelID = e.HotelID 
-- and  r.SiteID = e.SiteID
-- and  r.ArrivalDate= e.ArrivalDate
-- and  r.LOS = e.LOS
-- and  e.RateType = t.RateTypeID
-- and  r.RateType = t.RateType  
--     
-- --Fill in for missing Rate, RateDesc, ErrorCode, CurrencyCode, TimeInsertedUpdate
-- UPDATE r1 
-- SET 	r1.Rate = 0,
-- 	r1.RateDesc =  'No rates found - Most likely sold out',	
-- 	r1.ErrorCode = 'SOLD_OUT',
-- 	r1.CurrencyCode = r2.CurrencyCode,
-- 	r1.TimeInserted = r2.TimeInserted
-- FROM	#RESULTS  r1, #RESULTS  r2
-- WHERE 	r1.HotelID = r2.HotelID 
-- and  r1.SiteID = r2.SiteID
-- and  r1.ArrivalDate= r2.ArrivalDate
-- and  r1.LOS = r2.LOS
-- and  r1.RateType <> r2.RateType
-- and  r1.Rate is NULL
-- and  r2.Rate >= 0
-- 
-- UPDATE r1 
-- SET 	r1.Rate = r2.Rate,
-- 	r1.RateDesc = r2.RateDesc,	
-- 	r1.ErrorCode = r2.ErrorCode,
-- 	r1.CurrencyCode = r2.CurrencyCode,
-- 	r1.TimeInserted = r2.TimeInserted
-- FROM	#RESULTS  r1, #RESULTS  r2
-- WHERE 	r1.HotelID = r2.HotelID 
-- and  r1.SiteID = r2.SiteID
-- and  r1.ArrivalDate= r2.ArrivalDate
-- and  r1.LOS = r2.LOS
-- and  r1.RateType <> r2.RateType
-- and  r1.Rate is NULL
-- and  r2.Rate = -1 
-- 
-- UPDATE r1 
-- SET 	r1.Rate = -9,
-- 	r1.RateDesc = 'INTERNET CONNECTION FAILURE',	
-- 	r1.ErrorCode = 'EMSG_UNK'
-- 	
-- FROM	#RESULTS  r1
-- WHERE 	r1.Rate is NULL
-- 
-- --SELECT * FROM #RESULTS ORDER BY HotelID, SiteID, ArrivalDate 
-- --RETURN
-- 
-- 
-- --table to hold the extract data for the report
-- CREATE	TABLE #EXTRACT (
-- 	Hotel 		varchar(300) NULL,
-- 	Site 		varchar(200) NULL,
-- 	ArrivalDate 	datetime NULL,
-- 	LOS		int NULL,
-- 	RateType	varchar(10) NULL,
-- 	Rate		money NULL,
-- 	RateDesc	varchar(2000) NULL,
-- 	ErrorCodeID	varchar(8),
-- 	IsHost		bit NULL,
-- 	RateDiff	varchar(10) NULL,
-- 	Stars		numeric(18,2) NULL,	
-- 	Rooms		int NULL,
-- 	DistanceFromHost	numeric(18,2) NULL, 
-- 	TripAdvisorRating	numeric(18,2) NULL 
-- 			
-- )
-- 
-- --get the rates
-- --Distinct gets rid of the exact duplicates
-- INSERT #EXTRACT (
-- 	Hotel, 
-- 	Site, 	
-- 	ArrivalDate,
-- 	LOS,
--  	RateType, 
-- 	Rate, 
-- 	RateDesc,	
-- 	ErrorCodeID, 
-- 	IsHost, 
-- 	RateDiff,
-- 	Stars,	
-- 	Rooms,
-- 	DistanceFromHost, 
-- 	TripAdvisorRating
-- 	
-- )
-- SELECT DISTINCT 
-- 	HOTELID, 
-- 	SiteID,   
-- 	ArrivalDate, 
-- 	LOS,
-- 	RateType,
-- 	Rate,
-- 	RateDesc,
-- 	ErrorCode,
-- 	0,
-- 	0,
-- 	0,
-- 	0,
-- 	0,
-- 	0
-- FROM 	#RESULTS
-- 
-- --SELECT * FROM #EXTRACT ORDER BY Hotel, Site, ArrivalDate
-- 
-- Update 	e 
-- SET	e.Stars = c.Stars,    	
-- 	e.Rooms = c.Rooms,
-- 	e.DistanceFromHost = c.DistanceFromHost,
-- 	e.TripAdvisorRating = c.TripAdvisorRating
-- FROM 	#EXTRACT e,
-- 	--#RESULTS r, 
-- 	TFX_CompSetProfiles c
-- where	e.Hotel = c.HOTELID
-- and	c.CustomerID = @CustomerID
-- --SELECT * FROM #EXTRACT ORDER BY Hotel, Site, ArrivalDate
-- 
-- --SELECT * FROM #EXTRACT where Rate = -9 and  RateDesc = 'No Results' ORDER BY Hotel, Site, ArrivalDate
-- --Set host flag
-- DECLARE @HostHotelID int
-- 
-- SELECT @HostHotelID = (SELECT HostHotelID 
-- 	FROM TFX_Customers 
-- 	WHERE CustomerID = @CustomerID
-- )
-- 
-- UPDATE 	#EXTRACT
-- 	SET IsHost = 1
-- 	WHERE Hotel = @HostHotelID
-- 
-- --Set RateDiff = H where higher than host
-- UPDATE 	e2
-- SET 	RateDiff = 'Higher'
-- FROM	#EXTRACT e1,
-- 	#EXTRACT e2 
-- WHERE	e1.ArrivalDate = e2.ArrivalDate
-- AND	e1.Site = e2.Site
-- AND	e1.LOS = e2.LOS
-- AND	e1.RateType = e2.RateType
-- AND	e1.Hotel = @HostHotelID
-- AND	e2.Hotel <> @HostHotelID
-- AND	e1.RateType = e2.RateType	
-- AND	e2.Rate > e1.Rate
-- 
-- --Set RateDiff = L where lower than host
-- UPDATE 	e2
-- SET 	RateDiff = 'Lower'
-- FROM	#EXTRACT e1,
-- 	#EXTRACT e2 
-- WHERE	e1.ArrivalDate = e2.ArrivalDate
-- AND	e1.Site = e2.Site
-- AND	e1.LOS = e2.LOS
-- AND	e1.RateType = e2.RateType
-- AND	e1.Hotel = @HostHotelID
-- AND	e2.Hotel <> @HostHotelID
-- AND	e1.RateType = e2.RateType	
-- AND	e2.Rate < e1.Rate
-- AND	e2.Rate > 0
-- 
-- 
-- 
-- --SELECT * FROM #EXTRACT ORDER BY Hotel, Site, ArrivalDate
-- 
-- -- Replace HotelID with HotelName
-- UPDATE	#EXTRACT
-- SET	Hotel = h.[Name]
-- FROM 	TFX_Hotels h
-- WHERE	#EXTRACT.Hotel = h.HotelID
-- 
-- -- UPDATE SITE NAMES
-- UPDATE	#EXTRACT
-- SET	Site = 
-- 		CASE
-- 		  WHEN IsBranded = 1 THEN 'BRANDED'
-- 		  ELSE REPLACE(s.SiteDesc, '+', '')
-- 		END
-- FROM	TFX_Sites s
-- WHERE	#EXTRACT.Site = s.SiteID
-- 
-- --SELECT * FROM #EXTRACT ORDER BY Hotel, Site, ArrivalDate
-- 
-- --Return the final extract
-- SELECT 	Hotel,
-- 	Site, 
-- 	ArrivalDate, 
-- 	LOS,  
-- 	Rate,
-- 	RateDiff,
-- 	RateType,
-- 	ErrorCodeID AS [Error],
-- 	RateDesc AS [Detail],
-- 	IsHost,
-- 	Left(DateName(dw, ArrivalDate),3) as DayOfWeek,
-- 	Stars,	
-- 	Rooms,
-- 	DistanceFromHost, 
-- 	TripAdvisorRating
-- 		
-- 
-- FROM 	#EXTRACT e
-- ORDER BY
-- 	IsHost,
-- 	Hotel,
-- 	Site, 
-- 	ArrivalDate,
-- 	LOS
-- 
-- 	DROP TABLE #RAWRATES
-- DROP TABLE #RATETYPE
-- DROP TABLE #EXTRACT
-- DROP TABLE #RESULTS
-- ;

-- ----------------------------------------------------------------------------
-- View cls.USP_V2_MakeClsSearch
-- ----------------------------------------------------------------------------
-- USE `cls`;
-- 
-- 
-- CREATE   OR REPLACE PROC [dbo].[USP_V2_MakeClsSearch]
-- 	@sessionID 	varchar(100),	--Flash sessionID
-- 	@HotelID	int,		--Property for search
-- 	@SearchSiteID	int,		--Website to search
-- 	@ArrivalDate	datetime,	--search start date
-- 	@LOS		int,		--Length of Stay
--     @Occupancy int
-- AS
-- 
-- 
-- ---------------------------------------------------------------------------------
-- --CREATED: 1.21.2016 JPR
-- --DESC:   Modifies usp_V2_MakeFlashSearchV2  
-- --	Takes parameters from FlashLight webpage and generates search entries
-- --	in tfx_V2_Queue to search one hotel one site.
-- ---------------------------------------------------------------------------------
-- 
-- SET NOCOUNT ON
-- SET DATEFIRST 1
-- 
-- declare @email varchar(50)
-- select @email = 'cls@fakeemail.com'
-- 
-- --Set Booleans
-- DECLARE @True		bit		--TRUE
-- DECLARE @False 		bit		--FALSE
-- 
-- SELECT @True = 1, @False = 0
-- 
-- CREATE TABLE #TEMP_Q (
-- HotelID		int		not null,
-- SiteID		int		not null,
-- ArrDate		smalldatetime	not null,
-- LOS		int		not null,
-- SessionID	varchar(100)	not null,
-- EmailAddress	varchar(50)	not null,
-- Occupancy int not null
-- )
-- 
-- 
-- 		INSERT #TEMP_Q VALUES(
-- 			@HotelID, @searchSiteID, @ArrivalDate, @LOS, @SessionID, @email, @Occupancy
-- 		)
-- 		
-- 
-- SELECT * FROM #TEMP_Q ORDER BY HotelID, SiteID	
-- 
-- BEGIN
-- 	
-- 	IF (
-- 		SELECT 	ParameterValue 
-- 		FROM 	TFX_SiteParameters 
-- 		WHERE 	HotelID = @HotelID 
-- 			AND SiteID = @SearchSiteID
-- 			AND ParameterRoleID = 5) = 'N/A'
-- 	BEGIN
-- 		--Insert the search request
-- 		INSERT TFX_V2_Queue ( 
-- 			HotelID, 
-- 			SiteID, 
-- 			ArrivalDate, 
-- 			LOS,
-- 			DictionaryID,
-- 			RoomTypeID, 
-- 			NumOfGuest,
-- 			SearchProductID,
-- 			SearchEngineID,
-- 			SearchStartDate,
-- 			SearchStopDate,
-- 			RetryCount,
-- 			MaxRetries,
-- 			ErrorCode,
-- 			SessionID,
-- 			MachineName,
-- 			EmailAddress,
-- 			ProxyUsed,
-- 			InProgress 
-- 		) VALUES (
-- 			@HotelID,
-- 			@SearchSiteID,
-- 			@ArrivalDate,
-- 			@LOS,
-- 			1,
-- 			1,
-- 			@Occupancy,
-- 			1,
-- 			1,
-- 			GETDATE(),
-- 			GETDATE(),
-- 			0,
-- 			1,
-- 			'EMSG_MI1',
-- 			@SessionID,
-- 			NULL,
-- 			@email,
-- 			NULL,
-- 			0
-- 		)
-- 		--Insert the search Result
-- 		INSERT TFX_V2_UnfilteredRates (
-- 			RequestID,
-- 			HotelID,
-- 			SiteID,
-- 			ArrivalDate,
-- 			LOS,
-- 			Rate,
-- 			RateDesc,
-- 			ErrorCode,
-- 			CurrencyCode,
-- 			TimeInserted 
-- 		 ) VALUES (
-- 			@@IDENTITY,
-- 			@HotelID,
-- 			@SearchSiteID,
-- 			@ArrivalDate,
-- 			@LOS,
-- 			-1,
-- 			'Not Available',
-- 			'EMSG_MI1',
-- 			NULL,
-- 			GETDATE()
-- 		)
-- 		
-- 	END ELSE BEGIN
-- 
-- 		INSERT TFX_V2_Queue ( 
-- 			HotelID, 
-- 			SiteID, 
-- 			ArrivalDate, 
-- 			LOS,
-- 			DictionaryID,
-- 			RoomTypeID, 
-- 			NumOfGuest,
-- 			SearchProductID,
-- 			SearchEngineID,
-- 			SearchStartDate,
-- 			SearchStopDate,
-- 			RetryCount,
-- 			MaxRetries,
-- 			ErrorCode,
-- 			SessionID,
-- 			MachineName,
-- 			EmailAddress,
-- 			ProxyUsed,
-- 			InProgress )
-- 		SELECT
-- 			@HotelID,
-- 			@SearchSiteID,
-- 			@ArrivalDate,
-- 			@LOS,
-- 			1,
-- 			1,
-- 			@Occupancy,
-- 			1,
-- 			1,
-- 			NULL,
-- 			NULL,
-- 			0,
-- 			2,
-- 			NULL,
-- 			@SessionID,
-- 			NULL,
-- 			@email,
-- 			NULL,
-- 			0
-- 	END
-- 
-- END
-- 
-- DROP TABLE #TEMP_Q
-- 
-- RETURN
-- 
-- 
-- ;

-- ----------------------------------------------------------------------------
-- View cls.usp_V2_GetSingleSearchRequest
-- ----------------------------------------------------------------------------
-- USE `cls`;
-- 
-- CREATE	 OR REPLACE PROC [dbo].[usp_V2_GetSingleSearchRequest]
-- 	@RequestQID int,
-- 	@MachineName VarChar(15)
-- 
-- AS
-- 
-- --DECLARE @SKOOSH_MACHINE0 varchar(20)
-- --DECLARE @SKOOSH_MACHINE1 varchar(20)
-- --DECLARE @SKOOSH_MACHINE2 varchar(20)
-- --DECLARE @SKOOSH_MACHINE3 varchar(20)
-- --DECLARE @SKOOSH_MACHINE4 varchar(20)
-- --DECLARE @SKOOSH_MACHINE5 varchar(20)
-- --DECLARE @SKOOSH_MACHINE6 varchar(20)
-- --DECLARE @SKOOSH_MACHINE7 varchar(20)
-- --DECLARE @SKOOSH_MACHINE8 varchar(20)
-- --DECLARE @SKOOSH_MACHINE9 varchar(20)
-- 
-- --SET  @SKOOSH_MACHINE0 = 'mgkelly01'
-- --SET  @SKOOSH_MACHINE1 = 'mgkelly04'
-- --SET  @SKOOSH_MACHINE2 = 'mgkelly08'
-- --SET  @SKOOSH_MACHINE3 = 'search12'
-- --SET  @SKOOSH_MACHINE4 = 'beale05'
-- --SET  @SKOOSH_MACHINE5 = 'beale02'
-- --SET  @SKOOSH_MACHINE6 = 'beale08'
-- --SET  @SKOOSH_MACHINE7 = 'mrhandy02'
-- --SET  @SKOOSH_MACHINE8 = 'mrhandy04'
-- --SET  @SKOOSH_MACHINE9 = 'ls2'
-- 
-- --DECLARE @SITEID int
-- 
-- --SELECT @SITEID = SiteID FROM TFX_V2_Queue WHERE RequestID = @RequestQID
-- --IF @SiteID = 1263 AND @MachineName NOT IN (@SKOOSH_MACHINE0,@SKOOSH_MACHINE1,@SKOOSH_MACHINE2,@SKOOSH_MACHINE3)
-- 
-- --BEGIN
-- 	--print @siteid
-- 	--print @machinename
-- 	--SELECT * FROM TFX_V2_Queue WHERE 1=2
-- 	--Set @RequestQID = 0
-- --END
-- 
-- 
-- SET NOCOUNT ON
--  
-- --BEGIN TRAN
-- 
-- UPDATE	tfx_V2_Queue
-- Set	SearchStartDate = GetDate(),
-- 	InProgress = 1,
-- 	MachineName = @MachineName
-- WHERE	RequestID = @RequestQID
-- 
-- --COMMIT TRAN
-- 
-- SELECT
-- 	q.RequestID,
-- 	q.HotelID,
-- 	q.SiteID,
--     --q.ArrivalDate,
-- 	CONVERT(VARCHAR(10),q.ArrivalDate,101),
-- 	q.LOS,
-- 	q.DictionaryID,
-- 	q.RoomTypeID,
-- 	q.NumOfGuest,
-- 	q.SearchProductID,
-- 	q.SearchEngineID,
-- 	q.SearchStartDate,
-- 	q.SearchStopDate,
-- 	q.RetryCount,
-- 	q.MaxRetries,
-- 	q.ErrorCode,
-- 	q.SessionID,
-- 	q.MachineName,
-- 	q.EmailAddress,
-- 	q.ProxyUsed,
-- 	q.InProgress,  
-- 	e.ScriptEngineExt,
-- 	e.ScriptEngineApp,
-- 	t.TimeOut
-- FROM	tfx_V2_Queue q,
-- 	tfx_V2_ScriptEngines e,
-- 	tfx_v2_SiteTimeOuts t WITH (NOLOCK)
-- WHERE	RequestID = @RequestQID
-- AND	e.ScriptEngineID = q.SearchEngineID
-- AND	t.SiteID = q.SiteID
-- 
-- --COMMIT TRAN
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- ;

-- ----------------------------------------------------------------------------
-- View cls.usp_FlashLightStatusCheck
-- ----------------------------------------------------------------------------
-- USE `cls`;
-- 
-- CREATE    OR REPLACE PROC usp_FlashLightStatusCheck
-- 	@SessionID	varchar(100)
-- 
-- AS
-- 
-- SET NOCOUNT ON
-- ---------------------------------------------------------------------
-- --CHANGED: 8.21.04 BMC
-- --DESC:	   Sold outs and N/As shouldn't be counted as errors
-- ---------------------------------------------------------------------
-- --CREATED: 8.16.04 BMC
-- --DESC:	Reports the status of the Flash Lite search for the sessionID
-- --	called by the Flash Lite Web application to update the search
-- --	status screen and to check for completion.
-- ---------------------------------------------------------------------
-- 
-- DECLARE @Complete	int	--Completed Searches
-- DECLARE @Error		int	--Complete Searches with errors
-- DECLARE @Incomplete	int	--Incomplete Searches
-- DECLARE @Total		int	--Total Searches
-- DECLARE @done		bit	--Is the search complete?
-- DECLARE @Started	Datetime	--Search Start time
-- DECLARE @Now		Datetime	--now
-- DECLARE @SesID		VarChar(100)
-- 
-- SET @Complete = 0
-- SET @Error = 0
-- SET @Incomplete = 0
-- SET @Total = 0
-- SET @Done = 0
-- SET @Now = GETDATE()
-- 
-- INSERT TFX_FlashLogExtended (SessionID, StatusMessage, LogTime)
-- VALUES (@SessionID, 'usp_FlashLightStatusCheck Started', GetDate())
-- 
-- 
-- -- Check if session ID is in TFX_FlashJobStatus
-- SELECT @SesID = (SELECT SessionID FROM TFX_FlashJobStatus Where SessionID = @SessionID)
-- --print @SesID 
-- --print @SessionID
-- 
-- 
-- --Get oldest search
-- SELECT @Started = (SELECT MIN(RunStartDate) FROM tfx_SearchRequestQ WHERE SessionID = @SessionID)
-- 
-- --Set Total Searches
-- SELECT @Total = (SELECT COUNT(*) FROM TFX_V2_Queue WHERE SessionID = @SessionID)
-- 
-- --Set Complete Searches
-- SELECT @Complete = (
-- 	SELECT COUNT(*) 
-- 	FROM TFX_V2_Queue 
-- 	WHERE SearchStopDate IS NOT NULL
-- 	AND SessionID = @SessionID)
-- 
-- --Set Incomplete Searches
-- SELECT @Incomplete = (
-- 	SELECT COUNT(*)
-- 	FROM TFX_V2_Queue
-- 	WHERE SearchStartDate IS NOT NULL
-- 	AND SearchStopDate IS NULL
-- 	AND SessionID = @SessionID)
-- 
-- --Set Error Searches
-- SELECT @Error = (
-- 	SELECT COUNT(*) 
-- 	FROM TFX_V2_Queue 
-- 	WHERE ErrorCode NOT IN ('SUCC_RTE', 'SOLD_OUT', 'EMSG_MI1')
-- 	AND SearchStopDate IS NOT NULL
-- 	AND SessionID = @SessionID)
-- 
-- IF @Complete = @Total BEGIN
-- 	SET @Done = 1
-- END
-- 
-- 
-- -- INSERT NEW STATUS ROW
-- IF @SesID IS NULL
-- BEGIN
-- 	INSERT TFX_FlashJobStatus (SESSIONID, StartDate, JobSize)
-- 	VALUES (@SessionID, GetDate(), @Total)
-- 	INSERT TFX_FlashLogExtended (SessionID, StatusMessage, LogTime)
-- 	VALUES (@SessionID, 'First Status Check', GetDate())
-- END 
-- 
-- -- UPDATE STATUS IF JOB IS DONE
-- IF @Done = 1
-- BEGIN
-- 	UPDATE TFX_FlashJobStatus SET Status = 'C' WHERE SessionID = @SessionID
-- 	INSERT TFX_FlashLogExtended (SessionID, StatusMessage, LogTime)
-- 	VALUES (@SessionID, 'Job finished with status code: C', GetDate())
-- END
-- 
-- --UPDATE END TIME OF JOB
-- UPDATE TFX_FlashJobStatus Set EndDate = GetDate() WHERE SessionID = @SessionID
-- 
-- --The second parameter is the timeout in minutes
-- --IF DATEADD(mi, 20, @Started) < @Now BEGIN
-- --	SET @Done = 1
-- --END
-- 
-- INSERT TFX_FlashLogExtended (SessionID, StatusMessage, LogTime)
-- VALUES (@SessionID, 'usp_FlashLightStatusCheck Finished', GetDate())
-- 
-- SELECT 	@Total AS [Total],
-- 	@Error AS [Error],
-- 	@Complete AS [Complete],
-- 	@Incomplete AS [Incomplete],
-- 	@Done AS [Done]
-- 
-- RETURN
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- ;
SET FOREIGN_KEY_CHECKS = 1;;
