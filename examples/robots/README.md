# Robots

+ Robots move around in a grid warehouse space. They have to reach their individually assigned goals in the time horizon.

## Files

+ `encoding.lp`

## Instances

### `01` Simple

File: `instances/01_simple.lp`

| width| height| robots| horizon| models|
|:-----|:------|:------|:-------|:------|
|   `4`|   `4` |    `3`|     `6`| `2848`|

![Visualization of a valid plan for Instance 01](example.svg)

## Questions

### Case `SAT`

> "Is there a different solution?"
  + trivial (different answer set)
> "Can the time horizon be reduced with this instance staing satisfiable?"
  + Could be implemented using clingo's minimization
  + Still depending on the instance this could be hard to compute
  + Expected Answer:
    + Yes/No (maybe with shorter answer plan)


### Case `UNSAT`

> "Why can't the robots satisfy their given assignment?"
  + Very general
  + Expected Answer:
    + Can have various types of answers that match (conflict, time constraint, map problem, etc.)
> "Which robot(s) is/are responsible for the unsatisfiability?"
  + Expected Answer:
    + List of robots responsible (maybe with an additional reason)
> "Is there a solution if the robots are given more time?"
  + Could be difficult to compute, since the time domain would have to be extended with an unknown amount of time steps 
  + Expected Answer:
    + Yes/No (maybe with additional answer plan)
