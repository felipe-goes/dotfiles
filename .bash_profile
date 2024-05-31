#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Ensure Docker is running on WSL 2. This expects you've installed Docker and
# Docker Compose directly within your WSL distro instead of Docker Desktop, such as:
#   - https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script
#   - https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user
#   - https://docs.docker.com/compose/install/linux/
# Needed only when you do not have systemd in WSL2
if grep -q "microsoft" /proc/version >/dev/null 2>&1; then
	if service docker status 2>&1 | grep -q "is not running"; then
		wsl.exe --distribution "${WSL_DISTRO_NAME}" --user root \
			--exec /usr/sbin/service docker start >/dev/null 2>&1
	fi
fi

# [[ -f ~/.extend.bash_profile ]] && . ~/.extend.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc
