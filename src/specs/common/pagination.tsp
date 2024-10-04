import "@typespec/http";

using TypeSpec.Http;

@summary("Pagination model")
model Pagination {
    @summary("Total number of items")
    count: int32 = 0;

    @summary("Page index, starting from 0")
    page: int32 = 0;

    @summary("Number of items per page")
    pageSize: int32 = 10;

    @summary("Total number of pages")
    pageCount: int32 = 0;
}

model PaginationRespose<Item> {
    @statusCode
    success: 200;

    @body
    value: Array<Item>;

    @header({
        name: "x-pagination"
    })
    @encode("json")
    pagination: Pagination;
}
