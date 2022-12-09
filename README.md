# Internal Fluid Flow

<!-- [![DOI](https://zenodo.org/badge/509430202.svg)](https://zenodo.org/badge/latestdoi/509430202)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/aumpierre-unb/Game-of-Life-for-Scilab) -->

## Install and load Internal Fluid Flow Toolbox for Scilab

1\. Download ```v0.1.0.zip``` file from the current release page.

2\. Set Scilab current directory to the download folder.

3\. To install and load the toolbox, type:

```dotnetcli
atomsInstall('v0.1.0.zip')
atomsLoad('conway')
```

---

## The Conway's Game of Life

Conway's Game of Life computes the configuration of the next generation of a grid of square cells, each of which is in either live or dead. Each cell will be live or dead in the next generation according to two simple rules:

- A live cells with exactly 2 or 3 live neighbors stays a live cell, otherwise it dies.
- A dead cell with 3 live neighbors becomes alive, otherwise is stays dead.

As simple as these rules may be, they can result in surprising complexity from relatively simple initial configurations.

## The `game-of-life` Package

`game-of-life` provides the following functions:

- `genzero`
- `conway`
- `evolution`

### `genzero`

`genzero` generates a matrix of ones and zeros of m lines and n columns.

If probability for live cell if given, the values of individual cells are computed accordingly.

If the grid pattern is assingned by strings 'block', 'glider', 'blinker', 'toad' or 'beacon' matrix is generated with the pattern at its superior left corner.

**Syntax:**

```dotnetcli
[A]=genzero(m,n[,P=.5])
```

**Examples:**

Generate a spaceship glider pattern in a 9 lines and 7 columns matrix.

```dotnetcli
A=genzero(9,7,'glider')
```

Generate a 27 by 28 cells grid where individual cells have a 26:74 chance to be live or dead.

```dotnetcli
A=genzero(27,28,.26)
```

### `conway`

`conway` computes the configuration of the next generation of a grid of square cells, each of which is in either live or dead.

Each cell will be live or dead in the next generation according to the rules of the Conway's game of life:

- A live cells with exactly 2 or 3 live neighbors stays a live cell, otherwise it dies.
- A dead cell with 3 live neighbors becomes alive, otherwise is stays dead.

**Syntax:**

```dotnetcli
[B]=conway(A,cyc,fig)
```

**Examples:**

Compute the next generation of a spaceship glider pattern in a 10 by 10 cells grid and visualize the grids on plots.

```dotnetcli
A=genzero(10,10,'glider');..
B=conway(A,true,true)
```

### `evolution`

`evolution` computes the evolution of a grid of square cells according to the rules of the Conway's game of life.

The simulations will be interrupted if the grid comes to a stable configuration.By default, 100 generations will be computed.

The simulations will be interrupted if the grid comes to a stable configuration (including death).

**Syntax:**

```dotnetcli
[B]=evolution(A,N=100,cyc=false,fig=true,map='gray',s=50)
```

**Examples:**

Observe the evolution of the first 200 generations of a grid originally set as a spaceship glider pattern in a periodic 13 by 11 cells grid.

```dotnetcli
A=genzero(13,11,'glider');..
B=evolution(A,200,true)
```

Generate a periodic 27 by 28 cells grid where individual cells have a 26:74 chance to be live or dead and observe its evolution.

```dotnetcli
A=genzero(27,28,.26);..
B=evolution(A,inf,true)
```

Copyright &copy; 2022 Alexandre Umpierre

email: aumpierre@gmail.com
