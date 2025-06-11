CREATE TRIGGER ValidateEmail
ON Users
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

   
    IF EXISTS (
        SELECT 1 FROM inserted
        WHERE Email NOT LIKE '%_@__%.__%'
    )
    BEGIN
        RAISERROR('Invalid email format.', 16, 1);
        RETURN;
    END
	
	INSERT INTO Users (UserID, Username, Email, PasswordHash, UserType, RegistrationDate, LastLoginDate, ProfilePictureURL, Bio)
VALUES (103, 'test_user', 'invalid_email', 'weakpass', 'Freelancer', GETDATE(), GETDATE(), '', 'Test user');

	INSERT INTO Users (UserID, Username, Email, PasswordHash, UserType, RegistrationDate, LastLoginDate, ProfilePictureURL, Bio)
    SELECT UserID, Username, Email, PasswordHash, UserType, RegistrationDate, LastLoginDate, ProfilePictureURL, Bio
    FROM inserted;
END;
