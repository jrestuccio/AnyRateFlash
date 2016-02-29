#SQL script for importing the data


SET @source = 'cls';
SET @dest = 'trendfxrates';

insert into CONCAT(@dest,'.',