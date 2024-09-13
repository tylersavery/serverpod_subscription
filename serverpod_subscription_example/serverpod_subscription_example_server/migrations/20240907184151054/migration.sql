BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "app_subscription" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL,
    "expiresAt" timestamp without time zone NOT NULL,
    "provider" bigint NOT NULL,
    "productId" text NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "app_subscription"
    ADD CONSTRAINT "app_subscription_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR serverpod_subscription_example
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_subscription_example', '20240907184151054', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240907184151054', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_subscription
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_subscription', '20240907182803573', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240907182803573', "timestamp" = now();


COMMIT;
