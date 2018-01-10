import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import LogNorm

df = pd.read_csv("heyy.csv")

#value = 'period'
value = 'amplitude'

show_pop = [20, 50, 100, 200, 500, 1000]

# parse data
data = [
    df[df["population"]==n].pivot(index='alpha', columns='beta', values=value).fillna(0) for n in show_pop
]

vmin = min(np.min(d.values) for d in data)
vmax = max(np.max(d.values) for d in data)

fig, axs = plt.subplots(1, len(show_pop))

for ax, d, p in zip(axs, data, show_pop):
    d = d[d.columns[::-1]]
    print(d)
    print(d.values)
    im = ax.imshow(d, vmin=vmin, vmax=vmax)
    ax.set_title(str(value) + ' for population of ' + str(p))
    ax.set_xlabel('alpha')
    ax.set_ylabel('beta')
    ax.set_xticklabels(d.index)
    ax.set_yticklabels(d.columns)

fig.subplots_adjust(right=0.8)
cbar_ax = fig.add_axes([0.85, 0.29, 0.05, 0.41])
fig.colorbar(im, cax=cbar_ax)

plt.show()