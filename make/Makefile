LN = ln -fFs
RM = rm -rf
MD = mkdir -p
# DOTFILES = $(wildcard .*)
# all: backup, ${HOME}/asDeveloper, ${HOME}/dotfiles_old, ${HOME}/.vim/colors

zero:
	./zero.sh

xcode: zero
	./xcode.sh

zsh: zero
	./zsh.sh

brew: zero zsh
	./brew.sh

dotfiles: zero dir xcode
	./dotfiles.sh

${HOME}/asDeveloper:
	${MD} $@

${HOME}/dotfiles_old:
	${MD} $@/dotfiles

${HOME}/.vim/colors:
	${MD} $@

backup:
	./backup.sh

dir: ${HOME}/asDeveloper ${HOME}/.vim/colors ${HOME}/dotfiles_old

apps: xcode zero brew
	./apps.sh

try:
	${MD} $@

.PHONY: all clean backup try
