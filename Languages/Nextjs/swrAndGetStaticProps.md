### SWR and getStaticProps in Nextjs.

pages/trains.tsx
```
import useSWR from "swr";
import { url } from "./api/data";

const App = (props: { data: string[] }) => {
  const initial = props.data;
  const fetcher = (url: string) => fetch(url).then((res) => res.json());
  const { data } = useSWR("/api/data", fetcher, {
    refreshInterval: 60,
  });
  
  const mapData = (arr: string[]) =>
    arr.map((time, key) => <li key={key}>{time}</li>);
    
  return (
    <div>{data?.response ? mapData(data.response) : mapData(initial)}</div>
  );
};

export default App;

export async function getStaticProps() {
  const res = await fetch(url);
  const data = (await res.json()) as string[];

  return {
    props: {
      data,
    },
    revalidate: 10,
  };
}

```
/pages/api/data
```
import { NextApiRequest, NextApiResponse } from "next";

const url = "https://nextshinkansen.vercel.app/api/hakataminami-hakata";

export default async function handler(
  _req: NextApiRequest,
  res: NextApiResponse
) {
  let response = [];
  try {
    const data = await fetch(url);
    response = await data.json();
  } catch (e) {
    console.error(e);
  }
  res.status(200).json({ response });
}
```
