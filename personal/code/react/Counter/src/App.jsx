import { useState } from 'react';
import './App.css';

function App() {
  const [count, setCount] = useState(0);

  async function addCount() {
    try {
      const response = await fetch('http://localhost:5175/');
      setCount(parseInt(response)); // Assuming the server returns an object with a 'count' property
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  }

  return (
    <div>
      <h1>{count}</h1>
      <button onClick={addCount}>Click Me!</button>
    </div>
  );
}

export default App;
