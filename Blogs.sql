CREATE DATABASE Blogs;

CREATE TABLE Users (
	id int not null auto_increment primary key,
    title varchar(50) not null,
    content text null,
    authorid int not null,
    _created datetime default current_timestamp
    );

CREATE TABLE Authors (
	id int not null auto_increment primary key,
    name varchar(50) not null,
    email varchar(50) not null,
    _created datetime default current_timestamp
    );

CREATE TABLE Tags (
    id int not null auto_increment primary key,
    name varchar(50) not null
    );

CREATE TABLE BlogTags (
    blogid int not null,
    tagid int not null
);

CREATE PROCEDURE spBlogTags @blogid int not null
AS
SELECT * FROM BlogTags
GO;

SELECT BlogTags.blogid, BlogTags.tagid
FROM BlogTags
INNER JOIN Tags
ON (BlogTags.blogid = Tags.id);