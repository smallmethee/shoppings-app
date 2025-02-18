class QueryParams {
  final String? sort;
  final int? limit;
  final int? offset;
  final String? cursor;
  final List<String>? fields;

  QueryParams({this.sort, this.limit, this.offset, this.fields, this.cursor});

  QueryParams copyWith({
    String? sort,
    int? limit,
    int? offset,
    List<String>? fields,
    String? cursor,
  }) {
    return QueryParams(
      sort: sort ?? this.sort,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      fields: fields ?? this.fields,
      cursor: cursor ?? this.cursor,
    );
  }

  Map<String, dynamic> toFilterQueryParameters() {
    return {};
  }

  Map<String, dynamic> toJson() {
    final queryParameters = <String, dynamic>{};

    queryParameters.addAll(toFilterQueryParameters());

    if (cursor != null) {
      queryParameters['cursor'] = cursor;
    }

    if (sort != null) {
      queryParameters['sort'] = sort;
    }

    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }

    if (offset != null) {
      queryParameters['offset'] = offset.toString();
    }

    final effectiveFields = overrideFields ?? fields;
    if (effectiveFields != null && effectiveFields.isNotEmpty) {
      queryParameters['fields'] = effectiveFields.join(',');
    }

    return queryParameters;
  }

  List<String>? get overrideFields => null;
}
