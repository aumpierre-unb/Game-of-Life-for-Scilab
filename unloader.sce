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

// unloader.sce is part of
// the game_of_life package for Scilab.

oldmode=mode();
mode(-1);
oldlines=lines()(2);
lines(0);
toolbox_name="game_of_life";
try
    fileQuit=get_absolute_file_path("unloader.sce")+"etc\"+toolbox_name+".quit";
    if isfile(fileQuit) then
        exec(fileQuit);
    end
catch
    [errmsg,tmp,nline,func]=lasterror()
    msg="%s: error on line #%d: ""%s""\n"
    msg=msprintf(msg,func,nline,errmsg)
    lines(oldlines)
    mode(oldmode);
    clear oldlines oldmode tmp nline func
    error(msg);
end
lines(oldlines);
mode(oldmode);
clear oldlines oldmode;
