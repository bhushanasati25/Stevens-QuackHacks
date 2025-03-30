const axios = require('axios');

const OPENAI_API_KEY = process.env.OPENAI_API_KEY || '';

async function getCareerAdvice({
  userQuestion,
  currentRole,
  currentSalary,
  yearsOfExperience,
  keySkills
}) {
  // Create a prompt to send to the LLM
  const prompt = `
  The user has the following background:
  - Current Role: ${currentRole}
  - Current Salary: ${currentSalary}
  - Years of Experience: ${yearsOfExperience}
  - Key Skills: ${keySkills}

  They asked: "${userQuestion}"

  Provide a concise but detailed career strategy, offering specific suggestions or insights.
  `;

  try {
    const response = await axios.post(
      'https://api.openai.com/v1/completions',
      {
        model: 'text-davinci-003',
        prompt,
        max_tokens: 300,
        temperature: 0.7,
      },
      {
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${OPENAI_API_KEY}`
        }
      }
    );

    return response.data.choices[0].text.trim();
  } catch (err) {
    console.error("Error calling the LLM API:", err);
    throw new Error("LLM API Error");
  }
}

module.exports = { getCareerAdvice };
