// app.js
const express = require('express');
const mongoose = require('mongoose');

const app = express();
const PORT = process.env.PORT || 3000;
const MONGO_URL = process.env.MONGO_URL || 'mongodb://mongo:27017/counter-app';

const counterSchema = new mongoose.Schema({ count: Number });
const Counter = mongoose.model('Counter', counterSchema);

app.get('/', async (req, res) => {
  let counter = await Counter.findOne();
  if (!counter) {
    counter = new Counter({ count: 1 });
  } else {
    counter.count += 1;
  }
  await counter.save();
  res.send(`Visitor count: ${counter.count}`);
});

mongoose.connect(MONGO_URL)
  .then(() => {
    console.log('Connected to MongoDB');
    app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
  })
  .catch(err => console.error('MongoDB connection error:', err));

