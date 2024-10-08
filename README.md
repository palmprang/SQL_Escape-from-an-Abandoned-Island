# Escape from an Abandoned Island with SQL 


What if one day you have to escape a deserted island using only SQL writing skills?


### What is SQL Island?

SQL Island is an interactive adventure game designed to teach SQL in a fun and engaging way. Players find themselves stranded on a virtual island where they must solve puzzles and complete challenges using SQL queries to uncover clues and find a way off the island.

This platform provides opportunities to practice various SQL commands, including UPDATE, DELETE, WHERE, GROUP BY, and ORDER BY. Furthermore, you can enhance your skills by experimenting with table joins using both WHERE clauses and JOIN clauses.

Visit this link to start your own advanture:
[https://sql-island.informatik.uni-kl.de/](https://sql-island.informatik.uni-kl.de/)

<br/>

You can join my adventure and read about my SQL journey through my Medium articles linked here. <br/>
[From Code to Coast: A SQL-Powered Escape from an Abandoned Island (TH) ](https://medium.com/@palmprang/from-code-to-coast-a-sql-powered-escape-from-an-abandoned-island-เอาชีวิตรอดจากเกาะปริศนาด้วย-07fa34ac37e0)

<br/>


## Data Dictionary

### VILLAGE table
| Column                     | Description                                | Data type        |
| -------------------------  | ------------------------------------------ | ---------------- |
| villageid                  | Specific ID of each village                | VARCHAR(5)       | 
| name                       | Village name                               | VARCHAR(30)      |
| chief                      | Person ID of the chief for each village    | VARCHAR(5)       | 


<br/>


### INHABITANT table

| Column                     | Description                                | Data type        |
| -------------------------  | ------------------------------------------ | ---------------- |
| personid                   | Specific ID of each inhabitant             | VARCHAR(5)       | 
| name                       | Inhabitant name                            | VARCHAR(30)      |
| villageid                  | Specific ID of each village                | VARCHAR(5)       | 
| gender                     | Gender of the inhabitant                   | VARCHAR(1)       |
| job                        | Job of the inhabitant                      | VARCHAR(30)      |
| gold                       | The inhabitant's gold or currency          | VARCHAR(10)      |
| state                      | State or status of each inhabitant         | VARCHAR(30)      |


<br/>


### ITEM table

| Column                     | Description                                | Data type        |
| -------------------------  | ------------------------------------------ | ---------------- |
| item                       | Item name                                  | VARCHAR(30)      |
| owner                      | Owner person ID of each item               | VARCHAR(5)       | 






