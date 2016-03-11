DELIMITER //

CREATE PROCEDURE usp_GetCustomersByEmail (
		p_Login	varchar(100))

BEGIN

SELECT DISTINCT
 	-- Direct Access from contactCustomers
 	c.CustomerID,
	c.CustomerName
FROM	tfx_customers c,
 	tfx_contacts ct,
 	tfx_l_contactcustomers lcc
WHERE	ct.userID = p_Login
	AND	ct.ContactID = lcc.ContactID
	AND	lcc.CustomerID = c.CustomerID

UNION
 
SELECT DISTINCT
 	-- Indirect Access from contactRegions
 	c.CustomerID,
	c.CustomerName
FROM	tfx_customers c,
	tfx_contacts ct,
 	tfx_l_contactregions lcr,
 	tfx_l_regioncustomers lrc
WHERE	ct.userID = p_Login
 
	AND	lcr.ContactID = ct.ContactID
	AND	lcr.RegionID = lrc.RegionID
	AND	c.CustomerID = lrc.CustomerID
	 
ORDER BY c.CustomerName;


END;
//

DELIMITER ;





