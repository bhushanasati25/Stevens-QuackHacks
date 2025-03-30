const express = require('express');
const router = express.Router();
const { analyzeSalary } = require('../services/salaryService');

// POST /analysis/salary
router.post('/salary', (req, res) => {
  try {
    const {
      currentRole,
      currentSalary,
      yearsOfExperience,
      keySkills
    } = req.body;

    const analysisResult = analyzeSalary({
      currentRole,
      currentSalary,
      yearsOfExperience,
      keySkills
    });

    return res.json(analysisResult);
  } catch (error) {
    console.error('Error in /analysis/salary:', error);
    return res.status(500).json({ error: error.message });
  }
});

module.exports = router;
