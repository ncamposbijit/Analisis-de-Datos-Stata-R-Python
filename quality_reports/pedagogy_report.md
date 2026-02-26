# Pedagogical Review: Análisis de Datos — ECON 326, UBC 2026

**Date:** 2026-02-25
**Course:** ECON 326: Introduction to Econometrics II, University of British Columbia
**Author:** Nicolás Campos Bijit
**Files reviewed:** index.Rmd, tutorial1.Rmd, tutorial2.Rmd, tutorial3.Rmd, tutorial4.Rmd (placeholder), tutorial5.Rmd
**Overall rating: 7/10**

---

## Summary

- **Patterns followed:** 7/13
- **Patterns violated:** 4/13
- **Patterns partially applied:** 2/13

The textbook has genuine pedagogical strengths — strong worked examples, well-structured proof sequences, a motivating empirical application in T2, and an exceptionally clear treatment of potential outcomes in T5. The core narrative arc (R tools → OLS mechanics → OLS theory → causality) is coherent. The main weaknesses are structural: T2 begins with formalism rather than motivation; there is a large conceptual gap between T3 and T5 with no coverage of inference (t-tests, confidence intervals, hypothesis testing); T1 is substantially longer than later tutorials; and the book currently ends before connecting OLS to the statistical inference tools students need to read regression output critically.

---

## Top 5 Actionable Recommendations

**1. Add a tutorial on statistical inference before Tutorial 5 (CRITICAL)**
Students completing T3 know $\hat\beta_1$ is unbiased and know its variance formula, but cannot yet interpret t-statistics, standard errors, or p-values. T5 Block 5 references a t-stat of 1.79 and "borderline statistical significance" without any prior scaffolding. A Tutorial 3.5 covering: (a) the t-statistic, (b) the $t(n-2)$ null distribution, (c) confidence intervals, and (d) the F-test, would complete the OLS theory arc. Estimated addition: 300–400 lines.

**2. Add motivation at the start of Tutorial 2 (HIGH)**
T2 currently opens with the regression model and OLS objective with no "Why?" framing. A 10-line motivating paragraph — referencing the education-income example from T1, and explaining why we minimize squared rather than absolute residuals — would connect T1 to T2 narratively.

**3. Establish a visual hierarchy for boxed results (MEDIUM)**
`\boxed{}` is applied to 9+ results in T2 and 6+ in T3 Part A, giving equal visual weight to minor algebraic steps and the central unbiasedness theorem. Define a two-level system: a `.keyresult` callout for the 3–5 must-memorize results per tutorial, and plain equations for intermediate steps.

**4. Add two diagrams (HIGH)**
(a) In T2, before the OLS objective function, add a scatter plot showing a cloud of data, a candidate line, and vertical residuals drawn to the line — this makes "minimizing squared distances" immediately intuitive.
(b) In T3 Part B, before defining $m(x) = \mathbb{E}[Y|X=x]$, add a diagram showing the conditional distribution of $Y$ given $X$ for two values of $X$, with the PRF connecting the conditional means.

**5. Add notation reconciliation notes (LOW)**
Two notation shifts occur without comment: (a) T2 opens with $\varepsilon_i$ but T3 uses $u_i$ — one sentence resolves this. (b) T5 switches from uppercase $(Y_i, X_i)$ to lowercase $(y_i, x_i)$ following Wooldridge Ch. 2 — one sentence at the start of T5 prevents confusion.

---

## Pattern-by-Pattern Assessment

### Pattern 1: Motivation Before Formalism — PARTIALLY APPLIED

- **Strong:** T1 opens with "Why use R?" before any code. T3 has "Narrative idea" callouts before each part. T5 opens with Block 1 titled "Motivation — Why Do We Need Potential Outcomes?" — excellent.
- **Violation:** T2 opens on line 1 with the population model $Y_i = \beta_0 + \beta_1 X_i + \varepsilon_i$ and immediately states the OLS objective function, with zero motivating text.

### Pattern 2: Incremental Notation — FOLLOWED

- Notation builds one concept at a time throughout. T5 introduces $y_i(0)$, $y_i(1)$, $\tau_i$ sequentially in a framed box before use. No section introduces more than 4–5 new symbols simultaneously.

### Pattern 3: Worked Example After Every Definition — FOLLOWED (strength)

- Every derived result is followed immediately by its derivation and interpretation. Q4 in T5 Block 3 is a textbook-quality numerical walkthrough of ATE, ATT, and selection bias.

### Pattern 4: Progressive Complexity — FOLLOWED

- T1 (R) → T2 (OLS mechanics) → T3 (OLS theory) → T5 (causal inference) is well-ordered. Within T3, the order (sample identities → PRF → unbiasedness → variance → interpretation) is canonical.

### Pattern 5: Fragment Reveals (Question → Solution) — FOLLOWED

- T2 uses `#### Question` / `#### Solution` consistently. T3 uses the same pattern for every proof. T5 uses `::: {.solution}` fenced divs after every sub-question.

### Pattern 6: Transition Markers at Conceptual Pivots — PARTIALLY APPLIED

- **Strong:** T3's "Narrative idea" paragraphs and T5's numbered blocks with time estimates are excellent structural markers.
- **Violation:** T2 has no transition between Problem 1 (pure derivation) and Problem 2 (401K application). The T3→T5 gap is the largest structural hole: inference is never covered.

### Pattern 7: Unpacking Dense Theorems — FOLLOWED (adapted)

- The "statement then derivation then interpretation" structure in T3 (e.g., D2: state variance formula → prove it → interpret each component) is an effective adaptation of this pattern.

### Pattern 8 & 9: Box Hierarchy — VIOLATED

- `\boxed{}` applied to 9+ results in T2 Problem 1 and 6+ in T3 Part A. Minor identities ($\sum\hat{u}_i = 0$) carry the same visual weight as the central unbiasedness result ($\mathbb{E}[\hat\beta_1] = \beta_1$). Nothing stands out when everything is boxed.

### Pattern 10: Box Fatigue — VIOLATED

- Approximately one box every 30–35 lines in T2 and T3. Aim for 3–5 high-priority boxes per tutorial.

### Pattern 11: Socratic Embedding — FOLLOWED

- T3 B4, B5, C4 contain genuine conceptual prompts (e.g., "Explain why $\text{Cov}(X,u)=0$ alone does not guarantee $\mathbb{E}[u|X]=0$"). T5's multi-part questions build on each other in a guided discovery sequence.

### Pattern 12: Visual-First for Complex Concepts — VIOLATED

- No tutorial contains a diagram of OLS geometry, the conditional expectation function, or the counterfactual gap. The only visualization in T2 is an optional scatter plot at the end of Problem 2, after all algebra is complete.

### Pattern 13: Side-by-Side Comparisons — FOLLOWED (partially)

- **Best moment in the book:** T3 B3's sample/population parallel table:

  | Sample (by construction) | Population (by assumption) |
  |:---|:---|
  | $\sum \hat{u}_i = 0$ | $\mathbb{E}[u] = 0$ |
  | $\sum X_i\hat{u}_i = 0$ | $\text{Cov}(X,u) = 0$ |

- **Opportunity:** T3 B4 presents zero conditional mean vs. mean independence in consecutive paragraphs rather than side-by-side. T5 presents ATE and ATT sequentially rather than in a comparative layout.

---

## Narrative Arc Assessment

The overall arc is coherent and professionally sequenced:

- **T1** establishes the computational environment thoroughly. The education-income preview at the end nicely foreshadows T2.
- **T2** delivers OLS mechanics algebraically, then grounds them in the 401K application.
- **T3** is the strongest tutorial — the most sophisticated, with "Narrative idea" connectives transforming a proof sequence into a coherent argument.
- **T4** placeholder handled correctly.
- **T5** is the most tightly designed tutorial (50-minute block structure) with outstanding potential outcomes pedagogy.

**Main narrative gap:** The book covers OLS derivation and theory but never covers inference. Students finish T3 without knowing how to test $H_0: \beta_1 = 0$ or construct a confidence interval, yet T5 references t-statistics. The arc also ends without pointing toward multiple regression and observational methods — the natural next step after the causal inference motivation of T5.

---

## Pacing Assessment

| Tutorial | Estimated Student Time | Notes |
|:---------|:----------------------:|:------|
| T1 | 3–4 hours | Too long relative to others; consider splitting |
| T2 | 1–1.5 hours | Well-paced |
| T3 | 2–3 hours | Dense but well-structured; "Narrative idea" helps |
| T5 | 50 minutes (stated) | Excellent, most tightly paced |

**Imbalance:** T1 is 3–5× longer than any other tutorial. Consider labeling sections as "required" vs. "reference."

---

## Notation Consistency

| Issue | Location | Severity |
|:------|:---------|:---------|
| $\varepsilon_i$ (T2) vs. $u_i$ (T3) for population error | T2 line 22, T3 line 19 | Medium |
| Uppercase $Y_i, X_i$ (T2, T3) vs. lowercase $y_i, x_i$ (T5) | T5 line 1 | Low |
| $\mathbb{E}[\cdot]$, $\text{Cov}(\cdot)$ used without intro | T3 Part B | Low |
| Gauss-Markov assumptions unnamed (no SLR.1–SLR.5 labels) | T3 throughout | Medium |

---

## Coverage Gaps

| Gap | Severity | Natural Location |
|:----|:---------|:----------------|
| Statistical inference (t-tests, CIs, F-test) | **Critical** | Between T3 and T5 |
| Multiple regression | Important | After T5 |
| OLS assumption violations (heteroskedasticity, omitted variable bias) | Moderate | After inference tutorial |
| Gauss-Markov theorem statement | Low | End of T3 |

---

## Strengths to Preserve

1. **T3 "Narrative idea" connectives** — best pedagogical writing in the book
2. **T3 B3 sample/population parallel table** — clearest conceptual moment
3. **T5 Block 3 numerical exercise** (Q4) — excellent ATE/ATT/selection bias walkthrough
4. **T5 Block 4 "Why does random assignment work?"** — outstanding three-step mechanism explanation
5. **T3 R simulation chunks** — every major theorem verified computationally
6. **T2 Problem 2** (401K) — strong policy-relevant application grounding abstract algebra
7. **T1 code practices section** — treating R as a programming language, not a calculator
