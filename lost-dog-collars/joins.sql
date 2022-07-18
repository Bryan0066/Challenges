SELECT dog_owners.name, lost_dog_collars.dog_name
  FROM dog_owners
  JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name);

# 2
SELECT dog_owners.name, lost_dog_collars.dog_name
FROM dog_owners
RIGHT JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name)
WHERE dog_owners.name IS NULL ;

# 3 
SELECT dog_owners.name, lost_dog_collars.dog_name
    FROM dog_owners
    RIGHT JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name);

# 4
SELECT dog_owners.name, lost_dog_collars.dog_name
    FROM dog_owners
    LEFT JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name);

_________
SELECT dog_owners.name, lost_dog_collars.dog_name
FROM dog_owners
RIGHT JOIN lost_dog_collars
ON (dog_owners.dog_name = lost_dog_collars.dog_name)
ORDER BY dog_owners.name;