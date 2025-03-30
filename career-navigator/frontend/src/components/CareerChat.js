import React, { useState } from 'react';
import axios from 'axios';

function CareerChat({ currentRole, currentSalary, yearsOfExperience, keySkills }) {
  const [userQuestion, setUserQuestion] = useState("");
  const [chatResponse, setChatResponse] = useState("");

  const handleAsk = async () => {
    try {
      const response = await axios.post('http://localhost:5000/chat/ask', {
        userQuestion,
        currentRole,
        currentSalary,
        yearsOfExperience,
        keySkills
      });
      setChatResponse(response.data.answer);
    } catch (err) {
      console.error(err);
      setChatResponse("");
    }
  };

  return (
    <div style={{ marginTop: '20px' }}>
      <h2>Career Strategy Chat</h2>
      <textarea
        rows={3}
        placeholder="Ask a career question..."
        value={userQuestion}
        onChange={(e) => setUserQuestion(e.target.value)}
      />
      <br />
      <button onClick={handleAsk} style={{ marginTop: '10px' }}>
        Ask
      </button>

      {chatResponse && (
        <div style={{ marginTop: '10px', whiteSpace: 'pre-wrap' }}>
          <strong>AI Response:</strong>
          <p>{chatResponse}</p>
        </div>
      )}
    </div>
  );
}

export default CareerChat;
