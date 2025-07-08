-- Drop the table if it already exists
CREATE DATABASE IF NOT EXISTS hello ON CLUSTER 'cluster';

-- Drop the table if it already exists
DROP TABLE IF EXISTS hello.world;

-- Create a simple table with a single string column
CREATE TABLE hello.world (
    message String
) ENGINE = MergeTree()
ORDER BY tuple();

-- Insert a 'Hello, World!' message
INSERT INTO hello.world VALUES ('Hello, World!');

-- Select the message
SELECT * FROM hello.world;
