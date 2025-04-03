# AEGIS Structured Task Framework (AEGIS-STF) v1.0

**Version:** 1.0


## Overview

The AEGIS Structured Task Framework (AEGIS-STF) is a generalized, high-control prompt template designed to guide Large Language Models (LLMs) in executing complex, structured tasks with precision and consistency. It moves beyond simple instructions by implementing a multi-step process involving explicit planning, controlled generation, and self-critique, all driven by detailed user configuration.

This framework is built upon core prompt engineering principles emphasizing:

*   **Precision & Control:** Minimizing ambiguity and maximizing adherence to user specifications.
*   **Structured Execution:** Employing a predictable workflow for reliable results.
*   **Modularity & Reusability:** Separating configuration from execution logic for adaptability.
*   **Quality Assurance:** Incorporating self-critique for refinement and error checking.

It's ideal for tasks requiring specific output formats, consistent tone, adherence to complex constraints, and a high degree of factual accuracy or guideline compliance.

## Key Features & Benefits

*   **Highly Configurable:** Extensive parameters allow fine-grained control over the task, audience, style, structure, and quality guardrails.
*   **Predictable Workflow:** Enforces a Plan -> Generate -> Critique sequence, making the LLM's process more transparent and manageable.
*   **Enhanced Reliability:** The planning (Chain-of-Thought) and self-critique steps significantly increase the likelihood of achieving the desired output compared to basic prompting.
*   **Task Agnostic Design:** Easily adaptable to various tasks (e.g., report generation, technical explanations, data summarization, content creation) by modifying the configuration parameters.
*   **Improved Output Quality:** Explicit guardrails and self-critique help mitigate common LLM issues like hallucination, vagueness, or constraint violation.
*   **Persona Emulation:** Allows defining a specific persona for the LLM to adopt, ensuring appropriate tone and perspective.

## How it Works (High-Level Process)

When the complete AEGIS-STF template is provided to a capable LLM, it follows these internal steps:

1.  **Configuration Parsing:** The LLM reads and internalizes all parameters defined in the `USER CONFIGURATION BLOCK` and the specified `PERSONA`.
2.  **Step 1: Planning & Strategy:** The LLM analyzes the configuration and generates an explicit execution plan. This plan outlines how it intends to meet the requirements (structure, content, tone, etc.). This step is outputted first for transparency (unless `EXECUTION_MODE` is changed).
3.  **Step 2: Output Generation:** Based *only* on the validated plan and the initial configuration, the LLM generates the primary output (e.g., the report, explanation, code).
4.  **Step 3: Self-Critique:** The LLM reviews its generated output against the original requirements (from the configuration and plan). It assesses adherence using a structured critique matrix. Minor internal refinements may occur based on this critique.
5.  **Final Output:** The LLM presents the final, potentially refined output.

## Usage Instructions

1.  **Copy the Template:** Obtain the full AEGIS-STF v1.0 template text.
2.  **Configure Your Task:** Carefully fill in *all* parameters within the `USER CONFIGURATION BLOCK`. Be as specific and clear as possible. Pay close attention to:
    *   `PARAM_TASK_GOAL`
    *   `PARAM_PRIMARY_SUBJECT`
    *   `PARAM_OUTPUT_STRUCTURE_GUIDELINES`
    *   `PARAM_TARGET_AUDIENCE` & `PARAM_TONE_STYLE`
    *   `PARAM_QUALITY_GUARDRAILS`
3.  **Define the Persona:** Write a clear description for the desired `PERSONA` relevant to your task.
4.  **Review Parameters:** Double-check your configuration for clarity, consistency, and completeness. Ensure parameters don't contradict each other.
5.  **Submit to LLM:** Paste the *entire modified template* (including configuration, persona, and the execution protocol) into your chosen LLM interface (ideally one specified in `LLM_REQUESTED_MODEL` or similar capability).
6.  **Review Output:** Examine the LLM's output, which should include:
    *   The Execution Plan (Step 1)
    *   The Self-Critique Matrix (Step 3)
    *   The Final Generated Output

## Framework Anatomy

The template is organized into distinct blocks:

*   **`FRAMEWORK METADATA & CONTROL FLAGS`:** Contains version info and control settings. Generally not modified by end-users unless changing execution modes.
*   **`USER CONFIGURATION BLOCK`:** **This is the primary section for user modification.** Define your task specifics here.
    *   *Core Task Definition:* Goal, subject, key message, required components.
    *   *Audience & Style:* Target audience, prerequisites, tone.
    *   *Structure & Format:* Output layout, length, formatting rules.
    *   *Quality & Content:* Specific guardrails, keywords to include/exclude.
*   **`PERSONA DEFINITION`:** Define the AI's desired role, expertise, and voice.
*   **`EXECUTION PROTOCOL`:** Defines the step-by-step process the LLM follows (Plan, Generate, Critique). **Generally should not be modified by end-users** as it contains the core logic.
*   **`FINAL OUTPUT`:** Placeholder where the LLM will place the final generated content.

## Best Practices & Tips

*   **Specificity is Key:** The more detailed and unambiguous your parameters, the better the results. Avoid vague instructions.
*   **Iterate:** Start with a basic configuration and refine it based on the LLM's output. Treat it like an iterative development process.
*   **Choose the Right LLM:** This framework performs best with advanced models capable of following complex instructions and performing self-reflection (e.g., GPT-4, Claude 3 Opus, Gemini Advanced).
*   **Persona Matters:** A well-defined persona significantly influences the output's tone, style, and perspective.
*   **Review the Plan:** The AI's outputted plan (Step 1) is a valuable check. If the plan seems wrong or misinterprets your parameters, stop and refine your configuration before letting it generate the full output.
*   **Test Guardrails:** Ensure your `PARAM_QUALITY_GUARDRAILS` are clear and actionable for the LLM.

## Limitations & Considerations

*   **Verbosity & Token Cost:** This framework is detailed, leading to higher token usage compared to simple prompts.
*   **Complexity:** Requires more upfront effort from the user to configure properly.
*   **Rigidity:** While adaptable via parameters, the core structure (Plan-Generate-Critique) is fixed. May be less suitable for highly exploratory or purely creative tasks where structure is undesirable.
*   **LLM Dependency:** The effectiveness, particularly of the self-critique step, is highly dependent on the underlying capabilities of the LLM used.
*   **Configuration Quality:** The principle of "garbage in, garbage out" applies. Poorly defined parameters will lead to poor results.

## Future Development Ideas

*   Integration with external knowledge sources (RAG).
*   More sophisticated, potentially iterative, self-critique loops.
*   Dynamic structure generation based on initial analysis.
*   Parameter validation checks within the planning step.


---
