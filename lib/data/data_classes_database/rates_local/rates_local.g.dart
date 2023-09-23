// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rates_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRatesLocalCollection on Isar {
  IsarCollection<RatesLocal> get ratesLocals => this.collection();
}

const RatesLocalSchema = CollectionSchema(
  name: r'RatesLocal',
  id: -2923451139972401732,
  properties: {
    r'currentRate': PropertySchema(
      id: 0,
      name: r'currentRate',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _ratesLocalEstimateSize,
  serialize: _ratesLocalSerialize,
  deserialize: _ratesLocalDeserialize,
  deserializeProp: _ratesLocalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _ratesLocalGetId,
  getLinks: _ratesLocalGetLinks,
  attach: _ratesLocalAttach,
  version: '3.1.0',
);

int _ratesLocalEstimateSize(
  RatesLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _ratesLocalSerialize(
  RatesLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.currentRate);
  writer.writeString(offsets[1], object.name);
}

RatesLocal _ratesLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RatesLocal();
  object.currentRate = reader.readDoubleOrNull(offsets[0]);
  object.id = id;
  object.name = reader.readStringOrNull(offsets[1]);
  return object;
}

P _ratesLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ratesLocalGetId(RatesLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ratesLocalGetLinks(RatesLocal object) {
  return [];
}

void _ratesLocalAttach(IsarCollection<dynamic> col, Id id, RatesLocal object) {
  object.id = id;
}

extension RatesLocalQueryWhereSort
    on QueryBuilder<RatesLocal, RatesLocal, QWhere> {
  QueryBuilder<RatesLocal, RatesLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RatesLocalQueryWhere
    on QueryBuilder<RatesLocal, RatesLocal, QWhereClause> {
  QueryBuilder<RatesLocal, RatesLocal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RatesLocalQueryFilter
    on QueryBuilder<RatesLocal, RatesLocal, QFilterCondition> {
  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition>
      currentRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentRate',
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition>
      currentRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentRate',
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition>
      currentRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition>
      currentRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition>
      currentRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition>
      currentRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension RatesLocalQueryObject
    on QueryBuilder<RatesLocal, RatesLocal, QFilterCondition> {}

extension RatesLocalQueryLinks
    on QueryBuilder<RatesLocal, RatesLocal, QFilterCondition> {}

extension RatesLocalQuerySortBy
    on QueryBuilder<RatesLocal, RatesLocal, QSortBy> {
  QueryBuilder<RatesLocal, RatesLocal, QAfterSortBy> sortByCurrentRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRate', Sort.asc);
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterSortBy> sortByCurrentRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRate', Sort.desc);
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension RatesLocalQuerySortThenBy
    on QueryBuilder<RatesLocal, RatesLocal, QSortThenBy> {
  QueryBuilder<RatesLocal, RatesLocal, QAfterSortBy> thenByCurrentRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRate', Sort.asc);
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterSortBy> thenByCurrentRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRate', Sort.desc);
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension RatesLocalQueryWhereDistinct
    on QueryBuilder<RatesLocal, RatesLocal, QDistinct> {
  QueryBuilder<RatesLocal, RatesLocal, QDistinct> distinctByCurrentRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentRate');
    });
  }

  QueryBuilder<RatesLocal, RatesLocal, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension RatesLocalQueryProperty
    on QueryBuilder<RatesLocal, RatesLocal, QQueryProperty> {
  QueryBuilder<RatesLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RatesLocal, double?, QQueryOperations> currentRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentRate');
    });
  }

  QueryBuilder<RatesLocal, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
