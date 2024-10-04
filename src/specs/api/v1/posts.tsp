import "@typespec/http";
import "@typespec/openapi3";

import "../../types/scalar.tsp";
import "../../api-versions.tsp";
import "../../common/pagination.tsp";

using TypeSpec.Http;

namespace Sisa.Blog.Api.V1.Posts;

// BEGIN: API

@route("/posts")
@tag("Posts")
interface Posts {
  @get
  Get(
    @query
    keyword?: string,

    @query
    page?: int32 = 0,

    @query
    pageSize?: int32 = 10,
  ): PaginationRespose<PostResponse> | {
    @statusCode
    success: 500;
  };

  @get
  @route("/{id}/details")
  FindById(
    @path
    id: uuid,
  ): {
    @statusCode
    success: 200;

    @body
    response: PostResponse;
  } | {
    @statusCode
    success: 404;
  } | {
    @statusCode
    success: 500;
  };

  @get
  FindBySlug(
    @path
    slug: string,
  ): {
    @statusCode
    success: 200;

    @body
    response: PostResponse;
  } | {
    @statusCode
    success: 404;
  } | {
    @statusCode
    success: 500;
  };

  @put
  Update(
    @path
    id: uuid,

    @body
    request: UpdatePostRequest,
  ):
    | {
        @statusCode
        success: 200;

        @body
        response: PostResponse;
      }
    | {
        @statusCode
        success: 404;
      }
    | BadRequestResponse
    | UnauthorizedResponse
    | ForbiddenResponse
    | {
        @statusCode
        success: 500;
      };

  @delete
  Delete(
    @path
    id: uuid,
  ): {
    @statusCode
    success: 204;
  } | {
    @statusCode
    success: 404;
  } | {
    @statusCode
    success: 500;
  };
}

// END: API

// BEGIN: Models

@summary("Post of the post")
model PostResponse {
  @key
  id: uuid;

  @minLength(4)
  @maxLength(100)
  name: string;

  @minLength(4)
  @maxLength(100)
  slug: string;

  @maxLength(500)
  description?: string;
}

@summary("Create a new Post")
model CreatePostRequest {
  @minLength(4)
  @maxLength(100)
  name: string;

  @minLength(4)
  @maxLength(100)
  slug: string;

  @maxLength(500)
  description?: string;
}

@summary("Update a Post")
model UpdatePostRequest {
  @key
  id: uuid;

  @minLength(4)
  @maxLength(100)
  name: string;

  @minLength(4)
  @maxLength(100)
  slug: string;

  @maxLength(500)
  description?: string;
}

// END: Models
