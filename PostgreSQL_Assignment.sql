-- Active: 1747756618380@@127.0.0.1@5432@conservation_db@public
--  Database creation
CREATE DATABASE conservation_db;

-- - rangers table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

-- - species table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) DEFAULT 'Unknown'
);

-- - sightings table
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(150) NOT NULL,
    notes TEXT
);

-- Insert 10 rangers
INSERT INTO rangers (name, region) VALUES
( 'Alice Green', 'Northern Hills'),
( 'Bob White', 'River Delta'),
( 'Carol King', 'Mountain Range'),
( 'Derek Fox', 'Coastal Plains'),
( 'Eva Black', 'Desert Fringe'),
( 'Frank Stone', 'Rainforest Basin'),
( 'Grace Lee', 'Eastern Valley'),
( 'Henry Wood', 'Central Forest'),
( 'Isla Moon', 'Savannah Zone'),
( 'Jake Storm', 'Highland Ridge');

-- Insert 10 species
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
( 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
( 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
( 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
( 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
( 'Indian Cobra', 'Naja naja', '1802-01-01', 'Least Concern'),
( 'Ganges Dolphin', 'Platanista gangetica', '1801-01-01', 'Endangered'),
( 'Indian Peacock', 'Pavo cristatus', '1758-01-01', 'Least Concern'),
( 'Indian Pangolin', 'Manis crassicaudata', '1822-01-01', 'Endangered'),
( 'Olive Ridley Turtle', 'Lepidochelys olivacea', '1829-01-01', 'Vulnerable'),
( 'Great Indian Bustard', 'Ardeotis nigriceps', '1863-01-01', 'Critically Endangered');

-- 🔄 Insert 10 sightings
INSERT INTO sightings ( species_id, ranger_id, location, sighting_time, notes) VALUES
( 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
( 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
( 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
( 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL),
( 4, 5, 'Elephant Trail', '2024-05-20 06:15:00', 'Footprints spotted'),
( 6, 6, 'Delta Bay', '2024-05-21 14:10:00', 'Spotted breaching'),
( 8, 7, 'Burrow Ground', '2024-05-22 08:50:00', 'Found digging'),
( 9, 8, 'Turtle Beach', '2024-05-23 05:30:00', 'Nesting area'),
( 5, 9, 'Serpent Rock', '2024-05-24 11:00:00', 'Basking in sun'),
( 7, 10, 'Peacock Forest', '2024-05-25 17:45:00', 'Mating call observed');

SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;




--------------------------Problem Solving---------------------------------
-- Problem-1: Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

INSERT INTO rangers (name, region) VALUES ('Derek Fox', 'Coastal Plains');

-- Problem-2: Count unique species ever sighted.

SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;

-- Problem-3:  Find all sightings where the location includes "Pass".

SELECT * FROM sightings
WHERE location ILIKE '%Pass%';







