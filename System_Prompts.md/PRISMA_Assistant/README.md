Veritas Scrutator v2.1
## AI Assistant for PRISMA-Aligned Literature Processing

**Version:** 2.1
**Framework Author:** Raph / Galent
**Date:** april 3rd 2025

---

## Overview

Veritas Scrutator v2.1 is a specialized System Prompt designed to guide advanced Large Language Models (LLMs) like GPT-4, Claude 3 Opus, or Gemini Advanced to act as a meticulous AI Research Assistant. Its core purpose is to process user-provided scientific article texts, extract specified information, and structure that information in alignment with PRISMA 2020 reporting principles.

**Core Philosophy:** This tool operates under a strict protocol emphasizing **absolute source fidelity**. It relies *exclusively* on the textual content provided by the user. It does **not** access external knowledge, perform independent searches, or conduct nuanced human judgments like risk-of-bias assessment. It simulates PRISMA-related tasks (screening, extraction) based *only* on text analysis, serving as a highly structured information organizer.

**Simulation Notice:** It is crucial to understand that this process *simulates* steps of a systematic review using text analysis. It is **NOT** a substitute for a full, human-led systematic review, which requires comprehensive literature searching, domain expertise, critical appraisal skills, and nuanced interpretation.

## Key Features & Strengths

*   **PRISMA-Aligned Structure:** Generates output mimicking PRISMA sections (Methods, Results, etc.), promoting methodological transparency (especially in `FULL_PRISMA` mode).
*   **Strict Source Fidelity:** Confines analysis **exclusively** to the user-provided text, drastically minimizing the risk of AI hallucination or introducing external inaccuracies. Uses "`NR_PT`" (Not Reported in Provided Text) for missing data.
*   **Configurable Output:**
    *   **Operational Modes (`PARAM_OPERATIONAL_MODE`):** Choose between a detailed `FULL_PRISMA` report or a focused `EXTRACTION_SUMMARY` for data retrieval tasks, managing verbosity and token usage.
    *   **Table Detail (`PARAM_TABLE_DETAIL`):** Control the level of detail in the Characteristics of Included Studies table (`SUMMARY` vs. `FULL`).
*   **Clear Handling of Data Issues:**
    *   **Ambiguity:** Flags ambiguous text with an `[AI Note: Ambiguous Text...]` without attempting to resolve it.
    *   **Contradictions:** Explicitly reports contradictory findings between different included studies, citing sources.
*   **Systematic Processing:** Follows a defined workflow (Parameter Ingestion -> Article Processing -> Data Aggregation -> Synthesis -> Report Generation).
*   **Transparency:** Includes robust, consolidated disclaimers clearly stating the AI's limitations and the nature of the simulation.

## Usage Instructions

1.  **Select a Capable LLM:** Use an advanced LLM known for strong instruction following and large context windows (e.g., GPT-4, Claude 3 Opus, Gemini Advanced).
2.  **Set the System Prompt:** Copy the *entire* Veritas Scrutator v2.1 system prompt text and set it as the custom instruction or system prompt for your LLM session.
3.  **Configure Parameters:** Carefully edit the `USER CONFIGURATION BLOCK` within the prompt text *before* submitting anything else. Define:
    *   `PARAM_OPERATIONAL_MODE` (`FULL_PRISMA` or `EXTRACTION_SUMMARY`)
    *   `PARAM_TABLE_DETAIL` (`SUMMARY` or `FULL`)
    *   `PARAM_RESEARCH_QUESTION` (Be clear; use PICO/PICo if possible)
    *   `PARAM_INCLUSION_CRITERIA` (List specific, text-analyzable rules)
    *   `PARAM_EXCLUSION_CRITERIA` (List specific, text-analyzable rules)
    *   `PARAM_DATA_ITEMS` (List *exactly* what data to extract. If using `SUMMARY` table mode, ensure core items are listed first).
4.  **Provide Article Texts:** After the configured prompt, paste the **full text** of the scientific articles you want the AI to process. Clearly delineate where each article begins and ends (e.g., using markers like `--- ARTICLE 1 START ---`).
5.  **Submit & Review:** Submit the combined prompt + article texts to the LLM. Critically review the generated output, paying attention to:
    *   The Study Selection details (especially exclusions).
    *   The data presented in the tables (`NR_PT` occurrences).
    *   Any noted ambiguities or contradictions.
    *   The final Limitations & Disclaimer section.

## Configuration Parameters Explained

*   `PARAM_OPERATIONAL_MODE`: Controls the overall structure and length of the output. `EXTRACTION_SUMMARY` is faster and uses fewer tokens.
*   `PARAM_TABLE_DETAIL`: Controls the columns in the "Characteristics of Included Studies" table. `SUMMARY` uses fewer tokens but requires careful selection of essential `PARAM_DATA_ITEMS`. `FULL` is comprehensive but token-intensive.
*   `PARAM_RESEARCH_QUESTION`: Defines the focus for synthesis. A clear question yields better results.
*   `PARAM_INCLUSION_CRITERIA` / `PARAM_EXCLUSION_CRITERIA`: These MUST be specific and assessable based *only* on text (e.g., "Population age > 18", "Study design reported as RCT", "Publication year after 2010"). Avoid criteria requiring external knowledge or complex judgment (e.g., "high quality study").
*   `PARAM_DATA_ITEMS`: This list dictates *exactly* what the AI looks for in included studies. Be precise (e.g., "Primary outcome measure name", "Mean difference reported for outcome X", "Author conclusion regarding hypothesis Y").
*   `PARAM_MISSING_DATA_LABEL`: The consistent "`NR_PT`" tag makes missing data explicit.
*   `PARAM_STUDY_ID_FALLBACK`: Ensures every study has an identifier, defaulting from "Author, Year" to "Provided Article [Index]".

## Ethical Guidelines & Responsible Use

*   **Recognize as an Assistant:** Veritas Scrutator v2.1 is a tool to *assist* with information organization, not a replacement for human research skills, critical thinking, or domain expertise.
*   **Mandatory Human Oversight:** **ALL output requires critical review, validation, and interpretation by a qualified human expert.** Do not blindly trust or cite the AI's output without verification against the original source texts.
*   **Transparency in Use:** If using outputs generated by this tool in subsequent work (reports, presentations, publications), **you MUST clearly disclose the use of AI assistance and its limitations.** Misrepresenting AI-generated summaries as human-led systematic reviews is unethical.
*   **Appropriate Scope:** Use this tool only for its intended purpose: processing and structuring information from *provided* texts. Do not use it to attempt tasks it explicitly cannot do (e.g., conducting literature searches, assessing study quality/bias, generating novel interpretations).
*   **Input Responsibility:** The user is responsible for the legality, ethics, and quality of the article texts provided to the AI. Ensure you have the right to use and process these texts.
*   **Avoid Over-Reliance:** Use the tool to augment, not replace, rigorous research methodologies.

## Limitations

*   **Input Dependency ("Garbage In, Garbage Out"):** The quality and accuracy of the output are entirely dependent on the clarity, completeness, and correctness of the user-provided article texts and configuration parameters. Partial or poorly formatted texts will lead to incomplete or inaccurate results.
*   **No External Search Capability:** The AI **cannot** search databases or the internet. Its knowledge is strictly limited to the provided texts. The results do **not** represent a comprehensive overview of all available literature on a topic.
*   **No Quality or Risk-of-Bias Assessment:** The AI **does not** evaluate the methodological quality or risk of bias of the included studies (beyond extracting author statements if requested). This requires human expertise.
*   **Text-Based Analysis Only:** The AI analyzes literal text. It cannot reliably interpret implicit meanings, subtle nuances, complex figures/tables not described in text, or information requiring deep domain understanding.
*   **No Deep Interpretation or Novel Synthesis:** The synthesis provided is descriptive, summarizing patterns found *explicitly* in the extracted data. The AI does not perform complex statistical meta-analysis or generate novel insights beyond what is stated in the texts.
*   **Potential Token Limits:** Providing very long articles or requesting `FULL` mode with numerous data items can strain the LLM's context window, potentially leading to truncated or incomplete output. Monitor output length and consider `SUMMARY` modes if needed.

---

