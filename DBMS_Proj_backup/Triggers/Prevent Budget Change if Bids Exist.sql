CREATE TRIGGER trg_PreventBudgetChange
ON Projects
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Projects p ON i.ProjectID = p.ProjectID
        JOIN Bids b ON b.ProjectID = p.ProjectID
        WHERE i.Budget <> p.Budget
    )
    BEGIN
        RAISERROR ('Budget cannot be changed after bids have been placed.', 16, 1)
        ROLLBACK TRANSACTION
    END
    ELSE
    BEGIN
        UPDATE Projects
        SET Title = i.Title,
            Description = i.Description,
            CategoryID = i.CategoryID,
            Budget = i.Budget,
            Deadline = i.Deadline,
            PostingDate = i.PostingDate,
            Status = i.Status,
            Visibility = i.Visibility
        FROM inserted i
        WHERE Projects.ProjectID = i.ProjectID
    END
END

UPDATE Projects
SET Budget = 60000
WHERE ProjectID = 1


