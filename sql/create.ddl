CREATE TABLE Statistics (
  statisticsID    int(10) NOT NULL AUTO_INCREMENT, 
  statisticsMoney double NOT NULL, 
  statisticsTime  date NOT NULL, 
  PRIMARY KEY (statisticsID));
CREATE TABLE ItemTag (
  itemTagID int(10) NOT NULL AUTO_INCREMENT, 
  tagID     int(10) NOT NULL, 
  itemID    int(10) NOT NULL, 
  PRIMARY KEY (itemTagID));
CREATE TABLE Tag (
  tagID   int(10) NOT NULL AUTO_INCREMENT, 
  tagWord varchar(255) NOT NULL, 
  PRIMARY KEY (tagID));
CREATE TABLE Delivery (
  deliveryID       int(10) NOT NULL AUTO_INCREMENT, 
  deliveryLocation varchar(255) NOT NULL, 
  orderID          int(10) NOT NULL, 
  deliveryRemark   varchar(255), 
  deliveryTime     datetime NOT NULL, 
  PRIMARY KEY (deliveryID));
CREATE TABLE Category (
  categoryID   int(10) NOT NULL AUTO_INCREMENT, 
  categoryName varchar(255) NOT NULL, 
  PRIMARY KEY (categoryID));
CREATE TABLE Gallery (
  galleryID  int(10) NOT NULL AUTO_INCREMENT, 
  galleryURL varchar(255) NOT NULL, 
  itemID     int(10) NOT NULL, 
  PRIMARY KEY (galleryID));
CREATE TABLE Comment (
  commentID       int(10) NOT NULL AUTO_INCREMENT, 
  commentUserName varchar(255), 
  commentContent  varchar(255) NOT NULL, 
  commentRate     double NOT NULL, 
  itemID          int(10) NOT NULL, 
  commentTime     datetime NOT NULL, 
  PRIMARY KEY (commentID));
CREATE TABLE `Order` (
  orderID       int(10) NOT NULL AUTO_INCREMENT, 
  orderQuantity int(10) NOT NULL, 
  orderValidate varchar(10) NOT NULL, 
  orderPrice    double NOT NULL, 
  orderAddress  varchar(255) NOT NULL, 
  orderStatus   varchar(64) NOT NULL, 
  orderPhone    varchar(32) NOT NULL, 
  orderReceiver varchar(255) NOT NULL, 
  itemID        int(10) NOT NULL, 
  orderEmail    varchar(255) NOT NULL, 
  PRIMARY KEY (orderID));
CREATE TABLE Item (
  itemID                    int(10) NOT NULL AUTO_INCREMENT, 
  itemEbayID                varchar(30) NOT NULL, 
  itemTitle                 varchar(255) NOT NULL, 
  itemDescription           mediumblob NOT NULL, 
  itemQuantity              int(10) NOT NULL, 
  itemSortScore             double NOT NULL, 
  itemDiscount              double NOT NULL, 
  categoryID                int(10) NOT NULL, 
  itemThumbnailImageURL     varchar(255) NOT NULL, 
  itemSandboxID             varchar(30) NOT NULL, 
  itemPrice                 double NOT NULL, 
  itemPriceCurrency         varchar(10) NOT NULL, 
  itemPackageCost           double DEFAULT 0, 
  itemPackageCostCurrency   varchar(10) DEFAULT 'CNY', 
  itemImportCost            double DEFAULT 0, 
  itemImportCostCurrency    varchar(10) DEFAULT 'CNY', 
  itemShippingCost          double DEFAULT 0, 
  itemShippingCostCurrency  varchar(10) DEFAULT 'CNY', 
  itemInsuranceCost         double DEFAULT 0, 
  itemInsuranceCostCurrency varchar(10) DEFAULT 'CNY', 
  itemTaxCost               double DEFAULT 0, 
  itemTaxCostCurrency       varchar(10) DEFAULT 'CNY', 
  itemSoldQuantity          int(10) DEFAULT 0 NOT NULL, 
  PRIMARY KEY (itemID));
CREATE TABLE MLC (
  MLCID int(10) NOT NULL AUTO_INCREMENT, 
  MLC0  double, 
  MLC1  double, 
  MLC2  double, 
  MLC3  double, 
  MLC4  double, 
  MLC5  double, 
  MLC6  double, 
  PRIMARY KEY (MLCID));
ALTER TABLE `Order` ADD INDEX FKOrder388381 (itemID), ADD CONSTRAINT FKOrder388381 FOREIGN KEY (itemID) REFERENCES Item (itemID);
ALTER TABLE Comment ADD INDEX FKComment17490 (itemID), ADD CONSTRAINT FKComment17490 FOREIGN KEY (itemID) REFERENCES Item (itemID);
ALTER TABLE Gallery ADD INDEX FKGallery697525 (itemID), ADD CONSTRAINT FKGallery697525 FOREIGN KEY (itemID) REFERENCES Item (itemID);
ALTER TABLE Item ADD INDEX FKItem461997 (categoryID), ADD CONSTRAINT FKItem461997 FOREIGN KEY (categoryID) REFERENCES Category (categoryID);
ALTER TABLE Delivery ADD INDEX FKDelivery657493 (orderID), ADD CONSTRAINT FKDelivery657493 FOREIGN KEY (orderID) REFERENCES `Order` (orderID);
ALTER TABLE ItemTag ADD INDEX FKItemTag797338 (tagID), ADD CONSTRAINT FKItemTag797338 FOREIGN KEY (tagID) REFERENCES Tag (tagID);
ALTER TABLE ItemTag ADD INDEX FKItemTag814279 (itemID), ADD CONSTRAINT FKItemTag814279 FOREIGN KEY (itemID) REFERENCES Item (itemID);

