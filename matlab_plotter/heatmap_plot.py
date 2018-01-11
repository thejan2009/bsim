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
    df[df["population"]==n]
        .pivot(index='alpha', columns='beta', values=value)
        .fillna(10**(-10))
        .replace(-1, 10**(-10))
        .replace(0, 10**(-10)) for n in show_pop
]

vmin = min(np.min(d.values) for d in data)
vmax = max(np.max(d.values) for d in data)

fig, axs = plt.subplots(2, int(len(show_pop)/2), figsize=(20, 12))

for ax, d, p in zip(axs.flatten(), data, show_pop):
    d = d[d.columns[::-1]]
    #print(d)
    #print(d.values)
    X, Y = np.meshgrid(d.index, d.columns)
    if value == 'period':
        im = ax.pcolormesh(X, Y, d.values, vmin=vmin, vmax=vmax)
    else:
        im = ax.pcolormesh(X, Y, d.values, vmin=vmin, vmax=vmax, norm=LogNorm())
    ax.set_title(str(value) + ' for population of ' + str(p))
    ax.set_xlabel('alpha')
    ax.set_ylabel('beta')
    ax.set_xscale('log')
    ax.set_yscale('log')

fig.subplots_adjust(right=0.85)
cbar_ax = fig.add_axes([0.87, 0.29, 0.05, 0.41])
fig.colorbar(im, cax=cbar_ax)

plt.savefig(value + ".eps", bbox_inches='tight')