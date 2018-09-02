-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
ALTER TABLE posts ADD COLUMN user_id BIGSERIAL;
CREATE INDEX user_id ON posts USING BTREE (user_id);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP INDEX user_id;
ALTER TABLE posts DROP COLUMN user_id;
