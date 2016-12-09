CREATE TABLE Sales
(
ReceiptNumber INTEGER,
SalesDate DATE,
CONSTRAINT pk_SalesTable PRIMARY KEY(ReceiptNumber)
);

CREATE TABLE Quantity
(
ProductID INTEGER,
ReceiptNumber INTEGER,
QuantitySold INTEGER,
CONSTRAINT pk_QuantityTable PRIMARY KEY (ProductID,ReceiptNumber),
CONSTRAINT fk_ProductSecond FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
CONSTRAINT fk_SalesForeign FOREIGN KEY (ProductID) REFERENCES Sales(ReceiptNumber),
CONSTRAINT checkQuanSold CHECK(QuantitySold >= 0)
);

CREATE TABLE Product
(
ProductID INTEGER,
ProductDescription VARCHAR2(200),
CONSTRAINT pk_ProductPrimary PRIMARY KEY (ProductID)
); 

CREATE TABLE Item
(
ItemNum INTEGER,
ItemDescription VARCHAR2(200),
CONSTRAINT pk_ItemPrimary PRIMARY KEY (ItemNum)
);

CREATE TABLE QuantitySecond
(
 ProductID INTEGER, 
 ItemNum INTEGER,
 QuantityUsed INTEGER,
 CONSTRAINT pk_ProductAndItem PRIMARY KEY (ProductID, ItemNum),
 CONSTRAINT fk_ItemForeign FOREIGN KEY (ItemNum) REFERENCES Item(ItemNum),
 CONSTRAINT fk_ProductForeign FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
 CONSTRAINT checkQuanUsed CHECK (QuantityUsed >= 0)
 );



