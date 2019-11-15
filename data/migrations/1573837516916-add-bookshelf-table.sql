Query 1: 
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- This query will create a second table named bookshelves. 
\d bookshelves
-- Confirm the successful creation of table. You should see the bookshelves table schema, as shown above.
Query 2: 
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

-- This query will use asubquery to retrieve unique bookshelf values from the books table and insert each one into the bookshelves table in the name column. 
SELECT COUNT(*) FROM bookshelves;
-- Confirm  this command by typing  in your SQL shell. The number should be greater than zero.

Query 3: 
ALTER TABLE books ADD COLUMN bookshelf_id INT;

-- This query will add a column to the books table named bookshelf_id. This will connect each book to a specific bookshelf in the other table.
-- Confirm by typing \d books in your SQL shell. 

Query 4:
 UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

-- This query will prepare a connection between the two tables. It works by running a subquery for every row in the books table. The subquery finds the bookshelf row that has a name matching the current book’s bookshelf value. The id of that bookshelf row is then set as the value of the bookshelf_id property in the current book row.

SELECT bookshelf_id FROM books;
-- Confirms the query was successful.

Query 5: 
ALTER TABLE books DROP COLUMN bookshelf;

-- This query will modify the books table by removing the column named bookshelf.
-- Confirm the success of this command by typing \d books in your SQL shell. The books table schema should be updated to reflect the schema provided above, without the bookshelf column.

Query 6: 
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);

-- This query will modify the data type of the bookshelf_id in the books table, setting it as a foreign key which references the primary key in the bookshelves table.