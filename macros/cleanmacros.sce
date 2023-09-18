// Copyright (C) 2022 2023 Alexandre Umpierre
// This file is part of game_of_life package for Scilab.
// game_of_life package for Scilab is free software:
// you can redistribute it and/or modify it under the terms
// of the GNU General Public License (GPL) version 3
// as published by the Free Software Foundation.
// game_of_life package for Scilab is distributed in the hope
// that it will be useful, but WITHOUT ANY WARRANTY;
// without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
// You should have received a copy of the
// GNU General Public License along with this program.
// It is also available at www.gnu.org/licenses/.

// cleanmacros.sce is part of
// the game_of_life package for Scilab.

function cleanmacros()
    libpath=get_absolute_file_path();
    binfiles=ls(libpath+"/*.bin");
    for i=1:size(binfiles,"*")
        mdelete(binfiles(i));
    end
    mdelete(libpath+"/names");
    mdelete(libpath+"/lib");
endfunction
cleanmacros();
clear cleanmacros;
