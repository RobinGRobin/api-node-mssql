USE AdventureWorks2019_Sales
GO
CREATE PROCEDURE InsertOrderDetail(@_ClientID INT, @_SalesPersonID INT, @_TerritoryID INT, @_AddressID INT, @_CreditCardID INT, @_SubTotal MONEY, @_Qty INT)
AS
BEGIN
/*	DECLARE @_SalesPersonID INT, @_TerritoryID INT, @_AddressID INT, @_CreditCardID INT, @_SubTotal MONEY
	SET @_SalesPersonID = SELECT PersonID FROM Sales.Customer WHERE CustomerID = @_ClientID
	SET @_TerritoryID = SELECT TerritoryID FROM Sales.Customer WHERE CustomerID = @_ClientID
	SET @_AddressID = SELECT AddressID FROM SREMOTO1.AdventureWorks2019.Person.PersonBussinessEntityAddress WHERE BussinessEntityID = @_SalesPersonID
	SET @_CreditCardID = SELECT CreditCardID FROM Sales.PersonCreditCard WHERE BussinessEntityID = @_SalesPersonID
	SET @_SubTotal = SELECT * FROM OPENQUERY(MYSQL,'SELECT ListPrice FROM adventureworks2019.product WHERE productid = '+@_ProductID+'') */
	INSERT INTO Sales.SalesOrderHeader (	RevisionNumber,			-- 1 		
											OrderDate,				-- 2	
											DueDate,				-- 3 
											ShipDate,				-- 4
											Status,					-- 5
											OnlineOrderFlag,		-- 6 
											PurchaseOrderNumber,	-- 7
											AccountNumber,			-- 8 NULL	
											CustomerID,				-- 9
											SalesPersonID,			-- 10 GET ON A CONSULT TO SALES.CUSTOMER
											TerritoryID,			-- 11 GET ON A CONSULT TO SALES.CUSTOMER
											BillToAddressID,		-- 12 GET ON A CONSULT TO PERSON.ADDRESS WITH PERSONID FROM SALES.CUSTOMER -> BUSINESSENTITYID
											ShipToAddressID,		-- 13 SAME AS BEFORE
											ShipMethodID,			-- 14 
											CreditCardID,			-- 15 GET FROM BUSINESS ENTITY COLUMN IN SALES.PERSONCREDITCARD
											CreditCardApprovalCode,	-- 16 NULL	
											CurrencyRateID,			-- 17 null
											SubTotal,				-- 18 GET FROM A CONSULT IN PRODUCTION AND MULTIPLY IT BY THE AMOUNT
											TaxAmt,					-- 19 CALCULAR AL 10%
											Freight,				-- 20 0.00
											Comment,				-- 21			
											rowguid,				-- 22	
											ModifiedDate)			-- 23
	VALUES (8,								-- 1 RevisionNumber
			GETDATE(),						-- 2 OrderDate
			DATEADD(DAY, 12, GETDATE()),	-- 3 DueDate
			DATEADD(DAY, 7, GETDATE()),		-- 4 ShipDate
			5,								-- 5 Status
			1,								-- 6 OnlineOrderFlag
			NULL,							-- 7 PurchaseOrderNumber 
			NULL,							-- 8 Account
			@_ClientID,						-- 9 CustomerID
			@_SalesPersonID,				-- 10 SalesPersonID
			@_TerritoryID,					-- 11 TerritoryID
			@_AddressID,					-- 12 BillToAddressID
			@_AddressID,					-- 13 ShipToAddressID
			1,								-- 14 ShipMethodID
			@_CreditCardID,					-- 15 CreditCardID
			NULL,							-- 16 CreditCardApprovalCode
			NULL,							-- 17 CurrencyRateID
			@_SubTotal*@_Qty,				-- 18 SubTotal
			@_SubTotal*@_Qty*0.1,			-- 19 TaxAmt
			0.00,							-- 20 Freigth
			NULL,							-- 21 Comment
			NEWID(),						-- 22 rowguid
			GETDATE())						-- 23 ModifiedDate
END
GO