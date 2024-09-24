BEGIN;
--
-- Create model CustomUser
--
CREATE TABLE "accounts_customuser" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(150) NOT NULL, "last_name" varchar(150) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "email" varchar(254) NOT NULL UNIQUE, "phone_number" varchar(15) NOT NULL);
CREATE TABLE "accounts_customuser_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "customuser_id" bigint NOT NULL REFERENCES "accounts_customuser" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "accounts_customuser_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "customuser_id" bigint NOT NULL REFERENCES "accounts_customuser" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model Appointment
--
CREATE TABLE "accounts_appointment" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "date" datetime NOT NULL, "service" varchar(255) NOT NULL, "pet_name" varchar(255) NOT NULL, "user_id" bigint NOT NULL REFERENCES "accounts_customuser" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE UNIQUE INDEX "accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq" ON "accounts_customuser_groups" ("customuser_id", "group_id");
CREATE INDEX "accounts_customuser_groups_customuser_id_bc55088e" ON "accounts_customuser_groups" ("customuser_id");
CREATE INDEX "accounts_customuser_groups_group_id_86ba5f9e" ON "accounts_customuser_groups" ("group_id");
CREATE UNIQUE INDEX "accounts_customuser_user_permissions_customuser_id_permission_id_9632a709_uniq" ON "accounts_customuser_user_permissions" ("customuser_id", "permission_id");
CREATE INDEX "accounts_customuser_user_permissions_customuser_id_0deaefae" ON "accounts_customuser_user_permissions" ("customuser_id");
CREATE INDEX "accounts_customuser_user_permissions_permission_id_aea3d0e5" ON "accounts_customuser_user_permissions" ("permission_id");
CREATE INDEX "accounts_appointment_user_id_ffc999b5" ON "accounts_appointment" ("user_id");
COMMIT;
