CREATE DATABASE takeahike;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT,
    email TEXT,
    password_digest TEXT
);

CREATE TABLE hikes (
    id SERIAL PRIMARY KEY,
    name TEXT,
    location TEXT,
    image_URL TEXT,
    length INTEGER,
    days integer,
    user_id INTEGER
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    hike_id INTEGER
);



INSERT INTO hikes(name, location, image_URL, length, days)
VALUES ('Pacific Crest Trail', 'United States', 'https://imgur.com/ZQT4vzV', 4265, 152);

INSERT INTO hikes(name, location, image_URL, length, days)
VALUES ('Te Arora Trail', 'New Zealand', 'https://cdn.shopify.com/s/files/1/3004/4846/articles/BLOG-TeAraroa-1_1c386541-179c-4699-a1b5-6d0f0470d34b.jpg?v=1595576509', 3000, 120);

INSERT INTO hikes(name, location, image_URL, length, days)
VALUES ('Everest Base Camp', 'Nepal', 'https://imgur.com/OIi8bNl', 130, 12);


