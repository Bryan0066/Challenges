--#1 Which collars have a known owner? Display only collars with known owners and those owners' names.

--#2 For which collars is there no known owner? Display only collars without known owners.

--#3 What collars are in our possession? Display all collars in our possession. If an owner exists for a given collar, display that also.

--#4 What owners do we know about? Display all owners known to us. If a collar matches that owner, display the collar also.

-------
--#1

--Displays records with both parts of info
SELECT dog_owners.name, lost_dog_collars.dog_name
  FROM dog_owners
  JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name);

--# 2
--Displays records of right with no left
SELECT dog_owners.name, lost_dog_collars.dog_name
FROM dog_owners
RIGHT JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name)
WHERE dog_owners.name IS NULL ;

--# 3 
--Displays right, and any associated left
SELECT dog_owners.name, lost_dog_collars.dog_name
    FROM dog_owners
    RIGHT JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name);

--# 4
-- Displays left, and any associated right.
SELECT dog_owners.name, lost_dog_collars.dog_name
    FROM dog_owners
    LEFT JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name);

--_________

--Same as #3 but orders the records
SELECT dog_owners.name, lost_dog_collars.dog_name
FROM dog_owners
RIGHT JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name)
ORDER BY dog_owners.name;