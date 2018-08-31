BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ' || 'vet_specialties';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;  


BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ' || 'vets';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;  

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ' || 'specialties';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;  

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ' || 'visits';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;  

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ' || 'pets';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END; 

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ' || 'types';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;  

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ' || 'owners';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;  

CREATE TABLE vets (
  id number not null PRIMARY KEY,
  first_name VARCHAR(30),
  last_name  VARCHAR(30)
);

CREATE INDEX vets_last_name ON vets (last_name);

CREATE TABLE specialties (
  id number not null PRIMARY KEY,
  name VARCHAR(80)
);

CREATE INDEX specialties_name ON specialties (name);

CREATE TABLE vet_specialties (
  vet_id INTEGER NOT NULL,
  specialty_id INTEGER NOT NULL
);


ALTER TABLE vet_specialties ADD CONSTRAINT fk_vet_specialties_vets FOREIGN KEY (vet_id) REFERENCES vets (id);
ALTER TABLE vet_specialties ADD CONSTRAINT fk_vet_specialties_specialties FOREIGN KEY (specialty_id) REFERENCES specialties (id);

CREATE TABLE types (
  id INTEGER not null PRIMARY KEY,
  name VARCHAR(80)
);


CREATE INDEX types_name ON types (name);

CREATE TABLE owners (
  id         INTEGER PRIMARY KEY,
  first_name VARCHAR(30),
  last_name  VARCHAR(30),
  address    VARCHAR(255),
  city       VARCHAR(80),
  telephone  VARCHAR(20)
);

CREATE INDEX owners_last_name ON owners (last_name);

CREATE TABLE pets (
  id         INTEGER PRIMARY KEY,
  name       VARCHAR(30),
  birth_date DATE,
  type_id    INTEGER NOT NULL,
  owner_id   INTEGER NOT NULL
);


ALTER TABLE pets ADD CONSTRAINT fk_pets_owners FOREIGN KEY (owner_id) REFERENCES owners (id);
ALTER TABLE pets ADD CONSTRAINT fk_pets_types FOREIGN KEY (type_id) REFERENCES types (id);
CREATE INDEX pets_name ON pets (name);

CREATE TABLE visits (
  id          INTEGER PRIMARY KEY,
  pet_id      INTEGER NOT NULL,
  visit_date  DATE,
  description VARCHAR(255)
);
ALTER TABLE visits ADD CONSTRAINT fk_visits_pets FOREIGN KEY (pet_id) REFERENCES pets (id);
CREATE INDEX visits_pet_id ON visits (pet_id);
