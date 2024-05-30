---
show: false
layout: syllabus
title: Advanced Computer Architecture
code: CS4505
category: PME
credits: 3-0-0-3
prereq:
proposingfaculty: 
senateapprovedon: 
---
#Learning Objectives 
This course aims to develop understanding in the advanced design principles of
a computer system by addressing key issues such as instruction set design,
micro-architecture of scalar and superscalar processors along with the
interaction of other hardware components in a computer system. This course aids
you to acquire necessary skills for analysing and estimating the performance of
computing systems. In this course, there is a strong emphasis on the study of
various constraints in the design of single and multi-processor systems.
Students will complete this course with an appreciation and understanding of
processor design issues relating to simplicity of implementation,
performance-enhancement techniques, and power-reduction
methods.

# Learning Outcome
Upon the successful completion of this course students would be able to:

1. Interpret the performance of a processor based on metrics such as execution time, cycles
per instruction (CPI), Instruction count etc.

2. Differentiate between pipeline and non-pipeline processor architecture.

3. Predict the challenges of realizing different kinds of parallelism (such as
   instruction, data and thread level) and leverage them for performance
   advancement for the present, and in the future.

4. Apply concept of memory hierarchy for efficient memory design and virtual
   memory to overcome memory wall.

5. Learn to write high performance programs by taking into consideration
   data-path, memory design and parallelism at instruction, data and thread
level.

6. Explore emerging computing trends, different computing platforms, various
   design trade- offs.

# Course Content
1. Introduction and background: Review of basic computer architecture, technology trend
and design goals, performance metrics and performance enhancement techniques, key
concepts of parallel processing and pipelining, power dissipation in processors, power
metrics, and low-power design techniques.

2. Instruction set architecture design: Implementation and performance perspectives,
relative advantages of RISC and CISC instruction sets, relation of ISA to assembly, and to
compiler, instruction formats and addressing modes.

3. Micro-architecture design: Single and multi-cycle data path design, hardwired and micro-
programmed control design, pipeline data-path. 

4. Memory systems and I/O design:
Memory hierarchy, Cache design considerations, instruction vs. data caches, write-policy
and replacement policy, analysis of cache performance, and cache design for performance
enhancement, memory technologies (SRAM, DRAM, and flash memory), virtual memory,
TLB.

5. Instruction-level parallelism: Concept and examples of data-dependence, challenges in ILP
realization, pipeline hazards and their solutions, data forwarding, register renaming,
reordering of instructions, out-of-order execution, branch prediction, dynamic scheduling,
limitations of scalar pipelines, VLIW and superscalar processors.

6. Data-level parallelism: Introduction to vector architecture, SIMD instruction set
extensions, GPU architecture.

7. Thread-level parallelism: Motivation for multicore and many-core systems, Amdahl‟s law
under power constraint, challenges in efficient multi-core system design, Cache coherence
problem.

8. Emerging computing trends: Application specific architectures: ASIP, FPGA and ASIC,
heterogeneous multicore platform, introduction to domain-specific computing, comparison
of performances and power consumption of general purpose processors, DSP, GPU,
FPGA, and ASIC.

# Textbooks
i. J.L.Hennessy, D.A.Patterson, Computer Architecture: a quantitative approach,
Morgan Kaufmann, 5th edition, 2011, ISBN: 978-1558605961.

ii. William Stallings, Computer Organization and Architecture, Prentice Hall, 10th
edition, 2015, ISBN-10: 013293633X, ISBN-13: 978-0132936330

# References
i. Andrew S. Tanenbaum, Structured Computer Organization, Prentice Hall, 6th edition,
2012, ISBN: 978-0132916523.

ii. Patterson, J.L. Hennessy, Computer Organization and Design: The Hardware/Software
Interface, Morgan Kaufmann, 5th edition, 2013, ISBN-13: 9780124078864

iii. C. Hamacher, Z. Vranesic and S. Zaky, Computer Organization, McGraw-Hill, 5th
edition,2002, ISBN: 0072320869.

