-- 1.
SELECT date_format(booking_date, '%Y-%m-%d') as booking_date, nights
FROM booking JOIN guest ON guest_id = guest.id
WHERE guest_id = 1183

-- 2.
select arrival_time, first_name, last_name
from booking join guest on booking.guest_id = guest.id
where date_format(booking_date, '%Y-%m-%d') = '2016-11-05'
order by arrival_time

-- 3.
select booking_id, room_type_requested, occupants, amount
from booking join rate on booking.room_type_requested = rate.room_type and booking.occupants = rate.occupancy
where booking_id in (5152, 5165, 5154, 5295)

-- 4.
select first_name, last_name, address
from booking join guest on booking.guest_id = guest.id
where room_no = 101
and booking_date = '2016-12-03'

-- 5.
select guest_id, count(nights), sum(nights)
from booking
group by guest_id
having guest_id in (1185, 1270)

-- 6.
select sum(nights * amount)
from booking join rate on booking.room_type_requested = rate.room_type and booking.occupants = rate.occupancy
join guest on booking.guest_id = guest.id
where first_name = 'Ruth' and last_name = 'Cadbury'

-- 7.
with extra_cost (amount) as
(select sum(amount) from extra where booking_id = 5346)

select sum(nights * rate.amount) + (select amount from extra_cost)
from booking join rate on booking.room_type_requested = rate.room_type and booking.occupants = rate.occupancy
where booking.booking_id = 5346

-- 8.
with id_nights (id, nights) as
(select id, sum(nights) as nights
 from guest left join booking on guest.id = booking.guest_id
 where address like '%Edinburgh%'
 group by id)

select last_name, first_name, address, coalesce(id_nights.nights, 0) as nights
from guest join id_nights on guest.id = id_nights.id
order by last_name, first_name

-- 9.
select date_format(booking_date, '%Y-%m-%d') as booking_date, count(*) as arrivals
from booking
where booking_date between '2016-11-25' and date_add('2016-11-25', interval 6 day)
group by booking_date

-- 10.
select sum(occupants)
from booking
where booking_date <= '2016-11-21' and date_add(booking_date, interval nights day) > '2016-11-21'
