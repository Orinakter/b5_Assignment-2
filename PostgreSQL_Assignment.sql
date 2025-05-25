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
INSERT INTO rangers (ranger_id, name, region) VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range'),
(4, 'Derek Fox', 'Coastal Plains'),
(5, 'Eva Black', 'Desert Fringe'),
(6, 'Frank Stone', 'Rainforest Basin'),
(7, 'Grace Lee', 'Eastern Valley'),
(8, 'Henry Wood', 'Central Forest'),
(9, 'Isla Moon', 'Savannah Zone'),
(10, 'Jake Storm', 'Highland Ridge');

-- Insert 10 species
INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
(5, 'Indian Cobra', 'Naja naja', '1802-01-01', 'Least Concern'),
(6, 'Ganges Dolphin', 'Platanista gangetica', '1801-01-01', 'Endangered'),
(7, 'Indian Peacock', 'Pavo cristatus', '1758-01-01', 'Least Concern'),
(8, 'Indian Pangolin', 'Manis crassicaudata', '1822-01-01', 'Endangered'),
(9, 'Olive Ridley Turtle', 'Lepidochelys olivacea', '1829-01-01', 'Vulnerable'),
(10, 'Great Indian Bustard', 'Ardeotis nigriceps', '1863-01-01', 'Critically Endangered');

-- 🔄 Insert 10 sightings
INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL),
(5, 4, 5, 'Elephant Trail', '2024-05-20 06:15:00', 'Footprints spotted'),
(6, 6, 6, 'Delta Bay', '2024-05-21 14:10:00', 'Spotted breaching'),
(7, 8, 7, 'Burrow Ground', '2024-05-22 08:50:00', 'Found digging'),
(8, 9, 8, 'Turtle Beach', '2024-05-23 05:30:00', 'Nesting area'),
(9, 5, 9, 'Serpent Rock', '2024-05-24 11:00:00', 'Basking in sun'),
(10, 7, 10, 'Peacock Forest', '2024-05-25 17:45:00', 'Mating call observed');

SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;