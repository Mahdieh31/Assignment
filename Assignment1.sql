
select *
from Assignment1..customerVisit

--how mwny stores have a broken or off detecting devices
select count(store)
from(
select store
from Assignment1..customerVisit
group by store
having sum(customer_visits)=0) as sub

--split the data set for off devices
select * 
from Assignment1..customerVisit as c
join (
select store
from Assignment1..customerVisit
group by store
having sum(customer_visits)=0) as sub
on c.store=sub.store

--how many stores have on detecting devices

select count(store)
from(
select store
from Assignment1..customerVisit
group by store
having sum(customer_visits)!=0) as sub

--split the data set for on devices

select * 
from Assignment1..customerVisit as c
join (
select store
from Assignment1..customerVisit
group by store
having sum(customer_visits)!=0) as sub
on c.store=sub.store