select * from AdventureWorks2019.Sales.SalesOrderDetail;
select * from AdventureWorks2019.Sales.SalesOrderHeader;


select * from AdventureWorks2019.Sales.Customer
select * from AdventureWorks2019.Sales.Customer where CustomerID = 29685
select * from AdventureWorks2019.Person.Person;
select * from AdventureWorks2019.Person.BusinessEntityAddress
select * from AdventureWorks2019.Person.Address;
select * from AdventureWorks2019.Sales.SalesPerson;
select * from AdventureWorks2019.Sales.PersonCreditCard;

-- 1. SalesOrderID es llave primaria e incrementable
-- 2. RevisionNumber tiene valor 8 para todos
-- 3. OrderDate fecha actual a las 12 horas
-- 4. DueDate son 12 dias después de OrderDate
-- 5. ShipDate es 7 días después de OrderDate
-- 6. Status tiene valor 5 para todos
-- 7. OnlineOrderFlag tiene valor 1 para todos
-- 8. SalesOrderNumber valor computed autoincrementable hasta ahora
-- 9. PurchaseOrderNumber puede ser NULL
-- 10. AccountNumber desde tabla customer
-- 11. CustomerID obtenido del formulario
-- 12. SalesPersonID puede ser NULL
-- 13. TerritoryID obtenido de la tabla customer
-- 14. BillToAddressID
-- 15. ShipToAddressID
-- 16. ShipMethodID
-- 17. CreditCardID
-- 18. CreditCardApprovalCode
-- 19. CurrencyRateID puede ser NULL
-- 20. SubTotal
-- 21. TaxAmt
-- 22. Freight
-- 23. TotalDue
-- 24. Comment puede ser null
-- 25. rowguid
-- 26. ModifiedDate
