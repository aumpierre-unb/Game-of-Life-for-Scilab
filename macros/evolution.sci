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

function [B,n]=evolution(A,N,cyc,fig)
    // Computes the evolution of a given grid according to the rules of the Conway's game of life
    //
    // Syntax
    // [B,n]=evolution(A,N,cyc,fig)
    //
    // Parameters
    // A: matrix with configuration of the original grid
    // N: maximum number of generations to be computed
    // cyc: %t for infinite periodic arrangement or %f for finite grid
    // fig: %t for diplaying plot
    // B: matrix with the final configuration of the grid
    // n: number of generations computed
    //
    // Description
    // evolution computes the evolution of
    //  a grid of square cells
    //  according to the rules of
    //  the Conway's game of life.
    // The simulations will be interrupted
    //  if the grid comes to
    //  a stable configuration (including death of all cells).
    // evolution is a main function of
    //  the game_of_life package for Scilab.
    //
    // Examples
    // // Observe the evolution of
    // // the first 200 generations of
    // // a grid originally set as
    // // a spaceship glider pattern in
    // // a periodic 13 by 11 cells grid.
    // //
    // A=genzero(27,28,.26);..
    // B=evolution(A,200,%t,%t);
    //
    // // Generate a periodic 27 by 28 cells grid
    // // where individual cells have a 26:74 chance
    // // to be live or dead and
    // // observe its evolution.
    // A=genzero(27,28,.26);..
    // B=evolution(A,%inf,%t,%t);
    //
    // See also
    //  genzero
    //  conway
    //
    // Authors
    //  Alexandre Umpierre

    n=0
    start=%t
    while n<N
        if n<10
            C{n+1}=A
            m=n
        else
            for i=1:10-1
                C{i}=C{i+1}
            end
            C{10}=A
            m=10
        end
        B=conway(A,cyc,%f)
        n=n+1
        for i=1:m
            if and(and(B==C{i}))
                delete()
                subplot(122)
                Matplot(B*100)
                gca().box='on'
                gca().x_label.visible='off'
                gca().y_label.visible='off'
                gca().axes_visible='off'
                gca().isoview='on'
                sleep(30)
                printf('Stability after %d itarations with period %d.\n',n-1,m-i+1)
                return
            end
        end
        if n==N
            printf('Not stable after %d itarations.\n',n)
        end
        if start && fig
            if winsid()==[]
                k=0
            else
                k=max(winsid())+1
            end
            scf(k).color_map=graycolormap(2)
            subplot(121)
            Matplot(A*100)
            gca().box='on'
            gca().x_label.visible='off'
            gca().y_label.visible='off'
            gca().axes_visible='off'
            gca().isoview='on'
            start=%f
            subplot(122)
        end
        if fig
            delete()
            subplot(122)
            Matplot(B*100)
            gca().box='on'
            gca().x_label.visible='off'
            gca().y_label.visible='off'
            gca().axes_visible='off'
            gca().isoview='on'
//            name="foo"+msprintf("%3.d",n)+".gif"
//            xs2gif(k,name);
            sleep(30)
        end
        A=B
    end
endfunction
