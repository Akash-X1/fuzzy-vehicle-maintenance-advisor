# Fuzzy Logic Vehicle Maintenance Advisor

A MATLAB fuzzy-inference assignment that estimates vehicle maintenance urgency from mileage, coolant condition, and brake age. The project compares three Mamdani fuzzy inference configurations.

## Project Overview

The system maps three inputs to a maintenance-urgency score:

- **Mileage:** 0–1000 (project-defined scale)
- **Coolant:** 0–100 (project-defined scale)
- **Brake age:** 0–36 (project-defined scale)
- **Output — urgency:** 0–100

The MATLAB scripts define membership functions for low, medium, and high mileage; low, medium, and normal coolant; new, aging, and old brakes; and low, medium, and high urgency.

> The input scales and fuzzy rules are those defined in this academic implementation. They are not validated automotive service thresholds and should not be used as real-world maintenance or safety advice.

## Variants Compared

| Script | Configuration |
|---|---|
| `src/System_1_Baseline.m` | Baseline Mamdani FIS using centroid defuzzification and the `min` AND operator |
| `src/System_2_MOM.m` | Mamdani FIS using mean-of-maxima (`mom`) defuzzification |
| `src/System_3_Prod.m` | Mamdani FIS using centroid defuzzification and the `prod` AND operator |

The scripts share the same input/output variables and membership-function design, allowing the chosen inference settings to be compared.

## Repository Structure

```text
fuzzy-vehicle-maintenance-advisor/
├── README.md
├── .gitignore
├── src/
│   ├── System_1_Baseline.m
│   ├── System_2_MOM.m
│   └── System_3_Prod.m
└── report/
    └── project-report.pdf
```

## Requirements

- MATLAB
- MATLAB Fuzzy Logic Toolbox (for functions such as `mamfis`, `addInput`, `addMF`, `addOutput`, `addRule`, and `evalfis`)

The exact MATLAB release and toolbox version were not specified in the provided materials.

## How to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/Akash-X1/fuzzy-vehicle-maintenance-advisor.git
   cd fuzzy-vehicle-maintenance-advisor
   ```

2. Open MATLAB and set the current folder to the repository root.

3. Open one of the scripts in `src/` and run it.

4. Review the script's rule base and any output or evaluation statements included in the source. Run each variant under the same test inputs if comparing results.

The original scripts define the fuzzy inference systems. If you want to evaluate the systems for particular input values, use the variable names and `evalfis` calling convention supported by your MATLAB version, and confirm the input order from the script.

## Methodology

The implementation defines a Mamdani fuzzy inference system with membership functions for each input and output. It compares a baseline configuration against two alternatives: mean-of-maxima defuzzification and a product AND operator. This provides a small controlled comparison of fuzzy inference settings.

## Limitations

- This is an academic fuzzy-logic prototype, not a validated automotive diagnostic tool.
- The input scales, membership functions, and rules are hand-defined in the source code.
- The project report should be consulted for the full assignment context, evaluation, and references.
- No automated tests or independent validation are included in this repository package.

## Report

The full report is available at [`report/project-report.pdf`](report/project-report.pdf).

## Author

Akash Kumar

## License

No open-source license has been specified. Do not assume third-party or group-work materials may be redistributed without permission.
