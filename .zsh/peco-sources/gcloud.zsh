bindkey '^g' switch-gcp-config

function switch-gcp-config() {
	local config=$(gcloud config configurations list |  fzf --header-lines=1 | awk '{print $1}')
    if [ -n "$config" ]; then
		echo \n
        gcloud config configurations activate $config
        local code=$?
        gcloud config configurations list
		return $code
    fi
}

zle -N switch-gcp-config
