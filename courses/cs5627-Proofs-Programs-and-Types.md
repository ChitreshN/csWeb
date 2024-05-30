---
show: true
layout: syllabus
title: Proofs Programs and Types
code: CS5627
category: PME
credits: 3-0-0-3
prereq:
proposingfaculty: Piyush P Kurur
senateapprovedon: "21"
status: New
---

# Course Content
The main theme of this course is certified programs, ie. Programs that come
with a proof that it meets the desired specifications. A specification is a
property that the program has to satisfy for it to be acceptable and we say
that the program is correct if it executes according 10 its specification. For
example, a railway signaling software should not set the signals such that it
allows two trans to be on. Single line at the same time. 

One important property of purported proof of correctness is that they are *formal* in the sense that they are checked *by the computer* for correctness. The proof of correctness of the program thus acts as a *computer verifiable certificate* for program correctness.

To write such certified programs, we need

1. A language to write the program in
2. A language to write the specifications
3. A mechanism to verify that the given program meets the necessary specification,

In this course, we study how to use the proof assistant Coq to build such
certified programs. The Coq proof assistant gives a unified way to expression
programs and specifications. Programs written for Coq need to be of the correct
"type" and the cog interpreter checks for this. This type checking works as the
formal mechanism for checking the correctness of proofs.

The underlying mechanism behind the Coq proof assistant can also double up in
formulating and proving statements in mathematics — for a recent success see
the complete proof of Fiet-Thompson theorem in Coq. Although we emphasize
certified programs, what we learn in this course is applicable to proving
mathematical statements in general and should be of interest to mathematicians
and logicians as well,

**Coq the proof assistant** (5 lectures): Basics, The proposition as types. Principle, Vernacular-Gallina-Ltac, Simple proof of propositional logic. Constructive logic.

**Functional and dependent types programming in Coq** (12 lectures): Introduction to Gallina. Inductive types. Functions. Pattern matching. Natural numbers, lists and vectors, Correct by construction.

**Proof tactics and proof automation** (12 lectures): Introduction to Lise. Defining custom tactics. Match and backtracking on goals.

**Proofs by reflection** (12 lectures): The idea behind reflection. Examples of proofs using reflection. Boolean reflection and ssreflect.  Ring equation solver and ring tactic,

# Learning Outcomes
1. To be able to use Coq to write certified programs.
2. To carry out formal proofs in the Coq proof assistant

# Text Book
1. Certified programming using dependent types, Adam Chlipala, MIT Press. ISBN: 780262026659

# Reference
1. [Software Foundations by Benjamin C, Pierce et al](https://softwarefoundations.cis.upenn.edu/)
