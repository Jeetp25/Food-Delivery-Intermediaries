/*Insert customer */
INSERT INTO Customer ( CustomerName, PhoneNumber, CustomerAddress, CustomerRating )
VALUES (  'John', '123-456-7890', '123 Main St, Anytown USA', 4.5 ) ; 

/*update */
UPDATE Customer 
SET CustomerName = 'John Davidson Jr.', PhoneNumber = '(470)-566-6344', CustomerAddress = '3210 SW 39 blvd'
WHERE CustomerID = 6 ; 


/*Delete Customer —--*/
DELETE FROM Customer 
WHERE CustomerID = 6;

/*Insert Address —*/
INSERT INTO Address ( HouseNo, streetNo, City, Zipcode, orderID )
Values ('123', 'Main St', 'Anytown USA', '12345', 1) ;

/*Update —*/
UPDATE Address 
SET HouseNo = '21B' , streetNo = 42 
WHERE AddressID = 6 ;

/*Delete —- */
DELETE FROM Address
WHERE AddressID = 6;

/*Insert Payment — */
INSERT INTO Payment ( PaymentType, PaymentDetail, PaymentDate, PaymentAmount )
VALUES ( 'CreditCard', '**** **** **** 2222', '2023-02-14 12:34:56', 11.47 );

/*Update payment —*/
UPDATE Payment 
SET PaymentType = 'cash' , PaymentDate = '2023-1-21 12:12:12' 
WHERE PaymentID = 6;

/*Delete payment —*/
DELETE FROM Payment 
WHERE PaymentId = 6;

/*Insert Delivery agent —*/
INSERT INTO DeliveryAgent ( DeliveryRate, DeliveryRating )
VALUES  ( 0.25, 4.1 );

UPDATE DeliveryAgent
SET DeliveryRate = 1.2, DeliveryRating = 4.5 
WHERE DriverID = 6;

/*Delete agent —*/
DELETE FROM DeliveryAgent
WHERE DriverID = 6 ;

/*Insert Restaurant —*/
INSERT INTO Restaurant ( OperationTime, DeliveryTime, DeliveryFee, RestaurantPromos, RestaurantComission, RestaurantRating, MenuID ) 
VALUES ( '10:00 AM - 9:00 PM', '4:00 PM - 8:00 PM', 2.99, 'Free drink with purchase of burger and fries', 0.15,4.2, 1 );

/*Update restaurant —*/
UPDATE Restaurant
SET operationTime = '11:00 AM - 9:00 PM', DeliveryFee = 2.50
WHERE RestaurantID = 3;

/*Delete Agent —*/
DELETE FROM Restaurant 
WHERE RestaurantID = 3 ;

/*Insert menu - */
INSERT INTO MenuItem ( ItemDetails, ItemPrice )
Values ('grilled Hamburger', 8.99);

/*Update MENUITEM --*/
UPDATE MenuItem 
SET  ItemDetails = 'grilled cheese Hamburger', ItemPrice = 9.50 
WHERE MenuID = 8;

/*Delete ——*/
Delete FROM MenuItem 
WHERE MenuID = 8 ;

/* order */
INSERT INTO `order` (CustomerID, PaymentID, AddressID, DriverID, Date)
VALUES (1, 2, 1, 1, '2023-02-14 17:31:00');

/* Update order */
UPDATE `order` 
SET PaymentID = 3, DriverID = 4
WHERE OrderID = 7;

/* delete */
DELETE FROM `order`
wHERE orderID = 7;

/*  ORDER ITEM */
INSERT INTO OrderItem (OrderID, MenuID, Qty)
VALUES (5, 6, 10);

/* UPDATE ORDER ITEM */

UPDATE OrderItem 
SET Qty = 3
WHERE  OrderID = 5 AND MenuID = 6;

/* delete */
DELETE FROM `OrderItem`
WHERE OrderID = 7;

/* query 3 */
SELECT Customer.*
FROM Customer JOIN `order`
WHERE Customer.CustomerID = `order`.CustomerID
GROUP BY Customer.CustomerID
HAVING COUNT(`order`.OrderID) > 2;

/* query 3 */
SELECT DISTINCT Customer.*
FROM Customer JOIN `order` JOIN Payment
WHERE Customer.CustomerID = `order`.CustomerID AND `order`.PaymentID = Payment.PaymentID AND Payment.PaymentAmount >= 20.00 AND Payment.PaymentType = 'PayPal';