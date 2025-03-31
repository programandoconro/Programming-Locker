import "./App.css";

function App() {
  const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  return (
    <>
      <h1> Multiplication table</h1>

      <div className="container">
        {numbers.map((col, colIndex) => {
          return (
            <div className="column">
              {numbers.map((row, rowIndex) => {
                const multiplication = col * row;
                const key = `${rowIndex + 1} | ${colIndex + 1}`;

                return (
                  <div
                    className={`cell col-${colIndex + 1} row-${rowIndex + 1}`}
                    key={key}
                  >
                    {multiplication}
                  </div>
                );
              })}
            </div>
          );
        })}
      </div>
    </>
  );
}

export default App;
