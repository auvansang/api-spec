import "@typespec/http";

import "./categories.tsp";
import "./tags.tsp";
import "./posts.tsp";

using TypeSpec.Http;

@route("/v1")
namespace Sisa.Blog.Api.V1;
