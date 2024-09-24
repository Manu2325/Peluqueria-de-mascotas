BEGIN;
--
-- Rename field Nombre_de_macota on citas to Nombre_mascota
--
ALTER TABLE "accounts_citas" RENAME COLUMN "Nombre_de_macota" TO "Nombre_mascota";
COMMIT;
