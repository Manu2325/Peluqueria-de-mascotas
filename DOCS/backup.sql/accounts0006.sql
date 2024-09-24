BEGIN;
--
-- Create model Mascota
--
CREATE TABLE "accounts_mascota" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nombre" varchar(100) NOT NULL, "raza" varchar(100) NOT NULL, "edad" integer NOT NULL, "tipo" varchar(5) NOT NULL, "propietario_id" bigint NOT NULL REFERENCES "accounts_customuser" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE INDEX "accounts_mascota_propietario_id_2fe1fe3f" ON "accounts_mascota" ("propietario_id");
COMMIT;
