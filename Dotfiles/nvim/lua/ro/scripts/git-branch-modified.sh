BRANCH="$PROJECT_MAIN_BRANCH"

if [[ -z "$BRANCH" ]]; then
    BRANCH="master"
fi

if [[ "$1" == "list" ]]; then
    git diff --name-only --diff-filter=ACMR --relative $BRANCH
elif [[ "$1" == "diff" ]]; then
    git diff --diff-filter=ACMR --relative $BRANCH "$2"
fi
