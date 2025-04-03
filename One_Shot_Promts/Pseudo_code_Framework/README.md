**Explanation of Changes and Reusability:**

1.  **Generic Naming:** Replaced specific terms like `PARAM_PRIMARY_TOPIC`, `PARAM_ARTICLE_GOAL`, `PARAM_SEO_KEYWORDS` with more abstract concepts like `PARAM_TASK_GOAL`, `PARAM_PRIMARY_SUBJECT`, `PARAM_KEY_MESSAGE_OR_CORE_OUTPUT`, `PARAM_KEYWORDS_CONCEPTS_INCLUDE`/`EXCLUDE`.
2.  **Placeholder Instructions:** Added clear `[...]` placeholders within the `USER CONFIGURATION BLOCK` parameters, guiding the user on what kind of information to provide.
3.  **Flexible Structure Parameter:** `PARAM_OUTPUT_STRUCTURE_GUIDELINES` is now highly flexible, allowing users to define simple outlines, complex formatting rules (like JSON), or narrative flows.
4.  **Generalized Guardrails:** `PARAM_QUALITY_GUARDRAILS` is now a free-form block for users to list their specific quality requirements, rather than pre-defined ones (though examples are given).
5.  **Persona Placeholder:** The `PERSONA` block now explicitly instructs the user to define the persona relevant to *their* task.
6.  **Adaptive Execution Protocol:** The `EXECUTION PROTOCOL` steps (Plan, Generate, Critique) now reference the generic parameter names (`{PARAM_TASK_GOAL}`, etc.). This ensures the AI's internal process aligns with the user's specific configuration.
7.  **Generalized Critique Matrix:** The criteria in the `Self-Critique Matrix` are now linked to the generic parameters, making the self-assessment relevant regardless of the specific task.
8.  **Clear User Section:** The separation between the `USER CONFIGURATION BLOCK` (intended for modification) and the rest of the framework (generally not modified) is maintained and emphasized.
9.  **Framework Versioning:** Introduced `FRAMEWORK_VERSION` for better tracking and management.

**How to Use:**

A user would take this template and:

1.  Fill in all the `[...]` placeholders within the `USER CONFIGURATION BLOCK` according to their specific task requirements.
2.  Define the appropriate `PERSONA`.
3.  Submit the *entire* completed template (including the Execution Protocol) to the LLM.
