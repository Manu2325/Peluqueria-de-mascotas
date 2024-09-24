BEGIN;
--
-- Remove field user from cliente
--
CREATE TABLE "new__tienda_cliente" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "direccion" varchar(255) NOT NULL, "telefono" varchar(15) NOT NULL);
INSERT INTO "new__tienda_cliente" ("id", "direccion", "telefono") SELECT "id", "direccion", "telefono" FROM "tienda_cliente";
DROP TABLE "tienda_cliente";
ALTER TABLE "new__tienda_cliente" RENAME TO "tienda_cliente";
--
-- Remove field propietario from mascota
--
CREATE TABLE "new__tienda_mascota" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nombre" varchar(100) NOT NULL, "raza" varchar(100) NOT NULL, "edad" integer NOT NULL, "tipo" varchar(5) NOT NULL);
INSERT INTO "new__tienda_mascota" ("id", "nombre", "raza", "edad", "tipo") SELECT "id", "nombre", "raza", "edad", "tipo" FROM "tienda_mascota";
DROP TABLE "tienda_mascota";
ALTER TABLE "new__tienda_mascota" RENAME TO "tienda_mascota";
--
-- Delete model Cita
--
DROP TABLE "tienda_cita";
--
-- Delete model Cliente
--
DROP TABLE "tienda_cliente";
--
-- Delete model Mascota
--
DROP TABLE "tienda_mascota";
COMMIT;
