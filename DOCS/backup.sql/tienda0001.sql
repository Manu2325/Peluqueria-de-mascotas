BEGIN;
--
-- Create model Cliente
--
CREATE TABLE "tienda_cliente" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "direccion" varchar(255) NOT NULL, "telefono" varchar(15) NOT NULL, "user_id" bigint NOT NULL UNIQUE REFERENCES "accounts_customuser" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model Producto
--
CREATE TABLE "tienda_producto" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nombre" varchar(100) NOT NULL, "descripcion" text NOT NULL, "precio" decimal NOT NULL, "stock" integer NOT NULL);
--
-- Create model Mascota
--
CREATE TABLE "tienda_mascota" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "nombre" varchar(100) NOT NULL, "raza" varchar(100) NOT NULL, "edad" integer NOT NULL, "tipo" varchar(5) NOT NULL, "propietario_id" bigint NOT NULL REFERENCES "tienda_cliente" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model Cita
--
CREATE TABLE "tienda_cita" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "fecha" datetime NOT NULL, "servicio" varchar(100) NOT NULL, "mascota_id" bigint NOT NULL REFERENCES "tienda_mascota" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE INDEX "tienda_mascota_propietario_id_418c0d8d" ON "tienda_mascota" ("propietario_id");
CREATE INDEX "tienda_cita_mascota_id_84a3ba39" ON "tienda_cita" ("mascota_id");
COMMIT;
