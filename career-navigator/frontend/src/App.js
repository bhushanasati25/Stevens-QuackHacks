import React, { useState } from 'react';
import SalaryAnalysis from './components/SalaryAnalysis';
import CareerChat from './components/CareerChat';
import CareerPath from './components/CareerPath';

function App() {
  // Collect user inputs
  const [currentRole, setCurrentRole] = useState("");
  const [currentSalary, setCurrentSalary] = useState("");
  const [yearsOfExperience, setYearsOfExperience] = useState("");
  const [keySkills, setKeySkills] = useState("");
  const [targetRole, setTargetRole] = useState("");

  // Just logs data for demonstration
  const handleSubmit = () => {
    console.log("User Data:", {
      currentRole,
      currentSalary,
      yearsOfExperience,
      keySkills,
      targetRole
    });
  };

  return (
    <div style={{ margin: '20px' }}>
      <h1>AI Career Navigator</h1>
      <div style={{ display: 'flex', flexDirection: 'column', maxWidth: '400px' }}>
        <label>Current Role</label>
        <input
          value={currentRole}
          onChange={(e) => setCurrentRole(e.target.value)}
        />

        <label>Current Salary</label>
        <input
          value={currentSalary}
          onChange={(e) => setCurrentSalary(e.target.value)}
        />

        <label>Years of Experience</label>
        <input
          value={yearsOfExperience}
          onChange={(e) => setYearsOfExperience(e.target.value)}
        />

        <label>Key Skills (comma-separated)</label>
        <input
          value={keySkills}
          onChange={(e) => setKeySkills(e.target.value)}
        />

        <label>Target Role</label>
        <input
          value={targetRole}
          onChange={(e) => setTargetRole(e.target.value)}
        />

        <button style={{ marginTop: '10px' }} onClick={handleSubmit}>
          Submit
        </button>
      </div>

      <hr />

      {/* Salary Analysis Feature */}
      <SalaryAnalysis
        currentRole={currentRole}
        currentSalary={currentSalary}
        yearsOfExperience={yearsOfExperience}
        keySkills={keySkills}
      />

      {/* Career Strategy Chat Feature */}
      <CareerChat
        currentRole={currentRole}
        currentSalary={currentSalary}
        yearsOfExperience={yearsOfExperience}
        keySkills={keySkills}
      />

      {/* Career Path Visualization Feature */}
      <CareerPath
        currentRole={currentRole}
        targetRole={targetRole}
        yearsOfExperience={yearsOfExperience}
        keySkills={keySkills}
      />
    </div>
  );
}

export default App;
