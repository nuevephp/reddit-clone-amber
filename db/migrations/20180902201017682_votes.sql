-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TABLE votes (
  id BIGSERIAL PRIMARY KEY,
  vote_flag INTEGER,
  vote_scope VARCHAR,
  vote_weight INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
