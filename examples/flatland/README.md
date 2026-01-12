# Flatland

+ Inspired by the [Flatland Challenge](https://www.aicrowd.com/challenges/flatland) and the [flatland](https://github.com/krr-up/flatland) repository that adapts with for ASP.

## Files

+ `encoding.lp`
+ `domain.lp`

## Instances

### `01` Simple

File: `instances/01_simple.lp`

| width| height| trains| horizon| models|
|:-----|:------|:------|:-------|:------|
|   `5`|   `5` |    `2`|    `16`| `6448`|

## Questions

### Case `SAT`

> "Why does the train not arrive earlier at it's destination?"
  + Complex answer
  + Could be tested using a minimization statement but that could entail a long computation
  + Expected Answer:
    + (option) The train has to wait on other trains so it cannot arrive earlier
    + (option) It is not physically possible for the train to arrive earlier (shortest path, no waits)
    + (option) There is a faster solution that is an alternative model
    + (option) There is a faster solution that has a higher overall cost
> "Is there a different solution?"
  + trivial (different answer set)
> "Can the time horizon be reduced with this instance staing satisfiable?"
  + Could be implemented using clingo's minimization
  + Still depending on the instance this could be hard to compute
  + Expected Answer:
    + Yes/No (maybe with shorter answer plan)

### Case `UNSAT`

> "What  is the reason for the unsatisfiablity?"
  + Expected Answer:
    + Explanation of the problem type
    + (option) For train T it's goal is unreachable on the map
    + (option) For train T it's goal is unreachable under the time horizon
    + (option) There is a conflict between trains resulting in a deadlock
> "What train(s) is/are responsible for the unsatisfiability?"
  + Expected Answer:
    + A subset of trains together with the time horizon
> "Is there a solution if the trains are given more time?"
  + Could be difficult to compute, since the time domain would have to be extended with an unknown amount of time steps 
  + Expected Answer:
    + Yes/No (maybe with additional answer plan)
