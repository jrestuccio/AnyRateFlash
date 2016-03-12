DELIMITER $$
CREATE DEFINER=`scraper`@`192.168.1.1` PROCEDURE `usp_FlashLightStatusCheck`(
	p_SessionID	varchar(100))
BEGIN

DECLARE Complete	int;	-- Complete Sea... *** SQLINES FOR EVALUATION USE ONLY *** 
DECLARE Error		int;	-- Complete Sear... *** SQLINES FOR EVALUATION USE ONLY *** 
DECLARE Incomplete	int;	-- Incomplete Se... *** SQLINES FOR EVALUATION USE ONLY *** 
DECLARE Total		int;	-- Total Searche... *** SQLINES FOR EVALUATION USE ONLY *** 
DECLARE Done		tinyint;	-- Is the search... *** SQLINES FOR EVALUATION USE ONLY *** 
DECLARE Started	Datetime(3);	-- Search Start ... *** SQLINES FOR EVALUATION USE ONLY *** 
DECLARE Now		Datetime(3);	-- now
DECLARE SesID		VarChar(100);

SET Complete = 0;
SET Error = 0;
SET Incomplete = 0;
SET Total = 0;
SET Done = 0;
SET Now = NOW();

INSERT TFX_FlashLogExtended (SessionID, StatusMessage, LogTime)
SELECT (p_SessionID, 'usp_FlashLightStatusCheck Started', NOW());


-- Check if ses... *** SQLINES FOR EVALUATION USE ONLY *** 
SELECT SesID = (SELECT SessionID FROM TFX_FlashJobStatus Where SessionID = p_SessionID);
-- print @SesID 
-- print @Sessio... *** SQLINES FOR EVALUATION USE ONLY *** 


-- Get oldest se... *** SQLINES FOR EVALUATION USE ONLY *** 
SELECT Started = (SELECT MIN(RunStartDate) FROM TFX_SearchRequestQ WHERE SessionID = p_SessionID);

-- Set Total Sea... *** SQLINES FOR EVALUATION USE ONLY *** 
SELECT Total = (SELECT COUNT(*) FROM TFX_V2_Queue WHERE SessionID = p_SessionID);

-- Set Complete ... *** SQLINES FOR EVALUATION USE ONLY *** 
SELECT Complete = (
	SELECT COUNT(*) 
	FROM TFX_V2_Queue 
	WHERE SearchStopDate IS NOT NULL
	AND SessionID = p_SessionID);

-- Set Incomplet... *** SQLINES FOR EVALUATION USE ONLY *** 
SELECT Incomplete = (
	SELECT COUNT(*)
	FROM TFX_V2_Queue
	WHERE SearchStartDate IS NOT NULL
	AND SearchStopDate IS NULL
	AND SessionID = p_SessionID);

-- Set Error Sea... *** SQLINES FOR EVALUATION USE ONLY *** 
SELECT Error = (
	SELECT COUNT(*) 
	FROM TFX_V2_Queue 
	WHERE ErrorCode NOT IN ('SUCC_RTE', 'SOLD_OUT', 'EMSG_MI1')
	AND SearchStopDate IS NOT NULL
	AND SessionID = p_SessionID);

IF Complete = Total THEN
	SET Done = 1;
END IF;


-- INSERT NEW S... *** SQLINES FOR EVALUATION USE ONLY *** 
IF SesID IS NULL
THEN
	INSERT TFX_FlashJobStatus (SESSIONID, StartDate, JobSize)
	SELECT (p_SessionID, NOW(), Total);
	INSERT TFX_FlashLogExtended (SessionID, StatusMessage, LogTime)
	SELECT (p_SessionID, 'First Status Check', NOW());
END IF; 

-- UPDATE STATU... *** SQLINES FOR EVALUATION USE ONLY *** 
IF Done = 1
THEN
	UPDATE TFX_FlashJobStatus SET Status = 'C' WHERE SessionID = p_SessionID;
    
	INSERT TFX_FlashLogExtended (SessionID, StatusMessage, LogTime)
	SELECT (p_SessionID, 'Job finished with status code: C', NOW());
END IF;

-- UPDATE END TI... *** SQLINES FOR EVALUATION USE ONLY *** 
UPDATE TFX_FlashJobStatus Set EndDate = NOW() WHERE SessionID = p_SessionID;

INSERT TFX_FlashLogExtended (SessionID, StatusMessage, LogTime)
SELECT (p_SessionID, 'usp_FlashLightStatusCheck Finished', NOW());

SELECT 	Total, Error , Complete , Incomplete , Done ;


END$$
DELIMITER ;




