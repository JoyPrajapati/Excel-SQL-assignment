CREATE DATABASE Contact_Management;


use Contact_Management;

Create table Company(

	Company_ID INT,
	Company_Name varchar(45),
    City varchar(45),
	State varchar(2));
    
INSERT INTO Company (Company_ID, Company_Name, City, State)
VALUES
(101, 'Infosys Ltd', 'Bangalore', 'KA'),
(102, 'Tata Consultancy', 'Mumbai', 'MH'),
(103, 'Wipro Ltd', 'Hyderabad', 'TS'),
(104, 'Tech Mahindra', 'Pune', 'MH'),
(105, 'HCL Technologies', 'Noida', 'UP'),
(106, 'Zoho Corporation', 'Chennai', 'TN'),
(107, 'Persistent Systems', 'Nagpur', 'MH'),
(108, 'Mindtree Ltd', 'Bhubaneswar', 'OR'),
(109, 'L&T Infotech', 'Ahmedabad', 'GJ'),
(110, 'Cognizant India', 'Kolkata', 'WB');

select * from Company;

Create table Contact(

	Contact_ID INT,
    Company_ID INT,
    First_Name varchar(45),
    Last_Name varchar(45),
    City varchar(45),
    State varchar(2),
    Email varchar(45),
    Phone varchar(12));
    
INSERT INTO Contact (Contact_ID, Company_ID, First_Name, Last_Name, City, State, Email, Phone)
VALUES
(1, 101, 'Amit', 'Sharma', 'Mumbai', 'MH', 'amit.sharma@example.com', '9876543210'),
(2, 102, 'Neha', 'Verma', 'Delhi', 'DL', 'neha.verma@example.com', '9812345678'),
(3, 103, 'Raj', 'Patel', 'Ahmedabad', 'GJ', 'raj.patel@example.com', '9822123456'),
(4, 104, 'Sneha', 'Rao', 'Bangalore', 'KA', 'sneha.rao@example.com', '9900112233'),
(5, 105, 'Karan', 'Singh', 'Chandigarh', 'CH', 'karan.singh@example.com', '9877700001'),
(6, 106, 'Pooja', 'Mehta', 'Pune', 'MH', 'pooja.mehta@example.com', '9888876543'),
(7, 107, 'Arjun', 'Kapoor', 'Hyderabad', 'TS', 'arjun.kapoor@example.com', '9911223344'),
(8, 108, 'Isha', 'Gupta', 'Kolkata', 'WB', 'isha.gupta@example.com', '9833445566'),
(9, 109, 'Vikram', 'Desai', 'Surat', 'GJ', 'vikram.desai@example.com', '9844556677'),
(10, 110, 'Divya', 'Nair', 'Thiruvananthapuram', 'KL', 'divya.nair@example.com', '9898989898');

select*from Contact;

    Create table Employee(
    Employee_ID INT,
    First_Name varchar(45),
    Last_Name varchar(45),
    Salary decimal(10,2),
	HireDate DATE,
    Job_Title varchar(25),
    Email varchar(45),
    Phone varchar(12));
    
INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Salary, HireDate, Job_Title, Email, Phone)
VALUES
(1, 'Ravi', 'Kumar', 75000.00, '2020-01-15', 'Data Analyst', 'ravi.kumar@company.com', '9876543210'),
(2, 'Anjali', 'Shah', 95000.00, '2019-07-23', 'Software Engineer', 'anjali.shah@company.com', '9812345678'),
(3, 'Vikas', 'Mehra', 120000.00, '2018-03-11', 'Project Manager', 'vikas.mehra@company.com', '9822123456'),
(4, 'Sana', 'Iqbal', 88000.00, '2021-06-01', 'QA Engineer', 'sana.iqbal@company.com', '9900112233'),
(5, 'Manish', 'Jain', 105000.00, '2017-11-10', 'DevOps Engineer', 'manish.jain@company.com', '9877700001'),
(6, 'Divya', 'Menon', 70000.00, '2022-01-05', 'HR Executive', 'divya.menon@company.com', '9888876543'),
(7, 'Ayaan', 'Sheikh', 95000.00, '2020-08-18', 'Backend Developer', 'ayaan.sheikh@company.com', '9911223344'),
(8, 'Ritika', 'Bansal', 115000.00, '2019-10-30', 'Product Manager', 'ritika.bansal@company.com', '9833445566'),
(9, 'Nikhil', 'Reddy', 87000.00, '2021-04-20', 'Frontend Developer', 'nikhil.reddy@company.com', '9844556677'),
(10, 'Meera', 'Joshi', 99000.00, '2018-08-25', 'Business Analyst', 'meera.joshi@company.com', '9898989898');

select * from Employee;

    Create table Contact_Employee(
    Contact_Employee_ID INT,
    Contact_ID INT,
    Employee_ID INT,
    Contact_Date DATE,
    Description varchar(100));
    
INSERT INTO Contact_Employee(Contact_Employee_ID, Contact_ID, Employee_ID, Contact_Date, Description)
VALUES
(1, 1, 2, '2024-01-10', 'Initial client onboarding meeting'),
(2, 2, 4, '2024-02-15', 'Demo of analytics dashboard'),
(3, 3, 1, '2024-03-05', 'Follow-up on data integration request'),
(4, 4, 3, '2024-03-22', 'Technical discussion on ETL requirements'),
(5, 5, 5, '2024-04-18', 'Support session for BI reporting'),
(6, 6, 6, '2024-05-02', 'Client feedback and requirements update'),
(7, 7, 7, '2024-05-20', 'Introduced new dashboard features'),
(8, 8, 9, '2024-06-01', 'Finalizing contract terms'),
(9, 9, 8, '2024-06-10', 'Product training session'),
(10, 10, 10, '2024-06-15', 'Strategy alignment and future goals');

select * from Contact_Employee;
    
### CHANGE RAVI KUMAR'S NUMBER TO 9325729348 ###

SET SQL_SAFE_UPDATES =0;

update Employee
set Phone=9325729348
WHERE Employee_ID =1;

select * from Employee;

### REPLACE Tech Mahindra's TO Hexaware Technologies ###

update Company
set Company_Name='Hexaware Technologies'
WHERE Company_ID =104;

select * from Company;


### REMOVE Sneha rao's contact Event with Divya Menon ###

DELETE FROM Contact_Employee
WHERE Contact_Employee_ID IN (
    SELECT Contact_Employee_ID FROM (
        SELECT ce.Contact_Employee_ID
        FROM Contact_Employee ce
        JOIN Contact c ON ce.Contact_ID = c.Contact_ID
        JOIN Employee e ON ce.Employee_ID = e.Employee_ID
        WHERE c.First_Name = 'Sneha' AND c.Last_Name = 'Rao'
          AND e.First_Name = 'Divya' AND e.Last_Name = 'Menon'
        LIMIT 1
    ) AS temp
);

SELECT * FROM Employee;
SELECT * FROM Contact;
select * from Contact_Employee;

	


