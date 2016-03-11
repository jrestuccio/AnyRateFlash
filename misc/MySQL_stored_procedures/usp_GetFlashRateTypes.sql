DELIMITER $$
CREATE DEFINER=`scraper`@`192.168.1.1` PROCEDURE `usp_GetFlashRateTypes`()
BEGIN
    select RateTypeID, RateTypeDescShort from TFX_V2_RateTypes
	Where RateTypeDescShort in ('B/A', 'AAA', 'AARP', 'GOV', 'All Rate Types');
END$$
DELIMITER ;
