class FilterQueryParametersModel {
  final Map<String, dynamic> conditions;

  FilterQueryParametersModel({required this.conditions});

  Map<String, dynamic> toQueryParameters() {
    final queryParams = <String, dynamic>{};
    conditions.forEach((field, value) {
      if (value is Map<String, dynamic>) {
        value.forEach((operator, val) {
          if (val != null) {
            queryParams['filter[$field][$operator]'] = val;
          }
        });
      } else if (value != null) {
        queryParams['filter[$field]'] = value;
      }
    });
    return queryParams;
  }
}
