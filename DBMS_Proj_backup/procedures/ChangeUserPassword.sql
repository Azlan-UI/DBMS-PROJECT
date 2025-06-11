CREATE PROCEDURE ChangeUserPassword
    @UserID INT,
    @NewPasswordHash VARCHAR(50),
    @Message VARCHAR(100) OUTPUT
AS
BEGIN
    IF LEN(@NewPasswordHash) = 0
    BEGIN
        SET @Message = 'Password cannot be empty.';
        RETURN;
    END

    UPDATE Users
    SET PasswordHash = @NewPasswordHash
    WHERE UserID = @UserID;

    SET @Message = 'Password updated successfully.';
END;

DECLARE @msg VARCHAR(100);
EXEC ChangeUserPassword @UserID = 1, @NewPasswordHash = 'newhashedpassword123', @Message = @msg OUTPUT;
SELECT @msg AS ResultMessage;

