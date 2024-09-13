

-------------------------------------------------
------------------ Review data ------------------
-------------------------------------------------


-- Review data
select * 
from village;

select * 
from inhabitant;

select *
from item;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------
------------ Find the way to survive ------------
-------------------------------------------------


-- Find friendly weaponsmith to craft some weapon
select * 
from inhabitant
where job = 'weaponsmith' 
    and state = 'friendly';


-- Find other frindly smiths
select * 
from inhabitant
where job like '%smith' 
    and state = 'friendly';


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------
--------- Where is my powerful weapon? ----------
-------------------------------------------------


-- Insert our name to join the community as a stranger with Paul (chief of Monkeycity)
insert into inhabitant (name, villageid, gender, job, gold, state) 
values ('Stranger', 1, '?', '?', 0, '?');
------- our personid is 20 ------- 


-- We must have 150 gold for a sword -> Check our gold or money that we have
select gold 
from inhabitant
where name = 'Stranger'; 
------- Answer is 0 ------- 


-- Find the ownerless items
select * from item
where owner is null;
------- We have teapot, ring, coffee cup, bucket, carton, and lightbulb -------


-- Change owner of items (from null to personid = 20)
update item 
    set owner = 20 
    where owner is null;


-- Find friendly dealers or friendly merchants
select * 
from inhabitant
where (job = 'dealer' or job = 'merchant')
    and state = 'friendly';


-- We sale ring and teapot to dealer -> Change owner of items (dealer personid = 15)
update item
    set owner = 15
    where owner = 20 
          and (item = 'ring' or item = 'teapot');


-- Update gold or money to our pocket and change name from stranger to our name
update inhabitant
    set gold = 20,
        name = 'Prang'
    where personid = 20;
-------- We receive 20 gold --------


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------
----------- I don't have enough gold ------------
-------------------------------------------------


-- Find rich baker to apply the job for baking bakery 
select * 
from inhabitant
where job = 'baker'
order by gold desc;


-- We receive 100 gold and buy 150 gold sword
update inhabitant 
    set gold = gold + 100 - 150 
    where personid = 20;


-- Insert our new weapon to the data
insert into item (item, owner) 
    values ('sword', 20);


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------
------ How to escape from abandoned island ------
-------------------------------------------------


-- Find the pilot to bring us home
select * 
from inhabitant
where job = 'pilot';


-- The pilot is kidnapped! and we know Dirty Dieter did it. -> Find village name that he lives in
---- The first mehod (JOIN bwith WHERE clause)
select vil.name 
from village as vil, 
     inhabitant as inh
where vil.villageid = inh.villageid 
    and inh.name = 'Dirty Dieter';

---- The second method (JOIN with JOIN clause)
select vil.name 
from village as vil
join inhabitant as inh
    on vil.villageid = inh.villageid
where inh.name = 'Dirty Dieter';
------- He lives in Onionville ------- 


-- Find the chief of Onionville
select inh.name
from inhabitant as inh
join village as vil
    on inh.villageid = vil.villageid
where vil.chief = inh.personid 
    and vil.name = 'Onionville';
-------  Answer is Fred Dix ------- 


-- Fred Dix told us that Dirty Dieter has a sister -> Find woman names in Onionville
select inh.name
from inhabitant as inh
join village as vil
    on inh.villageid = vil.villageid
where inh.gender = 'f' and vil.name = 'Onionville';
------- We found a woman in Onionvill. Her name is Dirty Diane -------


-- He want all properties in Cucumbertown -> Calculate sum of Cucumbertown's gold
---- The first mehod (JOIN bwith WHERE clause)
select sum(inhabitant.gold) 
from inhabitant, village 
where village.villageid = inhabitant.villageid 
    and village.name = 'Cucumbertown';

---- The second method (JOIN with JOIN clause)
select sum(inh.gold) 
from inhabitant as inh
join village as vil
    on inh.villageid = vil.villageid
where vil.name = 'Cucumbertown';

------- Answer is 8980 -------


-- We won't to do like that! find another ways that we can do. 
-- Calculate total baker compensation from this island
select sum(inh.gold) 
from inhabitant as inh
join village as vil
    on inh.villageid = vil.villageid
where inh.job = 'baker' 
    or inh.job = 'dealer' 
    or inh.job = 'merchant';
------- Answer is 4130 -------


-- Calculate total gold and average gold for each job (descending order by average gold)
select job, 
    SUM(gold) as total_gold, 
    AVG(gold) as average_gold
from inhabitant
group by job 
order by average_gold desc;


-- Calculate average gold per person for each state (status)
select state, 
    avg(gold) as average_gold
from inhabitant 
group by state 
order by average_gold desc;


-- We choose to kill Dirty sibling instead -> Delete Dirty sibling name from data
delete from inhabitant 
    where name = 'Dirty Dieter' or name = 'Dirty Diane';


-- The pilot is free! -> Change his status from kidnapped to friendly
update inhabitant
    set state = 'friendly'
    where job = 'pilot';


-- We can leave from this island and go home -> Change our statys from ? to emigrated
update inhabitant 
    set state = 'emigrated' 
    where personid = 20;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
