# Numerical Methods Calculator (MATLAB)

A **menu-driven numerical methods calculator** implemented in MATLAB, designed to apply and reinforce core concepts of **Numerical Analysis** through practical implementation.

This project was developed after completing a Numerical Analysis course, with the goal of strengthening both **MATLAB programming skills** and **applied mathematical understanding**.

---

## 📌 Project Overview

Modern calculators and engineering software rely heavily on numerical methods to approximate solutions to mathematical problems that cannot be solved analytically.

This project provides a structured MATLAB-based calculator that allows users to:
- Navigate between different numerical methods using interactive menus
- Apply classical numerical algorithms
- Validate inputs and handle incorrect user entries gracefully
- Display results in clear, interpretable forms

The project is modular, scalable, and designed for further extension.

---

## ⚙️ Features & Implemented Methods

### 🔹 Interpolation
- Newton’s Divided Difference Method  
- Lagrange Interpolating Polynomial  

Both methods:
- Accept discrete data points
- Construct the interpolating polynomial symbolically using `syms`
- Display the expanded polynomial in **decimal form**

---

### 🔹 Numerical Differentiation
- First Derivative:
  - Forward Difference
  - Backward Difference
  - Central Difference
- Second Derivative:
  - Central Difference

---

### 🔹 Numerical Integration
- Midpoint Rule  
- Trapezoidal Rule  
- Simpson’s 1/3 Rule  
- Romberg Integration:
  - O(h⁴)
  - O(h⁶)
  - O(h⁸)
- Gauss Quadrature:
  - 2-point
  - 3-point
  - 4-point
  - 5-point

---

### 🔹 Systems of Linear Equations
- Gauss–Seidel Method  
- Successive Over-Relaxation (SOR)

---

### 🔹 Nonlinear Equations
- Root finding using Newton–Raphson method
- Systems of nonlinear equations:
  - 2 equations
  - 3 equations
  - 4 equations

---

### 🔹 Eigenvalue Problems
- Power Method for dominant eigenvalue and eigenvector

---

## 🧭 Program Structure

The calculator uses a **menu-driven architecture**:

- Main menu for selecting numerical categories
- Sub-menus for selecting specific methods
- Ability to:
  - Repeat operations
  - Go one step back
  - Return to the main menu
  - Exit the program cleanly

Each numerical method is implemented as a **separate function**, ensuring clarity and reusability.

---

## 🧠 Use of Symbolic Math (`syms`)

Symbolic variables are used in selected modules (e.g., interpolation) to:
- Construct mathematical expressions symbolically
- Expand and simplify resulting formulas
- Display results in a clear and readable polynomial form

Final outputs are converted to **floating-point (decimal) representation** for better interpretation.

---

## ▶️ How to Run

1. Open MATLAB
2. Ensure all project files are in the same directory
3. Run the main file: main.m
