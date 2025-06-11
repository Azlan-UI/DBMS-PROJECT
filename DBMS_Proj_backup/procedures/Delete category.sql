CREATE PROCEDURE DeleteCategory
    @CategoryID INT
AS
BEGIN
    DELETE FROM Categories
    WHERE CategoryID = @CategoryID;

    PRINT 'Category deleted successfully.';
END;


EXEC DeleteCategory @CategoryID = 3;


select * from Categories