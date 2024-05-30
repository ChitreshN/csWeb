---
show: true
layout: syllabus
title: Cryptography
code: CS5613
category: PME
credits: 3-0-0-3
prereq:
proposingfaculty: Satyajit Das
senateapprovedon: "9"
prerequisites: NOT GIVEN
status: New
revisioninfo:
remarks:
---

# Course Objective
This is an introductory graduate course on cryptography. This will enable the students to learn fundamental concepts of cryptography, cryptanalysis and utilize these techniques in computing systems.

# Course Contents
**Introduction and mathematical foundations**: 
1. Overview of cryptography (1 lecture)
2. Number Theory: modular arithmetic, extended Euclid’s algorithm, Euler’s theorem, Fermat’s little
theorem, examples of easy and hard problems in computational number theory (4 lectures)
3. Discrete Probability:
discrete probability spaces and distributions, binomial distribution, birthday paradox (2 lectures)

**Symmetric-key Encryption**
1. One time pad and stream ciphers: perfect secrecy and the one-time pad, semantic security and stream ciphers.
Linear Feedback Shift Registers as a way of implementing stream ciphers, analyze
their properties with examples, RC4. (3 lectures)
2. Block Ciphers: feistel networks and iterated Even-Mansour ciphers, examples. Pseudo Random
Permutations (PRP), Pseudo Random Functions (PRF), security against chosen
plaintext attacks (CPA), Modes of operation: CBC and counter mode (4 lectures)
3. Attacks on block ciphers: exhaustive search, time-space tradeoffs, differential & linear cryptanalysis, meet in the middle, side channels (4 lectures)

**Hash Functions**
1. Definition of hash functions and properties, Unkeyed hash functions, Keyed hash functions (2 lectures)
2. Message Authentication Codes (MAC), The Random Oracle Model (ROM) (2 lectures)


**Public key cryptography**
1. Cryptography using arithmetic modulo primes: Diffie-Hellman key exchange, the hardness of discrete-log assumption. (5 lectures)
2. Public key encryption: semantically secure ElGamal encryption, Chosen Ciphertext Attack (CCA) security (3 lectures)
3. Arithmetic modulo composites: RSA and Rabin functions, how to encrypt with trapdoor permutations, RSA OAEP encryption (4 lectures)

**Digital signatures**
1. Digital signatures: definitions and applications: how to sign using RSA (3 lectures)
2. More signature schemes and applications: hash based signatures, certificates, certificate transparency, certificate revocation (2 lectures)

**Special Topic**  (2 lectures)

# Learning Outcomes:

At the end of the course, the students should have: 
* Knowledge in modern cryptosystems, their analysis and applications to other fields 
* They will be able to combine these basics with their knowledge of experimental methodologies to identify, formulate, and solve engineering problems

# Text Books
1. A Graduate Course in Applied Cryptography by D. Boneh and V. Shoup. 
2. Cryptography and Network security: Principles and Practice, William Stallings, Pearson Education, 2002 

# References
1. Introduction to Modern Cryptography by J. Katz and Y. Lindell 
2. Cryptography: Theory and Practice, Douglas R. Stinson, CRC Press


