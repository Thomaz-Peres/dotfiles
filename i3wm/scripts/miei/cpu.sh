#!/usr/bin/bash
if [ $BLOCK_BUTTON == 1 ]; then
	alacritty -e htop
fi

echo ""$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%"
