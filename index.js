import express from 'express';
import bodyParser from 'body-parser';
import pg from 'pg';

const db = new pg.Client({
    user: 'postgres',
    host: 'localhost',
    database: 'my_readings',
    password: '123',
    port: 5432,
});
db.connect();

const app = express();
const PORT = 3000;

const username = 'nishadmp';
const password = '123';

let admin = false;

let books = [];

app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/', async (req, res) => {
    const result = await db.query('SELECT * FROM books');
    const { search, sort } = req.query;
    books = result.rows;
    if (sort === 'Fiction') {
        books = books.filter((book) => book.genre === 'Fiction');
    } else if (sort === 'Romance') {
        books = books.filter((book) => book.genre === 'Romance');
    }
    
    if (search) {
        const response = await db.query("SELECT * FROM books WHERE LOWER(name) LIKE '%' || $1 || '%'", [search.toLowerCase()]);
        books = response.rows;
    }

    res.render('index.ejs', { books, admin });
});

app.get('/view/:id', async (req, res) => {
    const bookId = parseInt(req.params.id);
    try {
        const result = await db.query("SELECT * FROM books WHERE id = $1", [bookId]);
        res.render('view.ejs', { book: result.rows[0], admin });
    } catch (err) {
        console.log(err);
    }
});

app.get('/edit/:id', async (req, res) => {
    const bookId = parseInt(req.params.id);
    try {
        const result = await db.query("SELECT * FROM books WHERE id = $1", [bookId]);
        res.render('add.ejs', { book: result.rows[0] });
    } catch (err) {
        console.log(err);
    }
});

app.get('/delete/:id',async (req, res) => {
    const bookId = parseInt(req.params.id);
    try {
        await db.query("DELETE FROM books WHERE id = $1", [bookId]);
        res.redirect("/");
    } catch (err) {
        console.log(err);
    }
});

app.get('/add', (req, res) => {
    res.render('add.ejs');
});

app.post('/add-book', async (req, res) => {
    const { imageUrl, title, author, genre, year, rating, review } = req.body;
    try {
        const result = await db.query("INSERT INTO books (url, name, author, genre, publication_year, rating, review) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *;", [imageUrl, title, author, genre, year, rating, review]);
        res.redirect("/");
    } catch (err) {
        console.log(err);
    }
});

app.post('/update-book', async (req, res) => {
    const { imageUrl, title, author, genre, year, rating, review, authorUrl } = req.body;
    const bookId = parseInt(req.params.id);
    try {
        await db.query("UPDATE books SET url = $1, name = $2, author = $3, genre = $4, publication_year = $5, rating = $6, review = $7, author_image = $8 WHERE id = $9", [imageUrl, title, author, genre, year, rating, review, authorUrl, bookId]);
        res.redirect("/");
    } catch (err) {
        console.log(err);
    }
});

app.get('/login', (req, res) => {
    res.render('login.ejs');
});

app.get('/logout', (req, res) => {
    admin = false;
    res.redirect('/');
});

app.post('/admin-login', (req, res) => {
    const { username: inputUsername, password: inputPassword } = req.body;

    if (inputUsername === username && inputPassword === password) {
        admin = true;
        res.redirect('/');
    } else {
        res.redirect('/');
    }
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
