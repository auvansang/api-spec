import "@typespec/http";
import "@typespec/openapi3";

import "../../types/scalar.tsp";
import "../../api-versions.tsp";
import "../../common/pagination.tsp";

using TypeSpec.Http;

namespace Sisa.Blog.Api.V1.Categories;

// BEGIN: API

@route("/categories")
@tag("Categories")
interface Categories {
  @get
  Get(
    @query
    keyword?: string,

    @query
    page?: int32 = 0,

    @query
    pageSize?: int32 = 10,
  ): PaginationRespose<CategoryResponse> | {
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
    response: CategoryResponse;
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
    response: CategoryResponse;
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
    request: UpdateCategoryRequest,
  ):
    | {
        @statusCode
        success: 200;

        @body
        response: CategoryResponse;
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

@summary("Category of the post")
model CategoryResponse {
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

@summary("Create a new category")
model CreateCategoryRequest {
  @minLength(4)
  @maxLength(100)
  name: string;

  @minLength(4)
  @maxLength(100)
  slug: string;

  @maxLength(500)
  description?: string;
}

@summary("Update a category")
model UpdateCategoryRequest {
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
