---
show: true
layout: syllabus
title: Model Checking
code: CS5633
category: PME
credits: 3-0-2-4
prereq:
proposingfaculty: Jasine Babu
senateapprovedon: "21"
status: New
---

# Course Content
Fundamentals: Significance of Model Checking, Kripke Structures, Fair Discrete Systems (FDS) for representing programs, synchronous and asynchronous parallel composition for representing concurrent systems, Examples (such as Peterson's mutual exclusion algorithm) and their analysis by hand computation. (8 lectures,  6 hours practice)


Logics for property specification: Review of propositional logic, Linear Temporal Logic - syntax, models,  semantics, abbreviations - Eventually and Globally. Invariants, Safety, Liveness properties and their examples. Computation Tree Logic - syntax, FDS as models, semantics, Examples, Comparison of expressive power of CTL and LTL. CTL* - models, syntax and semantics. Model checking using a tool such as NuSMV or SPIN including modeling hardware circuits and concurrent systems. (12 lectures,  8 hours practice)


Automata Based Techniques for Model Checking: Buchi Automata - Nondeterministic Buchi Automata (NBW), Closure under Union, Intersection and Complementation, Omega Regular languages, LTL formula to NBW conversion by Vardi and Wolper. Blow-up in the translation. Complexity of LTL/CTL satisfiability checking and model checking using Buchi automata based algorithms. (7 lectures)


Model checking Real Time systems: Timed Automata, TCTL, syntax and semantics, TCTL model-checking, Usage of UPPAAL. (7  lectures, 4 hours practice)


Symbolic model checking: Reduced Ordered Binary Decision Diagrams (BDDs), Using BDDs for symbolic model checking of Kripke structures for CTL and LTL properties.  Bounded Model Checking using SAT solvers, Usage of SAL. (6  lectures, 4 hours practice)


*Note*: Practice hours are majorly intended for programming exercises, while some sessions may also be used for theory exercises.


# Learning Outcomes
1. To be able to model systems using finite transition systems and express specifications using appropriate logic.
2. To be able to use a model checking tool like NuSMV/SPIN to develop models and do model checking of LTL and CTL based properties. 
3. To understand different frameworks used for model checking and to understand the efficiency of checking different types of properties like safety and liveness in these frameworks.


# Text Books
1. Edmund M. Clarke, Thomas A. Henzinger, Helmut Veith, and Roderick Bloem. Handbook of Model Checking (1st. Ed.) Springer (2018). ISBN: 978-3-319-10575-8. 
2. Christel Baier and Joost-Pieter Katoen. Principles of Model Checking. MIT Press (2008). ISBN: 978-0-262-02649-9.
3. Michael Huth, and Mark Ryan. Logic in Computer Science: Modelling and Reasoning about Systems (2nd edition) Cambridge University Press (2004). ISBN: 978-0521543101.


# References
1. Madhavan Mukund. Finite-state Automata on Infinite Inputs. In: Modern Applications of Automata Theory, Deepak D'Souza and Priti Shankar (eds), World Scientific (2012), 45 -- 78.
2. [NuSMV : A new Symbolic Model Checker](https://nusmv.fbk.eu/)
3. [UPPAAL 4.0 : Small tutorial](https://www.it.uu.se/research/group/darts/uppaal/small_tutorial.pdf)
4. [Symbolic Analysis Library.](https://sal.csl.sri.com/index.html)

