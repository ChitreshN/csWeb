---
show: true
layout: syllabus
title: Parallel Programming
code: CS5005
category: PME
credits: 3-0-0-3
prereq:
consent: yes
proposingfaculty: Sandeep Chandran
senateapprovedon: "6"
prerequisites: Data Structures, Analysis & Design of Algorithms, Computer Organizations
status: New
revisioninfo:
remarks:
---

**Introduction**: 
Motivation for parallel programming; Performance metrics for parallelprograms such as
speedup, utilization, efficiency, scalability; Models of Parallel Computation such as Single-instruction
Multiple-Data (SIMD), Multiple-Instruction Multiple-Data (MIMD); Parallel Random Access Memory
(PRAM) models such as Concurrent-Read Concurrent-Write (CRCW) and Concurrent-Read ExclusiveWrite(CREW); Basics of pipelining, latency, and throughput; Amdahl's Law; Sequential consistency;
Correctness of parallel programs-Mutual Exclusion, Liveness and Safety conditions. 

**Introduction to Parallel Hardware**: Organization of multi-core and multi-processor machines; shared memory and
message passing architecture, coherence. 

**Programming Shared Memory architectures**: Process and
Thread management -creation and termination; Inter-process communication mechanisms; Critical
sectionand its importance; Synchronization - need for it, and tools for it such as locks and barriers;
Relaxed Consistency and memory fences - benefits and pitfalls; Examples ofparallel algorithms and its
implementations on shared memory architectures. 

**Programming Distributed Memory architectures** :
Introduction to Message Passing Interface (MPI); Synchronous and asynchronous send-receive;
Collective communication - Scatter, Gather, Broadcast, Reduce; Examples of parallel algorithms and its
implementations on distributed memory architectures. Programming Graphics Processing Units (GPUs)
Introduction to GPU architecture; Introduction to CUDA and SIMT computation; Thread blocks;
Warps; Divergence in Control Flow and avoiding them; Example programs

