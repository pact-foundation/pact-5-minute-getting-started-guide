// Let's use async/await
(async () => {
  const { runTests } = require("./runTest.js");
  await runTests("provider");
})();
