const chai = require("chai");
const chaiAsPromised = require("chai-as-promised");
const { eachLike } = require("@pact-foundation/pact").MatchersV3;
const { Order } = require("./order");
const expect = chai.expect;
const { fetchOrders } = require("./orderClient");
const { provider } = require("../pact");
chai.use(chaiAsPromised);

describe("Pact with Order API", () => {
  describe("given there are orders", () => {
    const itemProperties = {
      name: "burger",
      quantity: 2,
      value: 100,
    };

    const orderProperties = {
      id: 1,
      items: eachLike(itemProperties),
    };

    describe("when a call to the API is made", () => {
      before(() => {
        provider
          .given("there are orders")
          .uponReceiving("a request for orders")
          .withRequest({
            method: "GET",
            path: "/orders",
          })
          .willRespondWith({
            body: eachLike(orderProperties),
            status: 200,
            headers: {
              "Content-Type": "application/json; charset=utf-8",
            },
          });
      });

      it("will receive the list of current orders", () => {
        return provider.executeTest((mockserver) => {
          // The mock server is started on a randomly available port,
          // so we set the API mock service port so HTTP clients
          // can dynamically find the endpoint
          process.env.API_PORT = mockserver.port;
          return expect(fetchOrders()).to.eventually.have.deep.members([
            new Order(orderProperties.id, [itemProperties]),
          ]);
        });
      });
    });
  });
});
