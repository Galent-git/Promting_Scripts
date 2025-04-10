# ANOVA Prompt Runner

**Run a complete, reproducible statistical analysis using only a text-based prompt and a dataset — no manual input required.**

This project demonstrates a modular "prompt-as-function" design where ChatGPT executes a full one-way ANOVA + post hoc test + visualizations using just an uploaded prompt file and spreadsheet. The result is a clean, styled HTML report including:

- Assumption testing (Levene’s, Q-Q plot)
- One-way ANOVA with effect size
- Tukey HSD post-hoc test
- Interactive box plots
- Full code annex for reproducibility

## Concept

Instead of manually prompting ChatGPT every time, this system uses a text file as a **callable prompt module**. When paired with a valid dataset, ChatGPT reads the instructions and outputs a fully formatted, annotated HTML report.

The philosophy: **What if prompts worked like scripts?**

No chat instructions. No coding required. Just drag, drop, and get results.

## Files

- `prompt-anova.txt`: The main prompt logic
- `sample-data.csv`: Example dataset (Fertilizer × Plant Height)
- `anova_report_fixed.html`: Example output
- `/screenshots/`: Optional ChatGPT run example

## How to Use

1. Open ChatGPT (GPT-4oor model with python interpreter)
2. Upload:
    - `prompt.txt`
    - Your `.csv` or `.xlsx` dataset
3. ChatGPT will process the instructions and generate a report

 **No further messages or inputs required**

##  Requirements (inferred by prompt)

- Your dataset must contain:
    - A numeric dependent variable (e.g., height, weight, etc.)
    - A categorical independent variable (e.g., treatment group)
- The script auto-detects assumptions and uses default Tukey post-hoc if significant
![image](https://github.com/user-attachments/assets/088a5ae9-1859-41b0-9968-eb5952fe453c)
![image](https://github.com/user-attachments/assets/cb4d3184-ee42-4557-8ed0-193d5adad21a)


##  Future Ideas

- Add support for multi-factor ANOVA (e.g., randomized block design)
- Allow prompt to accept comparison test preferences
- Extend to regression, chi-square, clustering, etc.

## Author

**Raph** — Builder of ghosts, automator of thought, eternal experimenter  
 [Substack] • [LinkedIn] • [GitHub]

---

Inspired by modular AI workflows and real-world researcher pain.
