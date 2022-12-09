// Copyright (C) 2022 Alexandre Umpierre
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

//Criar os arquivos .xml das funções em path+'help_xmls'
path=get_absolute_file_path();
chdir(path+"macros");
mkdir(path+"help");
help_from_sci(path+"macros",path+"help");
chapter="Game of Life of Conway";

//Cria visualização do help em path+"help"
chdir(path);
mkdir("help");
chdir(path+"help");
xmltojar(path+"help",chapter,"en_US");

add_help_chapter(chapter,path);
