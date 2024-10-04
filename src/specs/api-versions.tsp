import "@typespec/versioning";

using TypeSpec.Versioning;

@versioned(ApiVersions)
namespace Sisa.Blog.Api;

enum ApiVersions {
    v1,
    v2,
}
