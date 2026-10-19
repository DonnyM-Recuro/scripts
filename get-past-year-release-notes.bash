for repo in $(gh repo list recurohealth --limit 500 --json name -q '.[].name'); do
  echo "=== $repo ==="
  gh api --paginate "repos/recurohealth/$repo/releases" \
    -q '.[] | "## \(.tag_name) — \(.name // "") (\(.published_at // "draft"))\n\n\(.body // "_no notes_")\n"'
done