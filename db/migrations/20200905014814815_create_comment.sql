-- +micrate Up
CREATE TABLE comments (
  id BIGSERIAL PRIMARY KEY,
  post_id BIGINT,
  body TEXT,
  user_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX comment_post_id_idx ON comments (post_id);
CREATE INDEX comment_user_id_idx ON comments (user_id);

-- +micrate Down
DROP TABLE IF EXISTS comments;
