CREATE TRIGGER AfterInsert_Users
ON Users
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Freelancers (FreelancerID, ExperienceLevel, HourlyRate, Availability, Location, LinkedInProfileURL, WebsiteURL)
    SELECT UserID, 'Beginner', 0, 'Full-Time', '', '', ''
    FROM inserted
    WHERE UserType = 'Freelancer';

    INSERT INTO Clients (ClientID, CompanyName, CompanyWebsiteURL, Industry, Location, Verified)
    SELECT UserID, '', '', '', '', 'No'
    FROM inserted
    WHERE UserType = 'Client';
END;


INSERT INTO Users (UserID, Username, Email, PasswordHash, UserType, RegistrationDate, LastLoginDate, ProfilePictureURL, Bio)
VALUES (101, 'Romana Maroof', 'MAROOF@example.com', 'pass@123', 'Freelancer', GETDATE(), GETDATE(), '', 'Graphic dEVELOEPR');

SELECT * FROM Freelancers WHERE FreelancerID = 101;

