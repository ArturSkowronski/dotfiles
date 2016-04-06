#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set general.dont_remap_internal 1
/bin/echo -n .
$cli set general.dont_remap_apple_keyboard 1
/bin/echo -n .
$cli set remap.commandL2optionL 1
/bin/echo -n .
$cli set remap.fn2optionL_illphoche 1
/bin/echo -n .
$cli set remap.fn2help 1
/bin/echo -n .
$cli set remap.optionL2commandL 1
/bin/echo -n .
$cli set remap.fn2optionL 1
/bin/echo -n .
/bin/echo
