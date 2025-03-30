import React, { useState } from 'react';
import axios from 'axios';

function SalaryAnalysis({ currentRole, currentSalary, yearsOfExperience, keySkills }) {
  const [analysis, setAnalysis] = useState(null);

  const handleAnalyze = async () => {
    try {
      const response = await axios.post('http://localhost:5000/analysis/salary', {
        currentRole,
        currentSalary,
        yearsOfExperience,
        keySkills
      });
      setAnalysis(response.data);
    } catch (err) {
      console.error(err);
      setAnalysis(null);
    }
  };

  return (
    <div style={{ marginTop: '20px' }}>
      <h2>Salary Analysis</h2>
      <button onClick={handleAnalyze}>Analyze Salary</button>
      {analysis && (
        <div style={{ marginTop: '10px' }}>
          <p><strong>Current Role:</strong> {analysis.currentRole}</p>
          <p><strong>Current Salary:</strong> {analysis.currentSalary}</p>
          <p><strong>Years of Experience:</strong> {analysis.yearsOfExperience}</p>
          <p><strong>Key Skills:</strong> {analysis.keySkills}</p>
          <p><strong>Typical Range:</strong> {analysis.typicalRange}</p>
          <p><strong>Recommended Range:</strong> {analysis.recommendedRange}</p>
          <p><em>{analysis.note}</em></p>
        </div>
      )}
    </div>
  );
}

export default SalaryAnalysis;
