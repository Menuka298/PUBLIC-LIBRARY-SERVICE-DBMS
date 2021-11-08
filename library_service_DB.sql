--USE master;
--DROP DATABASE library_serviceDB;
GO
CREATE DATABASE library_serviceDB;
GO
USE library_serviceDB;
-----------------------------------------------------------------------Table Creation & Dummy/Sample Data Adding-------------------------------------------------------------------------------
--//creating table to store data of the library.
CREATE TABLE Library(
    library_name VARCHAR(50) NOT NULL,
    phone_no CHAR(10) NOT NULL,
    library_location VARCHAR(50) NOT NULL,
    main_library_name VARCHAR(50) NULL DEFAULT 'NULL'
    CONSTRAINT library_pk_library_name PRIMARY KEY (library_name)
);
--//adding sample data to both main and branch libraries.
INSERT INTO Library (library_name, phone_no, library_location)
VALUES
('Negombo Public Library', '0312231814', 'No.24 - 26, Fernando Avenue, Negombo.'),
('Colombo Public Library', '0112328193', 'No.98, York Street, Colombo 01'),
('Kandy Public Library', '0812235733', 'No.30, Dalada Veediya, Kandy.');
INSERT INTO Library
VALUES
('Negombo Public Library - Branch 01', '0312225280', 'No.314, Colombo, Negombo.', 'Negombo Public Library.'),
('Negombo Public Library - Branch 02', '0312228511', 'No.153, St. Joseph''s Street, Negombo.', 'Negombo Public Library.'),
('Colombo Public Library - Branch 01', '0112336224', 'No.123, Dharmapala Mawatha, Colombo 07', 'Colombo Public Library.'),
('Colombo Public Library - Branch 02', '0112339521', 'No.180/27, N. H. M. Abdul Cader Rd, Colombo 11', 'Colombo Public Library.'),
('Kandy Public Library - Branch 01', '0812223217', 'No.120, Kotogodella Veediya, Kandy', 'Kandy Public Library'),
('Kandy Public Library - Branch 02', '0816524303', 'No.670/5 Peradeniya Rd, Kandy.', 'Kandy Public Library');
SELECT * FROM Library;
--//creating table to store data of the employees.
CREATE TABLE Employee(
    emp_id CHAR(5) NOT NULL,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    phone_no CHAR(10),
    emp_address VARCHAR(100),
    library_name VARCHAR(50) NOT NULL,
    CONSTRAINT employee_pk_emp_id PRIMARY KEY (emp_id),
    CONSTRAINT employee_check CHECK (phone_no NOT LIKE '%[^0-9]%'), --//this will check wether the phone number starts with 0 and has 10 digits.
    CONSTRAINT employee_fk_library_name FOREIGN KEY (library_name) REFERENCES Library(library_name)
);
--//adding sample records to employee table.
INSERT INTO Employee
VALUES
('10000', 'Deepashika', 'Sajeewanie', '1996-06-06', '0775854776', 'No.513A, Elpitiya Rd, Anbalangoda.', 'Negombo Public Library'),
('10001', 'Kavinda', 'Dilshan', '1997-04-05', '0770050165', 'Imihiri, No.35, Mangala Rd, 3rd Kurana, Negombo.', 'Negombo Public Library'),
('10002', 'Mervyn', 'Mahendra', '1997-10-02', '0755124745', 'No.309, Galle Rd, Wellawatta.', 'Negombo Public Library'),
('10003', 'Priyani', 'Malkanthi', '1992-11-23', '0702399291', 'No.42/3, Pitipana Rd, Homagama.', 'Negombo Public Library'),
('10004', 'Priya', 'Madushani', '1990-03-28', '0718287311', 'No.230/A, Palliyawatta, Thimbirigaskatuwa, Negombo.', 'Negombo Public Library'),
('10005', 'Ramesh', 'Rashan', '1983-12-27', '0765231424', 'No.242/B, Hortan Place, Kollupitiya.', 'Negombo Public Library'),
('10006', 'Pasan', 'Anushka', '1988-06-15', '0725247566', 'No.11, Galle Rd, Matara.', 'Negombo Public Library'),
('10007', 'Thilini', 'Udeshika', '1990-02-05', '0715148280', 'No.40, Main Street, Colombo 11.', 'Negombo Public Library'),
('10008', 'Pradeep', 'Sanjaya', '1981-05-03', '0778445221', 'No.30, Janadhipathi Mawatha, Colombo 01.', 'Negombo Public Library'),
('10009', 'Sajith', 'Chathuranga', '1979-02-20', '0704366241', 'No.58, Sir Ernest De Silva Mawatha, Colombo 07.', 'Negombo Public Library'),
('10010', 'Kevin', 'Malshan', '1986-12-01', '0774153241', 'No.614, Maradana Road, Colombo 10.', 'Negombo Public Library'),
('10011', 'Devindya', 'Fernando', '1973-05-28', '0725967271', 'No.219, Stanley, Thilakarathna Mawatha, Nugegoda.', 'Negombo Public Library'),
('10012', 'Sepala', 'Gunathilaka', '1975-08-15', '0705390279', 'No.83/13, 2nd Cross Street, Colombo 11.', 'Negombo Public Library - Branch 01'),
('10013', 'Anushka', 'Devinda', '1990-03-20', '0754971514', 'No.115, Kumarathunga Mawatha, Matara.', 'Negombo Public Library - Branch 01'),
('10014', 'Tharindu', 'Peries', '1992-05-05', '0764324350', 'No.517/6, Thimbirigasyaya Road, Colombo 05.', 'Negombo Public Library - Branch 01'),
('10015', 'Udeshi', 'Hansika', '1990-12-30', '0772367890', 'No.4, 1st Lane, Galle Road, Ambalangoda.', 'Negombo Public Library - Branch 01'),
('10016', 'Prageeth','Eranga', '1979-06-03', '0717190211', 'No.602, Kumarathunga Mawatha, Matara.', 'Negombo Public Library - Branch 01'),
('10017', 'Sudesh', 'Rangana', '1990-02-05', '0761200270', 'No.6, Piliyandala Road, Boralasgamuwa.', 'Negombo Public Library - Branch 01'),
('10018', 'Praddep', 'Rangana', '1976-08-12','0758900231', 'No.505, pitipana North, Homagama.', 'Negombo Public Library - Branch 01'),
('10019','Madushanka', 'Silva', '1972-05-24', '0765671900', 'No.75/A, Main Street, Colombo 10.', 'Negombo Public Library - Branch 01'),
('10020','Pubudu', 'Chathuranga', '1981-04-08', '0752016200', 'No.10, Maharagama Road, Pannipitiya.', 'Negombo Public Library - Branch 01'),
('10021', 'Sajitha','Prabath', '1983-09-13', '0776025612', 'No.61/2, Maradana Road, Colombo 10.', 'Negombo Public Library - Branch 01'),
('10022', 'Madhavee', 'Shalika', '1990-12-27', '0705900190', 'No.8, Galle Road, Matara.', 'Negombo Public Library - Branch 01'),
('10023', 'Sriyani', 'Perera', '1967-08-22', '0727036311', 'No.108, Matara Road, Akurassa.', 'Negombo Public Library - Branch 01'),
('10024', 'Supuni', 'Poornika', '1996-01-12', '0712960280', 'No.20, Pitipana Road,Homagama.', 'Negombo Public Library - Branch 02'),
('10025', 'Dilan', 'Jayasekara', '1997-06-19', '0778028110', 'No.45, 2nd Cross Street, Colombo 11.', 'Negombo Public Library - Branch 02'),
('10026', 'Kasun', 'Nimshan', '1989-07-30', '0721305490', 'No.12/A, Galle Road, Ambalangoda.', 'Negombo Public Library - Branch 02'),
('10027', 'Priyantha', 'Silva', '1964-01-06', '0775458779', 'No.78, Parliament Road, Sri Jayawardhanapura.', 'Negombo Public Library - Branch 02'),
('10028', 'Piumi', 'Sewwandi', '1998-01-12', '0707620191', 'No.56/2, Maharagama Road, Pannipitiya.', 'Negombo Public Library - Branch 02'),
('10029', 'Ranga', 'Prabath', '1981-09-23', '0767040811', 'No.86, Makubura, Kottawa.', 'Negombo Public Library - Branch 02'),
('10030', 'Kalana', 'Pathum', '1992-07-29', '0760570790', 'No.34, Galle Road, Morathuwa.', 'Negombo Public Library - Branch 02'),
('10031', 'Sampath', 'Perera', '1991-10-10', '0772069073', 'No.50, Pitipana North, Homagama.', 'Negombo Public Library - Branch 02'),
('10032', 'Sandun', 'Rathsara', '1997-12-04', '0780827800', 'No.91, Main Street, Kollupitiya.', 'Negombo Public Library - Branch 02'),
('10033', 'Chalani', 'Silva', '1972-04-13', '0776027830',  'No.60, Galle Road, Panadura.', 'Negombo Public Library - Branch 02'),
('10034', 'Deepashika', 'Sandamali', '1968-12-23', '0766524303', 'No.09, Dam Street, Colombo 12.', 'Negombo Public Library - Branch 02'),
('10035', 'Pasan', 'Athukorala', '1972-03-16', '0774328765', 'No.812, Aluth Mawatha Rd, Colombo 15.', 'Negombo Public Library - Branch 02'),
('10036', 'Kalpa', 'Madushan', '1996-09-23', '0719027510', 'No.114, Yatinuwara Widiya, Kandy.', 'Colombo Public Library'),
('10037', 'Thilina', 'Sampath', '1986-11-23', '0789045900', 'No.206/1, Galle Road, Colombo4.', 'Colombo Public Library'),
('10038', 'Chamara', 'Peris', '1981-04-20', '0775889003', 'No.79, Makubura, Kottawa.', 'Colombo Public Library'),
('10039', 'Sandaru', 'Abishek', '1996-09-08', '0789087540', 'No.11, Dam Street, Colombo 12.', 'Colombo Public Library'),
('10040', 'Madushan', 'Perera', '1998-12-23', '0789027189', 'No.14, Matara Road, Ahangama.', 'Colombo Public Library'),
('10041', 'Nimesh', 'Madushan', '1981-09-06', '0726800810', 'No.36A,Galle Road, Colombo 6.', 'Colombo Public Library'),
('10042', 'Chandana', 'Silva', '1971-06-29', '0770912754', 'No.10, Maha Widiya, Kandy.', 'Colombo Public Library'),
('10043', 'Nethmi', 'Chalika', '1990-02-09', '0710970311', 'No.114, Galle Road, Panadura.', 'Colombo Public Library'),
('10044', 'Ravindu', 'Madushan', '1998-09-23', '0717510021', 'No.18/A, Yatinuwara Widiya, Kandy.', 'Colombo Public Library'),
('10045', 'Shaluka', 'Heshan', '1989-06-03', '0789027810', 'No.88, Green Path, Colombo.', 'Colombo Public Library'),
('10046', 'Supun', 'Prabath', '1986-10-23', '0772751099', 'No.78, Jhon Road, Colombo 11.', 'Colombo Public Library'),
('10047', 'Sunil', 'Perera', '1967-09-28', '0719029519', 'No.89, Grandpass, Colombo 6.', 'Colombo Public Library'),
('10048', 'Sudeshika', 'Madushika', '1996-09-23', '0789025516', 'No.14, Pitipana Road, Homagama.', 'Colombo Public Library - Branch 01'),
('10049', 'Thilini', 'Liyanage', '1986-12-05', '0759023810', 'No.178/A, Yatinuwara Widiya, Kandy.', 'Colombo Public Library - Branch 01'),
('10050', 'Supuni', 'Chamika', '1996-09-02', '0781827562', 'No.11, Galle Road, Ambalamgoda.', 'Colombo Public Library - Branch 01'),
('10051', 'Chathuri', 'Niroshika', '1979-06-23', '0778227510', 'No.3, Athuruwela,Galle Road, Iduruwa. ', 'Colombo Public Library - Branch 01'),
('10052', 'Kasun', 'Peris', '1978-09-28', '0752751009', 'No.30, Galle Road, Panadura.', 'Colombo Public Library - Branch 01'),
('10053', 'Ishitha', 'Madushan', '1990-03-23', '0719027789', 'No.102A, Land 1, Makubura, Kottawa.', 'Colombo Public Library - Branch 01'),
('10054', 'Kalpa', 'Nimshasn', '1988-12-06', '0718960510', 'No.29/A, Maha widiya, Kollupitiya.', 'Colombo Public Library - Branch 01'),
('10055', 'Chamika', 'Liyanage', '1969-02-23', '0789827567', 'No.9, GrandPass, Colombo 6.', 'Colombo Public Library - Branch 01'),
('10056', 'Upeksha', 'Madushani', '1984-01-13', '0774829598', 'No.98/A, Galle Road, Kalutara.', 'Colombo Public Library - Branch 01'),
('10057', 'Nimesha', 'Prabashi', '1983-07-22', '0726554805', 'No.67,Ranwala Mawatha,Nugegoda.', 'Colombo Public Library - Branch 01'),
('10058', 'Chathu', 'De silva', '1980-06-26', '0774795945', 'Araliya, No.5, Thuduwegoda Road, Maharagama.', 'Colombo Public Library - Branch 01'),
('10059', 'Sanduni', 'Shalika', '1981-12-08', '0706950466', 'No.98/2, Cross Street, Colombo 11.', 'Colombo Public Library - Branch 01'),
('10060', 'Pasan', 'Alwis', '1969-05-26', '0777365491', 'No.78, Galle Road, Matara.', 'Colombo Public Library - Branch 02'),
('10061', 'Nethmi', 'Wimansa', '1981-06-28', '0725111946', 'No.65, Ward Place, Colombo 7.', 'Colombo Public Library - Branch 02'),
('10062', 'Chalana', 'Silva', '1983-12-09', '0708333705', 'No.56/A, Makubura, Kottawa.', 'Colombo Public Library - Branch 02'),
('10063', 'Chathumi', 'Nirosha', '1981-12-05', '0700697611', 'No.8, Lauries Road, olombo 4.', 'Colombo Public Library - Branch 02'),
('10064', 'Chathuri', 'Liyange', '1985-10-01', '0703750888', 'No.251, Darley Road, Colombo 11.', 'Colombo Public Library - Branch 02'),
('10065', 'Shamalee', 'Chamoda', '1987-02-14', '0725955517', 'No.309, Galle Road, Ambalangoda.', 'Colombo Public Library - Branch 02'),
('10066', 'Maheshi', 'De silva', '1975-12-08', '0772782821', 'No.36, Sri Ramanathan Road, Colombo 6.', 'Colombo Public Library - Branch 02'),
('10067', 'Chamari', 'Pemasiri', '1965-06-25', '0775997752', 'No.2nd, Cross Street, Kalutara.', 'Colombo Public Library - Branch 02'),
('10068', 'Prabashi', 'Nayani', '1982-12-03', '0709474932', 'No.8/A, Matara Road, Akurassa.', 'Colombo Public Library - Branch 02'),
('10069', 'Kasun', 'Peris', '1967-02-24', '0723163113', 'No.45, Ward Place, Colombo 7.', 'Colombo Public Library - Branch 02'),
('10070', 'Chamath', 'Alwis', '1965-02-21', '0778333477', 'No.50/11, Dam Street, Colombo 11.', 'Colombo Public Library - Branch 02'),
('10071', 'Hasini', 'Kavindika', '1987-09-13', '0727268699', 'No.11,Bandarawela Road,Badulla.', 'Colombo Public Library - Branch 02'),
('10072', 'Ameesha', 'Prasadi', '1975-12-07', '0707631417', 'No.70/6, Gramodaya Mawatha, Panipitiya', 'Kandy Public Library'),
('10073', 'Namal', 'Sirisena', '1967-10-06', '0707176787', 'No.574/1, Galle Road, Colombo.', 'Kandy Public Library'),
('10074', 'Fathima', 'Nasrin', '1978-10-06', '0700490063', 'No.56, Galle Road, Buruwela.', 'Kandy Public Library'),
('10075', 'Sandun', 'De silva', '1966-04-21', '0723007658', 'No.8, Union Place, Colombo 2.', 'Kandy Public Library'),
('10076', 'Ramesh', 'Fernando', '1971-03-12', '0770801354', 'No.90, Norris Canal Road, Colombo 4.', 'Kandy Public Library'),
('10077', 'Shashini', 'Chamika', '1976-04-28', '0726614264', 'No.50, Old Butchers Street, Colombo 11.', 'Kandy Public Library'),
('10078', 'Sandaru', 'Perera', '1974-10-07', '0703441659', 'No.70/2, Pitipana Road, Homagama.', 'Kandy Public Library'),
('10079', 'Nimesha', 'Kavindya', '1982-09-16', '0724875580', 'No.78, Castle Street, Colombo 6.', 'Kandy Public Library'),
('10080', 'Supun', 'Kalana', '1979-10-04', '0700381285', 'No.6, Galle Road, Panadura.', 'Kandy Public Library'),
('10081', 'Tharindu', 'De Silva', '1970-03-27', '0770063423', 'No.89, 2nd Cross Street, Galle.', 'Kandy Public Library'),
('10082', 'Kavinda', 'Silva', '1985-06-18', '0772083710', 'No.90, Galle Road, Morathuwa.', 'Kandy Public Library'),
('10083', 'Shashi', 'Perera', '1969-12-08', '0705372391', 'No.80, New Chetty Street, Colombo.', 'Kandy Public Library'),
('10084', 'Kaveesha', 'Gimhan', '1991-07-13', '0770049539', 'No.67, Matara Road, Akurala.', 'Kandy Public Library - Branch 01'),
('10085', 'Supuni', 'Silva', '1979-01-19', '0772511313', 'No.70, 2nd Cross Street, Nugegoda.', 'Kandy Public Library - Branch 01'),
('10086', 'Avishka', 'Dimesh', '1986-12-07', '0706183210', 'No.101, Jampettah Street, Wellawathha.', 'Kandy Public Library - Branch 01'),
('10087', 'Nathasha', 'Perera', '1966-08-24', '0725089686', 'No.89, Galle Road, Morathuwa.', 'Kandy Public Library - Branch 01'),
('10088', 'Jagath', 'Perera', '1995-01-26', '0771842283', 'No.78, 1st Cross Street, Matara.', 'Kandy Public Library - Branch 01'),
('10089', 'Kasun', 'Chamara', '1967-02-19', '0728718120', 'No.90/B,  Bloemendhal Road, Welawattha.', 'Kandy Public Library - Branch 01'),
('10090', 'Shiranthi', 'De Silva', '1972-04-15', '0774899125', 'No.15/A, Maliban Street, Rathmalana.', 'Kandy Public Library - Branch 01'),
('10091', 'Chalith', 'Rathnayaka', '1988-06-16', '0729030433', 'No.9,RamaKrishna Road, Wallawathha.', 'Kandy Public Library - Branch 01'),
('10092', 'Binari', 'Wasana', '1974-08-15', '0774004362', 'No.23/A, Matara Road, Akurassa.', 'Kandy Public Library - Branch 01'),
('10093', 'Dimesh', 'Silva', '1966-05-28', '0773678401', 'No.35, Galle Road, Matara.', 'Kandy Public Library - Branch 01'),
('10094', 'Praneeth', 'Zoysa', '1970-11-04', '0772867446', 'No.9, Maha Widiya, Kandy.',  'Kandy Public Library - Branch 01'),
('10095', 'Chalana', 'Alwis', '1981-12-04', '0700385714', 'No.10/2, Jampettah Street, Colombo.', 'Kandy Public Library - Branch 01'),
('10096', 'Kasun', 'De Silva', '1988-08-26', '0776420139', 'No.12, 3rd Cross Lane, Homagama.', 'Kandy Public Library - Branch 02'),
('10097', 'Anushka', 'Rathnayaka', '1969-08-27', '0779918443', 'No.24/B, Robert De Silva Road, Aluthgama.', 'Kandy Public Library - Branch 02'),
('10098', 'Thilini', 'De Silva', '1975-09-15', '0777345629', 'No.65, Galle Road, Matara.', 'Kandy Public Library - Branch 02'),
('10099', 'Naduni', 'Dharmasena', '1994-10-09', '0705652727', 'No.90, Kahaduwa Road, Kegalle.', 'Kandy Public Library - Branch 02'),
('10100', 'Madush', 'Chanaka', '1970-12-01', '0706434165', 'No.70, Pitipna North, Homagama.', 'Kandy Public Library - Branch 02'),
('10101', 'Chathu', 'Alwis', '1991-11-02', '0709407437', 'No.10/3, New Road, AluthGama.', 'Kandy Public Library - Branch 02'),
('10102', 'Nayomi', 'Chamika', '1995-12-06', '0702159471', 'No.23, New Chetty Road, Colombo.', 'Kandy Public Library - Branch 02'),
('10103', 'Amanda', 'Dilrukshi', '1996-04-27', '0775512851', 'No.67, Colloege Lane, Iduruwa.', 'Kandy Public Library - Branch 02'),
('10104', 'Nemesh', 'Zoysa', '1995-01-19', '0774695671', 'No.90/3, Anagarika Dharmapala Road, Matara.', 'Kandy Public Library - Branch 02'),
('10105', 'Fathima', 'Mohomad', '1972-06-21', '0771192556', 'No.67, Galle Road, Morathuwa.', 'Kandy Public Library - Branch 02'),
('10106', 'shivi', 'Prabashwsari', '1969-08-13', '0776105556', 'No.67, Sea Road, Wellawathha.', 'Kandy Public Library - Branch 02'),
('10107', 'Sandun', 'De Silva', '1971-06-29', '0726603198', 'No.6, Galle Road, Morathuwa.', 'Kandy Public Library - Branch 02');
SELECT * FROM Employee;
--//creating table to store details about designations and the employees.
CREATE TABLE Designation(
    emp_id CHAR(5) NOT NULL,
    designation VARCHAR(50) NOT NULL,
    CONSTRAINT designation_pk_emp_id_designation PRIMARY KEY(emp_id),
    CONSTRAINT designation_fk_emp_id FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);
--//inserting sample records for the designation table.
INSERT INTO Designation
VALUES
('10000', 'Librarian'),
('10001', 'Library Technician'),
('10002', 'Library Assistant'),
('10003', 'Public Relations Specialist'),
('10004', 'Administrative Services Manager'),
('10005', 'Computer Support Specialist'),
('10006', 'Janitor'),
('10007', 'Library Security Guard'),
('10008', 'Library Assistant'),
('10009', 'Library Assistant'),
('10010', 'Janitor'),
('10011', 'Janitor'),
('10012', 'Librarian'),
('10013', 'Library Technician'),
('10014', 'Library Assistant'),
('10015', 'Public Relations Specialist'),
('10016', 'Administrative Services Manager'),
('10017', 'Computer Support Specialist'),
('10018', 'Janitor'),
('10019', 'Library Security Guard'),
('10020', 'Library Assistant'),
('10021', 'Library Assistant'),
('10022', 'Janitor'),
('10023', 'Janitor'),
('10024', 'Librarian'),
('10025', 'Library Technician'),
('10026', 'Library Assistant'),
('10027', 'Public Relations Specialist'),
('10028', 'Administrative Services Manager'),
('10029', 'Computer Support Specialist'),
('10030', 'Janitor'),
('10031', 'Library Security Guard'),
('10032', 'Library Assistant'),
('10033', 'Library Assistant'),
('10034', 'Janitor'),
('10035', 'Janitor'),
('10036', 'Librarian'),
('10037', 'Library Technician'),
('10038', 'Library Assistant'),
('10039', 'Public Relations Specialist'),
('10040', 'Administrative Services Manager'),
('10041', 'Computer Support Specialist'),
('10042', 'Janitor'),
('10043', 'Library Security Guard'),
('10044', 'Library Assistant'),
('10045', 'Library Assistant'),
('10046', 'Janitor'),
('10047', 'Janitor'),
('10048', 'Librarian'),
('10049', 'Library Technician'),
('10050', 'Library Assistant'),
('10051', 'Public Relations Specialist'),
('10052', 'Administrative Services Manager'),
('10053', 'Computer Support Specialist'),
('10054', 'Janitor'),
('10055', 'Library Security Guard'),
('10056', 'Library Assistant'),
('10057', 'Library Assistant'),
('10058', 'Janitor'),
('10059', 'Janitor'),
('10060', 'Librarian'),
('10061', 'Library Technician'),
('10062', 'Library Assistant'),
('10063', 'Public Relations Specialist'),
('10064', 'Administrative Services Manager'),
('10065', 'Computer Support Specialist'),
('10066', 'Janitor'),
('10067', 'Library Security Guard'),
('10068', 'Library Assistant'),
('10069', 'Library Assistant'),
('10070', 'Janitor'),
('10071', 'Janitor'),
('10072', 'Librarian'),
('10073', 'Library Technician'),
('10074', 'Library Assistant'),
('10075', 'Public Relations Specialist'),
('10076', 'Administrative Services Manager'),
('10077', 'Computer Support Specialist'),
('10078', 'Janitor'),
('10079', 'Library Security Guard'),
('10080', 'Library Assistant'),
('10081', 'Library Assistant'),
('10082', 'Janitor'),
('10083', 'Janitor'),
('10084', 'Librarian'),
('10085', 'Library Technician'),
('10086', 'Library Assistant'),
('10087', 'Public Relations Specialist'),
('10088', 'Administrative Services Manager'),
('10089', 'Computer Support Specialist'),
('10090', 'Janitor'),
('10091', 'Library Security Guard'),
('10092', 'Library Assistant'),
('10093', 'Library Assistant'),
('10094', 'Janitor'),
('10095', 'Janitor'),
('10096', 'Librarian'),
('10097', 'Library Technician'),
('10098', 'Library Assistant'),
('10099', 'Public Relations Specialist'),
('10100', 'Administrative Services Manager'),
('10101', 'Computer Support Specialist'),
('10102', 'Janitor'),
('10103', 'Library Security Guard'),
('10104', 'Library Assistant'),
('10105', 'Library Assistant'),
('10106', 'Janitor'),
('10107', 'Janitor');
SELECT * FROM Designation;
--//creating a tabel to store salary details about each designation.
CREATE TABLE Salary(
    designation VARCHAR(50) NOT NULL,
    salary MONEY NOT NULL,
    CONSTRAINT salary_pk_designation PRIMARY KEY(designation)
);
--//inserting sample records to salry table.
INSERT INTO Salary
VALUES
('Librarian', '62,200'),
('Library Technician', '22,000'),
('Library Assistant', '48,200'),
('Public Relations Specialist', '30,500'),
('Administrative Services Manager', '52,000'),
('Computer Support Specialist', '28,200'),
('Janitor', '10,200'),
('Library Security Guard', '13,000');
SELECT * FROM Salary;
--//creating a table to store details about books.
CREATE TABLE Book(
    ISBN VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    title VARCHAR(100) NOT NULL,
    number_of_pages VARCHAR(5),
    number_of_copies VARCHAR(5) NOT NULL,
    CONSTRAINT book_pk_ISBN PRIMARY KEY (ISBN)
);
--//adding sample records to books table.
INSERT INTO Book
VALUES
('B00GN4TJ0Y', 'Business & Investing', 'Think and Grow Rich', '683', '2'),
('9562915646', 'Business & Investing', 'Richest Man in Babylon', '540', '3'),
('8576840626', 'Business & Investing', 'Os 7 Hábitos das Pessoas Altamente Eficazes', '390', '1'),
('1978691696', 'Business & Investing', 'Rich Dad Poor Dad: 20th Anniversary Edition', '763', '3'),
('0385314647', 'Computers & Technology', 'What Your Fifth Grader Needs to Know : Fundamentals of a Good - Fifth Grade Education', '505', '3'),
('0141034599', 'Computers & Technology', 'The Black Swan: The Impact of the Highly Improbable', '384', '2'),
('1451648545', 'Computers & Technology', 'Steve Jobs', '680', '3'),
('0131101633 ', 'Computers & Technology', 'The C Programming Language', '490', '3'),
('0385486804', 'Education & Reference', 'Into the Wild', '290', '2'),
('0743247531', 'Education & Reference', 'The Glass Castle : A Memoir', '504', '2'),
('0590402331', 'Education & Reference', 'If You Give a Mouse a Cookie', '385', '1'),
('0307454541', 'Education & Reference', 'The Girl with the Dragon Tattoo', '670', '3'),
('014039012X', 'History', 'Narrative of the Life of Frederick Douglass, an American Slave', '500', '3'),
('0385663552', 'History', 'A Short History of Nearly Everything, Illustrated Edition', '420', '3'),
('0679751521', 'History', 'Midnight in the Garden of Good and Evil: A Savannah Story', '345', '2'),
('1979228736', 'History', 'The Odyssey', '680', '1'),
('1631595814', 'Science & Maths', 'Creative Coding in Python : 30+ Programming Projects in Art, Games, and More', '600', '3'),
('1593275226', 'Science & Maths', 'Build Your Own Website : A Comic Guide to HTML, CSS, and WordPress', '512', '1'),
('1465473610', 'Science & Maths', 'Coding Games in Python', '760', '2'),
('006247250X', 'Science & Maths', 'Girl Code : Gaming, Going Viral, and Getting It Done', '590', '2');
SELECT * FROM Book;
--//creating a table to store details about book copies. one book may have several copies.
CREATE TABLE Book_Copy(
    copy_no CHAR(5) NOT NULL,
    copy_price MONEY NOT NULL,
    ISBN VARCHAR(50) NOT NULL,
    CONSTRAINT book_copy_pk_copy_no PRIMARY KEY (copy_no),
    CONSTRAINT book_copy_fk_ISBN FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);
--//inserting sample records to book copy table.
INSERT INTO Book_Copy
VALUES
('81555', '2,500', 'B00GN4TJ0Y'),
('13742', '2,500', 'B00GN4TJ0Y'),
('56541', '1,890', '9562915646'),
('53318', '1,890', '9562915646'),
('30560', '1,890', '9562915646'),
('83547', '2,400', '8576840626'),
('29373', '3,100', '1978691696'),
('10754', '3,100', '1978691696'),
('64029', '1,450', '0385314647'),
('82317', '1,450', '0385314647'),
('72178', '1,450', '0385314647'),
('84138', '2,000', '0141034599'),
('31488', '2,000', '0141034599'),
('93303', '1,780', '1451648545'),
('03900', '1,780', '1451648545'),
('36081', '1,780', '1451648545'),
('39642', '890', '0131101633'),
('48160', '890', '0131101633'),
('45778', '890', '0131101633'),
('60350', '1,100', '0385486804'),
('92200', '1,100', '0385486804'),
('66635', '900', '0743247531'),
('02655', '900', '0743247531'),
('59404', '900', '0590402331'),
('08826', '1,500', '0307454541'),
('32119', '1,500', '0307454541'),
('96640', '1,500', '0307454541'),
('15271', '800', '014039012X'),
('06381', '800', '014039012X'),
('04607', '800', '014039012X'),
('12674', '2,000', '0385663552'),
('66938', '2,000', '0385663552'),
('97498', '2,000', '0385663552'),
('92595', '750', '0679751521'),
('83393', '750', '0679751521'),
('69658', '2,400', '1979228736'),
('41898', '1,560', '1631595814'),
('18087', '1,560', '1631595814'),
('94676', '1,560', '1631595814'),
('24680', '3,100', '1593275226'),
('59772', '780', '1465473610'),
('81306', '780', '1465473610'),
('25294', '1,890', '006247250X'),
('08975', '1,890', '006247250X');
SELECT * FROM Book_Copy;
--//creating a table to store details about book authors.
CREATE TABLE Book_Author(
    ISBN VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL,
    CONSTRAINT book_author_fk_ISBN FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);
--//inserting sample records to book author table.
INSERT INTO Book_Author
VALUES
('B00GN4TJ0Y', 'Napoleon Hill'),
('9562915646', 'George S. Clason'),
('8576840626', 'Stephen R. Covey'),
('1978691696', 'Robert T. Kiyosaki'),
('0385314647', 'Core Knowledge Foundation'),
('0141034599', 'Nassim Nicholas Taleb'),
('1451648545', 'Walter Isaacson'),
('0131101633', 'Dennis M. Ritchie '),
('0131101633', 'Brian W. Kernighan'),
('0385486804', 'Jon Krakauer'),
('0743247531', 'Jeannette Walls'),
('0590402331', 'Laura Joffe Numeroff'),
('0307454541', 'Stieg Larsson'),
('014039012X', 'Frederick Douglass'),
('0385663552', 'Bill Bryson'),
('0679751521', 'John Berendt'),
('1979228736', 'Homer'),
('1631595814', 'Sheena Vaidyanathan'),
('1593275226', 'Kim Gee '),
('1593275226', 'Nate Cooper'),
('1465473610', 'D.K. Publishing'),
('006247250X', 'Andrea Gonzales '),
('006247250X', 'Sophie Houser');
SELECT * FROM Book_Author; 
--//creating a table to store details about the online readabilty facility status of each book.
CREATE TABLE Book_Online_Readability(
    ISBN VARCHAR(50) NOT NULL,
    readability_status VARCHAR(20) NOT NULL,
    CONSTRAINT book_online_readabilty_pk_ISBN PRIMARY KEY (ISBN),
    CONSTRAINT book_online_readabilty_fk_ISBN FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);
--//inserting sample status records to book online readabilty table.
INSERT INTO Book_Online_Readability
VALUES
('B00GN4TJ0Y', 'Available'),
('9562915646', 'Not Available'),
('8576840626', 'Available'),
('1978691696', 'Available'),
('0385314647', 'Not Available'),
('0141034599', 'Available'),
('1451648545', 'Not Available'),
('0131101633 ', 'Available'),
('0385486804', 'Available'),
('0743247531', 'Available'),
('0590402331', 'Not Available'),
('0307454541', 'Not Available'),
('014039012X', 'Not Available'),
('0385663552', 'Available'),
('0679751521', 'Not Available'),
('1979228736', 'Available'),
('1631595814','Not Available'),
('1593275226', 'Available'),
('1465473610', 'Not Available'),
('006247250X', 'Available');
SELECT * FROM Book_Online_Readability;
--//creating a table to store details about locations where books are available.
CREATE TABLE Book_Copy_Location(
    copy_no CHAR(5) NOT NULL,
    copy_location VARCHAR(50) NOT NULL,
    CONSTRAINT book_copy_location_fk_copy_no FOREIGN KEY (copy_no) REFERENCES Book_Copy(copy_no),
    CONSTRAINT book_copy_location_fk_copy_location FOREIGN KEY (copy_location) REFERENCES Library(library_name)
);
--//inserting sample records to book location table.
INSERT INTO Book_Copy_Location
VALUES
('81555', 'Negombo Public Library'),
('13742', 'Colombo Public Library - Branch 01'),
('56541', 'Colombo Public Library'),
('53318', 'Kandy Public Library'),
('30560', 'Colombo Public Library'),
('83547', 'Kandy Public Library'),
('29373', 'Kandy Public Library - Branch 01'),
('10754', 'Colombo Public Library - Branch 02'),
('64029', 'Colombo Public Library - Branch 02'),
('82317', 'Colombo Public Library - Branch 01'),
('72178', 'Kandy Public Library'),
('84138', 'Negombo Public Library'),
('31488', 'Negombo Public Library - Branch 01'),
('93303', 'Kandy Public Library - Branch 02'),
('03900', 'Colombo Public Library'),
('36081', 'Kandy Public Library - Branch 01'),
('39642', 'Colombo Public Library'),
('48160', 'Colombo Public Library - Branch 02'),
('45778', 'Colombo Public Library - Branch 02'),
('60350', 'Negombo Public Library - Branch 02'),
('92200', 'Kandy Public Library'),
('66635', 'Kandy Public Library'),
('02655', 'Kandy Public Library'),
('59404', 'Colombo Public Library - Branch 02'),
('08826', 'Negombo Public Library'),
('32119', 'Kandy Public Library - Branch 02'),
('96640', 'Negombo Public Library - Branch 02'),
('15271', 'Kandy Public Library'),
('06381', 'Colombo Public Library - Branch 01'),
('04607', 'Colombo Public Library'),
('12674', 'Kandy Public Library - Branch 01'),
('66938', 'Kandy Public Library - Branch 02'),
('97498', 'Colombo Public Library'),
('92595', 'Kandy Public Library - Branch 02'),
('83393', 'Negombo Public Library - Branch 01'),
('69658', 'Colombo Public Library - Branch 01'),
('41898', 'Colombo Public Library'),
('18087', 'Negombo Public Library - Branch 02'),
('94676', 'Colombo Public Library - Branch 01'),
('24680', 'Kandy Public Library - Branch 01'),
('59772', 'Colombo Public Library - Branch 02'),
('81306', 'Negombo Public Library - Branch 01'),
('25294', 'Colombo Public Library'),
('08975', 'Negombo Public Library');
SELECT * FROM Book_Copy_Location;
--//creating a table to store details about book and where the book is availble.
CREATE TABLE Book_Library_Info(
    ISBN VARCHAR(50) NOT NULL,
    library_name VARCHAR(50) NOT NULL,
    CONSTRAINT book_library_info_pk_ISBN_library_name PRIMARY KEY (ISBN, library_name),
    CONSTRAINT book_library_info_fk_ISBN FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
    CONSTRAINT book_library_info_fk_library_name FOREIGN KEY (library_name) REFERENCES Library(library_name)
);
--//adding sample records to book library info table.
INSERT INTO Book_Library_Info
VALUES
('B00GN4TJ0Y', 'Negombo Public Library'),
('B00GN4TJ0Y', 'Colombo Public Library - Branch 01'),
('9562915646', 'Colombo Public Library'),
('9562915646', 'Kandy Public Library'),
('8576840626', 'Kandy Public Library'),
('1978691696', 'Kandy Public Library - Branch 01'),
('1978691696', 'Colombo Public Library - Branch 02'),
('0385314647', 'Colombo Public Library - Branch 01'),
('0385314647', 'Colombo Public Library - Branch 02'),
('0385314647', 'Kandy Public Library'),
('0141034599', 'Negombo Public Library'),
('0141034599', 'Negombo Public Library - Branch 01'),
('1451648545', 'Colombo Public Library'),
('1451648545', 'Kandy Public Library - Branch 01'),
('1451648545', 'Kandy Public Library - Branch 02'),
('0131101633', 'Colombo Public Library'),
('0131101633', 'Colombo Public Library - Branch 02'),
('0385486804', 'Kandy Public Library'),
('0385486804', 'Negombo Public Library - Branch 02'),
('0743247531', 'Kandy Public Library'),
('0590402331', 'Colombo Public Library - Branch 02'),
('0307454541', 'Kandy Public Library - Branch 02'),
('0307454541', 'Negombo Public Library'),
('0307454541', 'Negombo Public Library - Branch 02'),
('014039012X', 'Colombo Public Library'),
('014039012X', 'Colombo Public Library - Branch 01'),
('014039012X', 'Kandy Public Library'),
('0385663552', 'Colombo Public Library'),
('0385663552', 'Kandy Public Library - Branch 01'),
('0385663552', 'Kandy Public Library - Branch 02'),
('0679751521', 'Kandy Public Library - Branch 02'),
('0679751521', 'Negombo Public Library - Branch 01'),
('1979228736', 'Colombo Public Library - Branch 01'),
('1631595814', 'Colombo Public Library'),
('1631595814', 'Colombo Public Library - Branch 01'),
('1631595814', 'Negombo Public Library - Branch 02'),
('1593275226', 'Kandy Public Library - Branch 01'),
('1465473610', 'Colombo Public Library - Branch 02'),
('1465473610', 'Negombo Public Library - Branch 01'),
('006247250X', 'Colombo Public Library'),
('006247250X', 'Negombo Public Library');
SELECT * FROM Book_Library_Info;
--//creating table to store details about borrowers.
CREATE TABLE Borrower(
    id_code CHAR(5) NOT NULL,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    NIC_no CHAR(10) NOT NULL,
    phone_no CHAR(10),
    borrower_address VARCHAR(100) NOT NULL,
    number_of_borrowed_books VARCHAR(2) NOT NULL,
    borrow_limit VARCHAR(2) NOT NULL,
    issued_date DATE NOT NULL,
    returned_date VARCHAR(20) DEFAULT 'NOT RETURNED YET',
    max_borrow_days VARCHAR(2) NOT NULL,
    fine_per_day MONEY NOT NULL,
    CONSTRAINT borrower_pk_id_code PRIMARY KEY (id_code),
    CONSTRAINT borrower_unique_nic_no UNIQUE (NIC_no)
);
--//inserting sample records to borrower table.
INSERT INTO Borrower
VALUES
('24746', 'Kavidu', 'Lakshan', '1979-05-11', '527660384V', '0770660937', 'No.505, 1st Lane, Colombo 4.', '1', '1', '2018-12-11', '2019-01-27', '14', '20'),
('66254', 'Deepashika', 'Ariyadasa', '2002-12-03', '628440254V', '0703654869', 'No.38, Minuwangoda Road, Negombo.', '2', '2', '2020-12-03', '2021-01-03', '14', '20'),
('14813', 'Kasun', 'Fernando', '1996-04-29', '390235800V', '0779486461', 'No.78/2, Ward Place, Colombo 7.', '1', '1', '2018-12-29', '2019-01-28', '14', '20'),
('80169', 'Bhanuka', 'Gunasekara', '1987-04-20', '486827958V', '0775852602', 'No.6/B, Dalada Vidiya, Kandy.', '1', '3', '2020-12-20', '2021-01-20', '14', '20'),
('96686', 'Kavindya', 'Swarnamali', '2000-10-07', '666436721V', '0704452279', 'No.56, Paliament Road, Sri jayawardhanapura.', '2', '2', '2020-10-07', '2021-01-08', '14', '20'),
('74589', 'Kawya', 'Peries', '1963-03-24', '374036687V', '0778195345', 'No.6, Maha Vidiya, Kandy', '1', '1', '2020-12-24', '2021-01-10', '14', '20'),
('21558', 'Shenuka', 'Fernando', '1975-08-23', '021289554V', '0722794775', 'No.56, Mangala Rd, Negombo.', '2', '3', '2018-12-23', '2019-01-11', '14', '20');
INSERT INTO Borrower (id_code, fname, lname, date_of_birth, NIC_no, phone_no, borrower_address, number_of_borrowed_books, borrow_limit, issued_date, max_borrow_days, fine_per_day)
VALUES
('49491', 'Deshan', 'De Silva', '2000-11-07', '886960420V', '0702465768', 'No.6, Colombo Road, Negombo.', '1', '3', '2020-11-07', '14', '20'),
('13557', 'Amal', 'Ariyadasa', '1962-05-28', '659116501V', '0775339245', 'No.7, Union Place, Colombo 7.', '1', '1', '2020-12-28', '14', '20'),
('67089', 'Kamani', 'Gunasekara', '1992-08-11', '280957928V', '0774703800', 'No.107/A, Union Place, Colombo 7.', '3', '3', '2020-12-11', '14', '20'),
('75030', 'Sirimal', 'Rajapaksha', '1974-05-17', '341675441V', '0779561367', 'No.68, Galle Rd, Colombo 4.', '1', '2', '2020-12-17', '14', '20'),
('66219', 'Ayesh', 'Gunathilake', '1964-06-28', '628131913V', '0771506160', 'No.90, Ward Place, Colombo 3.', '1', '1', '2020-12-28', '14', '20');
--//creating a table to store details about book copies which are borrowerd by the borrower.
CREATE TABLE Borrower_Book_Copy(
    id_code CHAR(5) NOT NULL,
    copy_no CHAR(5) NOT NULL,
    CONSTRAINT borrower_book_copy_pk_id_code PRIMARY KEY (copy_no),
    CONSTRAINT borrower_book_copy_fk_id_code FOREIGN KEY (id_code) REFERENCES Borrower(id_code),
    CONSTRAINT borrower_book_copy_fk_copy_no FOREIGN KEY (copy_no) REFERENCES Book_Copy(copy_no)
);
--//inserting sample records to borrower book copy table.
INSERT INTO Borrower_Book_Copy
VALUES
('24746', '03900'),
('66254', '84138'),
('66254', '08975'),
('14813', '06381'),
('80169', '24680'),
('96686', '13742'),
('96686', '25294'),
('74589', '12674'),
('21558', '31488'),
('21558', '81555'),
('49491', '08826'),
('13557', '04607'),
('67089', '59772'),
('75030', '59404'),
('66219', '10754');
SELECT * FROM Borrower_Book_Copy;
--//creating a table to store details about the dependent of the borrower. borrower can have only one dependent.
CREATE TABLE Borrower_Dependent(
    borrower_id_code CHAR(5) NOT NULL,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    NIC_no CHAR(10),
    phone_no CHAR(10) NOT NULL,
    dependent_address VARCHAR(100),
    CONSTRAINT borrower_dependent_unique_nic_no UNIQUE (NIC_no),
    CONSTRAINT borrower_dependent_fk_id_code FOREIGN KEY (borrower_id_code) REFERENCES Borrower(id_code)
);
--//inserting sample records to dependent table of the borrower.
INSERT INTO Borrower_Dependent
VALUES
('21558', 'Nethmi', 'Kavindya', '683259730V', '0724388778', 'No.56, Mangala Rd, Negombo.'),
('67089', 'Nimesh', 'De Silva', '409083243V', '0708131091', 'No.107/A, Union Place, Colombo 7.'),
('75030', 'Sandaru', 'Fernando', '045007427V', '0728944574', 'No.68, Galle Rd, Colombo 4.'),
('74589', 'Udeshi', 'Hansika', '378878992V', '0772895957', 'No.6, Maha Vidiya, Kandy'),
('14813', 'Sachini', 'Zoysa', '690378825V', '0775287191', 'No.78/2, Ward Place, Colombo 7.'),
('80169', 'Bawantha', 'Sandaruwan', '590148380V', '0771688853', 'No.6/B, Dalada Vidiya, Kandy.'),
('24746', 'Himashi', 'De Silva', '374443662V', '0726487915', 'No.505, 1st Lane, Colombo 4.'),
('66219', 'Chandani', 'Perera', '320088095V', '0702977281', 'No.90, Ward Place, Colombo 3.'),
('66254', 'Sarath', 'Perera', '111577609V', '0727360139', 'No.38, Minuwangoda Road, Negombo.'),
('13557', 'Kasun', 'Jayasekara', '493831168V', '0771053684', 'No.7, Union Place, Colombo 7.'),
('96686', 'Prasanna', 'Zoysa', '518557562V', '0722105872', 'No.56, Paliament Road, Sri jayawardhanapura.'),
('49491', 'Shiranthi', 'De silva', '454016626V', '0770265513', 'No.6, Colombo Road, Negombo.'); 
SELECT * FROM Borrower_Dependent;

------------------------------------------------------------------------------Store Procedures,Triggers, Views and User Define Functions--------------------------------------------------------------------------------------
--//creating another employee table to store existing records when it's deleted from the original table.
CREATE TABLE Deleted_Employee(
    emp_id CHAR(5) NOT NULL,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    phone_no CHAR(10),
    emp_address VARCHAR(100),
    library_name VARCHAR(50) NOT NULL,
    CONSTRAINT deleted_employee_pk_emp_id PRIMARY KEY (emp_id)
);
--//creating another designation table to store existing records when it's deleted from the original table.
CREATE TABLE Deleted_Designation(
    emp_id CHAR(5) NOT NULL,
    designation VARCHAR(50) NOT NULL,
    CONSTRAINT deleted_designation_pk_emp_id PRIMARY KEY (emp_id)
);
--//this procedure will delete the employee from the employee table when the employee id is passed into it.
GO
CREATE PROCEDURE Delete_Employee (@emp_id CHAR(5))
AS
BEGIN
DELETE FROM Designation
WHERE emp_id = @emp_id
DELETE FROM Employee
WHERE emp_id = @emp_id
PRINT ''+@emp_id+' employee details have been deleted successfully!'
END;
--//this trigger will fire after an employee record is deleted from the employee table and insert the deleted records to the new table.
GO
CREATE TRIGGER Employee_Deletion
ON Employee
AFTER DELETE
AS
BEGIN
INSERT INTO Deleted_Employee
SELECT * FROM deleted
SELECT * FROM Deleted_Employee
END;
--//this trigger will fire after a designation record is deleted from the designation table and insert the deleted records to the new table.
GO
CREATE TRIGGER Designation_Deletion
ON Designation
AFTER DELETE
AS
BEGIN
INSERT INTO Deleted_Designation
SELECT * FROM deleted
SELECT * FROM Deleted_Designation
END;
--//creating another book table to store existing records when it's deleted from the original table.
GO
CREATE TABLE Deleted_Book(
    ISBN VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    title VARCHAR(100) NOT NULL,
    number_of_pages VARCHAR(5),
    number_of_copies VARCHAR(5) NOT NULL,
    CONSTRAINT deleted_book_pk_ISBN PRIMARY KEY (ISBN)
);
--//creating another book copy table to store existing records when it's deleted from the original table.
CREATE TABLE Deleted_Book_Copy(
    copy_no CHAR(5) NOT NULL,
    copy_price MONEY NOT NULL,
    ISBN VARCHAR(50) NOT NULL,
    CONSTRAINT deleted_book_copy_pk_copy_no PRIMARY KEY (copy_no)
);
--//creating another book author table to store existing records when it's deleted from the original table.
CREATE TABLE Deleted_Book_Author(
    ISBN VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL
);
--//creating another online book readability facility status table to store existing records when it's deleted from the original table.
CREATE TABLE Deleted_Book_Online_Readability(
    ISBN VARCHAR(50) NOT NULL,
    readability_status VARCHAR(20) NOT NULL,
    CONSTRAINT deleted_book_online_readability_copy_pk_isbn PRIMARY KEY (ISBN)
);
--//creating another book copy location table to store existing records when it's deleted from the original table.
CREATE TABLE Deleted_Book_Copy_Location(
    copy_no CHAR(5) NOT NULL,
    copy_location VARCHAR(50) NOT NULL,
    CONSTRAINT deleted_book_copy_location_pk_copy_no PRIMARY KEY (copy_no)
);
--//creating another book library info table to store existing records when it's deleted from the original table.
CREATE TABLE Deleted_Book_Library_Info(
    ISBN VARCHAR(50) NOT NULL,
    library_name VARCHAR(50) NOT NULL,
    CONSTRAINT deleted_book_copy_pk_isbn_library_name PRIMARY KEY (ISBN, library_name)
);
--//this procedure will delete the book from the book table when the isbn is passed into it.
GO
CREATE PROCEDURE Delete_Book (@ISBN VARCHAR(50))
AS
BEGIN
DECLARE @count VARCHAR(2)
SELECT @count = COUNT(*) FROM Borrower_Book_Copy
JOIN Book_Copy
ON Borrower_Book_Copy.copy_no = Book_Copy.copy_no
WHERE Book_Copy.ISBN = @ISBN
DECLARE @count2 VARCHAR(2)
SELECT @count2 = COUNT(*) FROM Book
WHERE Book.ISBN = @ISBN
IF @count2 > 0 --//this line checks whether there's a book in the table or not according to the passed isbn.
BEGIN
IF @count = 0 --//this line of code checks whether any borrower has borrowed any of the copies according to the passed isbn.
BEGIN
DELETE FROM Book_Copy_Location
WHERE Book_Copy_Location.copy_no IN (SELECT Book_Copy.copy_no FROM Book_Copy WHERE Book_Copy.ISBN = @ISBN)
DELETE FROM Book_Copy
WHERE Book_Copy.ISBN = @ISBN
DELETE FROM Book_Author
WHERE Book_Author.ISBN = @ISBN
DELETE FROM Book_Online_Readability
WHERE Book_Online_Readability.ISBN = @ISBN
DELETE FROM Book_Library_Info
WHERE Book_Library_Info.ISBN = @ISBN
DELETE FROM Book
WHERE Book.ISBN = @ISBN
PRINT ''+@ISBN+' book details have been deleted successfully!'
END
ELSE
BEGIN
PRINT 'You can''t delete '+@ISBN+' Book, because a borrower has been borrowed the book. Wait until the borrower returns it!'
END
END
ELSE
BEGIN
PRINT 'The '+@ISBN+' book doesn''t exist in the database, therefore you can''t delete it!'
END
END;
--//this trigger will fire when a book library info records is deleted from the original table and insert the deleted records to the new table.
GO
CREATE TRIGGER Book_Library_Info_Deletion
ON Book_Library_Info
AFTER DELETE
AS
BEGIN
INSERT INTO Deleted_Book_Library_Info
SELECT * FROM deleted
SELECT * FROM Deleted_Book_Library_Info
END;
--//this trigger will fire a the book record is deleted from the original table and insert the deleted records to the new table.
GO
CREATE TRIGGER Book_Deletion
ON Book
AFTER DELETE
AS
BEGIN
INSERT INTO Deleted_Book
SELECT * FROM deleted
SELECT * FROM Deleted_Book
END;
--//this trigger will fire a the book copy record is deleted from the original table and insert the deleted records to the new table.
GO
CREATE TRIGGER Book_Copy_Deletion
ON Book_Copy
AFTER DELETE
AS
BEGIN
INSERT INTO Deleted_Book_Copy
SELECT * FROM deleted
SELECT * FROM Deleted_Book_Copy
END;
--//this trigger will fire when a book author record is deleted from the original table and insert the deleted records to the new table.
GO
CREATE TRIGGER Book_Author_Deletion
ON Book_Author
AFTER DELETE
AS
BEGIN
INSERT INTO Deleted_Book_Author
SELECT * FROM deleted
SELECT * FROM Deleted_Book_Author
END;
--//this trigger will fire when a online book redability facility status record is deleted from the original table and insert the deleted records to the new table.
GO
CREATE TRIGGER Book_Online_Readability_Deletion
ON Book_Online_Readability
AFTER DELETE
AS
BEGIN
INSERT INTO Deleted_Book_Online_Readability
SELECT * FROM deleted
SELECT * FROM Deleted_Book_Online_Readability
END;
--//this trigger will fire when a book copylocation record is deleted from the original table and insert the deleted records to the new table.
GO
CREATE TRIGGER Book_Copy_Location_Deletion
ON Book_Copy_Location
AFTER DELETE
AS
BEGIN
INSERT INTO Deleted_Book_Copy_Location
SELECT * FROM deleted
SELECT * FROM Deleted_Book_Copy_Location
END;
GO
EXEC Delete_Book @ISBN = '0743247531';
--//creating new table to store records when a record from the borrower table is deleted.
GO
CREATE TABLE Deleted_Borrower(
    id_code CHAR(5) NOT NULL,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    NIC_no CHAR(10) NOT NULL,
    phone_no CHAR(10),
    borrower_address VARCHAR(100) NOT NULL,
    number_of_borrowed_books VARCHAR(2) NOT NULL,
    borrow_limit VARCHAR(2) NOT NULL,
    issued_date DATE NOT NULL,
    returned_date VARCHAR(20),
    max_borrow_days VARCHAR(2) NOT NULL,
    fine_per_day MONEY NOT NULL,
    CONSTRAINT deleted_borrower_pk_id_code PRIMARY KEY (id_code),
    CONSTRAINT deleted_borrower_unique_nic_no UNIQUE (NIC_no)
);
--//creating new table to store records when a record from the borrower book copy table is deleted.
CREATE TABLE Deleted_Borrower_Book_Copy(
    id_code CHAR(5) NOT NULL,
    copy_no CHAR(5) NOT NULL,
    CONSTRAINT deleted_borrower_pk_copy_no PRIMARY KEY (copy_no)
);
--//creating new table to store records when a record from the borrower dependent table is deleted.
CREATE TABLE Deleted_Borrower_Dependent(
    borrower_id_code CHAR(5) NOT NULL,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    NIC_no CHAR(10),
    phone_no CHAR(10) NOT NULL,
    dependent_address VARCHAR(100),
    CONSTRAINT deleted_borrower_dependent_unique_nic_no UNIQUE (NIC_no)
);
--//this procedure will delete all the borrowers who has not borrowed any book within 1 year from the last returned date. 
--//library doesn't need to keep data of the borrowers who doesn't read anymore and they will be moved to another table.
GO
CREATE PROCEDURE Delete_Borrower
AS
BEGIN
DECLARE @id_code CHAR(5), @current_date_minus_12 VARCHAR(20) = CONVERT(DATE,DATEADD(MONTH, -12, GETDATE())) --//this line of code check the borrowers who hasn't borrowed any book within 1 year from the last returned date. 
SELECT @id_code = id_code
FROM Borrower 
WHERE Borrower.returned_date NOT LIKE 'N%' AND Borrower.returned_date < @current_date_minus_12
DELETE FROM Borrower_Book_Copy
WHERE Borrower_Book_Copy.id_code = @id_code 
DELETE FROM Borrower_Dependent
WHERE Borrower_Dependent.borrower_id_code = @id_code
DELETE FROM Borrower
WHERE Borrower.id_code = @id_code
PRINT ''+@id_code+' borrower details have been deleted successfully!'
END;
--//when a new borrower is inserted to the system, this trigger will fire and call the 'Delete_Borrower' procedure to check the codition and delete the borrower from the original table.
GO
CREATE TRIGGER Call_Delete_Borrower
ON Borrower
AFTER INSERT
AS
BEGIN
DECLARE @index INT
SELECT @index = COUNT(*)
FROM Borrower 
WHERE Borrower.returned_date NOT LIKE 'N%' AND Borrower.returned_date < CONVERT(VARCHAR(20), CONVERT(DATE,DATEADD(MONTH, -12, GETDATE())) )
WHILE (@index != 0)
BEGIN
EXEC Delete_Borrower
SET @index -= 1
END
SELECT * FROM Deleted_Borrower_Dependent
SELECT * FROM Deleted_Borrower_Book_Copy
SELECT * FROM Deleted_Borrower
END;
--//this trigger will fire when a borrower record is deleted from the original table and insert it into another table.
GO
CREATE TRIGGER Borrower_Deletion
ON Borrower
AFTER DELETE
AS
BEGIN
INSERT INTO Deleted_Borrower
SELECT * FROM deleted
END;
--//this trigger will fire when a borrower  book copy is deleted from the original table and insert it into another table.
GO
CREATE TRIGGER Borrower_Book_Copy_Deletion
ON Borrower_Book_Copy 
AFTER DELETE
AS
BEGIN
INSERT INTO Deleted_Borrower_Book_Copy
SELECT * FROM deleted
END;
--//this trigger will fire when a borrower depedent record is deleted from the original table and insert it into another table.
GO
CREATE TRIGGER Borrower_Dependent_Deletion
ON Borrower_Dependent
AFTER DELETE
AS
BEGIN
INSERT INTO Deleted_Borrower_Dependent
SELECT * FROM deleted
END;
--//this insert statement will insert a new borrower to the database and the borrowers who has not borrowed any book whith in 1 year from the last borrow date will be deleted from the original table.
GO
INSERT INTO Borrower (id_code, fname, lname, date_of_birth, NIC_no, phone_no, borrower_address, number_of_borrowed_books, borrow_limit, issued_date, max_borrow_days, fine_per_day)
VALUES
('38921', 'Vimukthi', 'Fernando', '1997-11-07', '970963332V', '0755323456', 'No.34/D, Colombo Road, Negombo.', '1', '1', ''+GETDATE()+'', '14', '20');

--//this view will show the youngest employee out of all the librararies.
GO
CREATE VIEW Show_Employee_Details
AS
SELECT * 
FROM Employee 
WHERE Employee.date_of_birth = (SELECT MAX(Employee.date_of_birth) AS 'date_of_birth' FROM Employee);
GO
SELECT * FROM Show_Employee_Details;
--//this view will show number of employees works in each and every library.
GO
CREATE VIEW Show_Number_Of_Employees
AS
SELECT library_name, COUNT(*) AS 'number_of_employees'
FROM Employee
GROUP BY Employee.library_name;
GO
SELECT * from Show_Number_Of_Employees;
--//this view will show the next month upcoming birthdays of the employees.
GO
CREATE VIEW Show_Next_Birth_Day_Employees
AS
SELECT *
FROM Employee
WHERE MONTH(Employee.date_of_birth ) > MONTH(GETDATE()) AND MONTH(Employee.date_of_birth) < MONTH(GETDATE())+2
ORDER BY MONTH(Employee.date_of_birth), DAY((Employee.date_of_birth)) ASC
OFFSET 0 ROW
GO
SELECT * FROM Show_Next_Birth_Day_Employees ;
--//this view will show the borrowers who has not returned the books to the libraries.
GO
CREATE VIEW Show_Not_Returned_Borrowers
AS
SELECT Borrower.id_code, CONCAT(Borrower.fname, ' ', Borrower.lname) AS 'name' , Borrower.issued_date, Borrower.returned_date, Borrower.max_borrow_days, Borrower.fine_per_day, 
DATEDIFF(DAY, Borrower.issued_date, GETDATE()) - 14 AS 'over_due_days', (DATEDIFF(DAY, Borrower.issued_date, GETDATE()) - 14) * 20 AS 'total_fine_cost',
Book_Copy_Location.copy_location AS 'library_location'
FROM Borrower
JOIN Borrower_Book_Copy
ON Borrower.id_code = Borrower_Book_Copy.id_code
JOIN Book_Copy_Location
ON Book_Copy_Location.copy_no = Borrower_Book_Copy.copy_no
WHERE returned_date LIKE 'N%' AND (DATEDIFF(DAY, issued_date, GETDATE()) - 14) > 0
ORDER BY issued_date
OFFSET 0 ROW
GO
SELECT * FROM Show_Not_Returned_Borrowers;
--//this function will return the average age of an employee.
GO
CREATE FUNCTION Find_Average_Age_Of_Employee()
RETURNS VARCHAR(2)
AS
BEGIN
RETURN(
    SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE()))
    FROM Employee
)
END;
GO
SELECT dbo.Find_Average_Age_Of_Employee() AS 'average_emp_age';
--//this function  will return average salary of an employee.
GO
CREATE FUNCTION Average_Salary()
RETURNS MONEY
AS
BEGIN
RETURN(
    SELECT AVG(salary)
    FROM Salary
)
END;
GO
SELECT dbo.Average_Salary() AS 'average_emp_salary';
--//this function will return number of copies of a given library location.
GO
CREATE FUNCTION Find_No_Of_Copies_Of_A_Location(@lib_name VARCHAR(50))
RETURNS INT
AS
BEGIN
RETURN(
    SELECT COUNT(Book_Copy.copy_no)
    FROM Book_Copy, Book_Copy_Location
    WHERE Book_Copy.copy_no = Book_Copy_Location.copy_no AND Book_Copy_Location.copy_location = @lib_name
    GROUP BY Book_Copy_Location.copy_location
    ORDER BY Book_Copy_Location.copy_location
    OFFSET 0 ROW
)
END;
GO
SELECT dbo.Find_No_Of_Copies_Of_A_Location('Colombo Public Library') AS 'number_of_copies_of_the_location';
--//this view will show the number of books availble in all library loacations.
GO
CREATE VIEW Show_No_Of_Books_Of_A_Location
AS
SELECT Book_Copy_Location.copy_location, COUNT(Book.ISBN) AS 'number_of_books_of_a_location'
FROM Book
JOIN Book_Copy
ON Book_Copy.ISBN = Book.ISBN
JOIN Book_Copy_Location
ON Book_Copy_Location.copy_no = Book_Copy.copy_no
GROUP BY Book_Copy_Location.copy_location
ORDER BY Book_Copy_Location.copy_location
OFFSET 0 ROW
GO
SELECT * FROM Show_No_Of_Books_Of_A_Location;
--//this function will retirn number of books available in a given location.
GO
CREATE FUNCTION Find_No_Of_Books_Of_A_Location(@lib_name VARCHAR(50))
RETURNS INT
AS
BEGIN
RETURN(
    SELECT Show_No_Of_Books_Of_A_Location.number_of_books_of_a_location
    FROM Show_No_Of_Books_Of_A_Location
    WHERE Show_No_Of_Books_Of_A_Location.copy_location = @lib_name
)
END;
GO
SELECT dbo.Find_No_Of_Books_Of_A_Location('Negombo Public Library') AS 'number_of_books_of_the_location';
--//this function will return number of book which doesn't have online readabilty facility.
GO
CREATE FUNCTION Find_No_Readability_Count()
RETURNS INT
AS
BEGIN
RETURN(
    SELECT COUNT(*)
    FROM Book_Online_Readability
    WHERE Book_Online_Readability.readability_status LIKE 'N%'
)
END;
GO
SELECT dbo.Find_No_Readability_Count() AS 'no_online_readabilty_book_count';
--//this function will return the most favorite book.
GO
CREATE FUNCTION Find_Most_Favourite_Book()
RETURNS VARCHAR(100)
AS
BEGIN
RETURN(
    SELECT Book.title
    FROM Book
    WHERE Book.ISBN = (
    SELECT TOP 1 Book_Copy.ISBN
    FROM Borrower_Book_Copy
    JOIN Book_Copy
    ON Book_Copy.copy_no = Borrower_Book_Copy.copy_no
    GROUP BY Book_Copy.ISBN
    HAVING   COUNT(Book_Copy.ISBN) > 1
    ORDER BY COUNT(Book_Copy.ISBN) DESC)
)
END;
--//this function will return the most favorite category.
GO
CREATE FUNCTION Find_Most_Favourite_Category()
RETURNS VARCHAR(20)
AS
BEGIN
RETURN(
    SELECT Book.category
    FROM Book
    WHERE Book.ISBN = (
    SELECT TOP 1 Book_Copy.ISBN
    FROM Borrower_Book_Copy
    JOIN Book_Copy
    ON Book_Copy.copy_no = Borrower_Book_Copy.copy_no
    GROUP BY Book_Copy.ISBN
    HAVING   COUNT(Book_Copy.ISBN) > 1
    ORDER BY COUNT(Book_Copy.ISBN) DESC)
)
END;
GO
SELECT dbo.Find_Most_Favourite_Book() AS 'most_favourite_book';
SELECT dbo.Find_Most_Favourite_Category() AS 'most_favourite_category';
--//this function will return the average price of a book.
GO
CREATE FUNCTION Find_AVG_Book_Price()
RETURNS MONEY
AS
BEGIN
RETURN(
    SELECT AVG(Book_Copy.copy_price)
    FROM Book_Copy
)
END;
GO
SELECT dbo.Find_AVG_Book_Price() AS 'average_book_price';
--//this function will return the total number of borrowers
GO
CREATE FUNCTION Find_No_Of_Borrowers()
RETURNS INT
AS
BEGIN
RETURN(
    SELECT COUNT(Borrower.id_code)
    FROM Borrower
)
END;
GO
SELECT dbo.Find_No_Of_Borrowers() AS 'total_number_of_borrowers'
--//this function will return total number of borrowers in a specific library locaion.
GO
CREATE FUNCTION Find_No_Of_Borrowers_Of_A_Branch(@lib_name VARCHAR(100))
RETURNS INT
AS
BEGIN
RETURN(
    SELECT COUNT(Borrower_Book_Copy.copy_no)
    FROM Book_Copy_Location, Borrower_Book_Copy
    WHERE Book_Copy_Location.copy_no = Borrower_Book_Copy.copy_no AND Book_Copy_Location.copy_location = @lib_name
    GROUP BY Book_Copy_Location.copy_location
)
END;
GO
SELECT dbo.Find_No_Of_Borrowers_Of_A_Branch('Colombo Public Library') AS 'number_of_the_branch';
--//this view will show the average number of borrowers per book.
GO
CREATE VIEW Show_No_Of_Borrower_Per_Book
AS
SELECT Book_Copy.ISBN, COUNT(Book_Copy.ISBN) AS 'number_of_borrowers_for_the_book'
FROM Borrower_Book_Copy, Book_Copy
WHERE Borrower_Book_Copy.copy_no = Book_Copy.copy_no
GROUP BY Book_Copy.ISBN
ORDER BY COUNT(Book_Copy.ISBN) DESC
OFFSET 0 ROW
GO
SELECT AVG(number_of_borrowers_for_the_book) AS 'average_no_of_borrowers_per_book' FROM Show_No_Of_Borrower_Per_Book;
--//this function will return the average age of an borrower.
GO
CREATE FUNCTION Find_AVG_Age_Of_Borrower()
RETURNS INT
AS
BEGIN
RETURN(
    SELECT AVG(DATEDIFF(YEAR, Borrower.date_of_birth, GETDATE()))
    FROM Borrower
)
END;
GO
SELECT dbo.Find_AVG_Age_Of_Borrower() AS 'average_borrower_age';
--//this view will show the best borrower and his/her details.
GO
CREATE VIEW Show_Best_Borrower_Details
AS
SELECT TOP 1 DATEDIFF(DAY, Borrower.issued_date, Borrower.returned_date) AS 'returned_within', *
FROM Borrower
WHERE returned_date NOT LIKE 'N%'
ORDER BY returned_within ASC
GO
SELECT * FROM Show_Best_Borrower_Details;
--//this view will show all the returned days of borrowers including fine payments.
GO
CREATE VIEW Show_Borrower_Returned_Days
AS
SELECT DATEDIFF(DAY, Borrower.issued_date, Borrower.returned_date) AS 'returned_within', *, 
(DATEDIFF(DAY, Borrower.issued_date, Borrower.returned_date)-14) * Borrower.fine_per_day AS 'fine_cost'
FROM Borrower
WHERE returned_date NOT LIKE 'N%'
GO
SELECT * FROM Show_Borrower_Returned_Days
--//this function wiil return the average returned days of a borrower.
GO
CREATE FUNCTION Find_Avg_Returned_Days()
RETURNS INT
AS
BEGIN
RETURN(
    SELECT AVG(Show_Borrower_Returned_Days.returned_within)
    FROM Show_Borrower_Returned_Days
)
END;
GO
SELECT dbo.Find_Avg_Returned_Days() AS 'average_returned_days';
--//this function will return the maximum returned days of a borrower.
GO
CREATE FUNCTION Find_Max_Returned_Days()
RETURNS INT
AS
BEGIN
RETURN(
    SELECT MAX(Show_Borrower_Returned_Days.returned_within)
    FROM Show_Borrower_Returned_Days
)
END;
GO
SELECT dbo.Find_Max_Returned_Days() AS 'max_returned_days';
--//this function will return the average fine payment of a borrower.
GO
CREATE FUNCTION Find_Avg_Fine_Payment()
RETURNS MONEY
AS
BEGIN
RETURN(
    SELECT AVG(Show_Borrower_Returned_Days.fine_cost)
    FROM Show_Borrower_Returned_Days
)
END;
GO
SELECT dbo.Find_Avg_Fine_Payment() AS 'average_fine_payment';
--//this functon will return the maximum fine payment of a borrower.
GO
CREATE FUNCTION Find_Max_Fine_Payement()
RETURNS MONEY
AS
BEGIN
RETURN(
    SELECT MAX(Show_Borrower_Returned_Days.fine_cost)
    FROM Show_Borrower_Returned_Days
)
END;
GO
SELECT dbo.Find_Max_Fine_Payement() AS 'maximum_fine_payment';
--//this function will return number of borrowers who returned within the give period of time.
GO
CREATE FUNCTION Find_Who_Returned_Within()
RETURNS INT
AS
BEGIN
RETURN(
    SELECT COUNT(Show_Borrower_Returned_Days.returned_within)
    FROM Show_Borrower_Returned_Days
    WHERE CONVERT(VARCHAR(3), Show_Borrower_Returned_Days.returned_within) < 14
)
END;
GO
SELECT dbo.Find_Who_Returned_Within() AS 'borrowers_who_returned_within_the_time_period'; 

---------------------------------------------------------------Providing DBMS Presentation Application Privilages------------------------------------------------------------------------------

GO
CREATE TABLE Login_Details(
    library_location VARCHAR(50),
    six_digit_key CHAR(6),
    CONSTRAINT login_details_pk_six_digit_key PRIMARY KEY (six_digit_key),
    CONSTRAINT login_details_pk_library_location FOREIGN KEY (library_location) REFERENCES Library(library_name)
);

INSERT INTO Login_Details
VALUES
('Colombo Public Library', '906888'),
('Colombo Public Library - Branch 01', '979924'),
('Colombo Public Library - Branch 02', '065946'),
('Negombo Public Library', '123456'),
('Negombo Public Library - Branch 01', '100009'),
('Negombo Public Library - Branch 02', '873218'),
('Kandy Public Library', '980823'),
('Kandy Public Library - Branch 01', '001693'),
('Kandy Public Library - Branch 02', '174584');

