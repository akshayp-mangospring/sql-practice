DROP DATABASE IF EXISTS my_instagram_clone;
CREATE DATABASE my_instagram_clone;
USE my_instagram_clone;

-- IMPORTANT NOTE
-- TABLES ARE SELF CONTAINED BLOCKS
-- WHENEVER WE ARE ABOUT TO REFERENCE ANOTHER TABLE WE NEED TO RESERVE A COLUMN FOR THE DATA IN THE TABLE WE ARE REFERRING TO

-- Write down relations:

-- A user is unique with it's usersname
-- He can have many photos
-- He can put many comments on many photos
-- He can like many photos
-- He can put many hashtags on many of his own photos
-- He can follow many people
-- Many people can follow him
-- Users
CREATE TABLE users(
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) UNIQUE
);

-- A photo belongs to one user
-- A photo can have many likes
-- Many comments can be put up on a photo
-- A photo can have many hashtags
-- Photos Table
CREATE TABLE photos(
  id INT AUTO_INCREMENT PRIMARY KEY,
  url TEXT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id)
);

-- A comment belongs to a photo
-- A comment belongs to a user
-- Many comments can be put up on a photo by many users
-- Comments Table
CREATE TABLE comments(
  id INT AUTO_INCREMENT PRIMARY KEY,
  content TEXT NOT NULL,
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(photo_id) REFERENCES photos(id)
);

-- A like belongs to a photo
-- A photo can be liked by many people
-- Likes Table
CREATE TABLE likes(
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(photo_id) REFERENCES photos(id)
);

-- A hashtag can belong to many photos
-- A hashtag can be put up on a photo by a user
-- There can be many hashtags on one photo
-- Hashtags Table
CREATE TABLE hashtags(
  id INT AUTO_INCREMENT PRIMARY KEY,
  content VARCHAR(255) UNIQUE,
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(photo_id) REFERENCES photos(id)
);

-- A user can have many followers
-- A user can follow many people
-- Follows/Following Table
CREATE TABLE follows(
  id INT AUTO_INCREMENT PRIMARY KEY,
  source_user INT NOT NULL,
  dest_user INT NOT NULL,
  FOREIGN KEY(source_user) REFERENCES users(id),
  FOREIGN KEY(dest_user) REFERENCES users(id)
);
