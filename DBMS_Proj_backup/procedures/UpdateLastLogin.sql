CREATE PROCEDURE UpdateLastLogin
    @UserID INT,
    @Message VARCHAR(100) OUTPUT
AS
BEGIN
    UPDATE Users
    SET LastLoginDate = GETDATE()
    WHERE UserID = @UserID;

    SET @Message = 'Last login date updated successfully.';
END;

DECLARE @msg VARCHAR(100);
EXEC UpdateLastLogin @UserID = 1, @Message = @msg OUTPUT;
SELECT @msg AS ResultMessage;
