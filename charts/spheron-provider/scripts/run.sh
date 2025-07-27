echo "wallet: $SPH_WALLET_PATH"
echo "home: $SPH_HOME"
env
exec spheron run \
    --home=$SPH_HOME \
    --wallet-path=$SPH_WALLET_PATH \
    --wallet-secret=$SPH_WALLET_SECRET \
    | while read line; do
    echo "$line"
    if [[ "$line" == *"account sequence mismatch"* ]]; then
        echo "Pattern 'account sequence mismatch' found. Restarting provider-services..."
        exit 2
    fi
done