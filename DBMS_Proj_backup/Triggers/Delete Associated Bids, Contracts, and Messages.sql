CREATE TRIGGER trg_DeleteProjectDependencies
ON Projects
AFTER DELETE
AS
BEGIN
    DELETE FROM Messages
    WHERE MessageID IN (
        SELECT m.MessageID
        FROM Messages m
        JOIN Bids b ON b.FreelancerID = m.SenderID OR b.FreelancerID = m.ReceiverID
        JOIN deleted d ON b.ProjectID = d.ProjectID
    )

    DELETE FROM Contracts
    WHERE BidID IN (
        SELECT b.BidID FROM Bids b
        JOIN deleted d ON b.ProjectID = d.ProjectID
    )

    DELETE FROM Bids
    WHERE ProjectID IN (SELECT ProjectID FROM deleted)
END


select * from Projects

DELETE FROM Projects WHERE ProjectID = 1

SELECT * FROM Bids WHERE ProjectID = 1
SELECT * FROM Contracts
SELECT * FROM Messages
