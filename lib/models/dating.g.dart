// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dating.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDatingCollection on Isar {
  IsarCollection<Dating> get datings => this.collection();
}

const DatingSchema = CollectionSchema(
  name: r'Dating',
  id: 2613642271405137985,
  properties: {
    r'datingCompleted': PropertySchema(
      id: 0,
      name: r'datingCompleted',
      type: IsarType.bool,
    ),
    r'datingName': PropertySchema(
      id: 1,
      name: r'datingName',
      type: IsarType.string,
    ),
    r'initDate': PropertySchema(
      id: 2,
      name: r'initDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _datingEstimateSize,
  serialize: _datingSerialize,
  deserialize: _datingDeserialize,
  deserializeProp: _datingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _datingGetId,
  getLinks: _datingGetLinks,
  attach: _datingAttach,
  version: '3.1.0+1',
);

int _datingEstimateSize(
  Dating object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.datingName.length * 3;
  return bytesCount;
}

void _datingSerialize(
  Dating object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.datingCompleted);
  writer.writeString(offsets[1], object.datingName);
  writer.writeDateTime(offsets[2], object.initDate);
}

Dating _datingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Dating();
  object.datingCompleted = reader.readBool(offsets[0]);
  object.datingName = reader.readString(offsets[1]);
  object.id = id;
  object.initDate = reader.readDateTime(offsets[2]);
  return object;
}

P _datingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _datingGetId(Dating object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _datingGetLinks(Dating object) {
  return [];
}

void _datingAttach(IsarCollection<dynamic> col, Id id, Dating object) {
  object.id = id;
}

extension DatingQueryWhereSort on QueryBuilder<Dating, Dating, QWhere> {
  QueryBuilder<Dating, Dating, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DatingQueryWhere on QueryBuilder<Dating, Dating, QWhereClause> {
  QueryBuilder<Dating, Dating, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Dating, Dating, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Dating, Dating, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Dating, Dating, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Dating, Dating, QAfterWhereClause> idBetween(
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

extension DatingQueryFilter on QueryBuilder<Dating, Dating, QFilterCondition> {
  QueryBuilder<Dating, Dating, QAfterFilterCondition> datingCompletedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datingCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Dating, Dating, QAfterFilterCondition> datingNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dating, Dating, QAfterFilterCondition> datingNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'datingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dating, Dating, QAfterFilterCondition> datingNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'datingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dating, Dating, QAfterFilterCondition> datingNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'datingName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dating, Dating, QAfterFilterCondition> datingNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'datingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dating, Dating, QAfterFilterCondition> datingNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'datingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dating, Dating, QAfterFilterCondition> datingNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'datingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dating, Dating, QAfterFilterCondition> datingNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'datingName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dating, Dating, QAfterFilterCondition> datingNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datingName',
        value: '',
      ));
    });
  }

  QueryBuilder<Dating, Dating, QAfterFilterCondition> datingNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'datingName',
        value: '',
      ));
    });
  }

  QueryBuilder<Dating, Dating, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Dating, Dating, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Dating, Dating, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Dating, Dating, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Dating, Dating, QAfterFilterCondition> initDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'initDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Dating, Dating, QAfterFilterCondition> initDateGreaterThan(
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

  QueryBuilder<Dating, Dating, QAfterFilterCondition> initDateLessThan(
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

  QueryBuilder<Dating, Dating, QAfterFilterCondition> initDateBetween(
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
}

extension DatingQueryObject on QueryBuilder<Dating, Dating, QFilterCondition> {}

extension DatingQueryLinks on QueryBuilder<Dating, Dating, QFilterCondition> {}

extension DatingQuerySortBy on QueryBuilder<Dating, Dating, QSortBy> {
  QueryBuilder<Dating, Dating, QAfterSortBy> sortByDatingCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datingCompleted', Sort.asc);
    });
  }

  QueryBuilder<Dating, Dating, QAfterSortBy> sortByDatingCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datingCompleted', Sort.desc);
    });
  }

  QueryBuilder<Dating, Dating, QAfterSortBy> sortByDatingName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datingName', Sort.asc);
    });
  }

  QueryBuilder<Dating, Dating, QAfterSortBy> sortByDatingNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datingName', Sort.desc);
    });
  }

  QueryBuilder<Dating, Dating, QAfterSortBy> sortByInitDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initDate', Sort.asc);
    });
  }

  QueryBuilder<Dating, Dating, QAfterSortBy> sortByInitDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initDate', Sort.desc);
    });
  }
}

extension DatingQuerySortThenBy on QueryBuilder<Dating, Dating, QSortThenBy> {
  QueryBuilder<Dating, Dating, QAfterSortBy> thenByDatingCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datingCompleted', Sort.asc);
    });
  }

  QueryBuilder<Dating, Dating, QAfterSortBy> thenByDatingCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datingCompleted', Sort.desc);
    });
  }

  QueryBuilder<Dating, Dating, QAfterSortBy> thenByDatingName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datingName', Sort.asc);
    });
  }

  QueryBuilder<Dating, Dating, QAfterSortBy> thenByDatingNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datingName', Sort.desc);
    });
  }

  QueryBuilder<Dating, Dating, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Dating, Dating, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Dating, Dating, QAfterSortBy> thenByInitDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initDate', Sort.asc);
    });
  }

  QueryBuilder<Dating, Dating, QAfterSortBy> thenByInitDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initDate', Sort.desc);
    });
  }
}

extension DatingQueryWhereDistinct on QueryBuilder<Dating, Dating, QDistinct> {
  QueryBuilder<Dating, Dating, QDistinct> distinctByDatingCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'datingCompleted');
    });
  }

  QueryBuilder<Dating, Dating, QDistinct> distinctByDatingName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'datingName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Dating, Dating, QDistinct> distinctByInitDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'initDate');
    });
  }
}

extension DatingQueryProperty on QueryBuilder<Dating, Dating, QQueryProperty> {
  QueryBuilder<Dating, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Dating, bool, QQueryOperations> datingCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'datingCompleted');
    });
  }

  QueryBuilder<Dating, String, QQueryOperations> datingNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'datingName');
    });
  }

  QueryBuilder<Dating, DateTime, QQueryOperations> initDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'initDate');
    });
  }
}
