// app.js
const { MongoClient } = require("mongodb");
const http = require("http");

const url = "mongodb://mongo:27017";
const client = new MongoClient(url);
const dbName = "mycounter";

let visits = 0;

async function recordVisit() {
  try {
    await client.connect();
    const db = client.db(dbName);
    const collection = db.collection("visits");

    await collection.insertOne({ time: new Date() });
    visits = await collection.countDocuments();
  } catch (err) {
    console.error("Database error:", err.message);
  }
}

const server = http.createServer(async (req, res) => {
  await recordVisit();
  res.end(`Number of visits: ${visits}`);
});

server.listen(3000, () => {
  console.log("Server running on port 3000");
});

