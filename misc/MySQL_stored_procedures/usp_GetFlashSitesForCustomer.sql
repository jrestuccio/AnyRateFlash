DELIMITER $$
CREATE DEFINER=`scraper`@`192.168.1.1` PROCEDURE `usp_GetFlashSitesForCustomer`(
p_customerID int
)
BEGIN
SELECT DISTINCT s.SiteID,	s.SiteDesc,	s.IsBranded
FROM  	TFX_CustomerShoppingSites css, TFX_Sites s
WHERE  	css.CustomerID = p_customerID AND css.SiteID = s.SiteID AND s.SiteID <> 99
ORDER BY s.SiteDesc;

END$$
DELIMITER ;
