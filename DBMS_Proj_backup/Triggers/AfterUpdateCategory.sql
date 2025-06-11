CREATE OR ALTER TRIGGER AfterUpdateCategories
ON Categories
AFTER UPDATE
AS
BEGIN
    IF UPDATE(CategoryName)
    BEGIN
        INSERT INTO Notifications(UserID, Content, NotificationDate, IsRead, NotificationType)
        SELECT 1, 'Category name updated to: ' + CategoryName, GETDATE(), 0, 'AdminAlert' FROM inserted;

        RAISERROR('Category name updated trigger fired.', 10, 1) WITH NOWAIT;
    END
END;

UPDATE Categories
SET CategoryName = 'Web Development'
WHERE CategoryID = 1;

