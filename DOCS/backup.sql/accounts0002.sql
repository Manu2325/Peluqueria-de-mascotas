BEGIN;
--
-- Alter field phone_number on customuser
--
CREATE TABLE "new__accounts_customuser" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "phone_number" varchar(15) NULL, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(150) NOT NULL, "last_name" varchar(150) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "email" varchar(254) NOT NULL UNIQUE);
INSERT INTO "new__accounts_customuser" ("id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "is_staff", "is_active", "date_joined", "email", "phone_number") SELECT "id", "password", "last_login", "is_superuser", "username", "first_name", "last_name", "is_staff", "is_active", "date_joined", "email", "phone_number" FROM "accounts_customuser";
DROP TABLE "accounts_customuser";
ALTER TABLE "new__accounts_customuser" RENAME TO "accounts_customuser";
COMMIT;
