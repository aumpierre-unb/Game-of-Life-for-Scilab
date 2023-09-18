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

// buildmacros.sce is part of
// the game_of_life package for Scilab.

function buildmacros()
    toolbox_name="game_of_life";
    macros_path=get_absolute_file_path();
    tbx_build_macros(toolbox_name,macros_path);
endfunction
buildmacros();
clear buildmacros;
