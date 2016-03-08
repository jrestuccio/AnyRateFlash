
USE `trendfxrates`;
 
DELIMITER //

CREATE   PROCEDURE usp_FlashLightStatusCheck (
	v_SessionID	varchar(100))

BEGIN

DECLARE Complete	int;	-- Completed Searches
DECLARE Error		int;	-- Complete Searches with errors
DECLARE Incomplete	int;	-- Incomplete Searches
DECLARE Total		int;	-- Total Searches
DECLARE Done		bit;	-- Is the search complete?
DECLARE Started	Datetime(3);	-- Search Start time
DECLARE Now		Datetime(3);	-- now
DECLARE SesID		NVARCHAR(100);

SET Complete = 0;
SET Error = 0;
SET Incomplete = 0;
SET Total = 0;
SET Done = 0;
SET Now = NOW();

INSERT TFX_FlashLogExtended (v_SessionID, StatusMessage, LogTime)
SELECT (v_SessionID, 'usp_FlashLightStatusCheck Started', NOW());


-- Check if session ID is in TFX_FlashJobStatus
SELECT SesID = (SELECT SessionID FROM TFX_FlashJobStatus Where SessionID = v_SessionID);
-- Get oldest search
SELECT Started = (SELECT MIN(RunStartDate) FROM tfx_SearchRequestQ WHERE SessionID = SessionID);

-- Set Total Searches
SELECT Total = (SELECT COUNT(*) FROM TFX_V2_Queue WHERE SessionID = SessionID);

-- Set Complete Searches
SELECT Complete = (
	SELECT COUNT(*) 
	FROM TFX_V2_Queue 
	WHERE SearchStopDate IS NOT NULL
	AND SessionID = SessionID);

-- Set Incomplete Searches
SELECT Incomplete = (
	SELECT COUNT(*)
	FROM TFX_V2_Queue
	WHERE SearchStartDate IS NOT NULL
	AND SearchStopDate IS NULL
	AND SessionID = SessionID);

-- Set Error Searches
SELECT Error = (
	SELECT COUNT(*) 
	FROM TFX_V2_Queue 
	WHERE ErrorCode NOT IN ('SUCC_RTE', 'SOLD_OUT', 'EMSG_MI1')
	AND SearchStopDate IS NOT NULL
	AND SessionID = SessionID);

IF Complete = Total THEN
	SET Done = 1;
END IF;


-- INSERT NEW STATUS ROW
IF SesID IS NULL
THEN
	INSERT TFX_FlashJobStatus (SESSIONID, StartDate, JobSize)
	SELECT (SessionID, NOW(), Total);
	INSERT TFX_FlashLogExtended (SessionID, StatusMessage, LogTime)
	SELECT (v_SessionID, 'First Status Check', NOW());
END IF; 

-- UPDATE STATUS IF JOB IS DONE
IF Done = 1
THEN
	UPDATE TFX_FlashJobStatus SET Status = 'C' WHERE SessionID = v_SessionID;
	INSERT TFX_FlashLogExtended (SessionID, StatusMessage, LogTime)
	SELECT (SessionID, 'Job finished with status code: C', NOW());
END IF;

-- UPDATE END TIME OF JOB
UPDATE TFX_FlashJobStatus Set EndDate = NOW() WHERE SessionID = v_SessionID;

INSERT TFX_FlashLogExtended (SessionID, StatusMessage, LogTime)
SELECT (SessionID, 'usp_FlashLightStatusCheck Finished', NOW());

SELECT Total AS Total, Error AS Error, Complete AS Complete, Incomplete AS Incomplete, Done AS Done;

END;
//

DELIMITER ;



