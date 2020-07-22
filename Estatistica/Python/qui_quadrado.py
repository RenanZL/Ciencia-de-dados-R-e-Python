import numpy as np
from scipy.stats import chi2_contingency

base = np.array([[19,6], [43, 32]])
chi2_contingency(base)
