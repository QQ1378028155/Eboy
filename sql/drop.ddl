ALTER TABLE `Order` DROP FOREIGN KEY FKOrder388381;
ALTER TABLE Comment DROP FOREIGN KEY FKComment17490;
ALTER TABLE Gallery DROP FOREIGN KEY FKGallery697525;
ALTER TABLE Item DROP FOREIGN KEY FKItem461997;
ALTER TABLE Delivery DROP FOREIGN KEY FKDelivery657493;
ALTER TABLE ItemTag DROP FOREIGN KEY FKItemTag797338;
ALTER TABLE ItemTag DROP FOREIGN KEY FKItemTag814279;
DROP TABLE IF EXISTS Statistics;
DROP TABLE IF EXISTS ItemTag;
DROP TABLE IF EXISTS Tag;
DROP TABLE IF EXISTS Delivery;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Gallery;
DROP TABLE IF EXISTS Comment;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS Item;
