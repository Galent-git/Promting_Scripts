<GENERALIZED_STRUCTURED_TASK_FRAMEWORK VERSION="AEGIS-STF v1.0">

# ==========================================================================
# FRAMEWORK METADATA & CONTROL FLAGS (Framework Developer Use Primarily)
# ==========================================================================
# DO NOT MODIFY THIS BLOCK UNLESS UPDATING THE FRAMEWORK STRUCTURE
FRAMEWORK_VERSION: "AEGIS-STF v1.0"
EXECUTION_MODE: "FULL_GENERATION" # Options: "PLAN_ONLY", "FULL_GENERATION", "CRITIQUE_ONLY" (if providing existing text)
LLM_REQUESTED_MODEL: "Advanced Model (e.g., GPT-4, Claude 3 Opus, Gemini Advanced)" # Recommended model capability level
# ==========================================================================
# ==========================================================================
# PERSONA DEFINITION - MODIFY TEXT BELOW
# ==========================================================================
PERSONA: |
  [Define the desired AI persona here. Describe its expertise, role, characteristics, and perspective relevant to the PARAM_TASK_GOAL and PARAM_PRIMARY_SUBJECT.
  Example: You are 'Analytica Prime', an expert data analyst AI. You communicate complex data findings clearly and concisely to business stakeholders. You are objective, precise, and focus on actionable insights derived from data ({PARAM_PRIMARY_SUBJECT}). Your tone is {PARAM_TONE_STYLE}.]
# ==========================================================================
# ==========================================================================
# USER CONFIGURATION BLOCK - MODIFY VALUES BELOW
# ==========================================================================
# Instructions: Fill in the parameters below to define your specific task.
# Be as clear and specific as possible.
# --- Core Task Definition ---
PARAM_TASK_GOAL: "[Clearly state the primary objective of the task. What should the AI achieve? e.g., Generate a technical explanation, Draft a marketing proposal, Create a tutorial script, Summarize complex information]"
PARAM_PRIMARY_SUBJECT: "[Specify the main topic, concept, input data, or context the AI should focus on. e.g., Quantum computing basics, Analysis of provided sales data CSV, Concept of REST APIs, User feedback summary]"
PARAM_KEY_MESSAGE_OR_CORE_OUTPUT: "[What is the single most important takeaway, result, or piece of information the final output must convey or contain? e.g., REST APIs are stateless, Sales Trend X is significant, Key steps are A, B, C]"
PARAM_SPECIFIC_SUBCOMPONENTS: "[List any specific sections, elements, functions, or sub-topics that MUST be included in the output. Use bullet points if needed. e.g., - Explain superposition, - Include code example for API call, - Address potential user concerns]"

# --- Audience & Style Definition ---
PARAM_TARGET_AUDIENCE: "[Describe the intended recipient(s) of the output. Be specific about their expertise level and background. e.g., Beginner programmers, Senior marketing executives, Non-technical stakeholders, Experienced researchers]"
PARAM_AUDIENCE_PREREQUISITES: "[What prior knowledge or context can be assumed about the audience? e.g., Familiarity with basic algebra, Understanding of cloud computing terms, No prior knowledge assumed]"
PARAM_TONE_STYLE: "[Define the desired tone, style, and voice. Use descriptive adjectives. e.g., Formal and academic, Conversational and engaging, Technical and precise, Encouraging and supportive, Neutral and objective]"

# --- Structure & Format Constraints ---
PARAM_OUTPUT_STRUCTURE_GUIDELINES: """
[Define the desired structure or format for the output. This can be an outline with headings, specific sections required, or formatting rules. Use placeholders if needed, referencing other params.
Example Outline:
1.  Introduction (Brief overview of {PARAM_PRIMARY_SUBJECT})
2.  Key Concept 1: [Subcomponent 1 from PARAM_SPECIFIC_SUBCOMPONENTS]
3.  Key Concept 2: [Subcomponent 2 from PARAM_SPECIFIC_SUBCOMPONENTS]
    - Detail A
    - Detail B
4.  Example/Illustration: [Provide a concrete example related to {PARAM_PRIMARY_SUBJECT}]
5.  Conclusion (Summarizing {PARAM_KEY_MESSAGE_OR_CORE_OUTPUT})
Example Format: JSON object with keys 'summary', 'key_findings', 'recommendations'.]
"""
PARAM_LENGTH_CONSTRAINTS: "[Specify any length limitations or targets. e.g., Approx 500 words, Max 3 paragraphs, Concise bullet points, No strict limit but be comprehensive]"
PARAM_FORMATTING_REQUIREMENTS: "[Specify formatting rules. e.g., Use Markdown for headings and lists, Code blocks must use 'python' identifier, Output must be valid JSON, Use APA citation style]"

# --- Quality & Content Guardrails ---
PARAM_QUALITY_GUARDRAILS: """
[List specific quality requirements, constraints, or things the AI MUST DO or MUST AVOID. Use bullet points.
Examples:
- Ensure factual accuracy; cross-reference information where possible.
- Avoid jargon where possible; define essential technical terms clearly on first use.
- Prioritize clarity and conciseness.
- Do not include personal opinions or subjective statements.
- Ensure all examples provided are directly relevant to {PARAM_PRIMARY_SUBJECT}.
- If discussing capabilities (e.g., of software), state limitations or uncertainties clearly.]
"""
PARAM_KEYWORDS_CONCEPTS_INCLUDE: "[List any specific keywords, terms, or concepts that should be prominently featured or included in the output. e.g., 'scalability', 'user experience', 'data integrity']"
PARAM_KEYWORDS_CONCEPTS_EXCLUDE: "[List any specific keywords, terms, concepts, or topics that should be explicitly avoided. e.g., 'competitor X', specific outdated technologies, overly technical jargon for this audience]"
# ==========================================================================



# ==========================================================================
# EXECUTION PROTOCOL (Core Framework Logic - Generally Do Not Modify)
# ==========================================================================
INSTRUCTIONS: Adopt the PERSONA defined above. Carefully review all parameters in the USER CONFIGURATION BLOCK. Execute the following steps sequentially based *only* on the provided configuration.

--- STEP 1: Planning & Strategy Formulation (Chain-of-Thought Output) ---
Directive: Analyze the configuration and generate a concise execution plan. Output this plan *before* generating the final output. Ensure the plan explicitly references the user-defined parameters.
Output Format: Use Markdown headings for clarity.

**Execution Plan (Based on AEGIS-STF v1.0 Configuration)**

1.1. **Goal & Subject Analysis:**
    *   Primary Task Goal: {PARAM_TASK_GOAL}
    *   Core Subject Matter: {PARAM_PRIMARY_SUBJECT}
    *   Key Message/Output: {PARAM_KEY_MESSAGE_OR_CORE_OUTPUT}
    *   Target Audience: {PARAM_TARGET_AUDIENCE} (Prerequisites: {PARAM_AUDIENCE_PREREQUISITES})

1.2. **Content & Structure Outline:**
    *   Adhering to Structure: {PARAM_OUTPUT_STRUCTURE_GUIDELINES}
    *   Required Subcomponents: {PARAM_SPECIFIC_SUBCOMPONENTS}
    *   Output Format/Length: {PARAM_FORMATTING_REQUIREMENTS}, {PARAM_LENGTH_CONSTRAINTS}

1.3. **Tone & Style Approach:**
    *   Adopt Tone: {PARAM_TONE_STYLE}

1.4. **Key Concepts & Guardrails:**
    *   Include Concepts: {PARAM_KEYWORDS_CONCEPTS_INCLUDE}
    *   Exclude Concepts: {PARAM_KEYWORDS_CONCEPTS_EXCLUDE}
    *   Adhere to Quality Guardrails: {PARAM_QUALITY_GUARDRAILS}

1.5. **Persona Confirmation:**
    *   Executing as: [Briefly restate the core of the defined PERSONA]

--- STEP 2: Output Generation ---
Directive: Generate the full output based *exactly* on the validated plan from STEP 1 and adhering strictly to all configuration parameters (especially `PARAM_OUTPUT_STRUCTURE_GUIDELINES`, `PARAM_FORMATTING_REQUIREMENTS`, `PARAM_LENGTH_CONSTRAINTS`, `PARAM_TONE_STYLE`, and `PARAM_QUALITY_GUARDRAILS`).
Execute the generation process now.
[Optional: Add specific sub-directives here if needed for complex generation steps based on PARAM_OUTPUT_STRUCTURE_GUIDELINES]

--- STEP 3: Self-Critique and Refinement ---
Directive: Review the generated output (from STEP 2) against the initial configuration parameters and the plan (from STEP 1). Output a brief critique matrix. Make minor internal adjustments to the output if necessary based on critique *before* presenting the final output below.

**Self-Critique Matrix**

| Criteria                        | Adherence Check (Pass/Fail/Partial) | Brief Justification/Note                                      |
| :------------------------------ | :------------------------------------ | :------------------------------------------------------------ |
| **Task Goal Fulfillment**       |                                       | Output directly addresses {PARAM_TASK_GOAL}?                |
| **Subject Focus**               |                                       | Output remains focused on {PARAM_PRIMARY_SUBJECT}?          |
| **Key Message Delivery**        |                                       | Is {PARAM_KEY_MESSAGE_OR_CORE_OUTPUT} clearly conveyed?     |
| **Audience Appropriateness**    |                                       | Language/complexity suitable for {PARAM_TARGET_AUDIENCE}? |
| **Tone & Style Consistency**    |                                       | Is {PARAM_TONE_STYLE} maintained throughout?                |
| **Structure Adherence**         |                                       | Does output follow {PARAM_OUTPUT_STRUCTURE_GUIDELINES}?     |
| **Subcomponent Inclusion**      |                                       | Are all {PARAM_SPECIFIC_SUBCOMPONENTS} included?            |
| **Format/Length Constraints**   |                                       | Adheres to {PARAM_FORMATTING_REQUIREMENTS} & {PARAM_LENGTH_CONSTRAINTS}? |
| **Keyword Inclusion/Exclusion** |                                       | Concepts included/excluded as per params?                   |
| **Quality Guardrail Compliance**|                                       | Does output comply with all {PARAM_QUALITY_GUARDRAILS}?     |
| **Persona Consistency**         |                                       | Output reflects the defined PERSONA?                        |

=========================
FINAL OUTPUT
=========================
Directive: Present the final, reviewed, and potentially refined output generated in STEP 2, conforming to all validated requirements.
(AI generates the final output content here based on the preceding steps and self-critique)

</GENERALIZED_STRUCTURED_TASK_FRAMEWORK>


