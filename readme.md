# Slowly Changing Dimension (SCD Type 2) - Item Potency Tracking

This project demonstrates the implementation of **Slowly Changing Dimension Type 2 (SCD Type 2)** to track historical changes in item potency over time.

Instead of overwriting data, this approach preserves full history by creating new records whenever a change occurs.

---

## 📌 Problem Statement

In real-world systems, attributes like **item potency** (e.g., effectiveness, strength, or quality) change over time.

A simple update leads to:

- ❌ Loss of historical data
- ❌ No audit trail
- ❌ Inaccurate time-based analysis

This project solves that using **SCD Type 2**, enabling complete historical tracking.

---
