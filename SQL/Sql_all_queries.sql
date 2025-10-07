-- Total Loan Applications

Select count(id) as Total_Loan_Applications from bank_loan_data;

Select count(id) as MTD_Total_Loan_Applications from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021; 

Select count(id) as PMTD_Total_Loan_Applications from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021; 

-- Total Funded Amount: 
Select sum(loan_amount) as Total_Funded_Amount from bank_loan_data;

Select sum(loan_amount) as MTDTotal_Funded_Amount from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;

Select sum(loan_amount) as PMTDTotal_Funded_Amount from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

-- Total Amount Received

Select sum(total_payment) as Total_Amount_Received from bank_loan_data

Select sum(total_payment) as MTDTotal_Amount_Received from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;

Select sum(total_payment) as PMTDTotal_Amount_Received from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

-- Average Interest Rate

Select avg(int_rate) * 100 as Avg_Interest_Rate from bank_loan_data;
Select round(avg(int_rate),4) * 100 as Avg_Interest_Rate from bank_loan_data;


Select round(avg(int_rate),4) * 100 as MTDAvg_Interest_Rate from bank_loan_data 
where month(issue_date) = 12 and year(issue_date) = 2021;

Select round(avg(int_rate),4) * 100 as PMTDAvg_Interest_Rate from bank_loan_data 
where month(issue_date) = 11 and year(issue_date) = 2021;

--Average Debt-to-Income Ratio (DTI): 

Select round(avg(dti),4) * 100 as Avg_Debt_to_Income from bank_loan_data;

Select round(avg(dti),4) * 100 as MTDAvg_Debt_to_Income from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;

Select round(avg(dti),4) * 100 as PMTDAvg_Debt_to_Income from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

--Good Loan Application Percentage

Select * from bank_loan_data;

Select count(loan_status) as Good_Loan_Application
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current';

--count percentage

Select
	(count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end)*100)
	/
	count(id) as Good_Loan_Application_percentage
from bank_loan_data;

-- Good Loan Applications

Select count(id) as Good_Loan_Application
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current';

-- Good Loan Funded Amount

Select sum(loan_amount) as Good_Loan_Funded_Amount
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current';

-- Good Loan Total Received Amount

Select sum(total_payment) as Good_Loan_Total_Received_Amount
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current';

-- Bad Loan Application Percentage

Select 
	(count(case when loan_status = 'Charged Off' then id end)*100)
	/
	count(id) as Bad_Loan_Percentage
from bank_loan_data;

-- Bad Loan Applications

Select count(id) as Bad_Loan_Application
from bank_loan_data
where loan_status = 'Charged Off';

--Bad Loan Funded Amount

Select sum(loan_amount) as Bad_Loan_Funded_Amount
from bank_loan_data
where loan_status = 'Charged Off';

-- Bad Loan Total Received Amount

Select sum(total_payment) as Bad_Loan_Total_Received_Amount
from bank_loan_data
where loan_status = 'Charged Off';

-- Grid view

SELECT
        loan_status,
        COUNT(id) AS Total_Loan_Application,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status;

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

-- Dashboard -2 queries

SELECT 
	MONTH(issue_date) AS Month_Number, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date); 

--

Select 
	address_state as State,
	count(id) as Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
from bank_loan_data
group by address_state
order by count(id) desc;

--

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term;

--

Select * from bank_loan_data;

Select 
	emp_length,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;

--

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose;

--

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership









