output=$(grep -c "Vcard_DToL06760-RA" topGOAdult_BPprp.csv)
if [[ -n $output ]]; then
    echo "$output"
else
    echo "Sorry, no results..."
fi

