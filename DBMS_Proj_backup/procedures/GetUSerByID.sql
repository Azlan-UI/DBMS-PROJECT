CREATE PROCEDURE GetUserByID
    @UserID INT
AS
BEGIN
    SELECT UserID, Username, Email, UserType, RegistrationDate, LastLoginDate, ProfilePictureURL, Bio
    FROM Users
    WHERE UserID = @UserID;
END;

EXEC GetUserByID @UserID = 1;
