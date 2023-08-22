import express from "express";
import fs from "fs";
import { pool } from "../database/db"; //typescript import

const app = express();
app.get("/", (req, res) => {
  //   return res.send('<script>console.log("Hello world!")</script>'); //console.log in browser
  //   res.send("Hello world");
  // res.setHeader("Content-Type", "text/html");
  //res.send("<p>home page</p>");
  res.sendFile("./views/index.html", { root: "./server" });
});

app.get("/about", (req, res) => {
  res.sendFile("./views/about.html", { root: "./server" });
});

//redirects
app.get("/about-us", (req, res) => {
  res.redirect("/about");
});

//404 page
app.use((req, res) => {
  res.sendFile("./views/404.html", { root: "./server" });
});

//listen for requests:
// let PORT = process.env.PORT || 5000;
app.listen(5000, () => console.log("Server running"));
// app.listen(PORT, () => console.log(`Server running ${PORT}`));
