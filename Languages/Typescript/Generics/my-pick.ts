  type MyPick<T, K extends keyof T> = {
    [P in K]: T[P]
  }

  const title: MyPick<Post, "title"> = {title: "title"}
  const date: MyPick<Post, "date"> = {date: new Date()}
  const id: MyPick<Post, "id"> = {id: 2}

  const ok: MyPick<Post, "title" | "id"> = {id: 3, title: "hola"}

  type Post = {
    title: string,
    id: number,
    date: Date,
  }
