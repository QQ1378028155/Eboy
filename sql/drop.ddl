ALTER TABLE `Order` DROP FOREIGN KEY FKOrder388381;
ALTER TABLE Comment DROP FOREIGN KEY FKComment17490;
ALTER TABLE Gallary DROP FOREIGN KEY FKGallary701369;
ALTER TABLE Item DROP FOREIGN KEY FKItem249451;
ALTER TABLE Delivery DROP FOREIGN KEY FKDelivery657493;
ALTER TABLE ItemTag DROP FOREIGN KEY FKItemTag797338;
ALTER TABLE ItemTag DROP FOREIGN KEY FKItemTag814279;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS Comment;
DROP TABLE IF EXISTS Gallary;
DROP TABLE IF EXISTS Catagory;
DROP TABLE IF EXISTS Delivery;
DROP TABLE IF EXISTS Tag;
DROP TABLE IF EXISTS ItemTag;

