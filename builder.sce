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

// builder.sce is part of
// the game_of_life package for Scilab.

mode(-1);
lines(0);
function main_builder()
    toolbox_name="game_of_life";
    toolbox_title="Game of Life of Conway";
    toolbox_dir=get_absolute_file_path();
    try
        v=getversion("scilab");
    catch
        error(gettext("Scilab 5.3 or more is required."));
    end
    if v(1)<5 && v(2)<3
        error(gettext("Scilab 5.3 or more is required."));
    end
    if ~isdef("tbx_build_loader")
        error(msprintf(gettext("%s module not installed."), "modules_manager"));
    end
    tbx_builder_macros(toolbox_dir);
    tbx_builder_src(toolbox_dir);
    tbx_builder_gateway(toolbox_dir);
    tbx_build_localization(toolbox_dir);
    tbx_builder_help(toolbox_dir);
    tbx_build_loader(toolbox_dir);
    tbx_build_cleaner(toolbox_dir);
endfunction
main_builder();
clear main_builder;
