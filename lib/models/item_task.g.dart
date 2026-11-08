// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_task.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetItemTaskCollection on Isar {
  IsarCollection<ItemTask> get itemTasks => this.collection();
}

const ItemTaskSchema = CollectionSchema(
  name: r'ItemTask',
  id: -8429523096638807539,
  properties: {
    r'assignedDate': PropertySchema(
      id: 0,
      name: r'assignedDate',
      type: IsarType.dateTime,
    ),
    r'closedDate': PropertySchema(
      id: 1,
      name: r'closedDate',
      type: IsarType.dateTime,
    ),
    r'count': PropertySchema(
      id: 2,
      name: r'count',
      type: IsarType.long,
    ),
    r'isCompleted': PropertySchema(
      id: 3,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'subValue': PropertySchema(
      id: 4,
      name: r'subValue',
      type: IsarType.double,
    ),
    r'title': PropertySchema(
      id: 5,
      name: r'title',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 6,
      name: r'type',
      type: IsarType.byte,
      enumMap: _ItemTasktypeEnumValueMap,
    ),
    r'value': PropertySchema(
      id: 7,
      name: r'value',
      type: IsarType.double,
    )
  },
  estimateSize: _itemTaskEstimateSize,
  serialize: _itemTaskSerialize,
  deserialize: _itemTaskDeserialize,
  deserializeProp: _itemTaskDeserializeProp,
  idName: r'id',
  indexes: {
    r'assignedDate': IndexSchema(
      id: 3056661957003865451,
      name: r'assignedDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'assignedDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _itemTaskGetId,
  getLinks: _itemTaskGetLinks,
  attach: _itemTaskAttach,
  version: '3.1.0+1',
);

int _itemTaskEstimateSize(
  ItemTask object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _itemTaskSerialize(
  ItemTask object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.assignedDate);
  writer.writeDateTime(offsets[1], object.closedDate);
  writer.writeLong(offsets[2], object.count);
  writer.writeBool(offsets[3], object.isCompleted);
  writer.writeDouble(offsets[4], object.subValue);
  writer.writeString(offsets[5], object.title);
  writer.writeByte(offsets[6], object.type.index);
  writer.writeDouble(offsets[7], object.value);
}

ItemTask _itemTaskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ItemTask();
  object.assignedDate = reader.readDateTime(offsets[0]);
  object.closedDate = reader.readDateTimeOrNull(offsets[1]);
  object.count = reader.readLong(offsets[2]);
  object.id = id;
  object.isCompleted = reader.readBool(offsets[3]);
  object.subValue = reader.readDouble(offsets[4]);
  object.title = reader.readString(offsets[5]);
  object.type = _ItemTasktypeValueEnumMap[reader.readByteOrNull(offsets[6])] ??
      TaskType.required;
  object.value = reader.readDouble(offsets[7]);
  return object;
}

P _itemTaskDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (_ItemTasktypeValueEnumMap[reader.readByteOrNull(offset)] ??
          TaskType.required) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ItemTasktypeEnumValueMap = {
  'required': 0,
  'incentive': 1,
  'checkable': 2,
  'countable': 3,
};
const _ItemTasktypeValueEnumMap = {
  0: TaskType.required,
  1: TaskType.incentive,
  2: TaskType.checkable,
  3: TaskType.countable,
};

Id _itemTaskGetId(ItemTask object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _itemTaskGetLinks(ItemTask object) {
  return [];
}

void _itemTaskAttach(IsarCollection<dynamic> col, Id id, ItemTask object) {
  object.id = id;
}

extension ItemTaskQueryWhereSort on QueryBuilder<ItemTask, ItemTask, QWhere> {
  QueryBuilder<ItemTask, ItemTask, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterWhere> anyAssignedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'assignedDate'),
      );
    });
  }
}

extension ItemTaskQueryWhere on QueryBuilder<ItemTask, ItemTask, QWhereClause> {
  QueryBuilder<ItemTask, ItemTask, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ItemTask, ItemTask, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterWhereClause> idBetween(
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

  QueryBuilder<ItemTask, ItemTask, QAfterWhereClause> assignedDateEqualTo(
      DateTime assignedDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'assignedDate',
        value: [assignedDate],
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterWhereClause> assignedDateNotEqualTo(
      DateTime assignedDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedDate',
              lower: [],
              upper: [assignedDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedDate',
              lower: [assignedDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedDate',
              lower: [assignedDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedDate',
              lower: [],
              upper: [assignedDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterWhereClause> assignedDateGreaterThan(
    DateTime assignedDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'assignedDate',
        lower: [assignedDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterWhereClause> assignedDateLessThan(
    DateTime assignedDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'assignedDate',
        lower: [],
        upper: [assignedDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterWhereClause> assignedDateBetween(
    DateTime lowerAssignedDate,
    DateTime upperAssignedDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'assignedDate',
        lower: [lowerAssignedDate],
        includeLower: includeLower,
        upper: [upperAssignedDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ItemTaskQueryFilter
    on QueryBuilder<ItemTask, ItemTask, QFilterCondition> {
  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> assignedDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition>
      assignedDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assignedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> assignedDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assignedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> assignedDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assignedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> closedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedDate',
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition>
      closedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedDate',
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> closedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> closedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> closedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> closedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> countEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> countGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> countLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> countBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'count',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> isCompletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> subValueEqualTo(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> subValueGreaterThan(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> subValueLessThan(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> subValueBetween(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> titleContains(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> titleMatches(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> typeEqualTo(
      TaskType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> typeBetween(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> valueEqualTo(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> valueGreaterThan(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> valueLessThan(
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

  QueryBuilder<ItemTask, ItemTask, QAfterFilterCondition> valueBetween(
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

extension ItemTaskQueryObject
    on QueryBuilder<ItemTask, ItemTask, QFilterCondition> {}

extension ItemTaskQueryLinks
    on QueryBuilder<ItemTask, ItemTask, QFilterCondition> {}

extension ItemTaskQuerySortBy on QueryBuilder<ItemTask, ItemTask, QSortBy> {
  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortByAssignedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedDate', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortByAssignedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedDate', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortByClosedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDate', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortByClosedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDate', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortBySubValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subValue', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortBySubValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subValue', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension ItemTaskQuerySortThenBy
    on QueryBuilder<ItemTask, ItemTask, QSortThenBy> {
  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByAssignedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedDate', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByAssignedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedDate', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByClosedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDate', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByClosedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedDate', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenBySubValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subValue', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenBySubValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subValue', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QAfterSortBy> thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension ItemTaskQueryWhereDistinct
    on QueryBuilder<ItemTask, ItemTask, QDistinct> {
  QueryBuilder<ItemTask, ItemTask, QDistinct> distinctByAssignedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedDate');
    });
  }

  QueryBuilder<ItemTask, ItemTask, QDistinct> distinctByClosedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedDate');
    });
  }

  QueryBuilder<ItemTask, ItemTask, QDistinct> distinctByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'count');
    });
  }

  QueryBuilder<ItemTask, ItemTask, QDistinct> distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<ItemTask, ItemTask, QDistinct> distinctBySubValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subValue');
    });
  }

  QueryBuilder<ItemTask, ItemTask, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ItemTask, ItemTask, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<ItemTask, ItemTask, QDistinct> distinctByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value');
    });
  }
}

extension ItemTaskQueryProperty
    on QueryBuilder<ItemTask, ItemTask, QQueryProperty> {
  QueryBuilder<ItemTask, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ItemTask, DateTime, QQueryOperations> assignedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedDate');
    });
  }

  QueryBuilder<ItemTask, DateTime?, QQueryOperations> closedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedDate');
    });
  }

  QueryBuilder<ItemTask, int, QQueryOperations> countProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'count');
    });
  }

  QueryBuilder<ItemTask, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<ItemTask, double, QQueryOperations> subValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subValue');
    });
  }

  QueryBuilder<ItemTask, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<ItemTask, TaskType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<ItemTask, double, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}
