-- Lab 4 - BAKERY
-- name: Andrew Cheung
-- email: acheun29@calpoly.edu


USE `BAKERY`;
-- Q1
SELECT Flavor, Food, PRICE
FROM goods
WHERE Food = 'Cookie' AND PRICE < 1.00
ORDER BY Flavor;


USE `BAKERY`;
-- Q2
SELECT Flavor, Food, PRICE
FROM goods
WHERE (Food = 'Danish')
    OR (Price >= 4.00 AND Price <= 6.00)
    OR (Flavor = 'Chocolate' AND Food != 'Eclair')
ORDER BY PRICE;


USE `BAKERY`;
-- Q3
SELECT DISTINCT LastName, FirstName
FROM receipts, customers
WHERE receipts.Customer = customers.CId
    AND SaleDate = '2007-10-23'
ORDER BY LastName;


USE `BAKERY`;
-- Q4
SELECT DISTINCT Flavor, Food
FROM items, receipts, goods
WHERE items.Receipt = receipts.RNumber AND items.Item = goods.GId
    AND goods.Food = 'Tart'
    AND receipts.SaleDate = '2007-10-08'
ORDER BY Flavor;


USE `BAKERY`;
-- Q5
SELECT DISTINCT receipts.RNumber AS ReceiptNumber, goods.flavor, goods.food, receipts.SaleDate
FROM items AS item1, items AS item2, receipts, goods
WHERE item1.Receipt = receipts.RNumber AND item1.Item = goods.GId
    AND item2.Receipt = receipts.RNumber AND item2.Item = goods.GId
    AND goods.flavor = 'Almond'
    AND item1.Ordinal < item2.Ordinal
ORDER BY receipts.SaleDate;


USE `BAKERY`;
-- Q6
SELECT DISTINCT r1.SaleDate
FROM customers, receipts AS r1, receipts AS r2
WHERE r1.Customer = customers.CId AND r2.Customer = customers.CId
    AND customers.FirstName = 'RAYFORD' AND customers.LastName = 'SOPKO'
    AND r1.SaleDate = r2.SaleDate
    AND r1.RNumber != r2.RNumber
ORDER BY r1.SaleDate;
