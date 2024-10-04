import "@typespec/versioning";

import "./api-versions.tsp";

import "./api/v1";

using TypeSpec.Http;
using TypeSpec.Versioning;

@service({
  title: "Sisa Cafe",
  summary: "API for Sisa Cafe",
  termsOfService: "https://sisa.cafe/terms",
  contact: {
    name: "Sisa Cafe",
    url: "https://sangau.me",
    email: "contact@sisa.io",
  },
  license: {
    name: "MIT",
    url: "https://opensource.org/licenses/MIT",
  },
})
@server("http://localhost:10000", "Sisa Cafe")
@route("/blog/api")
// @useAuth(BearerAuth)
namespace Sisa.Blog.Api;

