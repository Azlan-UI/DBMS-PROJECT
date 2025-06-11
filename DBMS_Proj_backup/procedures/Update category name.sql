CREATE PROCEDURE UpdateCategoryName
    @CategoryID INT,
    @CategoryName VARCHAR(50)
AS
BEGIN
    UPDATE Categories
    SET CategoryName = @CategoryName
    WHERE CategoryID = @CategoryID;

    PRINT 'Category name updated successfully.';
END;

EXEC UpdateCategoryName @CategoryID = 2, @CategoryName = 'Web Development';
