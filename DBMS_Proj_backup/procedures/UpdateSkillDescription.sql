CREATE PROCEDURE UpdateSkillDescription
    @SkillID INT,
    @Description VARCHAR(50)
AS
BEGIN
    UPDATE Skills
    SET Description = @Description
    WHERE SkillID = @SkillID;
END;


EXEC UpdateSkillDescription @SkillID = 1, @Description = 'Updated description';
