export LAST_CURSOR=$(cat .last-cursor-update)

if [ -z "$LAST_CURSOR" ]; then
    npm start -- --file 'output.json'
else
    npm start -- --cursor $LAST_CURSOR --file 'output.json'
fi

cat output.json | jq -c '.[]' > audit-log-output.json
rm -f output.json

echo "LOGS UPDATED"