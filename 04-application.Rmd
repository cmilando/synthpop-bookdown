# Application

Here, we detail the methods used to apply the parcel-level synthetic population to a use-case example as well as a hypothetical health impact assessment.

## Use-case: proximity to major roadway

We assign proximity to major roadway for each parcel as a proxy for air pollution using the following scripts:

**[04] - [Distance-to-road] - CALCULATE.R**

-   Calculates shortest distance to major roadways.

**[04b] - [Distance-to-road] - MERGE with synth pop.R**

-   Merges the distances for parcels with the synthetic population households in the respective parcels.

**[05a] - [Distance-to-road] - Make calculated and misclassified datasets.R**

-   Randomize to make a 'misclassified' version of the parcel-level data

**[05b] - [Distance-to-road] - Make combined dataset.R**

-   Combine calculated and 'misclassified' versions into one dataset

**[05c] - [Distance-to-road] - Make combined plots and maps.R**

-   Creates plots and maps showing the results

**[06a] - [Distance-to-road] - Checking for related variables.R**

-   Examines potential social determinants of health that may be associated with proximity to major roadway (as a proxy for air pollution exposure)

## Hypothetical health impact assessment

To evaluate whether the use of a synthetic population produced with matched vs. random allocation leads to different conclusions about health impacts, we conducted a hypothetical health impact assessment.

Health impact assessments use exposure-response associations derived from the epidemiological literature. We constructed a conceptual model for a logit regression that can be applied for our example with both a main effect and a modifier variable (for example, income-level).

$$
\text{logit}(Y) = \beta_0 + \beta_M \cdot \text{modifier} + \beta_E \cdot \text{exposure} + \beta_I \cdot \text{modifier} \cdot \text{exposure}
$$

We used this model to estimate: the change in cases among householders with the exposure and modifier, testing different exposure-modifier associations and model coefficients.

While this model is presented as a hypothetical, exposures might include:

-   particulate matter
-   heat index
-   greenspace

Modifiers may include:

-   median household income
-   householder race and ethnicity
-   householder tenure
-   householder education status

The code used to conduct the hypothetical health impact assessment is provided here:

**[HIA] - hypothetical health impact assessment.R**
