DELIMITER $$
CREATE DEFINER=`scraper`@`192.168.1.1` PROCEDURE `usp_GetFlashHotelsForCustomer`(
p_customerID	int
)
BEGIN
SELECT 
    h.Name, h.HotelID, h.SiteID
FROM
    TFX_CustomerShoppingHotels csh,
    TFX_Hotels h
WHERE
    csh.CustomerID = p_customerID
        AND csh.HotelID = h.HotelID;

END$$
DELIMITER ;
