ALTER TABLE log MODIFY COLUMN level ENUM( 'critical', 'debug', 'error', 'warning') DEFAULT 'debug';