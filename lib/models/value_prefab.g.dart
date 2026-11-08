// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_prefab.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetValuePrefabCollection on Isar {
  IsarCollection<ValuePrefab> get valuePrefabs => this.collection();
}

const ValuePrefabSchema = CollectionSchema(
  name: r'ValuePrefab',
  id: 2659389061359131676,
  properties: {
    r'subValue': PropertySchema(
      id: 0,
      name: r'subValue',
      type: IsarType.double,
    ),
    r'title': PropertySchema(
      id: 1,
      name: r'title',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 2,
      name: r'type',
      type: IsarType.byte,
      enumMap: _ValuePrefabtypeEnumValueMap,
    ),
    r'value': PropertySchema(
      id: 3,
      name: r'value',
      type: IsarType.double,
    )
  },
  estimateSize: _valuePrefabEstimateSize,
  serialize: _valuePrefabSerialize,
  deserialize: _valuePrefabDeserialize,
  deserializeProp: _valuePrefabDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _valuePrefabGetId,
  getLinks: _valuePrefabGetLinks,
  attach: _valuePrefabAttach,
  version: '3.1.0+1',
);

int _valuePrefabEstimateSize(
  ValuePrefab object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _valuePrefabSerialize(
  ValuePrefab object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.subValue);
  writer.writeString(offsets[1], object.title);
  writer.writeByte(offsets[2], object.type.index);
  writer.writeDouble(offsets[3], object.value);
}

ValuePrefab _valuePrefabDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ValuePrefab();
  object.id = id;
  object.subValue = reader.readDouble(offsets[0]);
  object.title = reader.readString(offsets[1]);
  object.type =
      _ValuePrefabtypeValueEnumMap[reader.readByteOrNull(offsets[2])] ??
          TaskType.required;
  object.value = reader.readDouble(offsets[3]);
  return object;
}

P _valuePrefabDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (_ValuePrefabtypeValueEnumMap[reader.readByteOrNull(offset)] ??
          TaskType.required) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ValuePrefabtypeEnumValueMap = {
  'required': 0,
  'incentive': 1,
  'checkable': 2,
  'countable': 3,
};
const _ValuePrefabtypeValueEnumMap = {
  0: TaskType.required,
  1: TaskType.incentive,
  2: TaskType.checkable,
  3: TaskType.countable,
};

Id _valuePrefabGetId(ValuePrefab object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _valuePrefabGetLinks(ValuePrefab object) {
  return [];
}

void _valuePrefabAttach(
    IsarCollection<dynamic> col, Id id, ValuePrefab object) {
  object.id = id;
}

extension ValuePrefabQueryWhereSort
    on QueryBuilder<ValuePrefab, ValuePrefab, QWhere> {
  QueryBuilder<ValuePrefab, ValuePrefab, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ValuePrefabQueryWhere
    on QueryBuilder<ValuePrefab, ValuePrefab, QWhereClause> {
  QueryBuilder<ValuePrefab, ValuePrefab, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterWhereClause> idBetween(
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

extension ValuePrefabQueryFilter
    on QueryBuilder<ValuePrefab, ValuePrefab, QFilterCondition> {
  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> subValueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition>
      subValueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition>
      subValueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> subValueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> typeEqualTo(
      TaskType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> typeGreaterThan(
    TaskType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> typeLessThan(
    TaskType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> typeBetween(
    TaskType lower,
    TaskType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> valueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition>
      valueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> valueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterFilterCondition> valueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ValuePrefabQueryObject
    on QueryBuilder<ValuePrefab, ValuePrefab, QFilterCondition> {}

extension ValuePrefabQueryLinks
    on QueryBuilder<ValuePrefab, ValuePrefab, QFilterCondition> {}

extension ValuePrefabQuerySortBy
    on QueryBuilder<ValuePrefab, ValuePrefab, QSortBy> {
  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> sortBySubValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subValue', Sort.asc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> sortBySubValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subValue', Sort.desc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension ValuePrefabQuerySortThenBy
    on QueryBuilder<ValuePrefab, ValuePrefab, QSortThenBy> {
  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> thenBySubValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subValue', Sort.asc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> thenBySubValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subValue', Sort.desc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QAfterSortBy> thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension ValuePrefabQueryWhereDistinct
    on QueryBuilder<ValuePrefab, ValuePrefab, QDistinct> {
  QueryBuilder<ValuePrefab, ValuePrefab, QDistinct> distinctBySubValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subValue');
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<ValuePrefab, ValuePrefab, QDistinct> distinctByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value');
    });
  }
}

extension ValuePrefabQueryProperty
    on QueryBuilder<ValuePrefab, ValuePrefab, QQueryProperty> {
  QueryBuilder<ValuePrefab, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ValuePrefab, double, QQueryOperations> subValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subValue');
    });
  }

  QueryBuilder<ValuePrefab, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<ValuePrefab, TaskType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<ValuePrefab, double, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}
