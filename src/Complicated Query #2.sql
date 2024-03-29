-- Query 2: Send Error message/trigger warning when Patient's date of check-in is chronological and valid after their check-out date
-- 'trigger_validchronDate' is the trigger used to validate a given patient date of hospital check-in when a tuple is newly inputted within table of "Patient"
-- If a given patient's date of check-in is after ('greater than') their check-out, then a trigger will be thus raised (as it should only be before or on the check-out date)
-- The raised trigger will give a message of error that the patient's check-in date should be before the check-out date 

CREATE TRIGGER trigger_validchronDate BEFORE INSERT ON Patient
FOR EACH ROW
WHEN NEW.patient_checkindate > NEW.patient_checkoutdate
BEGIN
    SELECT RAISE(ABORT, 'Error: The patient should check-in on a date that is identical to or before the date they checked out!');
END;