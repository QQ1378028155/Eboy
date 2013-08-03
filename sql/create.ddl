CREATE TABLE Item (
  itemID          int(10) NOT NULL AUTO_INCREMENT, 
  itemEbayID      varchar(30) NOT NULL, 
  itemTitle       varchar(255) NOT NULL, 
  itemDescription blob NOT NULL, 
  itemQuantity    int(10) NOT NULL, 
  itemTax         double NOT NULL, 
  itemShippingFee double NOT NULL, 
  itemPrice       double NOT NULL, 
  itemSortScore   double NOT NULL, 
  itemDiscount    double NOT NULL, 
  catagoryID      int(10) NOT NULL, 
  PRIMARY KEY (itemID));
CREATE TABLE `Order` (
  orderID       int(10) NOT NULL AUTO_INCREMENT, 
  orderQuantity int(10) NOT NULL, 
  orderValidate varchar(10) NOT NULL, 
  orderPrice    int(10) NOT NULL, 
  orderAddress  varchar(255) NOT NULL, 
  orderStatus   varchar(64) NOT NULL, 
  orderPhone    varchar(32) NOT NULL, 
  orderReceiver varchar(255) NOT NULL, 
  itemID        int(10) NOT NULL, 
  orderEmail    varchar(255) NOT NULL, 
  PRIMARY KEY (orderID));
CREATE TABLE Comment (
  CommentID       int(10) NOT NULL AUTO_INCREMENT, 
  commentUserName varchar(255), 
  commentContent  varchar(255) NOT NULL, 
  commentRate     double NOT NULL, 
  itemID          int(10) NOT NULL, 
  PRIMARY KEY (CommentID));
CREATE TABLE Gallary (
  gallaryID  int(10) NOT NULL AUTO_INCREMENT, 
  gallaryURL varchar(255) NOT NULL, 
  itemID     int(10) NOT NULL, 
  PRIMARY KEY (gallaryID));
CREATE TABLE Catagory (
  catagoryID   int(10) NOT NULL AUTO_INCREMENT, 
  catagoryName varchar(255) NOT NULL, 
  PRIMARY KEY (catagoryID));
CREATE TABLE Delivery (
  deliveryID       int(10) NOT NULL AUTO_INCREMENT, 
  deliveryLocation varchar(255) NOT NULL, 
  orderID          int(10) NOT NULL, 
  PRIMARY KEY (deliveryID));
CREATE TABLE Tag (
  tagID   int(10) NOT NULL AUTO_INCREMENT, 
  tagWord varchar(255) NOT NULL, 
  PRIMARY KEY (tagID));
CREATE TABLE ItemTag (
  itemTagID int(10) NOT NULL AUTO_INCREMENT, 
  tagID     int(10) NOT NULL, 
  itemID    int(10) NOT NULL, 
  PRIMARY KEY (itemTagID));
ALTER TABLE `Order` ADD INDEX FKOrder388381 (itemID), ADD CONSTRAINT FKOrder388381 FOREIGN KEY (itemID) REFERENCES Item (itemID);
ALTER TABLE Comment ADD INDEX FKComment17490 (itemID), ADD CONSTRAINT FKComment17490 FOREIGN KEY (itemID) REFERENCES Item (itemID);
ALTER TABLE Gallary ADD INDEX FKGallary701369 (itemID), ADD CONSTRAINT FKGallary701369 FOREIGN KEY (itemID) REFERENCES Item (itemID);
ALTER TABLE Item ADD INDEX FKItem249451 (catagoryID), ADD CONSTRAINT FKItem249451 FOREIGN KEY (catagoryID) REFERENCES Catagory (catagoryID);
ALTER TABLE Delivery ADD INDEX FKDelivery657493 (orderID), ADD CONSTRAINT FKDelivery657493 FOREIGN KEY (orderID) REFERENCES `Order` (orderID);
ALTER TABLE ItemTag ADD INDEX FKItemTag797338 (tagID), ADD CONSTRAINT FKItemTag797338 FOREIGN KEY (tagID) REFERENCES Tag (tagID);
ALTER TABLE ItemTag ADD INDEX FKItemTag814279 (itemID), ADD CONSTRAINT FKItemTag814279 FOREIGN KEY (itemID) REFERENCES Item (itemID);

