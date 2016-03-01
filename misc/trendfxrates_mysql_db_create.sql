USE `trendfxrates`
;


/****** Object:  Table `TFX_CorporateCustomers`    Script Date: 1/21/2016 1:38:10 AM ******/
CREATE TABLE `TFX_CorporateCustomers`(
	`C_CustomerID` int AUTO_INCREMENT NOT NULL,
	`C_LoginCode` varchar(15) NULL,
	`C_CustomerChainID` int NULL,
	`C_CustomerName` varchar(300) NULL,
	`Address1` varchar(300) NULL,
	`Address2` varchar(300) NULL,
	`City` varchar(100) NULL,
	`State` varchar(2) NULL,
	`Zip` varchar(10) NULL,
	`Phone` varchar(30) NULL,
 PRIMARY KEY(C_CustomerID),
	INDEX cus_id (C_CustomerID)
) ENGINE=INNODB
;

/****** Object:  Table `TFX_Customers`    Script Date: 1/21/2016 12:56:48 AM ******/
CREATE TABLE `TFX_Customers`(
	`CustomerID` int AUTO_INCREMENT NOT NULL,
	`LoginCode` varchar(15) NULL,
	`CustomerChainID` int NULL,
	`CustomerName` varchar(300) NULL,
	`CustomerSiteID` int NULL,
	`Address1` varchar(300) NULL,
	`Address2` varchar(300) NULL,
	`City` varchar(100) NULL,
	`State` varchar(2) NULL,
	`Zip` varchar(10) NULL,
	`Phone` varchar(30) NULL,
	`HostHotelID` int NULL,
	`C_CustomerID` int NULL,
	`CountryCode` varchar(2) NULL,
	PRIMARY KEY (CustomerID),
	INDEX cus_id (CustomerID)
)ENGINE=INNODB
;

/****** Object:  Table `TFX_Contacts`    Script Date: 1/21/2016 12:58:08 AM ******/

CREATE TABLE `TFX_Contacts`(
	`ContactID` int AUTO_INCREMENT NOT NULL,
	`FirstName` varchar(100) NOT NULL,
	`LastName` varchar(100) NOT NULL,
	`EMail` varchar(100) NOT NULL,
	`UserID` varchar(100) NOT NULL,
	`Password` varchar(20) NOT NULL,
	`Phone` varchar(30) NULL,
	`Ext` varchar(10) NULL,
	`Expires` datetime NOT NULL,
	PRIMARY KEY (ContactID)
)ENGINE=INNODB
;

/****** Object:  Table `TFX_HotelChains`    Script Date: 1/21/2016 1:42:43 AM ******/
CREATE TABLE `TFX_HotelChains`(
	`HotelChainID` int AUTO_INCREMENT NOT NULL,
	`ChainShortName` varchar(5) NOT NULL,
	`ChainName` varchar(200) NOT NULL,
	`OwnedByID` int NULL,
	PRIMARY KEY (HotelChainID)
)ENGINE=INNODB
;


/****** Object:  Table `TFX_Hotels`    Script Date: 1/21/2016 1:13:35 AM ******/
CREATE TABLE `TFX_Hotels`(
	`HotelChainID` int NULL,
	`HotelID` int AUTO_INCREMENT NOT NULL,
	`SiteID` int NULL,
	`ShortName` varchar(7) NULL,
	`Name` varchar(200) NOT NULL,
	`Address` varchar(200) NULL,
	`Address2` varchar(200) NULL,
	`City` varchar(100) NOT NULL,
	`State` varchar(50) NOT NULL,
	`Zip` varchar(10) NULL,
	`Country` varchar(100) NOT NULL,
	`DateCreated` datetime NOT NULL,
	`Phone` varchar(30) NULL,
	PRIMARY KEY (HotelID)
)ENGINE=INNODB
;

ALTER TABLE `TFX_Hotels`
Add Foreign Key `FK_TFX_Hotels_TFX_HotelChains`(HotelChainID) References `TFX_HotelChains`(HotelChainID)
;


/****** Object:  Table `TFX_CustomerShoppingHotels`    Script Date: 1/21/2016 12:59:01 AM ******/
CREATE TABLE `TFX_CustomerShoppingHotels`(
	`CustomerID` int NOT NULL,
	`HotelID` int NOT NULL,
	INDEX (CustomerID), 
	INDEX (HotelID)
)ENGINE=INNODB
;

ALTER TABLE `TFX_CustomerShoppingHotels`
ADD FOREIGN KEY `FK_cusID` (CustomerID) REFERENCES `TFX_Customers`(CustomerID)
;

ALTER TABLE `TFX_CustomerShoppingHotels`
ADD FOREIGN KEY `FK_TFX_CustomerShoppingHotels_TFX_Hotels` (HotelID) REFERENCES `TFX_Hotels`(HotelID)
;


/****** Object:  Table `TFX_SiteParameterRoles`    Script Date: 1/21/2016 1:03:50 AM ******/
CREATE TABLE `TFX_SiteParameterRoles`(
	`SiteParameterRoleID` int NOT NULL,
	`RoleDesc` varchar(50) NOT NULL,
	PRIMARY KEY (SiteParameterRoleID),
	INDEX (SiteParameterRoleID)
)ENGINE=INNODB
;

/****** Object:  Table `TFX_SiteParameters`    Script Date: 1/21/2016 1:02:48 AM ******/
CREATE TABLE `TFX_SiteParameters`(
	`HotelID` int NOT NULL,
	`SiteID` int NOT NULL,
	`ParameterRoleID` int NOT NULL,
	`ParameterValue` varchar(300) NOT NULL,
	PRIMARY KEY (HotelID,SiteID,ParameterRoleID)
)ENGINE=INNODB
;


ALTER TABLE `TFX_SiteParameters`
ADD FOREIGN KEY `FK_TFX_SiteParameters_TFX_SiteParameterRoles`(ParameterRoleID) REFERENCES `TFX_SiteParameterRoles`(SiteParameterRoleID)
;

ALTER TABLE `TFX_SiteParameters` 
ADD FOREIGN KEY `FK_TFX_SiteParameters_TFX_Hotels` (HotelID) REFERENCES `TFX_Hotels`(HotelID)
;



/****** Object:  Table `TFX_Sites`    Script Date: 1/21/2016 1:08:01 AM ******/
CREATE TABLE `TFX_Sites`(
	`SiteID` int NOT NULL,
	`SiteDesc` varchar(300) NOT NULL,
	`IsBranded` boolean NOT NULL,
	`SearchTypeID` int NOT NULL,
	`HaveDetailedRates` boolean NULL,
	`IsAvailable` boolean NULL,
	`IsActive` boolean NULL,
 PRIMARY KEY (SiteID)
)ENGINE=INNODB
;


ALTER TABLE `TFX_SiteParameters` 
ADD FOREIGN KEY `FK_TFX_SiteParameters_TFX_Sites`(SiteID) REFERENCES `TFX_Sites`(SiteID)
;


/****** Object:  Table `TFX_CustomerShoppingSites`    Script Date: 1/21/2016 1:06:50 AM ******/
CREATE TABLE `TFX_CustomerShoppingSites`(
	`CustomerID` int NOT NULL,
	`SiteID` int NOT NULL,
	PRIMARY KEY (CustomerID,SiteID)
) ENGINE=INNODB
;

ALTER TABLE `TFX_CustomerShoppingSites`
ADD FOREIGN KEY `FK_TFX_CustomerShoppingSites_TFX_Customers`(CustomerID) REFERENCES `TFX_Customers`(CustomerID)
;

ALTER TABLE `TFX_CustomerShoppingSites`
ADD FOREIGN KEY `FK_TFX_CustomerShoppingSites_TFX_Sites`(SiteID) REFERENCES `TFX_Sites`(SiteID)
;


/****** Object:  Table `TFX_V2_SiteTimeOuts`    Script Date: 1/21/2016 1:09:53 AM ******/
CREATE TABLE `TFX_V2_SiteTimeOuts`(
	`SiteID` int NOT NULL,
	`TimeOut` int NOT NULL,
	PRIMARY KEY (SiteID)
) ENGINE=INNODB
;



/****** Object:  Table `tfx_V2_ErrorCodes`    Script Date: 1/21/2016 1:12:01 AM ******/
CREATE TABLE `TFX_V2_ErrorCodes`(
	`ErrorCode` varchar(8) NOT NULL,
	`ErrorCodeID` int NOT NULL,
	`ErrorDesc` varchar(500) NOT NULL,
	`ErrorSQL` varchar(1000) NOT NULL,
	PRIMARY KEY (ErrorCodeID)
)ENGINE=INNODB
;

/****** Object:  Table `tfx_V2_RateTypes`    Script Date: 1/21/2016 1:12:59 AM ******/
CREATE TABLE `TFX_V2_RateTypes`(
	`RateTypeID` int NOT NULL,
	`RateTypeDesc` varchar(50) NOT NULL,
	`RateTypeDescShort` varchar(10) NOT NULL,
	PRIMARY KEY (RateTypeID)
)ENGINE=INNODB
;



/****** Object:  Table `tfx_V2_Queue`    Script Date: 1/21/2016 2:40:39 AM ******/
CREATE TABLE `TFX_V2_Queue`(
	`RequestID` int AUTO_INCREMENT NOT NULL,
	`HotelID` int NOT NULL,
	`SiteID` int NOT NULL,
	`ArrivalDate` datetime NOT NULL,
	`LOS` int NOT NULL,
	`DictionaryID` int NULL,
	`RoomTypeID` int NULL,
	`NumOfGuest` int NULL,
	`SearchProductID` int NULL,
	`SearchEngineID` int NULL,
	`SearchStartDate` datetime NULL,
	`SearchStopDate` datetime NULL,
	`RetryCount` int NOT NULL,
	`MaxRetries` int NOT NULL,
	`ErrorCode` varchar(8) NULL,
	`SessionID` varchar(50) NOT NULL,
	`MachineName` varchar(50) NULL,
	`EmailAddress` varchar(100) NULL,
	`ProxyUsed` varchar(50) NULL,
	`InProgress` boolean NOT NULL,
	 PRIMARY KEY (RequestID,SessionID),
	INDEX (ArrivalDate),
	INDEX (RequestID,SessionID)
)ENGINE=INNODB
;

CREATE TABLE `TFX_V2_UnfilteredRates`(
	`RequestID` int NOT NULL,
	`HotelID` int NOT NULL,
	`SiteID` int NOT NULL,
	`ArrivalDate` datetime NOT NULL,
	`LOS` int NOT NULL,
	`Rate` decimal(12,2) NOT NULL,
	`RateDesc` varchar(1500) NULL,
	`ErrorCode` varchar(8) NOT NULL,
	`CurrencyCode` varchar(10) NULL,
	`TimeInserted` datetime NOT NULL,
	PRIMARY KEY (RequestID),	
	INDEX (SiteID, HotelID)
)ENGINE=INNODB
;

/****** Object:  Table `TFX_Proxies`    Script Date: 1/21/2016 3:43:01 AM ******/
CREATE TABLE `TFX_Proxies`(
	`Proxy` varchar(30) NOT NULL,
	`Port` int NOT NULL,
	`Expires` datetime NOT NULL,
	`ProxyGroup` int NOT NULL,
	PRIMARY KEY (`Proxy`,`Port`,Expires,ProxyGroup)
)ENGINE=INNODB
;


/****** Object:  Table `tfx_V2_ScriptEngines`    Script Date: 1/21/2016 3:47:51 AM ******/
CREATE TABLE `TFX_V2_ScriptEngines`(
	`ScriptEngineID` int AUTO_INCREMENT NOT NULL,
	`ScriptEngineDesc` varchar(200) NOT NULL,
	`ScriptEngineExt` varchar(5) NULL,
	`ScriptEngineApp` varchar(20) NULL,
	PRIMARY KEY (ScriptEngineID)
)ENGINE=INNODB
;

/****** Object:  Table `TFX_SearchRequestQ`    Script Date: 1/21/2016 4:20:16 AM ******/
CREATE TABLE `TFX_SearchRequestQ`(
	`RequestQID` int AUTO_INCREMENT NOT NULL,
	`HotelID` int NOT NULL,
	`SiteID` int NOT NULL,
	`ArrivalDate` datetime NOT NULL,
	`ArrivalDay` varchar(3) NULL,
	`LOS` int NOT NULL,
	`RateTypeID` int NOT NULL,
	`RoomTypeID` int NULL,
	`Guests` int NOT NULL,
	`RunStartDate` datetime NULL,
	`RunCompleteDate` datetime NULL,
	`RequestDate` datetime NOT NULL,
	`MachineName` varchar(50) NULL,
	`RetryCount` int NULL,
	`RetriesBeforeFail` int NULL,
	`ErrorCodeID` int NULL,
	`IsIncidental` tinyint NULL,
	`SessionID` varchar(100) NULL,
	`EmailAddress` varchar(50) NULL,
	`IsTestRun` tinyint NULL,
	`Activated` tinyint NULL,
	PRIMARY KEY (RequestQID)
)ENGINE=INNODB
;
