const express = require('express');
const cors = require('cors');
require('dotenv').config();  // Loads variables from .env

const analysisRoutes = require('./routes/analysis');
const chatRoutes = require('./routes/chat');

const app = express();
app.use(express.json());
app.use(cors());

// Routes
app.use('/analysis', analysisRoutes);
app.use('/chat', chatRoutes);

// Health check route
app.get('/', (req, res) => {
  res.send("Career Navigator Backend is running!");
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Backend listening on port ${PORT}`);
});
