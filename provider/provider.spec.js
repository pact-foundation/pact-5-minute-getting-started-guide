const Verifier = require("@pact-foundation/pact").Verifier;
const chai = require("chai");
const chaiAsPromised = require("chai-as-promised");
const getPort = require("get-port");
const { server } = require("./provider.js");
const { providerName, pactFile } = require("../pact.js");
chai.use(chaiAsPromised);
let port;
let opts;

// Verify that the provider meets all consumer expectations
describe("Pact Verification", () => {
  before(async () => {
    port = await getPort();
    opts = {
      provider: providerName,
      providerBaseUrl: `http://localhost:${port}`,
      // pactUrls: [pactFile], // if you don't use a broker
      pactBrokerUrl: "https://test.pactflow.io",
      pactBrokerUsername: "dXfltyFMgNOFZAxr8io9wJ37iUpY42M",
      pactBrokerPassword: "O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1",
      publishVerificationResult: false,
      providerVersionBranch: process.env.GIT_BRANCH ?? "master",
      providerVersion: process.env.GIT_COMMIT ?? "1.0." + process.env.HOSTNAME,
      consumerVersionSelectors: [
        { mainBranch: true },
        { deployedOrReleased: true },
      ],
    };

    server.listen(port, () => {
      console.log(`Provider service listening on http://localhost:${port}`);
    });
  });
  it("should validate the expectations of Order Web", () => {
    return new Verifier(opts)
      .verifyProvider()
      .then((output) => {
        console.log("Pact Verification Complete!");
        console.log(output);
      })
      .catch((e) => {
        console.error("Pact verification failed :(", e);
      });
  });
});
