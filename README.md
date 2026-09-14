# Single-Axis Solar Tracker: CAD, Simulation, & Embedded Control ☀️🔋

## 🔬 Project Overview
This project presents the design, simulation, and implementation of an automated dual-axis solar tracking system. The goal of the system is to dynamically orient a photovoltaic panel toward the sun's highest intensity point using light-dependent resistors (LDRs) and servo motors, optimizing energy harvesting efficiency.

---

### 📂 Repository Contents & Structure
- 📄 `[Your_Creo_File_Name].prt` — 3D CAD model and structural skeleton engineered in PTC Creo.
- 📄 `[Your_MATLAB_File_Name].m` — Algorithmic mathematical simulation analyzing solar angles and tracking efficiency.
- 📄 `[Your_Arduino_File_Name].ino` — Embedded C++ firmware for sensor data acquisition and real-time servo control loop.
- 📄 `[Your_Report_File_Name].pdf` — Full academic design review, schematic diagrams, and experimental data.

---

### 🛠️ Technical Methodology

#### 1. Mechanical Kinematics (PTC Creo)
- Designed a lightweight, dual-axis structural skeleton optimizing mechanical constraints for both azimuth and elevation rotations.
- Evaluated structural integrity to withstand outdoor physical parameters (e.g., wind loading).

#### 2. Mathematical Modeling (MATLAB)
- Developed computational models to simulate solar trajectory vectors based on simulated light intensity gradients.
- Analyzed theoretical efficiency curves comparing static panels against dynamic tracking systems.

#### 3. Embedded Systems & Control (Arduino)
- Implemented a closed-loop feedback control system utilizing differential voltage readouts from an array of 2 LDR sensors.
- Programmed error-threshold filtering in C++ to minimize mechanical jitter and actuator wear from minor ambient light fluctuations.

---

### 📊 Key Engineering Outcomes
- **Efficiency Gains:** Simulation models demonstrated up to a theoretical 30-35% increase in energy absorption compared to fixed-tilt solar frameworks.
- **System Stability:** Embedded error-margin thresholds effectively isolated high-frequency environmental noise, ensuring smooth tracking trajectories.

---

### 📄 Documentation & Verification
For a deep dive into the underlying electronic schematics, rigorous mathematical formulations, and experimental testing graphs, please review the complete **[Project Report PDF](./your-exact-pdf-filename.pdf)** uploaded directly in this repository.
