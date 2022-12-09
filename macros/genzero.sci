// Copyright (C) 2022 Alexandre Umpierre

// This file is part of Game of Life Package for Scilab.
// Game of Life Package for Scilab is free software:
// you can redistribute it and/or modify it under the terms
// of the GNU General Public License (GPL) version 3
// as published by the Free Software Foundation.

// Game of Life Package for Scilab is distributed in the hope
// that it will be useful, but WITHOUT ANY WARRANTY;
// without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.

// You should have received a copy of the
// GNU General Public License along with this program.
// It is also available at www.gnu.org/licenses/.

function [A]=genzero(m,n,P)
    // Generates a matrix of ones and zeros
    //
    // Syntax
    // [A]=genzero(m,n,P)
    //
    // Parameters
    // m: number of lines
    // m: number of columns
    // P: probability for live cell or a grid pattern
    // A: generated matrix
    //
    // Description
    // genzero generates a matrix of
    //  ones and zeros of
    //  m lines and n columns.
    // If probability for live cell if given,
    //  the values of individual cells are
    //  computed accordingly.
    // If the grid pattern is assingned by strings
    //  'block', 'glider', 'blinker', 'toad' or 'beacon'
    //  matrix is generated with the pattern at
    //  its superior left corner.
    // genzero is a main function of
    //  the Game of Life Package for Scilab.
    //
    // Examples
    // ..// Generate a spaceship glider pattern
    // ..// in a 9 lines and 7 columns matrix.
    // ..//
    // A=genzero(9,7,'glider')
    //
    // ..// Generate a 27 by 28 cells grid
    // ..// where individual cells have a 26:74 chance
    // ..// to be live or dead.
    // A=genzero(27,28,.26)
    //
    // See also
    //  conway
    //  evolution
    //
    // Authors
    //  Alexandre Umpierre

    if type(P)==1 && 1>P && P>0
        A=(rand(m,n))
        A=round(A)
    elseif type(P)==10 && P=='block'
        A=[0 0 0
           0 1 1
           0 1 1]
        if m>size(A,1)
            A(m,$)=0
        end
        if n>size(A,2)
            A($,n)=0
        end
    elseif type(P)==10 && P=='glider'
        A=[0 0 0 0
           0 0 1 0
           0 0 0 1
           0 1 1 1]
        if m>size(A,1)
            A(m,$)=0
        end
        if n>size(A,2)
            A($,n)=0
        end
    elseif type(P)==10 && P=='blinker'
        A=[0 0 0 0
           0 0 1 0
           0 0 1 0
           0 0 1 0]
        if m>size(A,1)
            A(m,$)=0
        end
        if n>size(A,2)
            A($,n)=0
        end
    elseif type(P)==10 && P=='toad'
        A=[0 0 0 0 0
           0 0 0 0 0
           0 0 1 1 1
           0 1 1 1 0
           0 0 0 0 0]
        if m>size(A,1)
            A(m,$)=0
        end
        if n>size(A,2)
            A($,n)=0
        end
    elseif type(P)==10 && P=='beacon'
        A=[0 0 0 0 0
           0 1 1 0 0
           0 1 1 0 0
           0 0 0 1 1
           0 0 0 1 1]
        if m>size(A,1)
            A(m,$)=0
        end
        if n>size(A,2)
            A($,n)=0
        end
    end
end
