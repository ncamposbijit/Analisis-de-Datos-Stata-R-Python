# Tutorial 5 — Potential Outcomes, Causality, and Counterfactual Reasoning

**Duration: 50 minutes**
**Source: Wooldridge, Introductory Econometrics — Sections 1-4 and 2-7a**

---

## BLOCK 1: Counterfactual Reasoning and the Fundamental Problem (10 min)

### Question 1 (Conceptual — Explanation)

Consider a farmer who applies fertilizer to his crops and obtains a yield of 180 bushels per acre (Example 1.3 from the book).

**(a)** What does it mean to ask: "What is the **causal effect** of fertilizer on crop yield"?

<details>
<summary><b>Solution</b></summary>

To ask about the causal effect means: **how much of the 180 bushels is due to the fertilizer, holding all other factors fixed (ceteris paribus)?** We want to compare the yield *with* fertilizer to what the yield *would have been without* fertilizer, keeping everything else (rain, soil quality, sunlight, seed type, etc.) exactly the same. That unobserved "what would have been" is the **counterfactual**.

</details>

---

**(b)** Why is it impossible to directly observe this causal effect for this specific farmer?

<details>
<summary><b>Solution</b></summary>

Because of the **fundamental problem of causal inference**: we can never observe the same unit (this farmer, this plot, this season) in both states simultaneously. The farmer either used fertilizer or did not. We observe the outcome under one state but **never the counterfactual**. We cannot rewind time and replay the season without fertilizer while keeping everything else identical.

</details>

---

### Question 2 (Conceptual — Example from the book)

Consider Example 1.4 (Measuring the Return to Education). A policy maker wants to know the "return to education." Informally, the question is: if a person is chosen from the population and given another year of education, by how much will his or her wage increase?

**(a)** Why is this a counterfactual question?

<details>
<summary><b>Solution</b></summary>

Because we are asking: what **would** this person's wage be if they had one more year of education, compared to what it actually is? We are comparing two states of the world for the **same individual** — one where they have their current education level, and one where they have one additional year. We can only observe one of these two states. The other is a counterfactual.

</details>

---

**(b)** Why can't we simply compare the average wage of people with 16 years of education to the average wage of people with 15 years of education and call that the causal effect?

<details>
<summary><b>Solution</b></summary>

Because people with different education levels likely differ in many other ways: ability, family background, motivation, socioeconomic status, etc. These are **confounding factors**. A simple comparison of group averages mixes together the effect of education **and** the effect of all these other differences. We cannot hold "all other factors fixed" (ceteris paribus) just by comparing different groups of people. This is exactly the **selection bias** problem we will formalize later.

</details>

---

### Question 3 (Conceptual — Quick check)

For each of the following, identify the **treatment**, the **outcome**, and explain briefly why the causal question is difficult:

**(a)** Does hiring more police officers reduce city crime? (Example 1.5)

<details>
<summary><b>Solution</b></summary>

- **Treatment:** Number of police officers (e.g., increasing police force size)
- **Outcome:** City crime rate
- **Difficulty:** Cities with higher crime rates may *already* hire more police. So if we observe a positive correlation between police and crime, it does not mean police *cause* crime — the relationship is confounded by reverse causality. We cannot randomly assign police to cities, and cities differ in many ways (population, poverty, etc.).

</details>

**(b)** Does increasing the minimum wage increase unemployment? (Example 1.6)

<details>
<summary><b>Solution</b></summary>

- **Treatment:** Level of the minimum wage
- **Outcome:** Employment/unemployment level
- **Difficulty:** Minimum wages are set by political and economic forces that also affect employment. Areas that raise the minimum wage may be economically different from those that don't. Various economic and political forces that impact the final minimum wage also affect employment levels, making it hard to isolate the causal effect.

</details>

---

## BLOCK 2: Potential Outcomes Notation — Definitions (10 min)

### Question 4 (Notation — Math)

We now formalize the ideas from Block 1. Consider a binary treatment $x_i \in \{0, 1\}$ for individual $i$.

**(a)** Define the two **potential outcomes** $y_i(0)$ and $y_i(1)$. What do they represent?

<details>
<summary><b>Solution</b></summary>

- $y_i(1)$ = the outcome individual $i$ **would** experience **if treated** ($x_i = 1$)
- $y_i(0)$ = the outcome individual $i$ **would** experience **if not treated** ($x_i = 0$)

These are defined for **every** individual regardless of their actual treatment status. For each person, both potential outcomes *exist conceptually*, but we can only observe one of them.

</details>

---

**(b)** Define the **individual treatment effect** $\tau_i$. Why can we never compute it directly?

<details>
<summary><b>Solution</b></summary>

$$\tau_i = y_i(1) - y_i(0)$$

This is the causal effect of the treatment for individual $i$. We can **never** compute it because we only observe one of $y_i(1)$ or $y_i(0)$, never both. This is the fundamental problem of causal inference restated in potential outcomes notation.

</details>

---

**(c)** Write the **observed outcome** $y_i$ in terms of $x_i$, $y_i(0)$, and $y_i(1)$. This is equation [2.77] from the book.

<details>
<summary><b>Solution</b></summary>

$$y_i = x_i \cdot y_i(1) + (1 - x_i) \cdot y_i(0)$$

**Interpretation:**
- If $x_i = 1$ (treated): $y_i = y_i(1)$ — we observe the treated potential outcome
- If $x_i = 0$ (not treated): $y_i = y_i(0)$ — we observe the untreated potential outcome

This is sometimes called the **switching equation**: the treatment "switches" which potential outcome we observe.

</details>

---

### Question 5 (Math — Algebraic manipulation)

Starting from the switching equation $y_i = x_i \cdot y_i(1) + (1 - x_i) \cdot y_i(0)$:

**(a)** Show that we can rewrite this as:

$$y_i = y_i(0) + [y_i(1) - y_i(0)] \cdot x_i$$

<details>
<summary><b>Solution</b></summary>

Start with:
$$y_i = x_i \cdot y_i(1) + (1 - x_i) \cdot y_i(0)$$

Expand:
$$y_i = x_i \cdot y_i(1) + y_i(0) - x_i \cdot y_i(0)$$

Factor out $x_i$:
$$y_i = y_i(0) + x_i [y_i(1) - y_i(0)]$$

$$\boxed{y_i = y_i(0) + \tau_i \cdot x_i}$$

where $\tau_i = y_i(1) - y_i(0)$ is the individual treatment effect.

</details>

---

**(b)** Now suppose the treatment effect is **constant** across all individuals: $\tau_i = \tau$ for all $i$. Let $\beta_0 = E[y(0)]$ and define $u_i = y_i(0) - E[y(0)]$. Show that we can write:

$$y_i = \beta_0 + \tau \cdot x_i + u_i$$

What does this equation look like?

<details>
<summary><b>Solution</b></summary>

From part (a), with constant treatment effect $\tau$:
$$y_i = y_i(0) + \tau \cdot x_i$$

Write $y_i(0) = E[y(0)] + [y_i(0) - E[y(0)]] = \beta_0 + u_i$:

$$y_i = \beta_0 + \tau \cdot x_i + u_i$$

This looks exactly like the **simple linear regression model**: $y = \beta_0 + \beta_1 x + u$, where the slope coefficient $\beta_1 = \tau$ is the causal treatment effect! This shows the deep connection between the potential outcomes framework and regression.

</details>

---

## BLOCK 3: ATE, ATT, and When They Differ (10 min)

### Question 6 (Definitions — Math)

**(a)** Write the formula for the **Average Treatment Effect (ATE)**. What population does it refer to?

<details>
<summary><b>Solution</b></summary>

$$ATE = E[y(1) - y(0)] = E[y(1)] - E[y(0)]$$

**(Equation [2.75] in the book)**

The ATE is the expected treatment effect **across the entire population** — including both those who are treated and those who are not. It answers: "If we randomly picked someone from the whole population and treated them, what effect would we expect on average?"

</details>

---

**(b)** Write the formula for the **Average Treatment Effect on the Treated (ATT)**. How does it differ from the ATE?

<details>
<summary><b>Solution</b></summary>

$$ATT = E[y(1) - y(0) \mid x = 1]$$

**(Equation [2.76] in the book)**

The ATT conditions on the individual **actually being treated**. It answers: "Among those who were actually treated, what was the average effect?"

The difference: ATE averages over **everyone**, ATT only over those with $x = 1$. If the treatment effect varies across individuals (heterogeneous treatment effects), and those who select into treatment have different effects than those who don't, then $ATE \neq ATT$.

</details>

---

**(c)** Give an intuitive example where $ATE \neq ATT$.

<details>
<summary><b>Solution</b></summary>

**Job training program** (like the JTRAIN example in the book): Suppose a job training program is offered and people choose whether to participate.

- Those who **choose** to enroll may be more motivated or may have lower baseline employment prospects, so they might benefit **more** from the program
- People who are already highly employable may not enroll because they don't need it

Then: ATT (effect among those who chose to participate) could be **larger** than ATE (effect if we trained a random person), because participants are those who benefit most.

Another example: If highly able workers self-select into college, the ATT of college (for those who go) may differ from the ATE (what would happen if a random person were sent to college).

</details>

---

### Question 7 (Math)

Suppose we have a population with two types of individuals:

| Type | Fraction | $y_i(0)$ | $y_i(1)$ |
|------|----------|-----------|-----------|
| A    | 0.6      | 2         | 5         |
| B    | 0.4      | 4         | 6         |

**(a)** Compute the individual treatment effect for each type.

<details>
<summary><b>Solution</b></summary>

- Type A: $\tau_A = y_A(1) - y_A(0) = 5 - 2 = 3$
- Type B: $\tau_B = y_B(1) - y_B(0) = 6 - 4 = 2$

</details>

---

**(b)** Compute the **ATE**.

<details>
<summary><b>Solution</b></summary>

$$ATE = E[\tau] = 0.6 \times 3 + 0.4 \times 2 = 1.8 + 0.8 = \boxed{2.6}$$

</details>

---

**(c)** Now suppose that **only Type A** individuals get treated ($x = 1$ for Type A, $x = 0$ for Type B). Compute the **ATT**.

<details>
<summary><b>Solution</b></summary>

ATT = $E[\tau \mid x = 1]$. Since only Type A is treated:

$$ATT = \tau_A = \boxed{3}$$

Note: $ATT = 3 \neq 2.6 = ATE$. This is because the people who are treated (Type A) have a larger treatment effect than the population average.

</details>

---

## BLOCK 4: Random Assignment and Selection Bias (10 min)

### Question 8 (Key derivation — Math)

This is one of the most important results in the course. Consider the simple difference in sample means between treated and untreated:

$$\bar{y}_1 - \bar{y}_0$$

where $\bar{y}_1$ is the average outcome among treated units and $\bar{y}_0$ among untreated.

**(a)** Using the law of iterated expectations, show that the **population** version of this comparison can be decomposed as:

$$E[y \mid x=1] - E[y \mid x=0] = \underbrace{E[y(1) - y(0) \mid x=1]}_{ATT} + \underbrace{E[y(0) \mid x=1] - E[y(0) \mid x=0]}_{\text{Selection Bias}}$$

*(Hint: start by writing $E[y \mid x=1] = E[y(1) \mid x=1]$ and $E[y \mid x=0] = E[y(0) \mid x=0]$, then add and subtract $E[y(0) \mid x=1]$.)*

<details>
<summary><b>Solution</b></summary>

From the switching equation:
- When $x = 1$: $y = y(1)$, so $E[y \mid x=1] = E[y(1) \mid x=1]$
- When $x = 0$: $y = y(0)$, so $E[y \mid x=0] = E[y(0) \mid x=0]$

Now:
$$E[y \mid x=1] - E[y \mid x=0] = E[y(1) \mid x=1] - E[y(0) \mid x=0]$$

**Add and subtract** $E[y(0) \mid x=1]$:

$$= E[y(1) \mid x=1] - E[y(0) \mid x=1] + E[y(0) \mid x=1] - E[y(0) \mid x=0]$$

$$= \underbrace{E[y(1) - y(0) \mid x=1]}_{ATT} + \underbrace{E[y(0) \mid x=1] - E[y(0) \mid x=0]}_{\text{Selection Bias}}$$

$\square$

</details>

---

**(b)** Explain in words what the **selection bias** term means.

<details>
<summary><b>Solution</b></summary>

The selection bias is $E[y(0) \mid x=1] - E[y(0) \mid x=0]$.

This compares the **baseline outcome** (the outcome *without treatment*) between those who chose treatment and those who did not. If treated individuals would have had different outcomes *even without treatment*, then simply comparing group averages will confuse pre-existing differences with the treatment effect.

**Example:** If more motivated workers self-select into job training, they would have had higher employment rates *even without the training*. So $E[y(0) \mid x=1] > E[y(0) \mid x=0]$, creating **positive** selection bias. The naive comparison overstates the training effect.

</details>

---

**(c)** Now suppose treatment is **randomly assigned**. Show that the selection bias disappears, and $\bar{y}_1 - \bar{y}_0$ is an unbiased estimator of the ATE.

<details>
<summary><b>Solution</b></summary>

Under **random assignment**, treatment $x$ is independent of potential outcomes:

$$x \perp (y(0), y(1))$$

This means:
$$E[y(0) \mid x=1] = E[y(0) \mid x=0] = E[y(0)]$$
$$E[y(1) \mid x=1] = E[y(1) \mid x=0] = E[y(1)]$$

**Selection bias vanishes:**
$$E[y(0) \mid x=1] - E[y(0) \mid x=0] = 0$$

**ATT equals ATE:**
$$ATT = E[y(1) - y(0) \mid x=1] = E[y(1) - y(0)] = ATE$$

Therefore:
$$E[\bar{y}_1 - \bar{y}_0] = ATE$$

The simple difference in means is **unbiased** for the ATE. This is why **randomized controlled trials (RCTs)** are the gold standard for estimating causal effects.

</details>

---

## BLOCK 5: Applied Problem — Job Training Program (10 min)

### Question 9 (Application — From Example 2.14 and Problem 14/15 in the book)

A job training program is offered to a group of workers. Let:
- $x_i = 1$ if worker $i$ participates in the program, $x_i = 0$ otherwise
- $y_i = 1$ if worker $i$ is employed after the program, $y_i = 0$ otherwise

Suppose we observe the following data:

| Group | $n$ | Number employed |
|-------|-----|-----------------|
| Treated ($x=1$) | 185 | 150 |
| Control ($x=0$) | 260 | 192 |

**(a)** Compute $\bar{y}_1$ and $\bar{y}_0$.

<details>
<summary><b>Solution</b></summary>

$$\bar{y}_1 = \frac{150}{185} \approx 0.811$$

$$\bar{y}_0 = \frac{192}{260} \approx 0.738$$

</details>

---

**(b)** Compute the estimated treatment effect $\hat{\tau} = \bar{y}_1 - \bar{y}_0$. Interpret this number.

<details>
<summary><b>Solution</b></summary>

$$\hat{\tau} = 0.811 - 0.738 = \boxed{0.073}$$

**Interpretation:** Workers who participated in the job training program had an employment rate approximately **7.3 percentage points** higher than those who did not participate.

</details>

---

**(c)** If this was a **randomized experiment** (as in the JTRAIN data), what causal interpretation can we give to $\hat{\tau}$?

<details>
<summary><b>Solution</b></summary>

Under random assignment, $\hat{\tau} = \bar{y}_1 - \bar{y}_0$ is an **unbiased estimate of the ATE**. We can say: the job training program **caused** an increase in the probability of employment of approximately 7.3 percentage points. There is no selection bias because participation was randomly assigned — the treated and control groups are comparable in all baseline characteristics on average.

</details>

---

**(d)** If instead workers **volunteered** for the program (no randomization), would you trust this estimate? Why or why not?

<details>
<summary><b>Solution</b></summary>

**No**, we should not interpret it as causal. With self-selection:

- Workers who volunteer may be **more motivated** → positive selection bias (we overestimate the effect)
- Or workers who volunteer may have **worse employment prospects** and feel they need help → negative selection bias (we underestimate the effect)

Formally, the selection bias $E[y(0) \mid x=1] - E[y(0) \mid x=0] \neq 0$, so the difference in means captures **both** the treatment effect and the selection bias. We cannot separate them without additional assumptions or methods.

</details>

---

### Question 10 (Problem 15 from the book — Math)

Consider the potential outcomes framework from Section 2-7a, where $y_i(0)$ and $y_i(1)$ are the potential outcomes in each treatment state.

**(a)** The **sample average treatment effect** estimator is:

$$\hat{\tau}_{ate} = n^{-1} \sum_{i=1}^{n} [y_i(1) - y_i(0)]$$

Show that if we could observe $y_i(0)$ and $y_i(1)$ for all $i$, then $\hat{\tau}_{ate}$ would be an unbiased estimator of $\tau_{ate} = E[y(1) - y(0)] = \bar{y}(1) - \bar{y}(0)$.

<details>
<summary><b>Solution</b></summary>

Take the expectation of $\hat{\tau}_{ate}$:

$$E[\hat{\tau}_{ate}] = E\left[n^{-1} \sum_{i=1}^{n} [y_i(1) - y_i(0)]\right]$$

$$= n^{-1} \sum_{i=1}^{n} E[y_i(1) - y_i(0)]$$

Since $\{y_i(1), y_i(0)\}$ are drawn from the same population:

$$= n^{-1} \sum_{i=1}^{n} E[y(1) - y(0)]$$

$$= n^{-1} \cdot n \cdot E[y(1) - y(0)]$$

$$= E[y(1) - y(0)] = \tau_{ate}$$

Therefore $E[\hat{\tau}_{ate}] = \tau_{ate}$, so $\hat{\tau}_{ate}$ is **unbiased**. $\square$

</details>

---

**(b)** Explain why the observed sample averages $\bar{y}_1$ and $\bar{y}_0$ are **not** the same as $\bar{y}(1)$ and $\bar{y}(0)$.

<details>
<summary><b>Solution</b></summary>

$\bar{y}(1) = n^{-1}\sum_{i=1}^{n} y_i(1)$ averages $y_i(1)$ over **all** $n$ individuals — both treated and untreated.

$\bar{y}_1 = n_1^{-1}\sum_{i: x_i=1} y_i$ averages observed outcomes only over the $n_1$ **treated** individuals.

The key difference:
- $\bar{y}(1)$ includes $y_i(1)$ for untreated people (which we don't observe)
- $\bar{y}_1$ only includes observed outcomes from the treated group

Similarly for $\bar{y}(0)$ vs $\bar{y}_0$. They would coincide only if we could observe **both** potential outcomes for everyone, which is impossible.

However, under **random assignment**, $\bar{y}_1$ is an unbiased estimator of $E[y(1)]$ and $\bar{y}_0$ is an unbiased estimator of $E[y(0)]$, so $\bar{y}_1 - \bar{y}_0$ is unbiased for the ATE.

</details>

---

## Summary of Key Formulas

| Concept | Formula |
|---------|---------|
| Potential outcomes | $y_i(0)$, $y_i(1)$ |
| Individual treatment effect | $\tau_i = y_i(1) - y_i(0)$ |
| Observed outcome (switching eq.) | $y_i = x_i \cdot y_i(1) + (1-x_i) \cdot y_i(0)$ |
| Equivalent form | $y_i = y_i(0) + \tau_i \cdot x_i$ |
| ATE | $E[y(1)] - E[y(0)]$ |
| ATT | $E[y(1) - y(0) \mid x=1]$ |
| Selection bias | $E[y(0) \mid x=1] - E[y(0) \mid x=0]$ |
| Decomposition | $E[y \mid x=1] - E[y \mid x=0] = ATT + \text{Selection Bias}$ |
| Random assignment implies | Selection Bias $= 0$ and $ATT = ATE$ |
| Connection to regression | $y_i = \beta_0 + \tau x_i + u_i$ under constant effects |
