BEGIN;
--
-- Rename field servicio on citas to Servicio
--
ALTER TABLE "accounts_citas" RENAME COLUMN "servicio" TO "Servicio";
COMMIT;
