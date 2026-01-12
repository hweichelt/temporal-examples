# Elevator

This is an example of a temporal encoding modeling elevator movements between different floors


![](elevator.svg)

## Questions

### Case `SAT`

> "Why did the elevator serve floor X first/last?"
  + Could encompass all serving order related questions
  + Expected Answer:
    + Reasoning why (probably using a constrastive explanation)
    + (option) Why it was the only option
    + (option) Why it was the lowest cost answer
    + (option) Why there is/are similar alternatives
> "Is there a different solution?"
  + trivial (different answer set)
> "Can the time horizon be reduced with this instance staing satisfiable?"
  + Could be implemented using clingo's minimization
  + Still depending on the instance this could be hard to compute
  + Expected Answer:
    + Yes/No (maybe with shorter answer plan)

### Case `UNSAT`

> "What is responsible for the unsatisfiability?"
  + Expected Answer:
    + A subset of elevator calls together with the time horizon
    + (should be the only possible reason for an UNSAT)
> "Is there a solution if the elevator is given more time?"
  + Could be difficult to compute, since the time domain would have to be extended with an unknown amount of time steps 
  + Expected Answer:
    + Yes/No (maybe with additional answer plan)
