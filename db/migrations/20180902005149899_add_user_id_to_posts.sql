-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
ALTER TABLE "public"."posts" ADD COLUMN "user_id" BIGSERIAL;
CREATE INDEX "user_id" ON "public"."posts" USING BTREE ("user_id");

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
ALTER TABLE "public"."posts" DROP COLUMN "user_id";
DROP INDEX "public"."user_id";
