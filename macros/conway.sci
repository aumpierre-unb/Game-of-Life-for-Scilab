//  Copyright (C) 2022 2023 Alexandre Umpierre
// This file is part of game_of_life Package for Scilab.
// game_of_life Package for Scilab is free software:
// you can redistribute it and/or modify it under the terms
// of the GNU General Public License (GPL) version 3
// as published by the Free Software Foundation.
// game_of_life Package for Scilab is distributed in the hope
// that it will be useful, but WITHOUT ANY WARRANTY;
// without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
// You should have received a copy of the
// GNU General Public License along with this program.
// It is also available at www.gnu.org/licenses/.

function [B]=conway(A,cyc,fig)
    // Compute the next generation of a given grid
    //
    // Syntax
    // [B]=conway(A,cyc,fig)
    //
    // Parameters
    // A: matrix with configuration of the original grid
    // cyc: %t for infinite periodic arrangement or %f for finite grid
    // fig: %t for diplaying plot
    // B: matrix with configuration of the next generation
    //
    // Description
    //  conway computes
    //  the configuration of
    //  the next generation of
    //  a grid of square cells,
    //  each of which is in either live or dead.
    // Each cell will be live or dead
    //  in the next generation according to
    //  the rules of the Conway's game of life:
    // 1) A live cells with exactly 2 or 3 live neighbors
    //  stays a live cell, otherwise it dies.
    // 2) A dead cell with 3 live neighbors
    //  becomes alive, otherwise is stays dead.
    // By default, the grid is assumed to be finite.
    //  If cyc=%t is given, then grid is assumed to be infinite and periodic.
    // By default, no plot is shown.
    //  If fig=%t is given, then
    //  a figure with two subplots is shown,
    //  the first subplot being
    //  the configuration of the original grid and
    //  the second subplot being
    //  the configuration of the next generations.
    // conway is a main function of
    //  the game_of_life package for Scilab.
    //
    // Examples
    // // Compute the next generation
    // // of a spaceship glider pattern
    // // in a 10 by 10 cells grid and
    // // visualize the grids on plots.
    // //
    // A=genzero(10,10,'glider');..
    // B=conway(A,%t,%t);
    //
    // See also
    //  genzero
    //  evolution
    //
    // Authors
    //  Alexandre Umpierre

    if cyc
        C=[A(:,$),A,A(:,1)]
        D=[C($,:);C;C(1,:)]
    else
        D=concat(0,A)
        D=concat(D,0)
    end
    B=zeros(D)
    for i=2:size(D,1)-1
        for j=2:size(D,2)-1
            viz=0
            for m=-1:1
                for n=-1:1
                    if (m==0 && n==0)
                        continue
                    end
                    if D(i+m,j+n)==1
                        viz=viz+1
                    end
                    if viz==4
                        break
                    end
                end
            end
            if D(i,j)==1 && viz==2 || viz==3
                B(i,j)=1
            end
            if D(i,j)==0 && viz==3
                B(i,j)=1
            end
        end
    end
    B=B(2:$-1,2:$-1)
    if fig
        if winsid()==[]
            m=0
        else
            m=max(winsid())+1
        end
        scf(m).color_map=graycolormap(2)
        subplot(121)
        Matplot(A*100)
        gca().box='on'
        gca().x_label.visible='off'
        gca().y_label.visible='off'
        gca().axes_visible='off'
        gca().isoview='on'
        subplot(122)
        Matplot(B*100)
        gca().box='on'
        gca().x_label.visible='off'
        gca().y_label.visible='off'
        gca().axes_visible='off'
        gca().isoview='on'
    end
end
