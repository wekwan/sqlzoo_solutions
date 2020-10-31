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
