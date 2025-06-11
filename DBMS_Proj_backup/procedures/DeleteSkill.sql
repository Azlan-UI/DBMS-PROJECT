CREATE PROCEDURE DeleteSkill
    @SkillID INT
AS
BEGIN
    DELETE FROM Skills
    WHERE SkillID = @SkillID;
END;

EXEC DeleteSkill @SkillID = 1;
