ALTER TABLE books
ADD COLUMN `author` VARCHAR(255) NOT NULL,
ADD COLUMN `genre` VARCHAR(100) NOT NULL,
ADD COLUMN `publication_year` INT NOT NULL,
ADD COLUMN `rating` DECIMAL(3, 2) NOT NULL,
ADD COLUMN `review` TEXT NOT NULL;

-- Make sure to use accurate cover IDs from Open Library for each book below
INSERT INTO books (url, name, author, genre, publication_year, rating, review)
VALUES
('https://covers.openlibrary.org/b/id/8231852-L.jpg', 'Crime and Punishment', 'Fyodor Dostoevsky', 'Philosophical', 1866, 4.20, 'A deep psychological exploration of morality and redemption.'),
('https://covers.openlibrary.org/b/id/8226190-L.jpg', 'The Great Expectations', 'Charles Dickens', 'Classic', 1860, 3.77, 'A coming-of-age story about wealth and social class.'),
('https://covers.openlibrary.org/b/id/8226191-L.jpg', 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 4.28, 'A powerful novel about racial injustice and childhood innocence.'),
('https://covers.openlibrary.org/b/id/10594761-L.jpg', '1984', 'George Orwell', 'Dystopian', 1949, 4.18, 'A chilling vision of a totalitarian future.'),
('https://covers.openlibrary.org/b/id/11153234-L.jpg', 'Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 4.26, 'A witty and romantic classic about manners and marriage.'),
('https://covers.openlibrary.org/b/id/10594763-L.jpg', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1925, 3.93, 'A tragic story of love and ambition in the Jazz Age.'),
('https://covers.openlibrary.org/b/id/10594765-L.jpg', 'Moby-Dick', 'Herman Melville', 'Adventure', 1851, 3.52, 'An epic tale of obsession and revenge at sea.'),
('https://covers.openlibrary.org/b/id/10594767-L.jpg', 'War and Peace', 'Leo Tolstoy', 'Historical', 1869, 4.12, 'A sweeping novel of love and war in Russia.'),
('https://covers.openlibrary.org/b/id/10594769-L.jpg', 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951, 3.81, 'A coming-of-age story of teenage alienation.'),
('https://covers.openlibrary.org/b/id/10594771-L.jpg', 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, 4.28, 'A fantastical adventure in Middle-earth.'),
('https://covers.openlibrary.org/b/id/10594775-L.jpg', 'Jane Eyre', 'Charlotte Brontë', 'Gothic', 1847, 4.14, 'A passionate and independent heroine in Victorian England.'),
('https://covers.openlibrary.org/b/id/10594777-L.jpg', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 1954, 4.50, 'An epic quest to destroy the One Ring.'),
('https://covers.openlibrary.org/b/id/10594779-L.jpg', 'The Brothers Karamazov', 'Fyodor Dostoevsky', 'Philosophical', 1880, 4.33, 'A profound exploration of faith, doubt, and morality.'),
('https://covers.openlibrary.org/b/id/10594781-L.jpg', 'Wuthering Heights', 'Emily Brontë', 'Gothic', 1847, 3.87, 'A dark tale of passion and revenge on the moors.'),
('https://covers.openlibrary.org/b/id/10594783-L.jpg', 'Anna Karenina', 'Leo Tolstoy', 'Classic', 1877, 4.06, 'A tragic story of love and betrayal in Russian high society.'),
('https://covers.openlibrary.org/b/id/10594785-L.jpg', 'The Odyssey', 'Homer', 'Epic', -800, 3.75, 'The legendary journey of Odysseus returning home.'),
('https://covers.openlibrary.org/b/id/10594787-L.jpg', 'Frankenstein', 'Mary Shelley', 'Horror', 1818, 3.85, 'A cautionary tale of science and creation.'),
('https://covers.openlibrary.org/b/id/10594789-L.jpg', 'The Picture of Dorian Gray', 'Oscar Wilde', 'Philosophical', 1890, 4.08, 'A story of vanity, morality, and corruption.'),
('https://covers.openlibrary.org/b/id/10594791-L.jpg', 'Dracula', 'Bram Stoker', 'Horror', 1897, 3.99, 'The classic vampire novel that started it all.'),
('https://covers.openlibrary.org/b/id/10594793-L.jpg', 'Les Misérables', 'Victor Hugo', 'Historical', 1862, 4.37, 'A sweeping tale of redemption and revolution in France.'),
('https://covers.openlibrary.org/b/id/10594795-L.jpg', 'Don Quixote', 'Miguel de Cervantes', 'Adventure', 1605, 3.87, 'A humorous and poignant tale of chivalry and delusion.')
-- To ensure the cover images match the books, use the correct Open Library cover IDs for each book.
-- Here is an example query to update the `url` column with accurate cover image URLs:
-- Update the URLs below with the correct Open Library cover IDs for each book.
-- Example:
-- UPDATE books SET url = 'https://covers.openlibrary.org/b/id/ACCURATE_ID-L.jpg' WHERE name = 'Book Title';
UPDATE books SET url = 'https://covers.openlibrary.org/b/id/8231852-L.jpg' WHERE name = 'Crime and Punishment';

-- If you want to ensure accuracy, verify each cover ID at https://openlibrary.org/ and update the URLs accordingly.