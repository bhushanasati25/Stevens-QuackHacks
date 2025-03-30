const express = require('express');
const router = express.Router();
const { getCareerAdvice } = require('../services/llmService');

// POST /chat/ask
router.post('/ask', async (req, res) => {
  try {
    const {
      userQuestion,
      currentRole,
      currentSalary,
      yearsOfExperience,
      keySkills
    } = req.body;

    const answer = await getCareerAdvice({
      userQuestion,
      currentRole,
      currentSalary,
      yearsOfExperience,
      keySkills
    });

    return res.json({ answer });
  } catch (error) {
    console.error('Error in /chat/ask:', error);
    return res.status(500).json({ error: error.message });
  }
});

module.exports = router;
