DELIMITER //

CREATE TRIGGER before_insert_comment
    BEFORE INSERT ON comment
    FOR EACH ROW
BEGIN
    IF NEW.parent_id IS NULL THEN
        SET NEW.parent_id = NEW.id;
END IF;
END//

DELIMITER ;
