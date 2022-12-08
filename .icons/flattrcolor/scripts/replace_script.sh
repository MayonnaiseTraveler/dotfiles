#!/usr/bin/env bash

  LOCAL="~/.local/share"

function replaceall {
	cd "$LOCAL/icons/flattrcolor/scripts"
	sh ./change_all_folders.sh
}

replaceall
