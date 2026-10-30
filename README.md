# Celestial Bodies Database

A freeCodeCamp Relational Database certification project. It is a PostgreSQL database named `universe` that stores galaxies, stars, planets, moons, and constellations.

## Files

- `universe.sql`: a dump of the `universe` database.

## Database structure

- `galaxy`: `galaxy_id` (primary key), `name`, `galaxy_type`, `age_in_millions_of_years`, `distance_from_earth`, `description`, `has_life`
- `star`: `star_id` (primary key), `name`, `galaxy_id` (foreign key to `galaxy`), `star_type`, `age_in_millions_of_years`, `mass_in_solar_masses`, `has_planets`, `description`
- `planet`: `planet_id` (primary key), `name`, `star_id` (foreign key to `star`), `planet_type`, `diameter_in_km`, `orbital_period_in_days`, `has_life`, `is_spherical`, `description`
- `moon`: `moon_id` (primary key), `name`, `planet_id` (foreign key to `planet`), `diameter_in_km`, `discovered_year`, `is_spherical`, `has_atmosphere`, `description`
- `constellation`: `constellation_id` (primary key), `name`, `abbreviation`, `hemisphere`, `area_in_square_degrees`, `description`

## Data

- 6 galaxies
- 6 stars
- 12 planets
- 22 moons
- 6 constellations

Ages and distances are approximate.

## Restoring the database

```bash
psql -U postgres < universe.sql
```

## Requirements

- PostgreSQL
