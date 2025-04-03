-- CONSTRAINT

ALTER TABLE Products
ADD CONSTRAINT DF_Price
DEFAULT 1 FOR [Price]

SELECT * FROM Products 

INSERT INTO Products (Code, Name, Description, Weight, Cost)
VALUES ('MIL', 'Milka Oreo', 'Delicious and sweet', 200, 40)

-- check constraint

ALTER TABLE Products WITH CHECK ADD CONSTRAINT CHK_product_Price
CHECK (price <= Cost*2)

INSERT INTO Products (Code, Name, Description, Weight, Price, Cost)
VALUES ('MILN', 'Milka Noisette', 'Delicious and sweet milka', 200, 100, 40)

--unique
ALTER TABLE Products WITH CHECK ADD CONSTRAINT UC_Product_Code UNIQUE (Code);

UPDATE Products SET Code = 'MIL' WHERE Id = 43; 

ALTER TABLE Products ADD Quantity int;

-- foreiGN key
ALTER TABLE Orders WITH CHECK ADD CONSTRAINT FK_Order_BusinessEntities 
FOREIGN KEY (BusinessEntityID)
REFERENCES BusinessEntities (Id);