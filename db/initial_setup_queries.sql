CREATE TABLE User(
  userID INTEGER PRIMARY KEY AUTO_INCREMENT,
  group STRING NOT NULL);

CREATE TABLE Outfit(
  outfitID INTEGER PRIMARY KEY AUTO_INCREMENT,
  userID INTEGER NOT NULL REFERENCES User(userID) ON DELETE CASCADE);

CREATE TABLE Tag(
  tagID INTEGER PRIMARY KEY AUTO_INCREMENT,
  outfitID INTEGER NOT NULL REFERENCES Outfit(outfitID) ON DELETE CASCADE,
  pattern STRING NOT NULL,
  category STRING NOT NULL,
  brand STRING NOT NULL); 

CREATE TABLE TagColor( 
  tagID INTEGER NOT NULL REFERENCES Tag(tagID) ON DELETE CASCADE,
  color STRING NOT NULL,
  PRIMARY KEY(tagID, color);		

CREATE TABLE Comment(
  commentID INTEGER PRIMARY KEY AUTO_INCREMENT,
  userID INTEGER NOT NULL REFERENCES User(userID) ON DELETE CASCADE,
  datePosted DATE NOT NULL,
  message STRING NOT NULL);

CREATE TABLE Rating(
  ratingID INTEGER PRIMARY KEY AUTO_INCREMENT,
  userID INTEGER NOT NULL REFERENCES User(userID) ON DELETE CASCADE,
  outfitID INTEGER NOT NULL REFERENCES Outfit(outfitID) ON DELETE CASCADE,
  value INTEGER NOT NULL);
