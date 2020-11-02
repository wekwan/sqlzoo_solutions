-- 1.
select date_format(call_date, '%Y-%m-%d %T') as call_date, call_ref
from Issue
where detail like '%index%' and detail like '%Oracle%'

-- 2.
select date_format(call_date, '%Y-%m-%d %T') as call_date, first_name, last_name
from Issue join Caller on Issue.caller_id = Caller.caller_id
where first_name = 'Samantha'
and last_name = 'Hall'
and date_format(call_date, '%Y-%m-%d') = '2017-08-14'

-- 3.
select status, count(*) as Volume
from Issue
group by status

-- 4.
select count(*) as mlcc
from Staff join Level on Staff.level_code = Level.level_code
join Issue on Staff.staff_code = Issue.assigned_to
where manager is not null

-- 5.
select date_format(shift_date, '%Y-%m-%d') as Shift_date,
Shift_type, first_name, last_name
from Shift join Staff on Shift.manager = Staff.staff_code
order by Shift_date, Shift_type

-- 6.
select Company_name, count(*) as cc
from Customer join Caller on Customer.company_ref = Caller.company_ref
join Issue on Caller.caller_id = Issue.caller_id
group by Company_name
having cc > 18

-- 7.
select first_name, last_name
from Caller
where caller_id in
(select Caller.caller_id
 from Caller left join Issue on Caller.caller_id = Issue.caller_id
 group by Caller.caller_id
 having count(call_date) = 0)

 -- 10.
 select Staff.first_name, Staff.last_name, date_format(call_date, '%Y-%m-%d %T') as call_date
 from Caller join Issue on Caller.caller_id = Issue.caller_id
 join Staff on Staff.staff_code = Issue.taken_by
 where Caller.first_name = 'Harry'
 order by call_date desc limit 1

 -- 11.
 -- NOT CORRECT
 
 select
 date_format(call_date, '%Y-%m-%d %H') as Hr,
 count(*) as cc
 from Issue join Staff on staff_code = assigned_to
 join Level on Staff.level_code = Level.level_code
 where date_format(call_date, '%Y-%m-%d') = '2017-08-12'
 and manager is not null
