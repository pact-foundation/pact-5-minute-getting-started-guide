pact-broker publish pacts \
  --branch master \
  --consumer-app-version 1.0.0 \
  --broker-base-url "https://test.pactflow.io" \
  --broker-username "dXfltyFMgNOFZAxr8io9wJ37iUpY42M" \
  --broker-password "O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1"

echo "Pact contract publishing complete!"
echo "Head over to https://test.pactflow.io/pacts/provider/GettingStartedOrderApi/consumer/GettingStartedOrderWeb/1.0.0 and login with"
echo "=> Username: dXfltyFMgNOFZAxr8io9wJ37iUpY42M"
echo "=> Password: O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1"
echo "to see your published contracts."
