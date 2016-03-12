DELIMITER //

CREATE PROCEDURE usp_GetCustomersByEmail (
		p_Login	varchar(100))

BEGIN

SELECT DISTINCT
 	-- Direct Access from contactCustomers
 	c.CustomerID,
	c.CustomerName
FROM	TFX_customers c,
 	TFX_Contacts ct,
 	TFX_L_ContactCustomers lcc
WHERE	ct.userID = p_Login
	AND	ct.ContactID = lcc.ContactID
	AND	lcc.CustomerID = c.CustomerID

UNION
 
SELECT DISTINCT
 	-- Indirect Access from contactRegions
 	c.CustomerID,
	c.CustomerName
FROM	TFX_Customers c,
	TFX_Contacts ct,
 	TFX_L_ContactRegions lcr,
 	TFX_L_RegionCustomers lrc
WHERE	ct.userID = p_Login
 
	AND	lcr.ContactID = ct.ContactID
	AND	lcr.RegionID = lrc.RegionID
	AND	c.CustomerID = lrc.CustomerID
	 
ORDER BY CustomerName;


END;
//

DELIMITER ;





