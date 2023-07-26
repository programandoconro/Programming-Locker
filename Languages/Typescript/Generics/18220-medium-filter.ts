 /*
    18220 - Filter
    -------
    by Muhun Kim (@x86chi) #medium #array #filter

    ### Question

    Implement the type `Filter<T, Predicate>` takes an Array `T`, primitive type or union primitive type `Predicate` and returns an Array include the elements of
   `Predicate`.

    > View on GitHub: https://tsch.js.org/18220
  */

  /* _____________ Your Code Here _____________ */

  // My try

  type Filter<T extends any[], P, Acc extends P[] = []> = T extends [infer F, ...infer R]
  ? F extends P
    ? Filter<R, P, [...Acc, F]>
    : Filter<R, P, Acc>
  : Acc

  // A simplest option from other programmer (no accummulator)
  
  type Filter2<T extends unknown[], P> = T extends [infer F, ...infer R]
    ? F extends P
      ? [F, ...Filter<R, P>]
      : Filter<R, P>
    : [];


  type Testo = Filter<[0, 1, 2], 0 | 1>    
    //   ^? type Testo = [0, 1]
  /* _____________ Test Cases _____________ */
  import type { Equal, Expect } from '@type-challenges/utils'^M
  
  type Falsy = false | 0 | '' | null | undefined^M
  
  type cases = [
    Expect<Equal<Filter<[0, 1, 2], 2>, [2]>>,^M
    Expect<Equal<Filter<[0, 1, 2], 0 | 1>, [0, 1]>>,^M
    Expect<Equal<Filter<[0, 1, 2], Falsy>, [0]>>,^M
  ]

  /* _____________ Further Steps _____________ */
  /*
    > Share your solutions: https://tsch.js.org/18220/answer
    > View solutions: https://tsch.js.org/18220/solutions
    > More Challenges: https://tsch.js.org
  */
