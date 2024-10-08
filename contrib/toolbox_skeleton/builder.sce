// Copyright (C) 2008 - INRIA
// Copyright (C) 2009-2011 - DIGITEO

// This file is released under the 3-clause BSD license. See COPYING-BSD.

mode(-1);
lines(0);

function main_builder()
    TOOLBOX_NAME  = "toolbox_skeleton";
    TOOLBOX_TITLE = "Toolbox Skeleton";
    toolbox_dir   = get_absolute_file_path();

    // Action
    // =============================================================================

    tbx_builder_macros(toolbox_dir);
    tbx_builder_src(toolbox_dir);
    tbx_builder_gateway(toolbox_dir);
    tbx_build_localization(toolbox_dir);
    tbx_builder_help(toolbox_dir);
    tbx_build_loader(toolbox_dir);
    tbx_build_cleaner(toolbox_dir);

endfunction
// =============================================================================
main_builder();
clear main_builder; // remove main_builder on stack
// =============================================================================


