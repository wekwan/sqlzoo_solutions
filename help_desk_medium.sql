-- 1.
select Company_name, count(*) as cc
from Customer join Caller on Customer.company_ref = Caller.company_ref
join Issue on Caller.caller_id = Issue.caller_id
group by Company_name
having cc > 18

-- 2.
select first_name, last_name
from Caller
where caller_id in
(select Caller.caller_id
 from Caller left join Issue on Caller.caller_id = Issue.caller_id
 group by Caller.caller_id
 having count(call_date) = 0)
