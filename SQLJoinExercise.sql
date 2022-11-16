/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT products.name AS 'Product', categories.name AS Category FROM products
JOIN categories on categories.CategoryID = products.CategoryID;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

SELECT name, price, rating FROM products
INNER JOIN reviews ON products.ProductID=reviews.ProductID
WHERE reviews.Rating=5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT FirstName, LastName, sum(quantity) FROM sales
JOIN Employees on Employees.EmployeeID = Sales.EmployeeID
GROUP BY Employees.EmployeeID ORDER BY sum(quantity) DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT d.name AS 'Department Name', c.Name AS 'Category Name'
FROM departments as d
JOIN categories as c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name  = "Appliances" OR c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
SELECT * FROM products WHERE products.Name LIKE '%HOtel California';
SELECT p.Name, SUM(s.Quantity) AS 'Total Sold', (p.price * SUM(s.Quantity)) AS "Total price sold"
FROM products AS p
JOIN sales as s
ON p.productID = s.ProductID
WHERE p.ProductID =97;


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT * FROM products WHERE NAME LIKE 'Visio%';

SELECT p.name, r. Reviewer, r.Rating, r.Comment
FROM products AS P
JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) AS Quantity
FROM sales AS s
JOIN employees as E
ON s.EmployeeID = e.EmployeeID
JOIN products AS p
ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID;