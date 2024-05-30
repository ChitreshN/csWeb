---
curriculum: "2020"
core: [msocd]
show: "TRUE"
layout: syllabus
title: Advanced Computer Architecture
code: CS5019
category: PMT
credits: 3-0-0-3
proposingfaculty: Sandeep Chandran & Vivek Chaturvedi
senateapprovedon: "11"
prerequisites: A basic course on Computer Organization/Architecture
status: new
revisioninfo: 'This course will replace another course offered under the same name by the CSE Department (CS4505- Advanced Computer Architecture). The original course will be discontinued going forward. The syllabus of this course is tailored to suit graduate students.               '
lastmodified: 2022/05/15
---

Prerequisite: A basic course on Computer Organization/Architecture

# Learning Objective
* Teach advanced design principles of modern processors by addressing key issues such
as instruction set design, micro-architecture of superscalar processors, its interaction
with other hardware components, and constraints to be addressed when going from
single-core to multi-core systems
* Teach students different techniques to estimate, analyze and enhance performance as
well as reduce power dissipation of computing systems.

# Learning Outcome
Upon successful completion of the course, students would be able to:
* Interpret the performance of a processor based on metrics such as execution time, cycles per instruction (CPI), Instruction count etc
* Predict the challenges of realizing different kinds of parallelism (such as instruction, data, thread, core level) and leverage them for performance advancement
* Apply the concept of memory hierarchy for efficient memory design and virtual memory to overcome the memory wall
* Explore emerging computing trends, computing platforms, and design trade-offs 

# Course contents

Design Space Exploration and Optimizations: Performance metrics and performance enhancement techniques, Basic
concepts of parallel processing and pipelining, Power dissipation in processors, power metrics, and low-power design techniques. (6 lectures)

Instruction set architecture design: Instruction set design, implementation and performance perspectives, relative advantages of RISC and CISC instruction set, Data Path Design (6 lectures)

Instruction-level parallelism (ILP): Pipeline data-path, data-dependence. Challenges in ILP realization. Pipeline hazards and their solutions, out-of-order execution, branch prediction, and dynamic scheduling. VLIW and superscalar processors. (12 lectures)

Memory systems: Overview of memory hierarchy, Cache design considerations, instruction vs. data caches, write-policy and replacement policy, analysis of cache
performance, and cache design for performance enhancement. Brief overview of memory technologies (SRAM, DRAM, and flash). (12 lectures)

Data Level Parallelism: Flynn Processor classification, SIMD, MIMD, GPU architectures (4 lectures)

IO: types, models, protocols, Sockets, ISR (2 lectures)

# Text Books
1. J.L.Hennessy, D.A.Patterson, Computer Architecture: a quantitative approach, Morgan Kaufmann, 5th edition, 2011, ISBN: 978-1558605961.
2. William Stallings, Computer Organization and Architecture, Prentice Hall, 10th edition, 2015, ISBN-10: 013293633X, ISBN-13: 978-0132936330

# Reference Books
1. Andrew S. Tanenbaum, Structured Computer Organization, Prentice Hall, 6th edition, 2012, ISBN: 978-0132916523.
2. Patterson, J.L. Hennessy, Computer Organization and Design: The Hardware/Software Interface, Morgan Kaufmann, 5th edition, 2013, ISBN-13:9780124078864
3. C. Hamacher, Z. Vranesic and S. Zaky, Computer Organization, McGraw-Hill, 5th edition,2002, ISBN: 0072320869.


