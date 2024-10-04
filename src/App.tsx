import { useEffect, useState } from 'react';

// @ts-ignore
import { API } from '@stoplight/elements';

import '@stoplight/elements/styles.min.css';

function App() {

  const [currentApiDoc, setCurrentApiDoc] = useState<unknown>(null);

  useEffect(() => {
    const modules = import.meta.glob("./docs/*.yaml");

    for (const path in modules) {
      modules[path]().then((mod) => {
        if (path.includes("v1")) {
          // biome-ignore lint/suspicious/noExplicitAny: <explanation>
          setCurrentApiDoc((mod as any).default);
        }
      })
    }
  }, []);

  return (
    <div className="App">

      {!!currentApiDoc &&
        <API
          apiDescriptionDocument={currentApiDoc}
          layout="sidebar"
        />
      }
    </div>
  );
}

export default App;
