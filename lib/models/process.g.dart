// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProcessCollection on Isar {
  IsarCollection<Process> get process => this.collection();
}

const ProcessSchema = CollectionSchema(
  name: r'Process',
  id: 5700594408034945547,
  properties: {
    r'initDate': PropertySchema(
      id: 0,
      name: r'initDate',
      type: IsarType.dateTime,
    ),
    r'processCompleted': PropertySchema(
      id: 1,
      name: r'processCompleted',
      type: IsarType.bool,
    ),
    r'processName': PropertySchema(
      id: 2,
      name: r'processName',
      type: IsarType.string,
    )
  },
  estimateSize: _processEstimateSize,
  serialize: _processSerialize,
  deserialize: _processDeserialize,
  deserializeProp: _processDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _processGetId,
  getLinks: _processGetLinks,
  attach: _processAttach,
  version: '3.1.0+1',
);

int _processEstimateSize(
  Process object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.processName.length * 3;
  return bytesCount;
}

void _processSerialize(
  Process object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.initDate);
  writer.writeBool(offsets[1], object.processCompleted);
  writer.writeString(offsets[2], object.processName);
}

Process _processDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Process();
  object.id = id;
  object.initDate = reader.readDateTime(offsets[0]);
  object.processCompleted = reader.readBool(offsets[1]);
  object.processName = reader.readString(offsets[2]);
  return object;
}

P _processDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _processGetId(Process object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _processGetLinks(Process object) {
  return [];
}

void _processAttach(IsarCollection<dynamic> col, Id id, Process object) {
  object.id = id;
}

extension ProcessQueryWhereSort on QueryBuilder<Process, Process, QWhere> {
  QueryBuilder<Process, Process, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProcessQueryWhere on QueryBuilder<Process, Process, QWhereClause> {
  QueryBuilder<Process, Process, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Process, Process, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Process, Process, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Process, Process, QAfterWhereClause> idBetween(
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

extension ProcessQueryFilter
    on QueryBuilder<Process, Process, QFilterCondition> {
  QueryBuilder<Process, Process, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Process, Process, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Process, Process, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Process, Process, QAfterFilterCondition> initDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'initDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition> initDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'initDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition> initDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'initDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition> initDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'initDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition> processCompletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'processCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition> processNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'processName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition> processNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'processName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition> processNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'processName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition> processNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'processName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition> processNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'processName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition> processNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'processName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition> processNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'processName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition> processNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'processName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition> processNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'processName',
        value: '',
      ));
    });
  }

  QueryBuilder<Process, Process, QAfterFilterCondition>
      processNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'processName',
        value: '',
      ));
    });
  }
}

extension ProcessQueryObject
    on QueryBuilder<Process, Process, QFilterCondition> {}

extension ProcessQueryLinks
    on QueryBuilder<Process, Process, QFilterCondition> {}

extension ProcessQuerySortBy on QueryBuilder<Process, Process, QSortBy> {
  QueryBuilder<Process, Process, QAfterSortBy> sortByInitDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initDate', Sort.asc);
    });
  }

  QueryBuilder<Process, Process, QAfterSortBy> sortByInitDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initDate', Sort.desc);
    });
  }

  QueryBuilder<Process, Process, QAfterSortBy> sortByProcessCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processCompleted', Sort.asc);
    });
  }

  QueryBuilder<Process, Process, QAfterSortBy> sortByProcessCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processCompleted', Sort.desc);
    });
  }

  QueryBuilder<Process, Process, QAfterSortBy> sortByProcessName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processName', Sort.asc);
    });
  }

  QueryBuilder<Process, Process, QAfterSortBy> sortByProcessNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processName', Sort.desc);
    });
  }
}

extension ProcessQuerySortThenBy
    on QueryBuilder<Process, Process, QSortThenBy> {
  QueryBuilder<Process, Process, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Process, Process, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Process, Process, QAfterSortBy> thenByInitDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initDate', Sort.asc);
    });
  }

  QueryBuilder<Process, Process, QAfterSortBy> thenByInitDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initDate', Sort.desc);
    });
  }

  QueryBuilder<Process, Process, QAfterSortBy> thenByProcessCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processCompleted', Sort.asc);
    });
  }

  QueryBuilder<Process, Process, QAfterSortBy> thenByProcessCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processCompleted', Sort.desc);
    });
  }

  QueryBuilder<Process, Process, QAfterSortBy> thenByProcessName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processName', Sort.asc);
    });
  }

  QueryBuilder<Process, Process, QAfterSortBy> thenByProcessNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processName', Sort.desc);
    });
  }
}

extension ProcessQueryWhereDistinct
    on QueryBuilder<Process, Process, QDistinct> {
  QueryBuilder<Process, Process, QDistinct> distinctByInitDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'initDate');
    });
  }

  QueryBuilder<Process, Process, QDistinct> distinctByProcessCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'processCompleted');
    });
  }

  QueryBuilder<Process, Process, QDistinct> distinctByProcessName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'processName', caseSensitive: caseSensitive);
    });
  }
}

extension ProcessQueryProperty
    on QueryBuilder<Process, Process, QQueryProperty> {
  QueryBuilder<Process, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Process, DateTime, QQueryOperations> initDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'initDate');
    });
  }

  QueryBuilder<Process, bool, QQueryOperations> processCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'processCompleted');
    });
  }

  QueryBuilder<Process, String, QQueryOperations> processNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'processName');
    });
  }
}
