* The var variable is globally scoped and can be updated and re-declared.
* The let variable is block-scoped and can be updated but not re-declared.
* The const variable is block-scoped and cannot be updated or re-declared.

* onclick: Activates when a user clicks on the specific element
* onmouseover: Activates when a user hovers over a specific element
* onload: Activates when the element has loaded
# Reflected XSS
## PHP
Vulnerable code
```
<?php
$search_query = $_GET['q'];
echo "<p>You searched for: $search_query</p>";
?>
```
safe code
```
<?php
$search_query = $_GET['q'];
$escaped_search_query = htmlspecialchars($search_query);
echo "<p>You searched for: $escaped_search_query</p>";
?>
```
## Node.js
Vulnerable code
```
const express = require('express');
const app = express();

app.get('/search', function(req, res) {
    var searchTerm = req.query.q;
    res.send('You searched for: ' + searchTerm);
});

app.listen(80);
```
safe code
```
const express = require('express');
const sanitizeHtml = require('sanitize-html');

const app = express();

app.get('/search', function(req, res) {
    const searchTerm = req.query.q;
    const sanitizedSearchTerm = sanitizeHtml(searchTerm);
    res.send('You searched for: ' + sanitizedSearchTerm);
});

app.listen(80);
```
## Python
Vulnerable code
```
from flask import Flask, request

app = Flask(__name__)

@app.route("/search")
def home():
    query = request.args.get("q")
    return f"You searched for: {query}!"

if __name__ == "__main__":
    app.run(debug=True)
```
safe code
```
from flask import Flask, request
from html import escape

app = Flask(__name__)

@app.route("/search")
def home():
    query = request.args.get("q")
    escaped_query = escape(query)
    return f"You searched for: {escaped_query}!"

if __name__ == "__main__":
    app.run(debug=True)
```
## ASP.NET
Vulnerable code
```
public void Page_Load(object sender, EventArgs e)
{
    var userInput = Request.QueryString["q"];
    Response.Write("User Input: " + userInput);
}
```
safe code
```
using System.Web;

public void Page_Load(object sender, EventArgs e)
{
    var userInput = Request.QueryString["q"];
    var encodedInput = HttpUtility.HtmlEncode(userInput);
    Response.Write("User Input: " + encodedInput);
}
```
# Stored XSS
## PHP
Vulnerable Code 
```
// Storing user comment
$comment = $_POST['comment'];
mysqli_query($conn, "INSERT INTO comments (comment) VALUES ('$comment')");

// Displaying user comment
$result = mysqli_query($conn, "SELECT comment FROM comments");
while ($row = mysqli_fetch_assoc($result)) {
    echo $row['comment'];
}
```
Safe code
```
// Storing user comment
$comment = mysqli_real_escape_string($conn, $_POST['comment']);
mysqli_query($conn, "INSERT INTO comments (comment) VALUES ('$comment')");

// Displaying user comment
$result = mysqli_query($conn, "SELECT comment FROM comments");
while ($row = mysqli_fetch_assoc($result)) {
    $sanitizedComment = htmlspecialchars($row['comment']);
    echo $sanitizedComment;
}
```
## Node.js
Vulnerable Code 
```
app.get('/comments', (req, res) => {
  let html = '<ul>';
  for (const comment of comments) {
    html += `<li>${comment}</li>`;
  }
  html += '</ul>';
  res.send(html);
});
```
Safe code
```
const sanitizeHtml = require('sanitize-html');

app.get('/comments', (req, res) => {
  let html = '<ul>';
  for (const comment of comments) {
    const sanitizedComment = sanitizeHtml(comment);
    html += `<li>${sanitizedComment}</li>`;
  }
  html += '</ul>';
  res.send(html);
});
```
## Python 
Vulnerable Code
```
from flask import Flask, request, render_template_string
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///site.db'
db = SQLAlchemy(app)

class Comment(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    content = db.Column(db.String, nullable=False)

@app.route('/comment', methods=['POST'])
def add_comment():
    comment_content = request.form['comment']
    comment = Comment(content=comment_content)
    db.session.add(comment)
    db.session.commit()
    return 'Comment added!'

@app.route('/comments')
def show_comments():
    comments = Comment.query.all()
    return render_template_string(''.join(['<div>' + c.content + '</div>' for c in comments]))
```
Safe Code
```
from flask import Flask, request, render_template_string, escape
from flask_sqlalchemy import SQLAlchemy
from markupsafe import escape

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///site.db'
db = SQLAlchemy(app)

class Comment(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    content = db.Column(db.String, nullable=False)

@app.route('/comment', methods=['POST'])
def add_comment():
    comment_content = request.form['comment']
    comment = Comment(content=comment_content)
    db.session.add(comment)
    db.session.commit()
    return 'Comment added!'

@app.route('/comments')
def show_comments():
    comments = Comment.query.all()
    sanitized_comments = [escape(c.content) for c in comments]
    return render_template_string(''.join(['<div>' + comment + '</div>' for comment in sanitized_comments]))
```
## C#(ASP.NET)
Vulnerable Code 
```
public void SaveComment(string userComment)
{
    var command = new SqlCommand("INSERT INTO Comments (Comment) VALUES ('" + userComment + "')", connection);
    // Execute the command
}

public void DisplayComments()
{
    var reader = new SqlCommand("SELECT Comment FROM Comments", connection).ExecuteReader();
    while (reader.Read())
    {
        Response.Write(reader["Comment"].ToString());
    }
    // Execute the command
}
```
Safe Code
```
sing System.Web;

public void SaveComment(string userComment)
{
    var command = new SqlCommand("INSERT INTO Comments (Comment) VALUES (@comment)", connection);
    command.Parameters.AddWithValue("@comment", userComment);
}

public void DisplayComments()
{
    var reader = new SqlCommand("SELECT Comment FROM Comments", connection).ExecuteReader();
    while (reader.Read())
    {
        var comment = reader["Comment"].ToString();
        var sanitizedComment = HttpUtility.HtmlEncode(comment);
        Response.Write(sanitizedComment);
    }
    reader.Close();
}
```










