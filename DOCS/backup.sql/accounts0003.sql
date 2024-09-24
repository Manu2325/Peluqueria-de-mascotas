BEGIN;
--
-- Create model Citas
--
CREATE TABLE "accounts_citas" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "Fecha" datetime NOT NULL, "servicio" varchar(255) NOT NULL, "Nombre_de_macota" varchar(255) NOT NULL, "Usuario_id" bigint NOT NULL REFERENCES "accounts_customuser" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Delete model Appointment
--
DROP TABLE "accounts_appointment";
CREATE INDEX "accounts_citas_Usuario_id_018e1181" ON "accounts_citas" ("Usuario_id");
COMMIT;
