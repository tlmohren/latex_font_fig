import matplotlib.pyplot as plt
import numpy as np
import matplotlib

plt.style.use('latex_scientificPaperStyle')

font = {'family':'serif', 'serif': ['computer modern roman']}
plt.rc('font',**font)
matplotlib.rcParams['text.latex.preamble']=[r"\usepackage{amsmath}"]

# create signals
x = np.arange( 0, 1, 0.01)
y = np.sin( np.pi*4*x)
y2 = np.sin( np.pi*4*( x+0.1) )

#initiate figure
fig = plt.figure(figsize=(2.5,2 ))
ax = plt.gca()

# plot lines
lines = plt.plot(x, y, x, y2)

# set axis labels
plt.xlabel(r'$\dot{\theta}$')
plt.ylabel(r'$\frac{\partial \theta}{\partial t}$',rotation=0)

# setup axes
plt.axis([-0.1,1.1,-1.1,1.1])
ax.set_xticks( np.arange(0,1+0.5,0.5))
ax.set_xticklabels( range(-1,1+1,1))
ax.set_yticks( range(-1,1+1,1))
ax.spines['left'].set_linewidth(0.5)
ax.spines['bottom'].set_linewidth(0.5)
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

leg = plt.legend((r'$\sin$', r'$\sin 4 \pi x$'),
        # bbox_to_anchor=(0.5, 0.5),
        # loc='upper right', edgecolor='k',
        # fancybox=False, framealpha=1,
        )
leg.get_frame().set_linewidth(0.5)
plt.title('Python example figure')

# Tighten figure
plt.tight_layout(pad=0, w_pad=0.5, h_pad=1.0)

# show and save
plt.show()
plt.savefig('figureExample_python.png',
        format='png', dpi=300,
        transparent= False,
        # bbox_inches = 'tight', pad_inches = 0,
        )
plt.savefig('figureExample_python.svg',
        format='svg',  transparent= False
        )
