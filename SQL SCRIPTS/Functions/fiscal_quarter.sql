CREATE DEFINER=`root`@`localhost` FUNCTION `get_fiscal_quarter`(
calendar_date date
) RETURNS char(2) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
Declare m tinyint;
Declare qtr char(2);
set m=Month(calendar_date);
CASE
WHEN m IN (9,10,11) THEN set qtr="Q1";
WHEN m IN (12,01,02) THEN set qtr="Q2";
WHEN m IN (03,04,05) THEN set qtr="Q3";
else set qtr="Q4";

END CASE;
RETURN qtr;
END
