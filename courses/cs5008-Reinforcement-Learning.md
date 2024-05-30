---
show: true
layout: syllabus
title: Reinforcement Learning
code: CS5008
category: ERC
credits: 3-0-0-3
proposingfaculty: Chandra Sekhar Lakshminarayanan
senateapprovedon: "7"
prerequisites: Probability, Linear Algebra, Data Structures & Algorithms
status: New
revisioninfo:
remarks:
---

Prerequisite course: Probability, Linear Algebra, Data Structures and Algorithms

# Learning Objective
Reinforcement learning (RL) is a paradigm of learning via interactions with the environment. RL algorithms are at the frontier of current success of AI: AlphaGo, the computer
program that beat humans is a RL algorithm. The objective is to provide a bottom up approach: starting from foundation in Markov decision processes (MDP), the course builds up to the state-of-the-art RL
algorithms.

# Learning Outcomes
The student should be able to
a) model a control task in the framework of MDPs.
b) Identify the model based from the model free methods.
c) Identify stability/convergence and approximation properties of RL algorithms.
d) Use deep learning methods to RL problems in practice.

# Course Content:
1. Introduction: State of the art applications in Atari, Alpha Go, relation to other problems in artificial intelligence [1 Week]
2. Markov Decision Processes (model based): Formulation, Value Iteration (VI), Policy Iteration (PI), Linear Programming (LP) [2 Weeks]
3. Approximate Dynamic Programming (approximate model based): curse-of-dimensionality, representations, Approximate value iteration, approximate policy iteration, approximate linear program, approximation and convergence guarantees [2 Weeks]
4. Stochastic Approximation: Single and multi-timescale stochastic approximation, introduction to ordinary differential equation based convergence results. [1 Week]
5. Value function learning (approximate model-free): Temporal difference (TD learning, TD(0), TD(lambda), Q-learning, State-Action-Reward-State Algorithm (SARSA) , TD with function approximation, on/off-policy learning, gradient temporal difference learning [2 weeks]
6. Actor-Critic: Policy gradient, Natural Actor-Critic [2 Weeks]
7. Deep RL [2 Weeks] 
8. Exploration vs Exploitation: Upper Confidence Bound (UCB), Upper Confidence Reinforcement Learning (UCRL) [2 Weeks]

# Text books
1. Richard S. Sutton and Andrew G. Barto, Introduction to Reinforcement Learning, 2nd Edition, MIT Press. 2017. ISBN-13 978-0262039246.
2. Dimitri Bertsekas and John G. Tsitsiklis, Neuro Dynamic Programming, Athena Scientific. 1996. ISBN-13: 978-1886529106

#  References
1. V. S. Borkar, Stochastic Approximation: A Dynamical Systems Viewpoint, Hindustan Book Agency, 2009. ISBN-13: 978-0521515924
2. Deep Learning. Ian Goodfellow and Yoshua Bengio and Aaron Courville. MIT Press. 2016.ISBN-13: 978-0262035613.


