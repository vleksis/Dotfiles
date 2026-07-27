# shellcheck shell=bash

usage() {
	echo "Usage: validate-movie-audio <eng|jpn> <movie-file>" >&2
}

if [[ $# -ne 2 ]]; then
	usage
	exit 2
fi

original_language="${1,,}"
movie_file="$2"

case "$original_language" in
eng | english)
	original_language="eng"
	;;
jpn | japanese)
	original_language="jpn"
	;;
*)
	echo "ERROR: original language must be 'eng' or 'jpn'." >&2
	usage
	exit 2
	;;
esac

if [[ ! -f "$movie_file" ]]; then
	echo "ERROR: movie file does not exist: $movie_file" >&2
	exit 2
fi

if ! probe_output="$(
	ffprobe \
		-v error \
		-select_streams a \
		-show_entries stream_tags=language \
		-of default=noprint_wrappers=1:nokey=1 \
		"$movie_file"
)"; then
	echo "ERROR: ffprobe could not inspect: $movie_file" >&2
	exit 2
fi

audio_languages=()
while IFS= read -r language; do
	case "${language,,}" in
	en | eng)
		normalized="eng"
		;;
	ja | jpn)
		normalized="jpn"
		;;
	ru | rus)
		normalized="rus"
		;;
	"")
		continue
		;;
	*)
		normalized="${language,,}"
		;;
	esac

	audio_languages+=("$normalized")
done <<<"$probe_output"

has_language() {
	local expected="$1"
	local detected

	for detected in "${audio_languages[@]}"; do
		if [[ "$detected" == "$expected" ]]; then
			return 0
		fi
	done

	return 1
}

status=0
for required_language in "$original_language" rus; do
	if has_language "$required_language"; then
		echo "PASS: $required_language audio present"
	else
		echo "FAIL: $required_language audio missing" >&2
		status=1
	fi
done

if [[ ${#audio_languages[@]} -eq 0 ]]; then
	echo "Detected audio languages: none (streams may be missing language tags)" >&2
else
	echo "Detected audio languages: ${audio_languages[*]}"
fi

if [[ $status -ne 0 ]]; then
	echo "Validation failed: $movie_file" >&2
else
	echo "Validation passed: $movie_file"
fi

exit "$status"
