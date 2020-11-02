-- 1.
select firstname, emailaddress
from Customer
where companyname = 'Bike World'

-- 2.
select distinct companyname
from Customer join CustomerAddress on Customer.customerid = CustomerAddress.customerid
join Address on CustomerAddress.addressid = Address.addressid
where city = 'Dallas'

-- 3.


-- 4.


-- 5.
