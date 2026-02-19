// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TfactionTable extends Tfaction
    with TableInfo<$TfactionTable, TfactionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TfactionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, link];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tfaction';
  @override
  VerificationContext validateIntegrity(Insertable<TfactionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TfactionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TfactionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link']),
    );
  }

  @override
  $TfactionTable createAlias(String alias) {
    return $TfactionTable(attachedDatabase, alias);
  }
}

class TfactionData extends DataClass implements Insertable<TfactionData> {
  final String id;
  final String name;
  final String? link;
  const TfactionData({required this.id, required this.name, this.link});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || link != null) {
      map['link'] = Variable<String>(link);
    }
    return map;
  }

  TfactionCompanion toCompanion(bool nullToAbsent) {
    return TfactionCompanion(
      id: Value(id),
      name: Value(name),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
    );
  }

  factory TfactionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TfactionData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      link: serializer.fromJson<String?>(json['link']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'link': serializer.toJson<String?>(link),
    };
  }

  TfactionData copyWith(
          {String? id,
          String? name,
          Value<String?> link = const Value.absent()}) =>
      TfactionData(
        id: id ?? this.id,
        name: name ?? this.name,
        link: link.present ? link.value : this.link,
      );
  TfactionData copyWithCompanion(TfactionCompanion data) {
    return TfactionData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      link: data.link.present ? data.link.value : this.link,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TfactionData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('link: $link')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, link);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TfactionData &&
          other.id == this.id &&
          other.name == this.name &&
          other.link == this.link);
}

class TfactionCompanion extends UpdateCompanion<TfactionData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> link;
  final Value<int> rowid;
  const TfactionCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.link = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TfactionCompanion.insert({
    required String id,
    required String name,
    this.link = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<TfactionData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? link,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (link != null) 'link': link,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TfactionCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? link,
      Value<int>? rowid}) {
    return TfactionCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TfactionCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('link: $link, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TsourceTable extends Tsource with TableInfo<$TsourceTable, TsourceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TsourceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _editionMeta =
      const VerificationMeta('edition');
  @override
  late final GeneratedColumn<int> edition = GeneratedColumn<int>(
      'edition', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
      'version', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _errataDateMeta =
      const VerificationMeta('errataDate');
  @override
  late final GeneratedColumn<DateTime> errataDate = GeneratedColumn<DateTime>(
      'errata_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _errataLinkMeta =
      const VerificationMeta('errataLink');
  @override
  late final GeneratedColumn<String> errataLink = GeneratedColumn<String>(
      'errata_link', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, type, edition, version, errataDate, errataLink];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tsource';
  @override
  VerificationContext validateIntegrity(Insertable<TsourceData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('edition')) {
      context.handle(_editionMeta,
          edition.isAcceptableOrUnknown(data['edition']!, _editionMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('errata_date')) {
      context.handle(
          _errataDateMeta,
          errataDate.isAcceptableOrUnknown(
              data['errata_date']!, _errataDateMeta));
    }
    if (data.containsKey('errata_link')) {
      context.handle(
          _errataLinkMeta,
          errataLink.isAcceptableOrUnknown(
              data['errata_link']!, _errataLinkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TsourceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TsourceData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      edition: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}edition']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}version']),
      errataDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}errata_date']),
      errataLink: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}errata_link']),
    );
  }

  @override
  $TsourceTable createAlias(String alias) {
    return $TsourceTable(attachedDatabase, alias);
  }
}

class TsourceData extends DataClass implements Insertable<TsourceData> {
  final int id;
  final String name;
  final String? type;
  final int? edition;
  final String? version;
  final DateTime? errataDate;
  final String? errataLink;
  const TsourceData(
      {required this.id,
      required this.name,
      this.type,
      this.edition,
      this.version,
      this.errataDate,
      this.errataLink});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || edition != null) {
      map['edition'] = Variable<int>(edition);
    }
    if (!nullToAbsent || version != null) {
      map['version'] = Variable<String>(version);
    }
    if (!nullToAbsent || errataDate != null) {
      map['errata_date'] = Variable<DateTime>(errataDate);
    }
    if (!nullToAbsent || errataLink != null) {
      map['errata_link'] = Variable<String>(errataLink);
    }
    return map;
  }

  TsourceCompanion toCompanion(bool nullToAbsent) {
    return TsourceCompanion(
      id: Value(id),
      name: Value(name),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      edition: edition == null && nullToAbsent
          ? const Value.absent()
          : Value(edition),
      version: version == null && nullToAbsent
          ? const Value.absent()
          : Value(version),
      errataDate: errataDate == null && nullToAbsent
          ? const Value.absent()
          : Value(errataDate),
      errataLink: errataLink == null && nullToAbsent
          ? const Value.absent()
          : Value(errataLink),
    );
  }

  factory TsourceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TsourceData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String?>(json['type']),
      edition: serializer.fromJson<int?>(json['edition']),
      version: serializer.fromJson<String?>(json['version']),
      errataDate: serializer.fromJson<DateTime?>(json['errataDate']),
      errataLink: serializer.fromJson<String?>(json['errataLink']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String?>(type),
      'edition': serializer.toJson<int?>(edition),
      'version': serializer.toJson<String?>(version),
      'errataDate': serializer.toJson<DateTime?>(errataDate),
      'errataLink': serializer.toJson<String?>(errataLink),
    };
  }

  TsourceData copyWith(
          {int? id,
          String? name,
          Value<String?> type = const Value.absent(),
          Value<int?> edition = const Value.absent(),
          Value<String?> version = const Value.absent(),
          Value<DateTime?> errataDate = const Value.absent(),
          Value<String?> errataLink = const Value.absent()}) =>
      TsourceData(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type.present ? type.value : this.type,
        edition: edition.present ? edition.value : this.edition,
        version: version.present ? version.value : this.version,
        errataDate: errataDate.present ? errataDate.value : this.errataDate,
        errataLink: errataLink.present ? errataLink.value : this.errataLink,
      );
  TsourceData copyWithCompanion(TsourceCompanion data) {
    return TsourceData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      edition: data.edition.present ? data.edition.value : this.edition,
      version: data.version.present ? data.version.value : this.version,
      errataDate:
          data.errataDate.present ? data.errataDate.value : this.errataDate,
      errataLink:
          data.errataLink.present ? data.errataLink.value : this.errataLink,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TsourceData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('edition: $edition, ')
          ..write('version: $version, ')
          ..write('errataDate: $errataDate, ')
          ..write('errataLink: $errataLink')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, type, edition, version, errataDate, errataLink);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TsourceData &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.edition == this.edition &&
          other.version == this.version &&
          other.errataDate == this.errataDate &&
          other.errataLink == this.errataLink);
}

class TsourceCompanion extends UpdateCompanion<TsourceData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> type;
  final Value<int?> edition;
  final Value<String?> version;
  final Value<DateTime?> errataDate;
  final Value<String?> errataLink;
  const TsourceCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.edition = const Value.absent(),
    this.version = const Value.absent(),
    this.errataDate = const Value.absent(),
    this.errataLink = const Value.absent(),
  });
  TsourceCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.type = const Value.absent(),
    this.edition = const Value.absent(),
    this.version = const Value.absent(),
    this.errataDate = const Value.absent(),
    this.errataLink = const Value.absent(),
  }) : name = Value(name);
  static Insertable<TsourceData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? edition,
    Expression<String>? version,
    Expression<DateTime>? errataDate,
    Expression<String>? errataLink,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (edition != null) 'edition': edition,
      if (version != null) 'version': version,
      if (errataDate != null) 'errata_date': errataDate,
      if (errataLink != null) 'errata_link': errataLink,
    });
  }

  TsourceCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? type,
      Value<int?>? edition,
      Value<String?>? version,
      Value<DateTime?>? errataDate,
      Value<String?>? errataLink}) {
    return TsourceCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      edition: edition ?? this.edition,
      version: version ?? this.version,
      errataDate: errataDate ?? this.errataDate,
      errataLink: errataLink ?? this.errataLink,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (edition.present) {
      map['edition'] = Variable<int>(edition.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (errataDate.present) {
      map['errata_date'] = Variable<DateTime>(errataDate.value);
    }
    if (errataLink.present) {
      map['errata_link'] = Variable<String>(errataLink.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TsourceCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('edition: $edition, ')
          ..write('version: $version, ')
          ..write('errataDate: $errataDate, ')
          ..write('errataLink: $errataLink')
          ..write(')'))
        .toString();
  }
}

class $TdatasheetTable extends Tdatasheet
    with TableInfo<$TdatasheetTable, TdatasheetData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TdatasheetTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _factionIdMeta =
      const VerificationMeta('factionId');
  @override
  late final GeneratedColumn<String> factionId = GeneratedColumn<String>(
      'factionId', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tfaction (id)'));
  static const VerificationMeta _sourceIdMeta =
      const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<int> sourceId = GeneratedColumn<int>(
      'source_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tsource (id)'));
  static const VerificationMeta _legendMeta = const VerificationMeta('legend');
  @override
  late final GeneratedColumn<String> legend = GeneratedColumn<String>(
      'legend', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _loadoutMeta =
      const VerificationMeta('loadout');
  @override
  late final GeneratedColumn<String> loadout = GeneratedColumn<String>(
      'loadout', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _transportMeta =
      const VerificationMeta('transport');
  @override
  late final GeneratedColumn<String> transport = GeneratedColumn<String>(
      'transport', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _virtualMeta =
      const VerificationMeta('virtual');
  @override
  late final GeneratedColumn<bool> virtual = GeneratedColumn<bool>(
      'virtual', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("virtual" IN (0, 1))'));
  static const VerificationMeta _leaderHeadMeta =
      const VerificationMeta('leaderHead');
  @override
  late final GeneratedColumn<String> leaderHead = GeneratedColumn<String>(
      'leader_head', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _leaderFooterMeta =
      const VerificationMeta('leaderFooter');
  @override
  late final GeneratedColumn<String> leaderFooter = GeneratedColumn<String>(
      'leader_footer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _damagedWMeta =
      const VerificationMeta('damagedW');
  @override
  late final GeneratedColumn<String> damagedW = GeneratedColumn<String>(
      'damaged_w', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _damagedDescriptionMeta =
      const VerificationMeta('damagedDescription');
  @override
  late final GeneratedColumn<String> damagedDescription =
      GeneratedColumn<String>('damaged_description', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        factionId,
        sourceId,
        legend,
        role,
        loadout,
        transport,
        virtual,
        leaderHead,
        leaderFooter,
        damagedW,
        damagedDescription,
        link
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tdatasheet';
  @override
  VerificationContext validateIntegrity(Insertable<TdatasheetData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('factionId')) {
      context.handle(_factionIdMeta,
          factionId.isAcceptableOrUnknown(data['factionId']!, _factionIdMeta));
    } else if (isInserting) {
      context.missing(_factionIdMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('legend')) {
      context.handle(_legendMeta,
          legend.isAcceptableOrUnknown(data['legend']!, _legendMeta));
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    }
    if (data.containsKey('loadout')) {
      context.handle(_loadoutMeta,
          loadout.isAcceptableOrUnknown(data['loadout']!, _loadoutMeta));
    }
    if (data.containsKey('transport')) {
      context.handle(_transportMeta,
          transport.isAcceptableOrUnknown(data['transport']!, _transportMeta));
    }
    if (data.containsKey('virtual')) {
      context.handle(_virtualMeta,
          virtual.isAcceptableOrUnknown(data['virtual']!, _virtualMeta));
    }
    if (data.containsKey('leader_head')) {
      context.handle(
          _leaderHeadMeta,
          leaderHead.isAcceptableOrUnknown(
              data['leader_head']!, _leaderHeadMeta));
    }
    if (data.containsKey('leader_footer')) {
      context.handle(
          _leaderFooterMeta,
          leaderFooter.isAcceptableOrUnknown(
              data['leader_footer']!, _leaderFooterMeta));
    }
    if (data.containsKey('damaged_w')) {
      context.handle(_damagedWMeta,
          damagedW.isAcceptableOrUnknown(data['damaged_w']!, _damagedWMeta));
    }
    if (data.containsKey('damaged_description')) {
      context.handle(
          _damagedDescriptionMeta,
          damagedDescription.isAcceptableOrUnknown(
              data['damaged_description']!, _damagedDescriptionMeta));
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TdatasheetData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TdatasheetData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      factionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}factionId'])!,
      sourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}source_id'])!,
      legend: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}legend']),
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role']),
      loadout: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}loadout']),
      transport: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transport']),
      virtual: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}virtual']),
      leaderHead: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}leader_head']),
      leaderFooter: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}leader_footer']),
      damagedW: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}damaged_w']),
      damagedDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}damaged_description']),
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link']),
    );
  }

  @override
  $TdatasheetTable createAlias(String alias) {
    return $TdatasheetTable(attachedDatabase, alias);
  }
}

class TdatasheetData extends DataClass implements Insertable<TdatasheetData> {
  final int id;
  final String name;
  final String factionId;
  final int sourceId;
  final String? legend;
  final String? role;
  final String? loadout;
  final String? transport;
  final bool? virtual;
  final String? leaderHead;
  final String? leaderFooter;
  final String? damagedW;
  final String? damagedDescription;
  final String? link;
  const TdatasheetData(
      {required this.id,
      required this.name,
      required this.factionId,
      required this.sourceId,
      this.legend,
      this.role,
      this.loadout,
      this.transport,
      this.virtual,
      this.leaderHead,
      this.leaderFooter,
      this.damagedW,
      this.damagedDescription,
      this.link});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['factionId'] = Variable<String>(factionId);
    map['source_id'] = Variable<int>(sourceId);
    if (!nullToAbsent || legend != null) {
      map['legend'] = Variable<String>(legend);
    }
    if (!nullToAbsent || role != null) {
      map['role'] = Variable<String>(role);
    }
    if (!nullToAbsent || loadout != null) {
      map['loadout'] = Variable<String>(loadout);
    }
    if (!nullToAbsent || transport != null) {
      map['transport'] = Variable<String>(transport);
    }
    if (!nullToAbsent || virtual != null) {
      map['virtual'] = Variable<bool>(virtual);
    }
    if (!nullToAbsent || leaderHead != null) {
      map['leader_head'] = Variable<String>(leaderHead);
    }
    if (!nullToAbsent || leaderFooter != null) {
      map['leader_footer'] = Variable<String>(leaderFooter);
    }
    if (!nullToAbsent || damagedW != null) {
      map['damaged_w'] = Variable<String>(damagedW);
    }
    if (!nullToAbsent || damagedDescription != null) {
      map['damaged_description'] = Variable<String>(damagedDescription);
    }
    if (!nullToAbsent || link != null) {
      map['link'] = Variable<String>(link);
    }
    return map;
  }

  TdatasheetCompanion toCompanion(bool nullToAbsent) {
    return TdatasheetCompanion(
      id: Value(id),
      name: Value(name),
      factionId: Value(factionId),
      sourceId: Value(sourceId),
      legend:
          legend == null && nullToAbsent ? const Value.absent() : Value(legend),
      role: role == null && nullToAbsent ? const Value.absent() : Value(role),
      loadout: loadout == null && nullToAbsent
          ? const Value.absent()
          : Value(loadout),
      transport: transport == null && nullToAbsent
          ? const Value.absent()
          : Value(transport),
      virtual: virtual == null && nullToAbsent
          ? const Value.absent()
          : Value(virtual),
      leaderHead: leaderHead == null && nullToAbsent
          ? const Value.absent()
          : Value(leaderHead),
      leaderFooter: leaderFooter == null && nullToAbsent
          ? const Value.absent()
          : Value(leaderFooter),
      damagedW: damagedW == null && nullToAbsent
          ? const Value.absent()
          : Value(damagedW),
      damagedDescription: damagedDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(damagedDescription),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
    );
  }

  factory TdatasheetData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TdatasheetData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      factionId: serializer.fromJson<String>(json['factionId']),
      sourceId: serializer.fromJson<int>(json['sourceId']),
      legend: serializer.fromJson<String?>(json['legend']),
      role: serializer.fromJson<String?>(json['role']),
      loadout: serializer.fromJson<String?>(json['loadout']),
      transport: serializer.fromJson<String?>(json['transport']),
      virtual: serializer.fromJson<bool?>(json['virtual']),
      leaderHead: serializer.fromJson<String?>(json['leaderHead']),
      leaderFooter: serializer.fromJson<String?>(json['leaderFooter']),
      damagedW: serializer.fromJson<String?>(json['damagedW']),
      damagedDescription:
          serializer.fromJson<String?>(json['damagedDescription']),
      link: serializer.fromJson<String?>(json['link']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'factionId': serializer.toJson<String>(factionId),
      'sourceId': serializer.toJson<int>(sourceId),
      'legend': serializer.toJson<String?>(legend),
      'role': serializer.toJson<String?>(role),
      'loadout': serializer.toJson<String?>(loadout),
      'transport': serializer.toJson<String?>(transport),
      'virtual': serializer.toJson<bool?>(virtual),
      'leaderHead': serializer.toJson<String?>(leaderHead),
      'leaderFooter': serializer.toJson<String?>(leaderFooter),
      'damagedW': serializer.toJson<String?>(damagedW),
      'damagedDescription': serializer.toJson<String?>(damagedDescription),
      'link': serializer.toJson<String?>(link),
    };
  }

  TdatasheetData copyWith(
          {int? id,
          String? name,
          String? factionId,
          int? sourceId,
          Value<String?> legend = const Value.absent(),
          Value<String?> role = const Value.absent(),
          Value<String?> loadout = const Value.absent(),
          Value<String?> transport = const Value.absent(),
          Value<bool?> virtual = const Value.absent(),
          Value<String?> leaderHead = const Value.absent(),
          Value<String?> leaderFooter = const Value.absent(),
          Value<String?> damagedW = const Value.absent(),
          Value<String?> damagedDescription = const Value.absent(),
          Value<String?> link = const Value.absent()}) =>
      TdatasheetData(
        id: id ?? this.id,
        name: name ?? this.name,
        factionId: factionId ?? this.factionId,
        sourceId: sourceId ?? this.sourceId,
        legend: legend.present ? legend.value : this.legend,
        role: role.present ? role.value : this.role,
        loadout: loadout.present ? loadout.value : this.loadout,
        transport: transport.present ? transport.value : this.transport,
        virtual: virtual.present ? virtual.value : this.virtual,
        leaderHead: leaderHead.present ? leaderHead.value : this.leaderHead,
        leaderFooter:
            leaderFooter.present ? leaderFooter.value : this.leaderFooter,
        damagedW: damagedW.present ? damagedW.value : this.damagedW,
        damagedDescription: damagedDescription.present
            ? damagedDescription.value
            : this.damagedDescription,
        link: link.present ? link.value : this.link,
      );
  TdatasheetData copyWithCompanion(TdatasheetCompanion data) {
    return TdatasheetData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      factionId: data.factionId.present ? data.factionId.value : this.factionId,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      legend: data.legend.present ? data.legend.value : this.legend,
      role: data.role.present ? data.role.value : this.role,
      loadout: data.loadout.present ? data.loadout.value : this.loadout,
      transport: data.transport.present ? data.transport.value : this.transport,
      virtual: data.virtual.present ? data.virtual.value : this.virtual,
      leaderHead:
          data.leaderHead.present ? data.leaderHead.value : this.leaderHead,
      leaderFooter: data.leaderFooter.present
          ? data.leaderFooter.value
          : this.leaderFooter,
      damagedW: data.damagedW.present ? data.damagedW.value : this.damagedW,
      damagedDescription: data.damagedDescription.present
          ? data.damagedDescription.value
          : this.damagedDescription,
      link: data.link.present ? data.link.value : this.link,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('factionId: $factionId, ')
          ..write('sourceId: $sourceId, ')
          ..write('legend: $legend, ')
          ..write('role: $role, ')
          ..write('loadout: $loadout, ')
          ..write('transport: $transport, ')
          ..write('virtual: $virtual, ')
          ..write('leaderHead: $leaderHead, ')
          ..write('leaderFooter: $leaderFooter, ')
          ..write('damagedW: $damagedW, ')
          ..write('damagedDescription: $damagedDescription, ')
          ..write('link: $link')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      factionId,
      sourceId,
      legend,
      role,
      loadout,
      transport,
      virtual,
      leaderHead,
      leaderFooter,
      damagedW,
      damagedDescription,
      link);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TdatasheetData &&
          other.id == this.id &&
          other.name == this.name &&
          other.factionId == this.factionId &&
          other.sourceId == this.sourceId &&
          other.legend == this.legend &&
          other.role == this.role &&
          other.loadout == this.loadout &&
          other.transport == this.transport &&
          other.virtual == this.virtual &&
          other.leaderHead == this.leaderHead &&
          other.leaderFooter == this.leaderFooter &&
          other.damagedW == this.damagedW &&
          other.damagedDescription == this.damagedDescription &&
          other.link == this.link);
}

class TdatasheetCompanion extends UpdateCompanion<TdatasheetData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> factionId;
  final Value<int> sourceId;
  final Value<String?> legend;
  final Value<String?> role;
  final Value<String?> loadout;
  final Value<String?> transport;
  final Value<bool?> virtual;
  final Value<String?> leaderHead;
  final Value<String?> leaderFooter;
  final Value<String?> damagedW;
  final Value<String?> damagedDescription;
  final Value<String?> link;
  const TdatasheetCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.factionId = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.legend = const Value.absent(),
    this.role = const Value.absent(),
    this.loadout = const Value.absent(),
    this.transport = const Value.absent(),
    this.virtual = const Value.absent(),
    this.leaderHead = const Value.absent(),
    this.leaderFooter = const Value.absent(),
    this.damagedW = const Value.absent(),
    this.damagedDescription = const Value.absent(),
    this.link = const Value.absent(),
  });
  TdatasheetCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String factionId,
    required int sourceId,
    this.legend = const Value.absent(),
    this.role = const Value.absent(),
    this.loadout = const Value.absent(),
    this.transport = const Value.absent(),
    this.virtual = const Value.absent(),
    this.leaderHead = const Value.absent(),
    this.leaderFooter = const Value.absent(),
    this.damagedW = const Value.absent(),
    this.damagedDescription = const Value.absent(),
    this.link = const Value.absent(),
  })  : name = Value(name),
        factionId = Value(factionId),
        sourceId = Value(sourceId);
  static Insertable<TdatasheetData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? factionId,
    Expression<int>? sourceId,
    Expression<String>? legend,
    Expression<String>? role,
    Expression<String>? loadout,
    Expression<String>? transport,
    Expression<bool>? virtual,
    Expression<String>? leaderHead,
    Expression<String>? leaderFooter,
    Expression<String>? damagedW,
    Expression<String>? damagedDescription,
    Expression<String>? link,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (factionId != null) 'factionId': factionId,
      if (sourceId != null) 'source_id': sourceId,
      if (legend != null) 'legend': legend,
      if (role != null) 'role': role,
      if (loadout != null) 'loadout': loadout,
      if (transport != null) 'transport': transport,
      if (virtual != null) 'virtual': virtual,
      if (leaderHead != null) 'leader_head': leaderHead,
      if (leaderFooter != null) 'leader_footer': leaderFooter,
      if (damagedW != null) 'damaged_w': damagedW,
      if (damagedDescription != null) 'damaged_description': damagedDescription,
      if (link != null) 'link': link,
    });
  }

  TdatasheetCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? factionId,
      Value<int>? sourceId,
      Value<String?>? legend,
      Value<String?>? role,
      Value<String?>? loadout,
      Value<String?>? transport,
      Value<bool?>? virtual,
      Value<String?>? leaderHead,
      Value<String?>? leaderFooter,
      Value<String?>? damagedW,
      Value<String?>? damagedDescription,
      Value<String?>? link}) {
    return TdatasheetCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      factionId: factionId ?? this.factionId,
      sourceId: sourceId ?? this.sourceId,
      legend: legend ?? this.legend,
      role: role ?? this.role,
      loadout: loadout ?? this.loadout,
      transport: transport ?? this.transport,
      virtual: virtual ?? this.virtual,
      leaderHead: leaderHead ?? this.leaderHead,
      leaderFooter: leaderFooter ?? this.leaderFooter,
      damagedW: damagedW ?? this.damagedW,
      damagedDescription: damagedDescription ?? this.damagedDescription,
      link: link ?? this.link,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (factionId.present) {
      map['factionId'] = Variable<String>(factionId.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<int>(sourceId.value);
    }
    if (legend.present) {
      map['legend'] = Variable<String>(legend.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (loadout.present) {
      map['loadout'] = Variable<String>(loadout.value);
    }
    if (transport.present) {
      map['transport'] = Variable<String>(transport.value);
    }
    if (virtual.present) {
      map['virtual'] = Variable<bool>(virtual.value);
    }
    if (leaderHead.present) {
      map['leader_head'] = Variable<String>(leaderHead.value);
    }
    if (leaderFooter.present) {
      map['leader_footer'] = Variable<String>(leaderFooter.value);
    }
    if (damagedW.present) {
      map['damaged_w'] = Variable<String>(damagedW.value);
    }
    if (damagedDescription.present) {
      map['damaged_description'] = Variable<String>(damagedDescription.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('factionId: $factionId, ')
          ..write('sourceId: $sourceId, ')
          ..write('legend: $legend, ')
          ..write('role: $role, ')
          ..write('loadout: $loadout, ')
          ..write('transport: $transport, ')
          ..write('virtual: $virtual, ')
          ..write('leaderHead: $leaderHead, ')
          ..write('leaderFooter: $leaderFooter, ')
          ..write('damagedW: $damagedW, ')
          ..write('damagedDescription: $damagedDescription, ')
          ..write('link: $link')
          ..write(')'))
        .toString();
  }
}

class $TabilityTable extends Tability
    with TableInfo<$TabilityTable, TabilityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TabilityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _legendMeta = const VerificationMeta('legend');
  @override
  late final GeneratedColumn<String> legend = GeneratedColumn<String>(
      'legend', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _factionIdMeta =
      const VerificationMeta('factionId');
  @override
  late final GeneratedColumn<String> factionId = GeneratedColumn<String>(
      'factionId', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tfaction (id)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, legend, factionId, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tability';
  @override
  VerificationContext validateIntegrity(Insertable<TabilityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('legend')) {
      context.handle(_legendMeta,
          legend.isAcceptableOrUnknown(data['legend']!, _legendMeta));
    }
    if (data.containsKey('factionId')) {
      context.handle(_factionIdMeta,
          factionId.isAcceptableOrUnknown(data['factionId']!, _factionIdMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TabilityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TabilityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      legend: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}legend']),
      factionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}factionId']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $TabilityTable createAlias(String alias) {
    return $TabilityTable(attachedDatabase, alias);
  }
}

class TabilityData extends DataClass implements Insertable<TabilityData> {
  final int id;
  final String name;
  final String? legend;
  final String? factionId;
  final String? description;
  const TabilityData(
      {required this.id,
      required this.name,
      this.legend,
      this.factionId,
      this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || legend != null) {
      map['legend'] = Variable<String>(legend);
    }
    if (!nullToAbsent || factionId != null) {
      map['factionId'] = Variable<String>(factionId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  TabilityCompanion toCompanion(bool nullToAbsent) {
    return TabilityCompanion(
      id: Value(id),
      name: Value(name),
      legend:
          legend == null && nullToAbsent ? const Value.absent() : Value(legend),
      factionId: factionId == null && nullToAbsent
          ? const Value.absent()
          : Value(factionId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory TabilityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TabilityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      legend: serializer.fromJson<String?>(json['legend']),
      factionId: serializer.fromJson<String?>(json['factionId']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'legend': serializer.toJson<String?>(legend),
      'factionId': serializer.toJson<String?>(factionId),
      'description': serializer.toJson<String?>(description),
    };
  }

  TabilityData copyWith(
          {int? id,
          String? name,
          Value<String?> legend = const Value.absent(),
          Value<String?> factionId = const Value.absent(),
          Value<String?> description = const Value.absent()}) =>
      TabilityData(
        id: id ?? this.id,
        name: name ?? this.name,
        legend: legend.present ? legend.value : this.legend,
        factionId: factionId.present ? factionId.value : this.factionId,
        description: description.present ? description.value : this.description,
      );
  TabilityData copyWithCompanion(TabilityCompanion data) {
    return TabilityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      legend: data.legend.present ? data.legend.value : this.legend,
      factionId: data.factionId.present ? data.factionId.value : this.factionId,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TabilityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('legend: $legend, ')
          ..write('factionId: $factionId, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, legend, factionId, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TabilityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.legend == this.legend &&
          other.factionId == this.factionId &&
          other.description == this.description);
}

class TabilityCompanion extends UpdateCompanion<TabilityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> legend;
  final Value<String?> factionId;
  final Value<String?> description;
  const TabilityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.legend = const Value.absent(),
    this.factionId = const Value.absent(),
    this.description = const Value.absent(),
  });
  TabilityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.legend = const Value.absent(),
    this.factionId = const Value.absent(),
    this.description = const Value.absent(),
  }) : name = Value(name);
  static Insertable<TabilityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? legend,
    Expression<String>? factionId,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (legend != null) 'legend': legend,
      if (factionId != null) 'factionId': factionId,
      if (description != null) 'description': description,
    });
  }

  TabilityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? legend,
      Value<String?>? factionId,
      Value<String?>? description}) {
    return TabilityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      legend: legend ?? this.legend,
      factionId: factionId ?? this.factionId,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (legend.present) {
      map['legend'] = Variable<String>(legend.value);
    }
    if (factionId.present) {
      map['factionId'] = Variable<String>(factionId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TabilityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('legend: $legend, ')
          ..write('factionId: $factionId, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $TdetachmentTable extends Tdetachment
    with TableInfo<$TdetachmentTable, TdetachmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TdetachmentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _factionIdMeta =
      const VerificationMeta('factionId');
  @override
  late final GeneratedColumn<String> factionId = GeneratedColumn<String>(
      'faction_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tfaction (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _legendMeta = const VerificationMeta('legend');
  @override
  late final GeneratedColumn<String> legend = GeneratedColumn<String>(
      'legend', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, factionId, name, legend, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tdetachment';
  @override
  VerificationContext validateIntegrity(Insertable<TdetachmentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('faction_id')) {
      context.handle(_factionIdMeta,
          factionId.isAcceptableOrUnknown(data['faction_id']!, _factionIdMeta));
    } else if (isInserting) {
      context.missing(_factionIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('legend')) {
      context.handle(_legendMeta,
          legend.isAcceptableOrUnknown(data['legend']!, _legendMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TdetachmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TdetachmentData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      factionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}faction_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      legend: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}legend']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
    );
  }

  @override
  $TdetachmentTable createAlias(String alias) {
    return $TdetachmentTable(attachedDatabase, alias);
  }
}

class TdetachmentData extends DataClass implements Insertable<TdetachmentData> {
  final int id;
  final String factionId;
  final String name;
  final String? legend;
  final String? type;
  const TdetachmentData(
      {required this.id,
      required this.factionId,
      required this.name,
      this.legend,
      this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['faction_id'] = Variable<String>(factionId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || legend != null) {
      map['legend'] = Variable<String>(legend);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    return map;
  }

  TdetachmentCompanion toCompanion(bool nullToAbsent) {
    return TdetachmentCompanion(
      id: Value(id),
      factionId: Value(factionId),
      name: Value(name),
      legend:
          legend == null && nullToAbsent ? const Value.absent() : Value(legend),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
    );
  }

  factory TdetachmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TdetachmentData(
      id: serializer.fromJson<int>(json['id']),
      factionId: serializer.fromJson<String>(json['factionId']),
      name: serializer.fromJson<String>(json['name']),
      legend: serializer.fromJson<String?>(json['legend']),
      type: serializer.fromJson<String?>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'factionId': serializer.toJson<String>(factionId),
      'name': serializer.toJson<String>(name),
      'legend': serializer.toJson<String?>(legend),
      'type': serializer.toJson<String?>(type),
    };
  }

  TdetachmentData copyWith(
          {int? id,
          String? factionId,
          String? name,
          Value<String?> legend = const Value.absent(),
          Value<String?> type = const Value.absent()}) =>
      TdetachmentData(
        id: id ?? this.id,
        factionId: factionId ?? this.factionId,
        name: name ?? this.name,
        legend: legend.present ? legend.value : this.legend,
        type: type.present ? type.value : this.type,
      );
  TdetachmentData copyWithCompanion(TdetachmentCompanion data) {
    return TdetachmentData(
      id: data.id.present ? data.id.value : this.id,
      factionId: data.factionId.present ? data.factionId.value : this.factionId,
      name: data.name.present ? data.name.value : this.name,
      legend: data.legend.present ? data.legend.value : this.legend,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TdetachmentData(')
          ..write('id: $id, ')
          ..write('factionId: $factionId, ')
          ..write('name: $name, ')
          ..write('legend: $legend, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, factionId, name, legend, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TdetachmentData &&
          other.id == this.id &&
          other.factionId == this.factionId &&
          other.name == this.name &&
          other.legend == this.legend &&
          other.type == this.type);
}

class TdetachmentCompanion extends UpdateCompanion<TdetachmentData> {
  final Value<int> id;
  final Value<String> factionId;
  final Value<String> name;
  final Value<String?> legend;
  final Value<String?> type;
  const TdetachmentCompanion({
    this.id = const Value.absent(),
    this.factionId = const Value.absent(),
    this.name = const Value.absent(),
    this.legend = const Value.absent(),
    this.type = const Value.absent(),
  });
  TdetachmentCompanion.insert({
    this.id = const Value.absent(),
    required String factionId,
    required String name,
    this.legend = const Value.absent(),
    this.type = const Value.absent(),
  })  : factionId = Value(factionId),
        name = Value(name);
  static Insertable<TdetachmentData> custom({
    Expression<int>? id,
    Expression<String>? factionId,
    Expression<String>? name,
    Expression<String>? legend,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (factionId != null) 'faction_id': factionId,
      if (name != null) 'name': name,
      if (legend != null) 'legend': legend,
      if (type != null) 'type': type,
    });
  }

  TdetachmentCompanion copyWith(
      {Value<int>? id,
      Value<String>? factionId,
      Value<String>? name,
      Value<String?>? legend,
      Value<String?>? type}) {
    return TdetachmentCompanion(
      id: id ?? this.id,
      factionId: factionId ?? this.factionId,
      name: name ?? this.name,
      legend: legend ?? this.legend,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (factionId.present) {
      map['faction_id'] = Variable<String>(factionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (legend.present) {
      map['legend'] = Variable<String>(legend.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TdetachmentCompanion(')
          ..write('id: $id, ')
          ..write('factionId: $factionId, ')
          ..write('name: $name, ')
          ..write('legend: $legend, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $TenhancementTable extends Tenhancement
    with TableInfo<$TenhancementTable, TenhancementData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TenhancementTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _factionIdMeta =
      const VerificationMeta('factionId');
  @override
  late final GeneratedColumn<String> factionId = GeneratedColumn<String>(
      'faction_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tfaction (id)'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<int> cost = GeneratedColumn<int>(
      'cost', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _detachmentMeta =
      const VerificationMeta('detachment');
  @override
  late final GeneratedColumn<String> detachment = GeneratedColumn<String>(
      'detachment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _detachmentIdMeta =
      const VerificationMeta('detachmentId');
  @override
  late final GeneratedColumn<int> detachmentId = GeneratedColumn<int>(
      'detachment_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tdetachment (id)'));
  static const VerificationMeta _legendMeta = const VerificationMeta('legend');
  @override
  late final GeneratedColumn<String> legend = GeneratedColumn<String>(
      'legend', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        factionId,
        id,
        name,
        cost,
        detachment,
        detachmentId,
        legend,
        description
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tenhancement';
  @override
  VerificationContext validateIntegrity(Insertable<TenhancementData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('faction_id')) {
      context.handle(_factionIdMeta,
          factionId.isAcceptableOrUnknown(data['faction_id']!, _factionIdMeta));
    } else if (isInserting) {
      context.missing(_factionIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
          _costMeta, cost.isAcceptableOrUnknown(data['cost']!, _costMeta));
    } else if (isInserting) {
      context.missing(_costMeta);
    }
    if (data.containsKey('detachment')) {
      context.handle(
          _detachmentMeta,
          detachment.isAcceptableOrUnknown(
              data['detachment']!, _detachmentMeta));
    }
    if (data.containsKey('detachment_id')) {
      context.handle(
          _detachmentIdMeta,
          detachmentId.isAcceptableOrUnknown(
              data['detachment_id']!, _detachmentIdMeta));
    }
    if (data.containsKey('legend')) {
      context.handle(_legendMeta,
          legend.isAcceptableOrUnknown(data['legend']!, _legendMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TenhancementData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TenhancementData(
      factionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}faction_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      cost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cost'])!,
      detachment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}detachment']),
      detachmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}detachment_id']),
      legend: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}legend']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $TenhancementTable createAlias(String alias) {
    return $TenhancementTable(attachedDatabase, alias);
  }
}

class TenhancementData extends DataClass
    implements Insertable<TenhancementData> {
  final String factionId;
  final int id;
  final String name;
  final int cost;
  final String? detachment;
  final int? detachmentId;
  final String? legend;
  final String? description;
  const TenhancementData(
      {required this.factionId,
      required this.id,
      required this.name,
      required this.cost,
      this.detachment,
      this.detachmentId,
      this.legend,
      this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['faction_id'] = Variable<String>(factionId);
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['cost'] = Variable<int>(cost);
    if (!nullToAbsent || detachment != null) {
      map['detachment'] = Variable<String>(detachment);
    }
    if (!nullToAbsent || detachmentId != null) {
      map['detachment_id'] = Variable<int>(detachmentId);
    }
    if (!nullToAbsent || legend != null) {
      map['legend'] = Variable<String>(legend);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  TenhancementCompanion toCompanion(bool nullToAbsent) {
    return TenhancementCompanion(
      factionId: Value(factionId),
      id: Value(id),
      name: Value(name),
      cost: Value(cost),
      detachment: detachment == null && nullToAbsent
          ? const Value.absent()
          : Value(detachment),
      detachmentId: detachmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(detachmentId),
      legend:
          legend == null && nullToAbsent ? const Value.absent() : Value(legend),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory TenhancementData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TenhancementData(
      factionId: serializer.fromJson<String>(json['factionId']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      cost: serializer.fromJson<int>(json['cost']),
      detachment: serializer.fromJson<String?>(json['detachment']),
      detachmentId: serializer.fromJson<int?>(json['detachmentId']),
      legend: serializer.fromJson<String?>(json['legend']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'factionId': serializer.toJson<String>(factionId),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'cost': serializer.toJson<int>(cost),
      'detachment': serializer.toJson<String?>(detachment),
      'detachmentId': serializer.toJson<int?>(detachmentId),
      'legend': serializer.toJson<String?>(legend),
      'description': serializer.toJson<String?>(description),
    };
  }

  TenhancementData copyWith(
          {String? factionId,
          int? id,
          String? name,
          int? cost,
          Value<String?> detachment = const Value.absent(),
          Value<int?> detachmentId = const Value.absent(),
          Value<String?> legend = const Value.absent(),
          Value<String?> description = const Value.absent()}) =>
      TenhancementData(
        factionId: factionId ?? this.factionId,
        id: id ?? this.id,
        name: name ?? this.name,
        cost: cost ?? this.cost,
        detachment: detachment.present ? detachment.value : this.detachment,
        detachmentId:
            detachmentId.present ? detachmentId.value : this.detachmentId,
        legend: legend.present ? legend.value : this.legend,
        description: description.present ? description.value : this.description,
      );
  TenhancementData copyWithCompanion(TenhancementCompanion data) {
    return TenhancementData(
      factionId: data.factionId.present ? data.factionId.value : this.factionId,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      cost: data.cost.present ? data.cost.value : this.cost,
      detachment:
          data.detachment.present ? data.detachment.value : this.detachment,
      detachmentId: data.detachmentId.present
          ? data.detachmentId.value
          : this.detachmentId,
      legend: data.legend.present ? data.legend.value : this.legend,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TenhancementData(')
          ..write('factionId: $factionId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('cost: $cost, ')
          ..write('detachment: $detachment, ')
          ..write('detachmentId: $detachmentId, ')
          ..write('legend: $legend, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      factionId, id, name, cost, detachment, detachmentId, legend, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TenhancementData &&
          other.factionId == this.factionId &&
          other.id == this.id &&
          other.name == this.name &&
          other.cost == this.cost &&
          other.detachment == this.detachment &&
          other.detachmentId == this.detachmentId &&
          other.legend == this.legend &&
          other.description == this.description);
}

class TenhancementCompanion extends UpdateCompanion<TenhancementData> {
  final Value<String> factionId;
  final Value<int> id;
  final Value<String> name;
  final Value<int> cost;
  final Value<String?> detachment;
  final Value<int?> detachmentId;
  final Value<String?> legend;
  final Value<String?> description;
  const TenhancementCompanion({
    this.factionId = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.cost = const Value.absent(),
    this.detachment = const Value.absent(),
    this.detachmentId = const Value.absent(),
    this.legend = const Value.absent(),
    this.description = const Value.absent(),
  });
  TenhancementCompanion.insert({
    required String factionId,
    this.id = const Value.absent(),
    required String name,
    required int cost,
    this.detachment = const Value.absent(),
    this.detachmentId = const Value.absent(),
    this.legend = const Value.absent(),
    this.description = const Value.absent(),
  })  : factionId = Value(factionId),
        name = Value(name),
        cost = Value(cost);
  static Insertable<TenhancementData> custom({
    Expression<String>? factionId,
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? cost,
    Expression<String>? detachment,
    Expression<int>? detachmentId,
    Expression<String>? legend,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (factionId != null) 'faction_id': factionId,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (cost != null) 'cost': cost,
      if (detachment != null) 'detachment': detachment,
      if (detachmentId != null) 'detachment_id': detachmentId,
      if (legend != null) 'legend': legend,
      if (description != null) 'description': description,
    });
  }

  TenhancementCompanion copyWith(
      {Value<String>? factionId,
      Value<int>? id,
      Value<String>? name,
      Value<int>? cost,
      Value<String?>? detachment,
      Value<int?>? detachmentId,
      Value<String?>? legend,
      Value<String?>? description}) {
    return TenhancementCompanion(
      factionId: factionId ?? this.factionId,
      id: id ?? this.id,
      name: name ?? this.name,
      cost: cost ?? this.cost,
      detachment: detachment ?? this.detachment,
      detachmentId: detachmentId ?? this.detachmentId,
      legend: legend ?? this.legend,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (factionId.present) {
      map['faction_id'] = Variable<String>(factionId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (cost.present) {
      map['cost'] = Variable<int>(cost.value);
    }
    if (detachment.present) {
      map['detachment'] = Variable<String>(detachment.value);
    }
    if (detachmentId.present) {
      map['detachment_id'] = Variable<int>(detachmentId.value);
    }
    if (legend.present) {
      map['legend'] = Variable<String>(legend.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TenhancementCompanion(')
          ..write('factionId: $factionId, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('cost: $cost, ')
          ..write('detachment: $detachment, ')
          ..write('detachmentId: $detachmentId, ')
          ..write('legend: $legend, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $TstratagemTable extends Tstratagem
    with TableInfo<$TstratagemTable, TstratagemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TstratagemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _factionIdMeta =
      const VerificationMeta('factionId');
  @override
  late final GeneratedColumn<String> factionId = GeneratedColumn<String>(
      'faction_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _commandPointCostMeta =
      const VerificationMeta('commandPointCost');
  @override
  late final GeneratedColumn<int> commandPointCost = GeneratedColumn<int>(
      'command_point_cost', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _legendMeta = const VerificationMeta('legend');
  @override
  late final GeneratedColumn<String> legend = GeneratedColumn<String>(
      'legend', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _turnMeta = const VerificationMeta('turn');
  @override
  late final GeneratedColumn<String> turn = GeneratedColumn<String>(
      'turn', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phaseMeta = const VerificationMeta('phase');
  @override
  late final GeneratedColumn<String> phase = GeneratedColumn<String>(
      'phase', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _detachmentMeta =
      const VerificationMeta('detachment');
  @override
  late final GeneratedColumn<String> detachment = GeneratedColumn<String>(
      'detachment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _detachmentIdMeta =
      const VerificationMeta('detachmentId');
  @override
  late final GeneratedColumn<int> detachmentId = GeneratedColumn<int>(
      'detachment_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tdetachment (id)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        factionId,
        name,
        id,
        type,
        commandPointCost,
        legend,
        turn,
        phase,
        detachment,
        detachmentId,
        description
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tstratagem';
  @override
  VerificationContext validateIntegrity(Insertable<TstratagemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('faction_id')) {
      context.handle(_factionIdMeta,
          factionId.isAcceptableOrUnknown(data['faction_id']!, _factionIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('command_point_cost')) {
      context.handle(
          _commandPointCostMeta,
          commandPointCost.isAcceptableOrUnknown(
              data['command_point_cost']!, _commandPointCostMeta));
    }
    if (data.containsKey('legend')) {
      context.handle(_legendMeta,
          legend.isAcceptableOrUnknown(data['legend']!, _legendMeta));
    }
    if (data.containsKey('turn')) {
      context.handle(
          _turnMeta, turn.isAcceptableOrUnknown(data['turn']!, _turnMeta));
    }
    if (data.containsKey('phase')) {
      context.handle(
          _phaseMeta, phase.isAcceptableOrUnknown(data['phase']!, _phaseMeta));
    }
    if (data.containsKey('detachment')) {
      context.handle(
          _detachmentMeta,
          detachment.isAcceptableOrUnknown(
              data['detachment']!, _detachmentMeta));
    }
    if (data.containsKey('detachment_id')) {
      context.handle(
          _detachmentIdMeta,
          detachmentId.isAcceptableOrUnknown(
              data['detachment_id']!, _detachmentIdMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TstratagemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TstratagemData(
      factionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}faction_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      commandPointCost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}command_point_cost']),
      legend: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}legend']),
      turn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}turn']),
      phase: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phase']),
      detachment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}detachment']),
      detachmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}detachment_id']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $TstratagemTable createAlias(String alias) {
    return $TstratagemTable(attachedDatabase, alias);
  }
}

class TstratagemData extends DataClass implements Insertable<TstratagemData> {
  final String? factionId;
  final String? name;
  final int id;
  final String? type;
  final int? commandPointCost;
  final String? legend;
  final String? turn;
  final String? phase;
  final String? detachment;
  final int? detachmentId;
  final String? description;
  const TstratagemData(
      {this.factionId,
      this.name,
      required this.id,
      this.type,
      this.commandPointCost,
      this.legend,
      this.turn,
      this.phase,
      this.detachment,
      this.detachmentId,
      this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || factionId != null) {
      map['faction_id'] = Variable<String>(factionId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || commandPointCost != null) {
      map['command_point_cost'] = Variable<int>(commandPointCost);
    }
    if (!nullToAbsent || legend != null) {
      map['legend'] = Variable<String>(legend);
    }
    if (!nullToAbsent || turn != null) {
      map['turn'] = Variable<String>(turn);
    }
    if (!nullToAbsent || phase != null) {
      map['phase'] = Variable<String>(phase);
    }
    if (!nullToAbsent || detachment != null) {
      map['detachment'] = Variable<String>(detachment);
    }
    if (!nullToAbsent || detachmentId != null) {
      map['detachment_id'] = Variable<int>(detachmentId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  TstratagemCompanion toCompanion(bool nullToAbsent) {
    return TstratagemCompanion(
      factionId: factionId == null && nullToAbsent
          ? const Value.absent()
          : Value(factionId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      id: Value(id),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      commandPointCost: commandPointCost == null && nullToAbsent
          ? const Value.absent()
          : Value(commandPointCost),
      legend:
          legend == null && nullToAbsent ? const Value.absent() : Value(legend),
      turn: turn == null && nullToAbsent ? const Value.absent() : Value(turn),
      phase:
          phase == null && nullToAbsent ? const Value.absent() : Value(phase),
      detachment: detachment == null && nullToAbsent
          ? const Value.absent()
          : Value(detachment),
      detachmentId: detachmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(detachmentId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory TstratagemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TstratagemData(
      factionId: serializer.fromJson<String?>(json['factionId']),
      name: serializer.fromJson<String?>(json['name']),
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String?>(json['type']),
      commandPointCost: serializer.fromJson<int?>(json['commandPointCost']),
      legend: serializer.fromJson<String?>(json['legend']),
      turn: serializer.fromJson<String?>(json['turn']),
      phase: serializer.fromJson<String?>(json['phase']),
      detachment: serializer.fromJson<String?>(json['detachment']),
      detachmentId: serializer.fromJson<int?>(json['detachmentId']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'factionId': serializer.toJson<String?>(factionId),
      'name': serializer.toJson<String?>(name),
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String?>(type),
      'commandPointCost': serializer.toJson<int?>(commandPointCost),
      'legend': serializer.toJson<String?>(legend),
      'turn': serializer.toJson<String?>(turn),
      'phase': serializer.toJson<String?>(phase),
      'detachment': serializer.toJson<String?>(detachment),
      'detachmentId': serializer.toJson<int?>(detachmentId),
      'description': serializer.toJson<String?>(description),
    };
  }

  TstratagemData copyWith(
          {Value<String?> factionId = const Value.absent(),
          Value<String?> name = const Value.absent(),
          int? id,
          Value<String?> type = const Value.absent(),
          Value<int?> commandPointCost = const Value.absent(),
          Value<String?> legend = const Value.absent(),
          Value<String?> turn = const Value.absent(),
          Value<String?> phase = const Value.absent(),
          Value<String?> detachment = const Value.absent(),
          Value<int?> detachmentId = const Value.absent(),
          Value<String?> description = const Value.absent()}) =>
      TstratagemData(
        factionId: factionId.present ? factionId.value : this.factionId,
        name: name.present ? name.value : this.name,
        id: id ?? this.id,
        type: type.present ? type.value : this.type,
        commandPointCost: commandPointCost.present
            ? commandPointCost.value
            : this.commandPointCost,
        legend: legend.present ? legend.value : this.legend,
        turn: turn.present ? turn.value : this.turn,
        phase: phase.present ? phase.value : this.phase,
        detachment: detachment.present ? detachment.value : this.detachment,
        detachmentId:
            detachmentId.present ? detachmentId.value : this.detachmentId,
        description: description.present ? description.value : this.description,
      );
  TstratagemData copyWithCompanion(TstratagemCompanion data) {
    return TstratagemData(
      factionId: data.factionId.present ? data.factionId.value : this.factionId,
      name: data.name.present ? data.name.value : this.name,
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      commandPointCost: data.commandPointCost.present
          ? data.commandPointCost.value
          : this.commandPointCost,
      legend: data.legend.present ? data.legend.value : this.legend,
      turn: data.turn.present ? data.turn.value : this.turn,
      phase: data.phase.present ? data.phase.value : this.phase,
      detachment:
          data.detachment.present ? data.detachment.value : this.detachment,
      detachmentId: data.detachmentId.present
          ? data.detachmentId.value
          : this.detachmentId,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TstratagemData(')
          ..write('factionId: $factionId, ')
          ..write('name: $name, ')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('commandPointCost: $commandPointCost, ')
          ..write('legend: $legend, ')
          ..write('turn: $turn, ')
          ..write('phase: $phase, ')
          ..write('detachment: $detachment, ')
          ..write('detachmentId: $detachmentId, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(factionId, name, id, type, commandPointCost,
      legend, turn, phase, detachment, detachmentId, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TstratagemData &&
          other.factionId == this.factionId &&
          other.name == this.name &&
          other.id == this.id &&
          other.type == this.type &&
          other.commandPointCost == this.commandPointCost &&
          other.legend == this.legend &&
          other.turn == this.turn &&
          other.phase == this.phase &&
          other.detachment == this.detachment &&
          other.detachmentId == this.detachmentId &&
          other.description == this.description);
}

class TstratagemCompanion extends UpdateCompanion<TstratagemData> {
  final Value<String?> factionId;
  final Value<String?> name;
  final Value<int> id;
  final Value<String?> type;
  final Value<int?> commandPointCost;
  final Value<String?> legend;
  final Value<String?> turn;
  final Value<String?> phase;
  final Value<String?> detachment;
  final Value<int?> detachmentId;
  final Value<String?> description;
  const TstratagemCompanion({
    this.factionId = const Value.absent(),
    this.name = const Value.absent(),
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.commandPointCost = const Value.absent(),
    this.legend = const Value.absent(),
    this.turn = const Value.absent(),
    this.phase = const Value.absent(),
    this.detachment = const Value.absent(),
    this.detachmentId = const Value.absent(),
    this.description = const Value.absent(),
  });
  TstratagemCompanion.insert({
    this.factionId = const Value.absent(),
    this.name = const Value.absent(),
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.commandPointCost = const Value.absent(),
    this.legend = const Value.absent(),
    this.turn = const Value.absent(),
    this.phase = const Value.absent(),
    this.detachment = const Value.absent(),
    this.detachmentId = const Value.absent(),
    this.description = const Value.absent(),
  });
  static Insertable<TstratagemData> custom({
    Expression<String>? factionId,
    Expression<String>? name,
    Expression<int>? id,
    Expression<String>? type,
    Expression<int>? commandPointCost,
    Expression<String>? legend,
    Expression<String>? turn,
    Expression<String>? phase,
    Expression<String>? detachment,
    Expression<int>? detachmentId,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (factionId != null) 'faction_id': factionId,
      if (name != null) 'name': name,
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (commandPointCost != null) 'command_point_cost': commandPointCost,
      if (legend != null) 'legend': legend,
      if (turn != null) 'turn': turn,
      if (phase != null) 'phase': phase,
      if (detachment != null) 'detachment': detachment,
      if (detachmentId != null) 'detachment_id': detachmentId,
      if (description != null) 'description': description,
    });
  }

  TstratagemCompanion copyWith(
      {Value<String?>? factionId,
      Value<String?>? name,
      Value<int>? id,
      Value<String?>? type,
      Value<int?>? commandPointCost,
      Value<String?>? legend,
      Value<String?>? turn,
      Value<String?>? phase,
      Value<String?>? detachment,
      Value<int?>? detachmentId,
      Value<String?>? description}) {
    return TstratagemCompanion(
      factionId: factionId ?? this.factionId,
      name: name ?? this.name,
      id: id ?? this.id,
      type: type ?? this.type,
      commandPointCost: commandPointCost ?? this.commandPointCost,
      legend: legend ?? this.legend,
      turn: turn ?? this.turn,
      phase: phase ?? this.phase,
      detachment: detachment ?? this.detachment,
      detachmentId: detachmentId ?? this.detachmentId,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (factionId.present) {
      map['faction_id'] = Variable<String>(factionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (commandPointCost.present) {
      map['command_point_cost'] = Variable<int>(commandPointCost.value);
    }
    if (legend.present) {
      map['legend'] = Variable<String>(legend.value);
    }
    if (turn.present) {
      map['turn'] = Variable<String>(turn.value);
    }
    if (phase.present) {
      map['phase'] = Variable<String>(phase.value);
    }
    if (detachment.present) {
      map['detachment'] = Variable<String>(detachment.value);
    }
    if (detachmentId.present) {
      map['detachment_id'] = Variable<int>(detachmentId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TstratagemCompanion(')
          ..write('factionId: $factionId, ')
          ..write('name: $name, ')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('commandPointCost: $commandPointCost, ')
          ..write('legend: $legend, ')
          ..write('turn: $turn, ')
          ..write('phase: $phase, ')
          ..write('detachment: $detachment, ')
          ..write('detachmentId: $detachmentId, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $TlastupdateTable extends Tlastupdate
    with TableInfo<$TlastupdateTable, TlastupdateData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TlastupdateTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lastUpdateMeta =
      const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
      'last_update', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [lastUpdate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tlastupdate';
  @override
  VerificationContext validateIntegrity(Insertable<TlastupdateData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('last_update')) {
      context.handle(
          _lastUpdateMeta,
          lastUpdate.isAcceptableOrUnknown(
              data['last_update']!, _lastUpdateMeta));
    } else if (isInserting) {
      context.missing(_lastUpdateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lastUpdate};
  @override
  TlastupdateData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TlastupdateData(
      lastUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_update'])!,
    );
  }

  @override
  $TlastupdateTable createAlias(String alias) {
    return $TlastupdateTable(attachedDatabase, alias);
  }
}

class TlastupdateData extends DataClass implements Insertable<TlastupdateData> {
  final DateTime lastUpdate;
  const TlastupdateData({required this.lastUpdate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_update'] = Variable<DateTime>(lastUpdate);
    return map;
  }

  TlastupdateCompanion toCompanion(bool nullToAbsent) {
    return TlastupdateCompanion(
      lastUpdate: Value(lastUpdate),
    );
  }

  factory TlastupdateData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TlastupdateData(
      lastUpdate: serializer.fromJson<DateTime>(json['lastUpdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastUpdate': serializer.toJson<DateTime>(lastUpdate),
    };
  }

  TlastupdateData copyWith({DateTime? lastUpdate}) => TlastupdateData(
        lastUpdate: lastUpdate ?? this.lastUpdate,
      );
  TlastupdateData copyWithCompanion(TlastupdateCompanion data) {
    return TlastupdateData(
      lastUpdate:
          data.lastUpdate.present ? data.lastUpdate.value : this.lastUpdate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TlastupdateData(')
          ..write('lastUpdate: $lastUpdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => lastUpdate.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TlastupdateData && other.lastUpdate == this.lastUpdate);
}

class TlastupdateCompanion extends UpdateCompanion<TlastupdateData> {
  final Value<DateTime> lastUpdate;
  final Value<int> rowid;
  const TlastupdateCompanion({
    this.lastUpdate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TlastupdateCompanion.insert({
    required DateTime lastUpdate,
    this.rowid = const Value.absent(),
  }) : lastUpdate = Value(lastUpdate);
  static Insertable<TlastupdateData> custom({
    Expression<DateTime>? lastUpdate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TlastupdateCompanion copyWith(
      {Value<DateTime>? lastUpdate, Value<int>? rowid}) {
    return TlastupdateCompanion(
      lastUpdate: lastUpdate ?? this.lastUpdate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TlastupdateCompanion(')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TdatasheetabilityTable extends Tdatasheetability
    with TableInfo<$TdatasheetabilityTable, TdatasheetabilityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TdatasheetabilityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _datasheetIdMeta =
      const VerificationMeta('datasheetId');
  @override
  late final GeneratedColumn<int> datasheetId = GeneratedColumn<int>(
      'datasheet_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lineMeta = const VerificationMeta('line');
  @override
  late final GeneratedColumn<int> line = GeneratedColumn<int>(
      'line', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _abilityIdMeta =
      const VerificationMeta('abilityId');
  @override
  late final GeneratedColumn<int> abilityId = GeneratedColumn<int>(
      'ability_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tability (id)'));
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
      'model', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _parameterMeta =
      const VerificationMeta('parameter');
  @override
  late final GeneratedColumn<String> parameter = GeneratedColumn<String>(
      'parameter', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [datasheetId, line, abilityId, model, name, description, type, parameter];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tdatasheetability';
  @override
  VerificationContext validateIntegrity(
      Insertable<TdatasheetabilityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('datasheet_id')) {
      context.handle(
          _datasheetIdMeta,
          datasheetId.isAcceptableOrUnknown(
              data['datasheet_id']!, _datasheetIdMeta));
    } else if (isInserting) {
      context.missing(_datasheetIdMeta);
    }
    if (data.containsKey('line')) {
      context.handle(
          _lineMeta, line.isAcceptableOrUnknown(data['line']!, _lineMeta));
    } else if (isInserting) {
      context.missing(_lineMeta);
    }
    if (data.containsKey('ability_id')) {
      context.handle(_abilityIdMeta,
          abilityId.isAcceptableOrUnknown(data['ability_id']!, _abilityIdMeta));
    }
    if (data.containsKey('model')) {
      context.handle(
          _modelMeta, model.isAcceptableOrUnknown(data['model']!, _modelMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('parameter')) {
      context.handle(_parameterMeta,
          parameter.isAcceptableOrUnknown(data['parameter']!, _parameterMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {datasheetId, line};
  @override
  TdatasheetabilityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TdatasheetabilityData(
      datasheetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}datasheet_id'])!,
      line: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}line'])!,
      abilityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ability_id']),
      model: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}model']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      parameter: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parameter']),
    );
  }

  @override
  $TdatasheetabilityTable createAlias(String alias) {
    return $TdatasheetabilityTable(attachedDatabase, alias);
  }
}

class TdatasheetabilityData extends DataClass
    implements Insertable<TdatasheetabilityData> {
  final int datasheetId;
  final int line;
  final int? abilityId;
  final String? model;
  final String? name;
  final String? description;
  final String? type;
  final String? parameter;
  const TdatasheetabilityData(
      {required this.datasheetId,
      required this.line,
      this.abilityId,
      this.model,
      this.name,
      this.description,
      this.type,
      this.parameter});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['datasheet_id'] = Variable<int>(datasheetId);
    map['line'] = Variable<int>(line);
    if (!nullToAbsent || abilityId != null) {
      map['ability_id'] = Variable<int>(abilityId);
    }
    if (!nullToAbsent || model != null) {
      map['model'] = Variable<String>(model);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || parameter != null) {
      map['parameter'] = Variable<String>(parameter);
    }
    return map;
  }

  TdatasheetabilityCompanion toCompanion(bool nullToAbsent) {
    return TdatasheetabilityCompanion(
      datasheetId: Value(datasheetId),
      line: Value(line),
      abilityId: abilityId == null && nullToAbsent
          ? const Value.absent()
          : Value(abilityId),
      model:
          model == null && nullToAbsent ? const Value.absent() : Value(model),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      parameter: parameter == null && nullToAbsent
          ? const Value.absent()
          : Value(parameter),
    );
  }

  factory TdatasheetabilityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TdatasheetabilityData(
      datasheetId: serializer.fromJson<int>(json['datasheetId']),
      line: serializer.fromJson<int>(json['line']),
      abilityId: serializer.fromJson<int?>(json['abilityId']),
      model: serializer.fromJson<String?>(json['model']),
      name: serializer.fromJson<String?>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      type: serializer.fromJson<String?>(json['type']),
      parameter: serializer.fromJson<String?>(json['parameter']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'datasheetId': serializer.toJson<int>(datasheetId),
      'line': serializer.toJson<int>(line),
      'abilityId': serializer.toJson<int?>(abilityId),
      'model': serializer.toJson<String?>(model),
      'name': serializer.toJson<String?>(name),
      'description': serializer.toJson<String?>(description),
      'type': serializer.toJson<String?>(type),
      'parameter': serializer.toJson<String?>(parameter),
    };
  }

  TdatasheetabilityData copyWith(
          {int? datasheetId,
          int? line,
          Value<int?> abilityId = const Value.absent(),
          Value<String?> model = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> type = const Value.absent(),
          Value<String?> parameter = const Value.absent()}) =>
      TdatasheetabilityData(
        datasheetId: datasheetId ?? this.datasheetId,
        line: line ?? this.line,
        abilityId: abilityId.present ? abilityId.value : this.abilityId,
        model: model.present ? model.value : this.model,
        name: name.present ? name.value : this.name,
        description: description.present ? description.value : this.description,
        type: type.present ? type.value : this.type,
        parameter: parameter.present ? parameter.value : this.parameter,
      );
  TdatasheetabilityData copyWithCompanion(TdatasheetabilityCompanion data) {
    return TdatasheetabilityData(
      datasheetId:
          data.datasheetId.present ? data.datasheetId.value : this.datasheetId,
      line: data.line.present ? data.line.value : this.line,
      abilityId: data.abilityId.present ? data.abilityId.value : this.abilityId,
      model: data.model.present ? data.model.value : this.model,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      type: data.type.present ? data.type.value : this.type,
      parameter: data.parameter.present ? data.parameter.value : this.parameter,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetabilityData(')
          ..write('datasheetId: $datasheetId, ')
          ..write('line: $line, ')
          ..write('abilityId: $abilityId, ')
          ..write('model: $model, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('parameter: $parameter')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      datasheetId, line, abilityId, model, name, description, type, parameter);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TdatasheetabilityData &&
          other.datasheetId == this.datasheetId &&
          other.line == this.line &&
          other.abilityId == this.abilityId &&
          other.model == this.model &&
          other.name == this.name &&
          other.description == this.description &&
          other.type == this.type &&
          other.parameter == this.parameter);
}

class TdatasheetabilityCompanion
    extends UpdateCompanion<TdatasheetabilityData> {
  final Value<int> datasheetId;
  final Value<int> line;
  final Value<int?> abilityId;
  final Value<String?> model;
  final Value<String?> name;
  final Value<String?> description;
  final Value<String?> type;
  final Value<String?> parameter;
  final Value<int> rowid;
  const TdatasheetabilityCompanion({
    this.datasheetId = const Value.absent(),
    this.line = const Value.absent(),
    this.abilityId = const Value.absent(),
    this.model = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.parameter = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TdatasheetabilityCompanion.insert({
    required int datasheetId,
    required int line,
    this.abilityId = const Value.absent(),
    this.model = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.parameter = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : datasheetId = Value(datasheetId),
        line = Value(line);
  static Insertable<TdatasheetabilityData> custom({
    Expression<int>? datasheetId,
    Expression<int>? line,
    Expression<int>? abilityId,
    Expression<String>? model,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? type,
    Expression<String>? parameter,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (datasheetId != null) 'datasheet_id': datasheetId,
      if (line != null) 'line': line,
      if (abilityId != null) 'ability_id': abilityId,
      if (model != null) 'model': model,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (parameter != null) 'parameter': parameter,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TdatasheetabilityCompanion copyWith(
      {Value<int>? datasheetId,
      Value<int>? line,
      Value<int?>? abilityId,
      Value<String?>? model,
      Value<String?>? name,
      Value<String?>? description,
      Value<String?>? type,
      Value<String?>? parameter,
      Value<int>? rowid}) {
    return TdatasheetabilityCompanion(
      datasheetId: datasheetId ?? this.datasheetId,
      line: line ?? this.line,
      abilityId: abilityId ?? this.abilityId,
      model: model ?? this.model,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      parameter: parameter ?? this.parameter,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (datasheetId.present) {
      map['datasheet_id'] = Variable<int>(datasheetId.value);
    }
    if (line.present) {
      map['line'] = Variable<int>(line.value);
    }
    if (abilityId.present) {
      map['ability_id'] = Variable<int>(abilityId.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (parameter.present) {
      map['parameter'] = Variable<String>(parameter.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetabilityCompanion(')
          ..write('datasheetId: $datasheetId, ')
          ..write('line: $line, ')
          ..write('abilityId: $abilityId, ')
          ..write('model: $model, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('parameter: $parameter, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TdatasheetmodelTable extends Tdatasheetmodel
    with TableInfo<$TdatasheetmodelTable, TdatasheetmodelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TdatasheetmodelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _datasheetIdMeta =
      const VerificationMeta('datasheetId');
  @override
  late final GeneratedColumn<int> datasheetId = GeneratedColumn<int>(
      'datasheet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tdatasheet (id)'));
  static const VerificationMeta _lineMeta = const VerificationMeta('line');
  @override
  late final GeneratedColumn<int> line = GeneratedColumn<int>(
      'line', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _moveMeta = const VerificationMeta('move');
  @override
  late final GeneratedColumn<int> move = GeneratedColumn<int>(
      'move', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _toughnessMeta =
      const VerificationMeta('toughness');
  @override
  late final GeneratedColumn<int> toughness = GeneratedColumn<int>(
      'toughness', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _saveMeta = const VerificationMeta('save');
  @override
  late final GeneratedColumn<String> save = GeneratedColumn<String>(
      'save', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _invulnerableSaveMeta =
      const VerificationMeta('invulnerableSave');
  @override
  late final GeneratedColumn<String> invulnerableSave = GeneratedColumn<String>(
      'invulnerable_save', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _invulnerableSaveDescriptionMeta =
      const VerificationMeta('invulnerableSaveDescription');
  @override
  late final GeneratedColumn<String> invulnerableSaveDescription =
      GeneratedColumn<String>(
          'invulnerable_save_description', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _woundsMeta = const VerificationMeta('wounds');
  @override
  late final GeneratedColumn<int> wounds = GeneratedColumn<int>(
      'wounds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _leadershipMeta =
      const VerificationMeta('leadership');
  @override
  late final GeneratedColumn<String> leadership = GeneratedColumn<String>(
      'leadership', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _objectiveControlMeta =
      const VerificationMeta('objectiveControl');
  @override
  late final GeneratedColumn<int> objectiveControl = GeneratedColumn<int>(
      'objective_control', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _baseSizeMeta =
      const VerificationMeta('baseSize');
  @override
  late final GeneratedColumn<String> baseSize = GeneratedColumn<String>(
      'base_size', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _baseSizeDescriptionMeta =
      const VerificationMeta('baseSizeDescription');
  @override
  late final GeneratedColumn<String> baseSizeDescription =
      GeneratedColumn<String>('base_size_description', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        datasheetId,
        line,
        name,
        move,
        toughness,
        save,
        invulnerableSave,
        invulnerableSaveDescription,
        wounds,
        leadership,
        objectiveControl,
        baseSize,
        baseSizeDescription
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tdatasheetmodel';
  @override
  VerificationContext validateIntegrity(
      Insertable<TdatasheetmodelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('datasheet_id')) {
      context.handle(
          _datasheetIdMeta,
          datasheetId.isAcceptableOrUnknown(
              data['datasheet_id']!, _datasheetIdMeta));
    } else if (isInserting) {
      context.missing(_datasheetIdMeta);
    }
    if (data.containsKey('line')) {
      context.handle(
          _lineMeta, line.isAcceptableOrUnknown(data['line']!, _lineMeta));
    } else if (isInserting) {
      context.missing(_lineMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('move')) {
      context.handle(
          _moveMeta, move.isAcceptableOrUnknown(data['move']!, _moveMeta));
    } else if (isInserting) {
      context.missing(_moveMeta);
    }
    if (data.containsKey('toughness')) {
      context.handle(_toughnessMeta,
          toughness.isAcceptableOrUnknown(data['toughness']!, _toughnessMeta));
    } else if (isInserting) {
      context.missing(_toughnessMeta);
    }
    if (data.containsKey('save')) {
      context.handle(
          _saveMeta, save.isAcceptableOrUnknown(data['save']!, _saveMeta));
    } else if (isInserting) {
      context.missing(_saveMeta);
    }
    if (data.containsKey('invulnerable_save')) {
      context.handle(
          _invulnerableSaveMeta,
          invulnerableSave.isAcceptableOrUnknown(
              data['invulnerable_save']!, _invulnerableSaveMeta));
    }
    if (data.containsKey('invulnerable_save_description')) {
      context.handle(
          _invulnerableSaveDescriptionMeta,
          invulnerableSaveDescription.isAcceptableOrUnknown(
              data['invulnerable_save_description']!,
              _invulnerableSaveDescriptionMeta));
    }
    if (data.containsKey('wounds')) {
      context.handle(_woundsMeta,
          wounds.isAcceptableOrUnknown(data['wounds']!, _woundsMeta));
    } else if (isInserting) {
      context.missing(_woundsMeta);
    }
    if (data.containsKey('leadership')) {
      context.handle(
          _leadershipMeta,
          leadership.isAcceptableOrUnknown(
              data['leadership']!, _leadershipMeta));
    } else if (isInserting) {
      context.missing(_leadershipMeta);
    }
    if (data.containsKey('objective_control')) {
      context.handle(
          _objectiveControlMeta,
          objectiveControl.isAcceptableOrUnknown(
              data['objective_control']!, _objectiveControlMeta));
    } else if (isInserting) {
      context.missing(_objectiveControlMeta);
    }
    if (data.containsKey('base_size')) {
      context.handle(_baseSizeMeta,
          baseSize.isAcceptableOrUnknown(data['base_size']!, _baseSizeMeta));
    } else if (isInserting) {
      context.missing(_baseSizeMeta);
    }
    if (data.containsKey('base_size_description')) {
      context.handle(
          _baseSizeDescriptionMeta,
          baseSizeDescription.isAcceptableOrUnknown(
              data['base_size_description']!, _baseSizeDescriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {datasheetId, line};
  @override
  TdatasheetmodelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TdatasheetmodelData(
      datasheetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}datasheet_id'])!,
      line: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}line'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      move: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}move'])!,
      toughness: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}toughness'])!,
      save: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}save'])!,
      invulnerableSave: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}invulnerable_save']),
      invulnerableSaveDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}invulnerable_save_description']),
      wounds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wounds'])!,
      leadership: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}leadership'])!,
      objectiveControl: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}objective_control'])!,
      baseSize: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}base_size'])!,
      baseSizeDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}base_size_description']),
    );
  }

  @override
  $TdatasheetmodelTable createAlias(String alias) {
    return $TdatasheetmodelTable(attachedDatabase, alias);
  }
}

class TdatasheetmodelData extends DataClass
    implements Insertable<TdatasheetmodelData> {
  final int datasheetId;
  final int line;
  final String name;
  final int move;
  final int toughness;
  final String save;
  final String? invulnerableSave;
  final String? invulnerableSaveDescription;
  final int wounds;
  final String leadership;
  final int objectiveControl;
  final String baseSize;
  final String? baseSizeDescription;
  const TdatasheetmodelData(
      {required this.datasheetId,
      required this.line,
      required this.name,
      required this.move,
      required this.toughness,
      required this.save,
      this.invulnerableSave,
      this.invulnerableSaveDescription,
      required this.wounds,
      required this.leadership,
      required this.objectiveControl,
      required this.baseSize,
      this.baseSizeDescription});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['datasheet_id'] = Variable<int>(datasheetId);
    map['line'] = Variable<int>(line);
    map['name'] = Variable<String>(name);
    map['move'] = Variable<int>(move);
    map['toughness'] = Variable<int>(toughness);
    map['save'] = Variable<String>(save);
    if (!nullToAbsent || invulnerableSave != null) {
      map['invulnerable_save'] = Variable<String>(invulnerableSave);
    }
    if (!nullToAbsent || invulnerableSaveDescription != null) {
      map['invulnerable_save_description'] =
          Variable<String>(invulnerableSaveDescription);
    }
    map['wounds'] = Variable<int>(wounds);
    map['leadership'] = Variable<String>(leadership);
    map['objective_control'] = Variable<int>(objectiveControl);
    map['base_size'] = Variable<String>(baseSize);
    if (!nullToAbsent || baseSizeDescription != null) {
      map['base_size_description'] = Variable<String>(baseSizeDescription);
    }
    return map;
  }

  TdatasheetmodelCompanion toCompanion(bool nullToAbsent) {
    return TdatasheetmodelCompanion(
      datasheetId: Value(datasheetId),
      line: Value(line),
      name: Value(name),
      move: Value(move),
      toughness: Value(toughness),
      save: Value(save),
      invulnerableSave: invulnerableSave == null && nullToAbsent
          ? const Value.absent()
          : Value(invulnerableSave),
      invulnerableSaveDescription:
          invulnerableSaveDescription == null && nullToAbsent
              ? const Value.absent()
              : Value(invulnerableSaveDescription),
      wounds: Value(wounds),
      leadership: Value(leadership),
      objectiveControl: Value(objectiveControl),
      baseSize: Value(baseSize),
      baseSizeDescription: baseSizeDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(baseSizeDescription),
    );
  }

  factory TdatasheetmodelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TdatasheetmodelData(
      datasheetId: serializer.fromJson<int>(json['datasheetId']),
      line: serializer.fromJson<int>(json['line']),
      name: serializer.fromJson<String>(json['name']),
      move: serializer.fromJson<int>(json['move']),
      toughness: serializer.fromJson<int>(json['toughness']),
      save: serializer.fromJson<String>(json['save']),
      invulnerableSave: serializer.fromJson<String?>(json['invulnerableSave']),
      invulnerableSaveDescription:
          serializer.fromJson<String?>(json['invulnerableSaveDescription']),
      wounds: serializer.fromJson<int>(json['wounds']),
      leadership: serializer.fromJson<String>(json['leadership']),
      objectiveControl: serializer.fromJson<int>(json['objectiveControl']),
      baseSize: serializer.fromJson<String>(json['baseSize']),
      baseSizeDescription:
          serializer.fromJson<String?>(json['baseSizeDescription']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'datasheetId': serializer.toJson<int>(datasheetId),
      'line': serializer.toJson<int>(line),
      'name': serializer.toJson<String>(name),
      'move': serializer.toJson<int>(move),
      'toughness': serializer.toJson<int>(toughness),
      'save': serializer.toJson<String>(save),
      'invulnerableSave': serializer.toJson<String?>(invulnerableSave),
      'invulnerableSaveDescription':
          serializer.toJson<String?>(invulnerableSaveDescription),
      'wounds': serializer.toJson<int>(wounds),
      'leadership': serializer.toJson<String>(leadership),
      'objectiveControl': serializer.toJson<int>(objectiveControl),
      'baseSize': serializer.toJson<String>(baseSize),
      'baseSizeDescription': serializer.toJson<String?>(baseSizeDescription),
    };
  }

  TdatasheetmodelData copyWith(
          {int? datasheetId,
          int? line,
          String? name,
          int? move,
          int? toughness,
          String? save,
          Value<String?> invulnerableSave = const Value.absent(),
          Value<String?> invulnerableSaveDescription = const Value.absent(),
          int? wounds,
          String? leadership,
          int? objectiveControl,
          String? baseSize,
          Value<String?> baseSizeDescription = const Value.absent()}) =>
      TdatasheetmodelData(
        datasheetId: datasheetId ?? this.datasheetId,
        line: line ?? this.line,
        name: name ?? this.name,
        move: move ?? this.move,
        toughness: toughness ?? this.toughness,
        save: save ?? this.save,
        invulnerableSave: invulnerableSave.present
            ? invulnerableSave.value
            : this.invulnerableSave,
        invulnerableSaveDescription: invulnerableSaveDescription.present
            ? invulnerableSaveDescription.value
            : this.invulnerableSaveDescription,
        wounds: wounds ?? this.wounds,
        leadership: leadership ?? this.leadership,
        objectiveControl: objectiveControl ?? this.objectiveControl,
        baseSize: baseSize ?? this.baseSize,
        baseSizeDescription: baseSizeDescription.present
            ? baseSizeDescription.value
            : this.baseSizeDescription,
      );
  TdatasheetmodelData copyWithCompanion(TdatasheetmodelCompanion data) {
    return TdatasheetmodelData(
      datasheetId:
          data.datasheetId.present ? data.datasheetId.value : this.datasheetId,
      line: data.line.present ? data.line.value : this.line,
      name: data.name.present ? data.name.value : this.name,
      move: data.move.present ? data.move.value : this.move,
      toughness: data.toughness.present ? data.toughness.value : this.toughness,
      save: data.save.present ? data.save.value : this.save,
      invulnerableSave: data.invulnerableSave.present
          ? data.invulnerableSave.value
          : this.invulnerableSave,
      invulnerableSaveDescription: data.invulnerableSaveDescription.present
          ? data.invulnerableSaveDescription.value
          : this.invulnerableSaveDescription,
      wounds: data.wounds.present ? data.wounds.value : this.wounds,
      leadership:
          data.leadership.present ? data.leadership.value : this.leadership,
      objectiveControl: data.objectiveControl.present
          ? data.objectiveControl.value
          : this.objectiveControl,
      baseSize: data.baseSize.present ? data.baseSize.value : this.baseSize,
      baseSizeDescription: data.baseSizeDescription.present
          ? data.baseSizeDescription.value
          : this.baseSizeDescription,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetmodelData(')
          ..write('datasheetId: $datasheetId, ')
          ..write('line: $line, ')
          ..write('name: $name, ')
          ..write('move: $move, ')
          ..write('toughness: $toughness, ')
          ..write('save: $save, ')
          ..write('invulnerableSave: $invulnerableSave, ')
          ..write('invulnerableSaveDescription: $invulnerableSaveDescription, ')
          ..write('wounds: $wounds, ')
          ..write('leadership: $leadership, ')
          ..write('objectiveControl: $objectiveControl, ')
          ..write('baseSize: $baseSize, ')
          ..write('baseSizeDescription: $baseSizeDescription')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      datasheetId,
      line,
      name,
      move,
      toughness,
      save,
      invulnerableSave,
      invulnerableSaveDescription,
      wounds,
      leadership,
      objectiveControl,
      baseSize,
      baseSizeDescription);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TdatasheetmodelData &&
          other.datasheetId == this.datasheetId &&
          other.line == this.line &&
          other.name == this.name &&
          other.move == this.move &&
          other.toughness == this.toughness &&
          other.save == this.save &&
          other.invulnerableSave == this.invulnerableSave &&
          other.invulnerableSaveDescription ==
              this.invulnerableSaveDescription &&
          other.wounds == this.wounds &&
          other.leadership == this.leadership &&
          other.objectiveControl == this.objectiveControl &&
          other.baseSize == this.baseSize &&
          other.baseSizeDescription == this.baseSizeDescription);
}

class TdatasheetmodelCompanion extends UpdateCompanion<TdatasheetmodelData> {
  final Value<int> datasheetId;
  final Value<int> line;
  final Value<String> name;
  final Value<int> move;
  final Value<int> toughness;
  final Value<String> save;
  final Value<String?> invulnerableSave;
  final Value<String?> invulnerableSaveDescription;
  final Value<int> wounds;
  final Value<String> leadership;
  final Value<int> objectiveControl;
  final Value<String> baseSize;
  final Value<String?> baseSizeDescription;
  final Value<int> rowid;
  const TdatasheetmodelCompanion({
    this.datasheetId = const Value.absent(),
    this.line = const Value.absent(),
    this.name = const Value.absent(),
    this.move = const Value.absent(),
    this.toughness = const Value.absent(),
    this.save = const Value.absent(),
    this.invulnerableSave = const Value.absent(),
    this.invulnerableSaveDescription = const Value.absent(),
    this.wounds = const Value.absent(),
    this.leadership = const Value.absent(),
    this.objectiveControl = const Value.absent(),
    this.baseSize = const Value.absent(),
    this.baseSizeDescription = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TdatasheetmodelCompanion.insert({
    required int datasheetId,
    required int line,
    required String name,
    required int move,
    required int toughness,
    required String save,
    this.invulnerableSave = const Value.absent(),
    this.invulnerableSaveDescription = const Value.absent(),
    required int wounds,
    required String leadership,
    required int objectiveControl,
    required String baseSize,
    this.baseSizeDescription = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : datasheetId = Value(datasheetId),
        line = Value(line),
        name = Value(name),
        move = Value(move),
        toughness = Value(toughness),
        save = Value(save),
        wounds = Value(wounds),
        leadership = Value(leadership),
        objectiveControl = Value(objectiveControl),
        baseSize = Value(baseSize);
  static Insertable<TdatasheetmodelData> custom({
    Expression<int>? datasheetId,
    Expression<int>? line,
    Expression<String>? name,
    Expression<int>? move,
    Expression<int>? toughness,
    Expression<String>? save,
    Expression<String>? invulnerableSave,
    Expression<String>? invulnerableSaveDescription,
    Expression<int>? wounds,
    Expression<String>? leadership,
    Expression<int>? objectiveControl,
    Expression<String>? baseSize,
    Expression<String>? baseSizeDescription,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (datasheetId != null) 'datasheet_id': datasheetId,
      if (line != null) 'line': line,
      if (name != null) 'name': name,
      if (move != null) 'move': move,
      if (toughness != null) 'toughness': toughness,
      if (save != null) 'save': save,
      if (invulnerableSave != null) 'invulnerable_save': invulnerableSave,
      if (invulnerableSaveDescription != null)
        'invulnerable_save_description': invulnerableSaveDescription,
      if (wounds != null) 'wounds': wounds,
      if (leadership != null) 'leadership': leadership,
      if (objectiveControl != null) 'objective_control': objectiveControl,
      if (baseSize != null) 'base_size': baseSize,
      if (baseSizeDescription != null)
        'base_size_description': baseSizeDescription,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TdatasheetmodelCompanion copyWith(
      {Value<int>? datasheetId,
      Value<int>? line,
      Value<String>? name,
      Value<int>? move,
      Value<int>? toughness,
      Value<String>? save,
      Value<String?>? invulnerableSave,
      Value<String?>? invulnerableSaveDescription,
      Value<int>? wounds,
      Value<String>? leadership,
      Value<int>? objectiveControl,
      Value<String>? baseSize,
      Value<String?>? baseSizeDescription,
      Value<int>? rowid}) {
    return TdatasheetmodelCompanion(
      datasheetId: datasheetId ?? this.datasheetId,
      line: line ?? this.line,
      name: name ?? this.name,
      move: move ?? this.move,
      toughness: toughness ?? this.toughness,
      save: save ?? this.save,
      invulnerableSave: invulnerableSave ?? this.invulnerableSave,
      invulnerableSaveDescription:
          invulnerableSaveDescription ?? this.invulnerableSaveDescription,
      wounds: wounds ?? this.wounds,
      leadership: leadership ?? this.leadership,
      objectiveControl: objectiveControl ?? this.objectiveControl,
      baseSize: baseSize ?? this.baseSize,
      baseSizeDescription: baseSizeDescription ?? this.baseSizeDescription,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (datasheetId.present) {
      map['datasheet_id'] = Variable<int>(datasheetId.value);
    }
    if (line.present) {
      map['line'] = Variable<int>(line.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (move.present) {
      map['move'] = Variable<int>(move.value);
    }
    if (toughness.present) {
      map['toughness'] = Variable<int>(toughness.value);
    }
    if (save.present) {
      map['save'] = Variable<String>(save.value);
    }
    if (invulnerableSave.present) {
      map['invulnerable_save'] = Variable<String>(invulnerableSave.value);
    }
    if (invulnerableSaveDescription.present) {
      map['invulnerable_save_description'] =
          Variable<String>(invulnerableSaveDescription.value);
    }
    if (wounds.present) {
      map['wounds'] = Variable<int>(wounds.value);
    }
    if (leadership.present) {
      map['leadership'] = Variable<String>(leadership.value);
    }
    if (objectiveControl.present) {
      map['objective_control'] = Variable<int>(objectiveControl.value);
    }
    if (baseSize.present) {
      map['base_size'] = Variable<String>(baseSize.value);
    }
    if (baseSizeDescription.present) {
      map['base_size_description'] =
          Variable<String>(baseSizeDescription.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetmodelCompanion(')
          ..write('datasheetId: $datasheetId, ')
          ..write('line: $line, ')
          ..write('name: $name, ')
          ..write('move: $move, ')
          ..write('toughness: $toughness, ')
          ..write('save: $save, ')
          ..write('invulnerableSave: $invulnerableSave, ')
          ..write('invulnerableSaveDescription: $invulnerableSaveDescription, ')
          ..write('wounds: $wounds, ')
          ..write('leadership: $leadership, ')
          ..write('objectiveControl: $objectiveControl, ')
          ..write('baseSize: $baseSize, ')
          ..write('baseSizeDescription: $baseSizeDescription, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TdatasheetwargearTable extends Tdatasheetwargear
    with TableInfo<$TdatasheetwargearTable, TdatasheetwargearData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TdatasheetwargearTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _datasheetIdMeta =
      const VerificationMeta('datasheetId');
  @override
  late final GeneratedColumn<int> datasheetId = GeneratedColumn<int>(
      'datasheet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tdatasheet (id)'));
  static const VerificationMeta _lineMeta = const VerificationMeta('line');
  @override
  late final GeneratedColumn<int> line = GeneratedColumn<int>(
      'line', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lineInWargearMeta =
      const VerificationMeta('lineInWargear');
  @override
  late final GeneratedColumn<int> lineInWargear = GeneratedColumn<int>(
      'line_in_wargear', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _diceMeta = const VerificationMeta('dice');
  @override
  late final GeneratedColumn<String> dice = GeneratedColumn<String>(
      'dice', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _rangeMeta = const VerificationMeta('range');
  @override
  late final GeneratedColumn<int> range = GeneratedColumn<int>(
      'range', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _attacksMeta =
      const VerificationMeta('attacks');
  @override
  late final GeneratedColumn<int> attacks = GeneratedColumn<int>(
      'attacks', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _ballisticSkillMeta =
      const VerificationMeta('ballisticSkill');
  @override
  late final GeneratedColumn<String> ballisticSkill = GeneratedColumn<String>(
      'ballistic_skill', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strengthMeta =
      const VerificationMeta('strength');
  @override
  late final GeneratedColumn<int> strength = GeneratedColumn<int>(
      'strength', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _armorPenetrationMeta =
      const VerificationMeta('armorPenetration');
  @override
  late final GeneratedColumn<int> armorPenetration = GeneratedColumn<int>(
      'armor_penetration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _damageMeta = const VerificationMeta('damage');
  @override
  late final GeneratedColumn<String> damage = GeneratedColumn<String>(
      'damage', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        datasheetId,
        line,
        lineInWargear,
        dice,
        name,
        description,
        range,
        type,
        attacks,
        ballisticSkill,
        strength,
        armorPenetration,
        damage
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tdatasheetwargear';
  @override
  VerificationContext validateIntegrity(
      Insertable<TdatasheetwargearData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('datasheet_id')) {
      context.handle(
          _datasheetIdMeta,
          datasheetId.isAcceptableOrUnknown(
              data['datasheet_id']!, _datasheetIdMeta));
    } else if (isInserting) {
      context.missing(_datasheetIdMeta);
    }
    if (data.containsKey('line')) {
      context.handle(
          _lineMeta, line.isAcceptableOrUnknown(data['line']!, _lineMeta));
    }
    if (data.containsKey('line_in_wargear')) {
      context.handle(
          _lineInWargearMeta,
          lineInWargear.isAcceptableOrUnknown(
              data['line_in_wargear']!, _lineInWargearMeta));
    } else if (isInserting) {
      context.missing(_lineInWargearMeta);
    }
    if (data.containsKey('dice')) {
      context.handle(
          _diceMeta, dice.isAcceptableOrUnknown(data['dice']!, _diceMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('range')) {
      context.handle(
          _rangeMeta, range.isAcceptableOrUnknown(data['range']!, _rangeMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('attacks')) {
      context.handle(_attacksMeta,
          attacks.isAcceptableOrUnknown(data['attacks']!, _attacksMeta));
    }
    if (data.containsKey('ballistic_skill')) {
      context.handle(
          _ballisticSkillMeta,
          ballisticSkill.isAcceptableOrUnknown(
              data['ballistic_skill']!, _ballisticSkillMeta));
    }
    if (data.containsKey('strength')) {
      context.handle(_strengthMeta,
          strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta));
    }
    if (data.containsKey('armor_penetration')) {
      context.handle(
          _armorPenetrationMeta,
          armorPenetration.isAcceptableOrUnknown(
              data['armor_penetration']!, _armorPenetrationMeta));
    }
    if (data.containsKey('damage')) {
      context.handle(_damageMeta,
          damage.isAcceptableOrUnknown(data['damage']!, _damageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {datasheetId, lineInWargear};
  @override
  TdatasheetwargearData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TdatasheetwargearData(
      datasheetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}datasheet_id'])!,
      line: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}line']),
      lineInWargear: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}line_in_wargear'])!,
      dice: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dice']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      range: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}range']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      attacks: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attacks']),
      ballisticSkill: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ballistic_skill']),
      strength: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}strength']),
      armorPenetration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}armor_penetration']),
      damage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}damage']),
    );
  }

  @override
  $TdatasheetwargearTable createAlias(String alias) {
    return $TdatasheetwargearTable(attachedDatabase, alias);
  }
}

class TdatasheetwargearData extends DataClass
    implements Insertable<TdatasheetwargearData> {
  final int datasheetId;
  final int? line;
  final int lineInWargear;
  final String? dice;
  final String? name;
  final String? description;
  final int? range;
  final String? type;
  final int? attacks;
  final String? ballisticSkill;
  final int? strength;
  final int? armorPenetration;
  final String? damage;
  const TdatasheetwargearData(
      {required this.datasheetId,
      this.line,
      required this.lineInWargear,
      this.dice,
      this.name,
      this.description,
      this.range,
      this.type,
      this.attacks,
      this.ballisticSkill,
      this.strength,
      this.armorPenetration,
      this.damage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['datasheet_id'] = Variable<int>(datasheetId);
    if (!nullToAbsent || line != null) {
      map['line'] = Variable<int>(line);
    }
    map['line_in_wargear'] = Variable<int>(lineInWargear);
    if (!nullToAbsent || dice != null) {
      map['dice'] = Variable<String>(dice);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || range != null) {
      map['range'] = Variable<int>(range);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || attacks != null) {
      map['attacks'] = Variable<int>(attacks);
    }
    if (!nullToAbsent || ballisticSkill != null) {
      map['ballistic_skill'] = Variable<String>(ballisticSkill);
    }
    if (!nullToAbsent || strength != null) {
      map['strength'] = Variable<int>(strength);
    }
    if (!nullToAbsent || armorPenetration != null) {
      map['armor_penetration'] = Variable<int>(armorPenetration);
    }
    if (!nullToAbsent || damage != null) {
      map['damage'] = Variable<String>(damage);
    }
    return map;
  }

  TdatasheetwargearCompanion toCompanion(bool nullToAbsent) {
    return TdatasheetwargearCompanion(
      datasheetId: Value(datasheetId),
      line: line == null && nullToAbsent ? const Value.absent() : Value(line),
      lineInWargear: Value(lineInWargear),
      dice: dice == null && nullToAbsent ? const Value.absent() : Value(dice),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      range:
          range == null && nullToAbsent ? const Value.absent() : Value(range),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      attacks: attacks == null && nullToAbsent
          ? const Value.absent()
          : Value(attacks),
      ballisticSkill: ballisticSkill == null && nullToAbsent
          ? const Value.absent()
          : Value(ballisticSkill),
      strength: strength == null && nullToAbsent
          ? const Value.absent()
          : Value(strength),
      armorPenetration: armorPenetration == null && nullToAbsent
          ? const Value.absent()
          : Value(armorPenetration),
      damage:
          damage == null && nullToAbsent ? const Value.absent() : Value(damage),
    );
  }

  factory TdatasheetwargearData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TdatasheetwargearData(
      datasheetId: serializer.fromJson<int>(json['datasheetId']),
      line: serializer.fromJson<int?>(json['line']),
      lineInWargear: serializer.fromJson<int>(json['lineInWargear']),
      dice: serializer.fromJson<String?>(json['dice']),
      name: serializer.fromJson<String?>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      range: serializer.fromJson<int?>(json['range']),
      type: serializer.fromJson<String?>(json['type']),
      attacks: serializer.fromJson<int?>(json['attacks']),
      ballisticSkill: serializer.fromJson<String?>(json['ballisticSkill']),
      strength: serializer.fromJson<int?>(json['strength']),
      armorPenetration: serializer.fromJson<int?>(json['armorPenetration']),
      damage: serializer.fromJson<String?>(json['damage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'datasheetId': serializer.toJson<int>(datasheetId),
      'line': serializer.toJson<int?>(line),
      'lineInWargear': serializer.toJson<int>(lineInWargear),
      'dice': serializer.toJson<String?>(dice),
      'name': serializer.toJson<String?>(name),
      'description': serializer.toJson<String?>(description),
      'range': serializer.toJson<int?>(range),
      'type': serializer.toJson<String?>(type),
      'attacks': serializer.toJson<int?>(attacks),
      'ballisticSkill': serializer.toJson<String?>(ballisticSkill),
      'strength': serializer.toJson<int?>(strength),
      'armorPenetration': serializer.toJson<int?>(armorPenetration),
      'damage': serializer.toJson<String?>(damage),
    };
  }

  TdatasheetwargearData copyWith(
          {int? datasheetId,
          Value<int?> line = const Value.absent(),
          int? lineInWargear,
          Value<String?> dice = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<int?> range = const Value.absent(),
          Value<String?> type = const Value.absent(),
          Value<int?> attacks = const Value.absent(),
          Value<String?> ballisticSkill = const Value.absent(),
          Value<int?> strength = const Value.absent(),
          Value<int?> armorPenetration = const Value.absent(),
          Value<String?> damage = const Value.absent()}) =>
      TdatasheetwargearData(
        datasheetId: datasheetId ?? this.datasheetId,
        line: line.present ? line.value : this.line,
        lineInWargear: lineInWargear ?? this.lineInWargear,
        dice: dice.present ? dice.value : this.dice,
        name: name.present ? name.value : this.name,
        description: description.present ? description.value : this.description,
        range: range.present ? range.value : this.range,
        type: type.present ? type.value : this.type,
        attacks: attacks.present ? attacks.value : this.attacks,
        ballisticSkill:
            ballisticSkill.present ? ballisticSkill.value : this.ballisticSkill,
        strength: strength.present ? strength.value : this.strength,
        armorPenetration: armorPenetration.present
            ? armorPenetration.value
            : this.armorPenetration,
        damage: damage.present ? damage.value : this.damage,
      );
  TdatasheetwargearData copyWithCompanion(TdatasheetwargearCompanion data) {
    return TdatasheetwargearData(
      datasheetId:
          data.datasheetId.present ? data.datasheetId.value : this.datasheetId,
      line: data.line.present ? data.line.value : this.line,
      lineInWargear: data.lineInWargear.present
          ? data.lineInWargear.value
          : this.lineInWargear,
      dice: data.dice.present ? data.dice.value : this.dice,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      range: data.range.present ? data.range.value : this.range,
      type: data.type.present ? data.type.value : this.type,
      attacks: data.attacks.present ? data.attacks.value : this.attacks,
      ballisticSkill: data.ballisticSkill.present
          ? data.ballisticSkill.value
          : this.ballisticSkill,
      strength: data.strength.present ? data.strength.value : this.strength,
      armorPenetration: data.armorPenetration.present
          ? data.armorPenetration.value
          : this.armorPenetration,
      damage: data.damage.present ? data.damage.value : this.damage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetwargearData(')
          ..write('datasheetId: $datasheetId, ')
          ..write('line: $line, ')
          ..write('lineInWargear: $lineInWargear, ')
          ..write('dice: $dice, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('range: $range, ')
          ..write('type: $type, ')
          ..write('attacks: $attacks, ')
          ..write('ballisticSkill: $ballisticSkill, ')
          ..write('strength: $strength, ')
          ..write('armorPenetration: $armorPenetration, ')
          ..write('damage: $damage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      datasheetId,
      line,
      lineInWargear,
      dice,
      name,
      description,
      range,
      type,
      attacks,
      ballisticSkill,
      strength,
      armorPenetration,
      damage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TdatasheetwargearData &&
          other.datasheetId == this.datasheetId &&
          other.line == this.line &&
          other.lineInWargear == this.lineInWargear &&
          other.dice == this.dice &&
          other.name == this.name &&
          other.description == this.description &&
          other.range == this.range &&
          other.type == this.type &&
          other.attacks == this.attacks &&
          other.ballisticSkill == this.ballisticSkill &&
          other.strength == this.strength &&
          other.armorPenetration == this.armorPenetration &&
          other.damage == this.damage);
}

class TdatasheetwargearCompanion
    extends UpdateCompanion<TdatasheetwargearData> {
  final Value<int> datasheetId;
  final Value<int?> line;
  final Value<int> lineInWargear;
  final Value<String?> dice;
  final Value<String?> name;
  final Value<String?> description;
  final Value<int?> range;
  final Value<String?> type;
  final Value<int?> attacks;
  final Value<String?> ballisticSkill;
  final Value<int?> strength;
  final Value<int?> armorPenetration;
  final Value<String?> damage;
  final Value<int> rowid;
  const TdatasheetwargearCompanion({
    this.datasheetId = const Value.absent(),
    this.line = const Value.absent(),
    this.lineInWargear = const Value.absent(),
    this.dice = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.range = const Value.absent(),
    this.type = const Value.absent(),
    this.attacks = const Value.absent(),
    this.ballisticSkill = const Value.absent(),
    this.strength = const Value.absent(),
    this.armorPenetration = const Value.absent(),
    this.damage = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TdatasheetwargearCompanion.insert({
    required int datasheetId,
    this.line = const Value.absent(),
    required int lineInWargear,
    this.dice = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.range = const Value.absent(),
    this.type = const Value.absent(),
    this.attacks = const Value.absent(),
    this.ballisticSkill = const Value.absent(),
    this.strength = const Value.absent(),
    this.armorPenetration = const Value.absent(),
    this.damage = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : datasheetId = Value(datasheetId),
        lineInWargear = Value(lineInWargear);
  static Insertable<TdatasheetwargearData> custom({
    Expression<int>? datasheetId,
    Expression<int>? line,
    Expression<int>? lineInWargear,
    Expression<String>? dice,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? range,
    Expression<String>? type,
    Expression<int>? attacks,
    Expression<String>? ballisticSkill,
    Expression<int>? strength,
    Expression<int>? armorPenetration,
    Expression<String>? damage,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (datasheetId != null) 'datasheet_id': datasheetId,
      if (line != null) 'line': line,
      if (lineInWargear != null) 'line_in_wargear': lineInWargear,
      if (dice != null) 'dice': dice,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (range != null) 'range': range,
      if (type != null) 'type': type,
      if (attacks != null) 'attacks': attacks,
      if (ballisticSkill != null) 'ballistic_skill': ballisticSkill,
      if (strength != null) 'strength': strength,
      if (armorPenetration != null) 'armor_penetration': armorPenetration,
      if (damage != null) 'damage': damage,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TdatasheetwargearCompanion copyWith(
      {Value<int>? datasheetId,
      Value<int?>? line,
      Value<int>? lineInWargear,
      Value<String?>? dice,
      Value<String?>? name,
      Value<String?>? description,
      Value<int?>? range,
      Value<String?>? type,
      Value<int?>? attacks,
      Value<String?>? ballisticSkill,
      Value<int?>? strength,
      Value<int?>? armorPenetration,
      Value<String?>? damage,
      Value<int>? rowid}) {
    return TdatasheetwargearCompanion(
      datasheetId: datasheetId ?? this.datasheetId,
      line: line ?? this.line,
      lineInWargear: lineInWargear ?? this.lineInWargear,
      dice: dice ?? this.dice,
      name: name ?? this.name,
      description: description ?? this.description,
      range: range ?? this.range,
      type: type ?? this.type,
      attacks: attacks ?? this.attacks,
      ballisticSkill: ballisticSkill ?? this.ballisticSkill,
      strength: strength ?? this.strength,
      armorPenetration: armorPenetration ?? this.armorPenetration,
      damage: damage ?? this.damage,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (datasheetId.present) {
      map['datasheet_id'] = Variable<int>(datasheetId.value);
    }
    if (line.present) {
      map['line'] = Variable<int>(line.value);
    }
    if (lineInWargear.present) {
      map['line_in_wargear'] = Variable<int>(lineInWargear.value);
    }
    if (dice.present) {
      map['dice'] = Variable<String>(dice.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (range.present) {
      map['range'] = Variable<int>(range.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (attacks.present) {
      map['attacks'] = Variable<int>(attacks.value);
    }
    if (ballisticSkill.present) {
      map['ballistic_skill'] = Variable<String>(ballisticSkill.value);
    }
    if (strength.present) {
      map['strength'] = Variable<int>(strength.value);
    }
    if (armorPenetration.present) {
      map['armor_penetration'] = Variable<int>(armorPenetration.value);
    }
    if (damage.present) {
      map['damage'] = Variable<String>(damage.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetwargearCompanion(')
          ..write('datasheetId: $datasheetId, ')
          ..write('line: $line, ')
          ..write('lineInWargear: $lineInWargear, ')
          ..write('dice: $dice, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('range: $range, ')
          ..write('type: $type, ')
          ..write('attacks: $attacks, ')
          ..write('ballisticSkill: $ballisticSkill, ')
          ..write('strength: $strength, ')
          ..write('armorPenetration: $armorPenetration, ')
          ..write('damage: $damage, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TdatasheetkeywordTable extends Tdatasheetkeyword
    with TableInfo<$TdatasheetkeywordTable, TdatasheetkeywordData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TdatasheetkeywordTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _datasheetIdMeta =
      const VerificationMeta('datasheetId');
  @override
  late final GeneratedColumn<int> datasheetId = GeneratedColumn<int>(
      'datasheetId', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tdatasheet (id)'));
  static const VerificationMeta _keywordMeta =
      const VerificationMeta('keyword');
  @override
  late final GeneratedColumn<String> keyword = GeneratedColumn<String>(
      'keyword', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
      'model', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isFactionKeywordMeta =
      const VerificationMeta('isFactionKeyword');
  @override
  late final GeneratedColumn<bool> isFactionKeyword = GeneratedColumn<bool>(
      'isFactionKeyword', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("isFactionKeyword" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, datasheetId, keyword, model, isFactionKeyword];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tdatasheetkeyword';
  @override
  VerificationContext validateIntegrity(
      Insertable<TdatasheetkeywordData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('datasheetId')) {
      context.handle(
          _datasheetIdMeta,
          datasheetId.isAcceptableOrUnknown(
              data['datasheetId']!, _datasheetIdMeta));
    } else if (isInserting) {
      context.missing(_datasheetIdMeta);
    }
    if (data.containsKey('keyword')) {
      context.handle(_keywordMeta,
          keyword.isAcceptableOrUnknown(data['keyword']!, _keywordMeta));
    }
    if (data.containsKey('model')) {
      context.handle(
          _modelMeta, model.isAcceptableOrUnknown(data['model']!, _modelMeta));
    }
    if (data.containsKey('isFactionKeyword')) {
      context.handle(
          _isFactionKeywordMeta,
          isFactionKeyword.isAcceptableOrUnknown(
              data['isFactionKeyword']!, _isFactionKeywordMeta));
    } else if (isInserting) {
      context.missing(_isFactionKeywordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TdatasheetkeywordData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TdatasheetkeywordData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      datasheetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}datasheetId'])!,
      keyword: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}keyword']),
      model: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}model']),
      isFactionKeyword: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}isFactionKeyword'])!,
    );
  }

  @override
  $TdatasheetkeywordTable createAlias(String alias) {
    return $TdatasheetkeywordTable(attachedDatabase, alias);
  }
}

class TdatasheetkeywordData extends DataClass
    implements Insertable<TdatasheetkeywordData> {
  final int id;
  final int datasheetId;
  final String? keyword;
  final String? model;
  final bool isFactionKeyword;
  const TdatasheetkeywordData(
      {required this.id,
      required this.datasheetId,
      this.keyword,
      this.model,
      required this.isFactionKeyword});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['datasheetId'] = Variable<int>(datasheetId);
    if (!nullToAbsent || keyword != null) {
      map['keyword'] = Variable<String>(keyword);
    }
    if (!nullToAbsent || model != null) {
      map['model'] = Variable<String>(model);
    }
    map['isFactionKeyword'] = Variable<bool>(isFactionKeyword);
    return map;
  }

  TdatasheetkeywordCompanion toCompanion(bool nullToAbsent) {
    return TdatasheetkeywordCompanion(
      id: Value(id),
      datasheetId: Value(datasheetId),
      keyword: keyword == null && nullToAbsent
          ? const Value.absent()
          : Value(keyword),
      model:
          model == null && nullToAbsent ? const Value.absent() : Value(model),
      isFactionKeyword: Value(isFactionKeyword),
    );
  }

  factory TdatasheetkeywordData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TdatasheetkeywordData(
      id: serializer.fromJson<int>(json['id']),
      datasheetId: serializer.fromJson<int>(json['datasheetId']),
      keyword: serializer.fromJson<String?>(json['keyword']),
      model: serializer.fromJson<String?>(json['model']),
      isFactionKeyword: serializer.fromJson<bool>(json['isFactionKeyword']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'datasheetId': serializer.toJson<int>(datasheetId),
      'keyword': serializer.toJson<String?>(keyword),
      'model': serializer.toJson<String?>(model),
      'isFactionKeyword': serializer.toJson<bool>(isFactionKeyword),
    };
  }

  TdatasheetkeywordData copyWith(
          {int? id,
          int? datasheetId,
          Value<String?> keyword = const Value.absent(),
          Value<String?> model = const Value.absent(),
          bool? isFactionKeyword}) =>
      TdatasheetkeywordData(
        id: id ?? this.id,
        datasheetId: datasheetId ?? this.datasheetId,
        keyword: keyword.present ? keyword.value : this.keyword,
        model: model.present ? model.value : this.model,
        isFactionKeyword: isFactionKeyword ?? this.isFactionKeyword,
      );
  TdatasheetkeywordData copyWithCompanion(TdatasheetkeywordCompanion data) {
    return TdatasheetkeywordData(
      id: data.id.present ? data.id.value : this.id,
      datasheetId:
          data.datasheetId.present ? data.datasheetId.value : this.datasheetId,
      keyword: data.keyword.present ? data.keyword.value : this.keyword,
      model: data.model.present ? data.model.value : this.model,
      isFactionKeyword: data.isFactionKeyword.present
          ? data.isFactionKeyword.value
          : this.isFactionKeyword,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetkeywordData(')
          ..write('id: $id, ')
          ..write('datasheetId: $datasheetId, ')
          ..write('keyword: $keyword, ')
          ..write('model: $model, ')
          ..write('isFactionKeyword: $isFactionKeyword')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, datasheetId, keyword, model, isFactionKeyword);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TdatasheetkeywordData &&
          other.id == this.id &&
          other.datasheetId == this.datasheetId &&
          other.keyword == this.keyword &&
          other.model == this.model &&
          other.isFactionKeyword == this.isFactionKeyword);
}

class TdatasheetkeywordCompanion
    extends UpdateCompanion<TdatasheetkeywordData> {
  final Value<int> id;
  final Value<int> datasheetId;
  final Value<String?> keyword;
  final Value<String?> model;
  final Value<bool> isFactionKeyword;
  const TdatasheetkeywordCompanion({
    this.id = const Value.absent(),
    this.datasheetId = const Value.absent(),
    this.keyword = const Value.absent(),
    this.model = const Value.absent(),
    this.isFactionKeyword = const Value.absent(),
  });
  TdatasheetkeywordCompanion.insert({
    this.id = const Value.absent(),
    required int datasheetId,
    this.keyword = const Value.absent(),
    this.model = const Value.absent(),
    required bool isFactionKeyword,
  })  : datasheetId = Value(datasheetId),
        isFactionKeyword = Value(isFactionKeyword);
  static Insertable<TdatasheetkeywordData> custom({
    Expression<int>? id,
    Expression<int>? datasheetId,
    Expression<String>? keyword,
    Expression<String>? model,
    Expression<bool>? isFactionKeyword,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (datasheetId != null) 'datasheetId': datasheetId,
      if (keyword != null) 'keyword': keyword,
      if (model != null) 'model': model,
      if (isFactionKeyword != null) 'isFactionKeyword': isFactionKeyword,
    });
  }

  TdatasheetkeywordCompanion copyWith(
      {Value<int>? id,
      Value<int>? datasheetId,
      Value<String?>? keyword,
      Value<String?>? model,
      Value<bool>? isFactionKeyword}) {
    return TdatasheetkeywordCompanion(
      id: id ?? this.id,
      datasheetId: datasheetId ?? this.datasheetId,
      keyword: keyword ?? this.keyword,
      model: model ?? this.model,
      isFactionKeyword: isFactionKeyword ?? this.isFactionKeyword,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (datasheetId.present) {
      map['datasheetId'] = Variable<int>(datasheetId.value);
    }
    if (keyword.present) {
      map['keyword'] = Variable<String>(keyword.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (isFactionKeyword.present) {
      map['isFactionKeyword'] = Variable<bool>(isFactionKeyword.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetkeywordCompanion(')
          ..write('id: $id, ')
          ..write('datasheetId: $datasheetId, ')
          ..write('keyword: $keyword, ')
          ..write('model: $model, ')
          ..write('isFactionKeyword: $isFactionKeyword')
          ..write(')'))
        .toString();
  }
}

class $TdatasheetoptionTable extends Tdatasheetoption
    with TableInfo<$TdatasheetoptionTable, TdatasheetoptionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TdatasheetoptionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _datasheetIdMeta =
      const VerificationMeta('datasheetId');
  @override
  late final GeneratedColumn<int> datasheetId = GeneratedColumn<int>(
      'datasheet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tdatasheet (id)'));
  static const VerificationMeta _lineMeta = const VerificationMeta('line');
  @override
  late final GeneratedColumn<int> line = GeneratedColumn<int>(
      'line', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _buttonMeta = const VerificationMeta('button');
  @override
  late final GeneratedColumn<String> button = GeneratedColumn<String>(
      'button', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [datasheetId, line, button, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tdatasheetoption';
  @override
  VerificationContext validateIntegrity(
      Insertable<TdatasheetoptionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('datasheet_id')) {
      context.handle(
          _datasheetIdMeta,
          datasheetId.isAcceptableOrUnknown(
              data['datasheet_id']!, _datasheetIdMeta));
    } else if (isInserting) {
      context.missing(_datasheetIdMeta);
    }
    if (data.containsKey('line')) {
      context.handle(
          _lineMeta, line.isAcceptableOrUnknown(data['line']!, _lineMeta));
    } else if (isInserting) {
      context.missing(_lineMeta);
    }
    if (data.containsKey('button')) {
      context.handle(_buttonMeta,
          button.isAcceptableOrUnknown(data['button']!, _buttonMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {datasheetId, line};
  @override
  TdatasheetoptionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TdatasheetoptionData(
      datasheetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}datasheet_id'])!,
      line: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}line'])!,
      button: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}button']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $TdatasheetoptionTable createAlias(String alias) {
    return $TdatasheetoptionTable(attachedDatabase, alias);
  }
}

class TdatasheetoptionData extends DataClass
    implements Insertable<TdatasheetoptionData> {
  final int datasheetId;
  final int line;
  final String? button;
  final String? description;
  const TdatasheetoptionData(
      {required this.datasheetId,
      required this.line,
      this.button,
      this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['datasheet_id'] = Variable<int>(datasheetId);
    map['line'] = Variable<int>(line);
    if (!nullToAbsent || button != null) {
      map['button'] = Variable<String>(button);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  TdatasheetoptionCompanion toCompanion(bool nullToAbsent) {
    return TdatasheetoptionCompanion(
      datasheetId: Value(datasheetId),
      line: Value(line),
      button:
          button == null && nullToAbsent ? const Value.absent() : Value(button),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory TdatasheetoptionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TdatasheetoptionData(
      datasheetId: serializer.fromJson<int>(json['datasheetId']),
      line: serializer.fromJson<int>(json['line']),
      button: serializer.fromJson<String?>(json['button']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'datasheetId': serializer.toJson<int>(datasheetId),
      'line': serializer.toJson<int>(line),
      'button': serializer.toJson<String?>(button),
      'description': serializer.toJson<String?>(description),
    };
  }

  TdatasheetoptionData copyWith(
          {int? datasheetId,
          int? line,
          Value<String?> button = const Value.absent(),
          Value<String?> description = const Value.absent()}) =>
      TdatasheetoptionData(
        datasheetId: datasheetId ?? this.datasheetId,
        line: line ?? this.line,
        button: button.present ? button.value : this.button,
        description: description.present ? description.value : this.description,
      );
  TdatasheetoptionData copyWithCompanion(TdatasheetoptionCompanion data) {
    return TdatasheetoptionData(
      datasheetId:
          data.datasheetId.present ? data.datasheetId.value : this.datasheetId,
      line: data.line.present ? data.line.value : this.line,
      button: data.button.present ? data.button.value : this.button,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetoptionData(')
          ..write('datasheetId: $datasheetId, ')
          ..write('line: $line, ')
          ..write('button: $button, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(datasheetId, line, button, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TdatasheetoptionData &&
          other.datasheetId == this.datasheetId &&
          other.line == this.line &&
          other.button == this.button &&
          other.description == this.description);
}

class TdatasheetoptionCompanion extends UpdateCompanion<TdatasheetoptionData> {
  final Value<int> datasheetId;
  final Value<int> line;
  final Value<String?> button;
  final Value<String?> description;
  final Value<int> rowid;
  const TdatasheetoptionCompanion({
    this.datasheetId = const Value.absent(),
    this.line = const Value.absent(),
    this.button = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TdatasheetoptionCompanion.insert({
    required int datasheetId,
    required int line,
    this.button = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : datasheetId = Value(datasheetId),
        line = Value(line);
  static Insertable<TdatasheetoptionData> custom({
    Expression<int>? datasheetId,
    Expression<int>? line,
    Expression<String>? button,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (datasheetId != null) 'datasheet_id': datasheetId,
      if (line != null) 'line': line,
      if (button != null) 'button': button,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TdatasheetoptionCompanion copyWith(
      {Value<int>? datasheetId,
      Value<int>? line,
      Value<String?>? button,
      Value<String?>? description,
      Value<int>? rowid}) {
    return TdatasheetoptionCompanion(
      datasheetId: datasheetId ?? this.datasheetId,
      line: line ?? this.line,
      button: button ?? this.button,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (datasheetId.present) {
      map['datasheet_id'] = Variable<int>(datasheetId.value);
    }
    if (line.present) {
      map['line'] = Variable<int>(line.value);
    }
    if (button.present) {
      map['button'] = Variable<String>(button.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetoptionCompanion(')
          ..write('datasheetId: $datasheetId, ')
          ..write('line: $line, ')
          ..write('button: $button, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TdatasheetleaderTable extends Tdatasheetleader
    with TableInfo<$TdatasheetleaderTable, TdatasheetleaderData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TdatasheetleaderTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _leaderIdMeta =
      const VerificationMeta('leaderId');
  @override
  late final GeneratedColumn<int> leaderId = GeneratedColumn<int>(
      'leader_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tdatasheet (id)'));
  static const VerificationMeta _attachedIdMeta =
      const VerificationMeta('attachedId');
  @override
  late final GeneratedColumn<int> attachedId = GeneratedColumn<int>(
      'attached_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tdatasheet (id)'));
  @override
  List<GeneratedColumn> get $columns => [leaderId, attachedId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tdatasheetleader';
  @override
  VerificationContext validateIntegrity(
      Insertable<TdatasheetleaderData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('leader_id')) {
      context.handle(_leaderIdMeta,
          leaderId.isAcceptableOrUnknown(data['leader_id']!, _leaderIdMeta));
    } else if (isInserting) {
      context.missing(_leaderIdMeta);
    }
    if (data.containsKey('attached_id')) {
      context.handle(
          _attachedIdMeta,
          attachedId.isAcceptableOrUnknown(
              data['attached_id']!, _attachedIdMeta));
    } else if (isInserting) {
      context.missing(_attachedIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {leaderId, attachedId};
  @override
  TdatasheetleaderData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TdatasheetleaderData(
      leaderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}leader_id'])!,
      attachedId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attached_id'])!,
    );
  }

  @override
  $TdatasheetleaderTable createAlias(String alias) {
    return $TdatasheetleaderTable(attachedDatabase, alias);
  }
}

class TdatasheetleaderData extends DataClass
    implements Insertable<TdatasheetleaderData> {
  final int leaderId;
  final int attachedId;
  const TdatasheetleaderData(
      {required this.leaderId, required this.attachedId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['leader_id'] = Variable<int>(leaderId);
    map['attached_id'] = Variable<int>(attachedId);
    return map;
  }

  TdatasheetleaderCompanion toCompanion(bool nullToAbsent) {
    return TdatasheetleaderCompanion(
      leaderId: Value(leaderId),
      attachedId: Value(attachedId),
    );
  }

  factory TdatasheetleaderData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TdatasheetleaderData(
      leaderId: serializer.fromJson<int>(json['leaderId']),
      attachedId: serializer.fromJson<int>(json['attachedId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'leaderId': serializer.toJson<int>(leaderId),
      'attachedId': serializer.toJson<int>(attachedId),
    };
  }

  TdatasheetleaderData copyWith({int? leaderId, int? attachedId}) =>
      TdatasheetleaderData(
        leaderId: leaderId ?? this.leaderId,
        attachedId: attachedId ?? this.attachedId,
      );
  TdatasheetleaderData copyWithCompanion(TdatasheetleaderCompanion data) {
    return TdatasheetleaderData(
      leaderId: data.leaderId.present ? data.leaderId.value : this.leaderId,
      attachedId:
          data.attachedId.present ? data.attachedId.value : this.attachedId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetleaderData(')
          ..write('leaderId: $leaderId, ')
          ..write('attachedId: $attachedId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(leaderId, attachedId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TdatasheetleaderData &&
          other.leaderId == this.leaderId &&
          other.attachedId == this.attachedId);
}

class TdatasheetleaderCompanion extends UpdateCompanion<TdatasheetleaderData> {
  final Value<int> leaderId;
  final Value<int> attachedId;
  final Value<int> rowid;
  const TdatasheetleaderCompanion({
    this.leaderId = const Value.absent(),
    this.attachedId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TdatasheetleaderCompanion.insert({
    required int leaderId,
    required int attachedId,
    this.rowid = const Value.absent(),
  })  : leaderId = Value(leaderId),
        attachedId = Value(attachedId);
  static Insertable<TdatasheetleaderData> custom({
    Expression<int>? leaderId,
    Expression<int>? attachedId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (leaderId != null) 'leader_id': leaderId,
      if (attachedId != null) 'attached_id': attachedId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TdatasheetleaderCompanion copyWith(
      {Value<int>? leaderId, Value<int>? attachedId, Value<int>? rowid}) {
    return TdatasheetleaderCompanion(
      leaderId: leaderId ?? this.leaderId,
      attachedId: attachedId ?? this.attachedId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (leaderId.present) {
      map['leader_id'] = Variable<int>(leaderId.value);
    }
    if (attachedId.present) {
      map['attached_id'] = Variable<int>(attachedId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetleaderCompanion(')
          ..write('leaderId: $leaderId, ')
          ..write('attachedId: $attachedId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TdatasheetstratagemTable extends Tdatasheetstratagem
    with TableInfo<$TdatasheetstratagemTable, TdatasheetstratagemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TdatasheetstratagemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _datasheetIdMeta =
      const VerificationMeta('datasheetId');
  @override
  late final GeneratedColumn<int> datasheetId = GeneratedColumn<int>(
      'datasheet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tdatasheet (id)'));
  static const VerificationMeta _stratagemIdMeta =
      const VerificationMeta('stratagemId');
  @override
  late final GeneratedColumn<int> stratagemId = GeneratedColumn<int>(
      'stratagem_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tstratagem (id)'));
  @override
  List<GeneratedColumn> get $columns => [datasheetId, stratagemId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tdatasheetstratagem';
  @override
  VerificationContext validateIntegrity(
      Insertable<TdatasheetstratagemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('datasheet_id')) {
      context.handle(
          _datasheetIdMeta,
          datasheetId.isAcceptableOrUnknown(
              data['datasheet_id']!, _datasheetIdMeta));
    } else if (isInserting) {
      context.missing(_datasheetIdMeta);
    }
    if (data.containsKey('stratagem_id')) {
      context.handle(
          _stratagemIdMeta,
          stratagemId.isAcceptableOrUnknown(
              data['stratagem_id']!, _stratagemIdMeta));
    } else if (isInserting) {
      context.missing(_stratagemIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {datasheetId, stratagemId};
  @override
  TdatasheetstratagemData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TdatasheetstratagemData(
      datasheetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}datasheet_id'])!,
      stratagemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stratagem_id'])!,
    );
  }

  @override
  $TdatasheetstratagemTable createAlias(String alias) {
    return $TdatasheetstratagemTable(attachedDatabase, alias);
  }
}

class TdatasheetstratagemData extends DataClass
    implements Insertable<TdatasheetstratagemData> {
  final int datasheetId;
  final int stratagemId;
  const TdatasheetstratagemData(
      {required this.datasheetId, required this.stratagemId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['datasheet_id'] = Variable<int>(datasheetId);
    map['stratagem_id'] = Variable<int>(stratagemId);
    return map;
  }

  TdatasheetstratagemCompanion toCompanion(bool nullToAbsent) {
    return TdatasheetstratagemCompanion(
      datasheetId: Value(datasheetId),
      stratagemId: Value(stratagemId),
    );
  }

  factory TdatasheetstratagemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TdatasheetstratagemData(
      datasheetId: serializer.fromJson<int>(json['datasheetId']),
      stratagemId: serializer.fromJson<int>(json['stratagemId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'datasheetId': serializer.toJson<int>(datasheetId),
      'stratagemId': serializer.toJson<int>(stratagemId),
    };
  }

  TdatasheetstratagemData copyWith({int? datasheetId, int? stratagemId}) =>
      TdatasheetstratagemData(
        datasheetId: datasheetId ?? this.datasheetId,
        stratagemId: stratagemId ?? this.stratagemId,
      );
  TdatasheetstratagemData copyWithCompanion(TdatasheetstratagemCompanion data) {
    return TdatasheetstratagemData(
      datasheetId:
          data.datasheetId.present ? data.datasheetId.value : this.datasheetId,
      stratagemId:
          data.stratagemId.present ? data.stratagemId.value : this.stratagemId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetstratagemData(')
          ..write('datasheetId: $datasheetId, ')
          ..write('stratagemId: $stratagemId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(datasheetId, stratagemId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TdatasheetstratagemData &&
          other.datasheetId == this.datasheetId &&
          other.stratagemId == this.stratagemId);
}

class TdatasheetstratagemCompanion
    extends UpdateCompanion<TdatasheetstratagemData> {
  final Value<int> datasheetId;
  final Value<int> stratagemId;
  final Value<int> rowid;
  const TdatasheetstratagemCompanion({
    this.datasheetId = const Value.absent(),
    this.stratagemId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TdatasheetstratagemCompanion.insert({
    required int datasheetId,
    required int stratagemId,
    this.rowid = const Value.absent(),
  })  : datasheetId = Value(datasheetId),
        stratagemId = Value(stratagemId);
  static Insertable<TdatasheetstratagemData> custom({
    Expression<int>? datasheetId,
    Expression<int>? stratagemId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (datasheetId != null) 'datasheet_id': datasheetId,
      if (stratagemId != null) 'stratagem_id': stratagemId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TdatasheetstratagemCompanion copyWith(
      {Value<int>? datasheetId, Value<int>? stratagemId, Value<int>? rowid}) {
    return TdatasheetstratagemCompanion(
      datasheetId: datasheetId ?? this.datasheetId,
      stratagemId: stratagemId ?? this.stratagemId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (datasheetId.present) {
      map['datasheet_id'] = Variable<int>(datasheetId.value);
    }
    if (stratagemId.present) {
      map['stratagem_id'] = Variable<int>(stratagemId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetstratagemCompanion(')
          ..write('datasheetId: $datasheetId, ')
          ..write('stratagemId: $stratagemId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TdatasheetenhancementTable extends Tdatasheetenhancement
    with TableInfo<$TdatasheetenhancementTable, TdatasheetenhancementData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TdatasheetenhancementTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _datasheetIdMeta =
      const VerificationMeta('datasheetId');
  @override
  late final GeneratedColumn<int> datasheetId = GeneratedColumn<int>(
      'datasheet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tdatasheet (id)'));
  static const VerificationMeta _enhancementIdMeta =
      const VerificationMeta('enhancementId');
  @override
  late final GeneratedColumn<int> enhancementId = GeneratedColumn<int>(
      'enhancement_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tenhancement (id)'));
  @override
  List<GeneratedColumn> get $columns => [datasheetId, enhancementId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tdatasheetenhancement';
  @override
  VerificationContext validateIntegrity(
      Insertable<TdatasheetenhancementData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('datasheet_id')) {
      context.handle(
          _datasheetIdMeta,
          datasheetId.isAcceptableOrUnknown(
              data['datasheet_id']!, _datasheetIdMeta));
    } else if (isInserting) {
      context.missing(_datasheetIdMeta);
    }
    if (data.containsKey('enhancement_id')) {
      context.handle(
          _enhancementIdMeta,
          enhancementId.isAcceptableOrUnknown(
              data['enhancement_id']!, _enhancementIdMeta));
    } else if (isInserting) {
      context.missing(_enhancementIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {datasheetId, enhancementId};
  @override
  TdatasheetenhancementData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TdatasheetenhancementData(
      datasheetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}datasheet_id'])!,
      enhancementId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}enhancement_id'])!,
    );
  }

  @override
  $TdatasheetenhancementTable createAlias(String alias) {
    return $TdatasheetenhancementTable(attachedDatabase, alias);
  }
}

class TdatasheetenhancementData extends DataClass
    implements Insertable<TdatasheetenhancementData> {
  final int datasheetId;
  final int enhancementId;
  const TdatasheetenhancementData(
      {required this.datasheetId, required this.enhancementId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['datasheet_id'] = Variable<int>(datasheetId);
    map['enhancement_id'] = Variable<int>(enhancementId);
    return map;
  }

  TdatasheetenhancementCompanion toCompanion(bool nullToAbsent) {
    return TdatasheetenhancementCompanion(
      datasheetId: Value(datasheetId),
      enhancementId: Value(enhancementId),
    );
  }

  factory TdatasheetenhancementData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TdatasheetenhancementData(
      datasheetId: serializer.fromJson<int>(json['datasheetId']),
      enhancementId: serializer.fromJson<int>(json['enhancementId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'datasheetId': serializer.toJson<int>(datasheetId),
      'enhancementId': serializer.toJson<int>(enhancementId),
    };
  }

  TdatasheetenhancementData copyWith({int? datasheetId, int? enhancementId}) =>
      TdatasheetenhancementData(
        datasheetId: datasheetId ?? this.datasheetId,
        enhancementId: enhancementId ?? this.enhancementId,
      );
  TdatasheetenhancementData copyWithCompanion(
      TdatasheetenhancementCompanion data) {
    return TdatasheetenhancementData(
      datasheetId:
          data.datasheetId.present ? data.datasheetId.value : this.datasheetId,
      enhancementId: data.enhancementId.present
          ? data.enhancementId.value
          : this.enhancementId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetenhancementData(')
          ..write('datasheetId: $datasheetId, ')
          ..write('enhancementId: $enhancementId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(datasheetId, enhancementId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TdatasheetenhancementData &&
          other.datasheetId == this.datasheetId &&
          other.enhancementId == this.enhancementId);
}

class TdatasheetenhancementCompanion
    extends UpdateCompanion<TdatasheetenhancementData> {
  final Value<int> datasheetId;
  final Value<int> enhancementId;
  final Value<int> rowid;
  const TdatasheetenhancementCompanion({
    this.datasheetId = const Value.absent(),
    this.enhancementId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TdatasheetenhancementCompanion.insert({
    required int datasheetId,
    required int enhancementId,
    this.rowid = const Value.absent(),
  })  : datasheetId = Value(datasheetId),
        enhancementId = Value(enhancementId);
  static Insertable<TdatasheetenhancementData> custom({
    Expression<int>? datasheetId,
    Expression<int>? enhancementId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (datasheetId != null) 'datasheet_id': datasheetId,
      if (enhancementId != null) 'enhancement_id': enhancementId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TdatasheetenhancementCompanion copyWith(
      {Value<int>? datasheetId, Value<int>? enhancementId, Value<int>? rowid}) {
    return TdatasheetenhancementCompanion(
      datasheetId: datasheetId ?? this.datasheetId,
      enhancementId: enhancementId ?? this.enhancementId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (datasheetId.present) {
      map['datasheet_id'] = Variable<int>(datasheetId.value);
    }
    if (enhancementId.present) {
      map['enhancement_id'] = Variable<int>(enhancementId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetenhancementCompanion(')
          ..write('datasheetId: $datasheetId, ')
          ..write('enhancementId: $enhancementId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TdetachmentabilityTable extends Tdetachmentability
    with TableInfo<$TdetachmentabilityTable, TdetachmentabilityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TdetachmentabilityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _factionIdMeta =
      const VerificationMeta('factionId');
  @override
  late final GeneratedColumn<String> factionId = GeneratedColumn<String>(
      'faction_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tfaction (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _legendMeta = const VerificationMeta('legend');
  @override
  late final GeneratedColumn<String> legend = GeneratedColumn<String>(
      'legend', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _detachmentMeta =
      const VerificationMeta('detachment');
  @override
  late final GeneratedColumn<String> detachment = GeneratedColumn<String>(
      'detachment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _detachmentIdMeta =
      const VerificationMeta('detachmentId');
  @override
  late final GeneratedColumn<int> detachmentId = GeneratedColumn<int>(
      'detachment_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tdetachment (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, factionId, name, legend, description, detachment, detachmentId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tdetachmentability';
  @override
  VerificationContext validateIntegrity(
      Insertable<TdetachmentabilityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('faction_id')) {
      context.handle(_factionIdMeta,
          factionId.isAcceptableOrUnknown(data['faction_id']!, _factionIdMeta));
    } else if (isInserting) {
      context.missing(_factionIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('legend')) {
      context.handle(_legendMeta,
          legend.isAcceptableOrUnknown(data['legend']!, _legendMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('detachment')) {
      context.handle(
          _detachmentMeta,
          detachment.isAcceptableOrUnknown(
              data['detachment']!, _detachmentMeta));
    }
    if (data.containsKey('detachment_id')) {
      context.handle(
          _detachmentIdMeta,
          detachmentId.isAcceptableOrUnknown(
              data['detachment_id']!, _detachmentIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TdetachmentabilityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TdetachmentabilityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      factionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}faction_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      legend: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}legend']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      detachment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}detachment']),
      detachmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}detachment_id']),
    );
  }

  @override
  $TdetachmentabilityTable createAlias(String alias) {
    return $TdetachmentabilityTable(attachedDatabase, alias);
  }
}

class TdetachmentabilityData extends DataClass
    implements Insertable<TdetachmentabilityData> {
  final int id;
  final String factionId;
  final String name;
  final String? legend;
  final String? description;
  final String? detachment;
  final int? detachmentId;
  const TdetachmentabilityData(
      {required this.id,
      required this.factionId,
      required this.name,
      this.legend,
      this.description,
      this.detachment,
      this.detachmentId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['faction_id'] = Variable<String>(factionId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || legend != null) {
      map['legend'] = Variable<String>(legend);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || detachment != null) {
      map['detachment'] = Variable<String>(detachment);
    }
    if (!nullToAbsent || detachmentId != null) {
      map['detachment_id'] = Variable<int>(detachmentId);
    }
    return map;
  }

  TdetachmentabilityCompanion toCompanion(bool nullToAbsent) {
    return TdetachmentabilityCompanion(
      id: Value(id),
      factionId: Value(factionId),
      name: Value(name),
      legend:
          legend == null && nullToAbsent ? const Value.absent() : Value(legend),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      detachment: detachment == null && nullToAbsent
          ? const Value.absent()
          : Value(detachment),
      detachmentId: detachmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(detachmentId),
    );
  }

  factory TdetachmentabilityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TdetachmentabilityData(
      id: serializer.fromJson<int>(json['id']),
      factionId: serializer.fromJson<String>(json['factionId']),
      name: serializer.fromJson<String>(json['name']),
      legend: serializer.fromJson<String?>(json['legend']),
      description: serializer.fromJson<String?>(json['description']),
      detachment: serializer.fromJson<String?>(json['detachment']),
      detachmentId: serializer.fromJson<int?>(json['detachmentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'factionId': serializer.toJson<String>(factionId),
      'name': serializer.toJson<String>(name),
      'legend': serializer.toJson<String?>(legend),
      'description': serializer.toJson<String?>(description),
      'detachment': serializer.toJson<String?>(detachment),
      'detachmentId': serializer.toJson<int?>(detachmentId),
    };
  }

  TdetachmentabilityData copyWith(
          {int? id,
          String? factionId,
          String? name,
          Value<String?> legend = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> detachment = const Value.absent(),
          Value<int?> detachmentId = const Value.absent()}) =>
      TdetachmentabilityData(
        id: id ?? this.id,
        factionId: factionId ?? this.factionId,
        name: name ?? this.name,
        legend: legend.present ? legend.value : this.legend,
        description: description.present ? description.value : this.description,
        detachment: detachment.present ? detachment.value : this.detachment,
        detachmentId:
            detachmentId.present ? detachmentId.value : this.detachmentId,
      );
  TdetachmentabilityData copyWithCompanion(TdetachmentabilityCompanion data) {
    return TdetachmentabilityData(
      id: data.id.present ? data.id.value : this.id,
      factionId: data.factionId.present ? data.factionId.value : this.factionId,
      name: data.name.present ? data.name.value : this.name,
      legend: data.legend.present ? data.legend.value : this.legend,
      description:
          data.description.present ? data.description.value : this.description,
      detachment:
          data.detachment.present ? data.detachment.value : this.detachment,
      detachmentId: data.detachmentId.present
          ? data.detachmentId.value
          : this.detachmentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TdetachmentabilityData(')
          ..write('id: $id, ')
          ..write('factionId: $factionId, ')
          ..write('name: $name, ')
          ..write('legend: $legend, ')
          ..write('description: $description, ')
          ..write('detachment: $detachment, ')
          ..write('detachmentId: $detachmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, factionId, name, legend, description, detachment, detachmentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TdetachmentabilityData &&
          other.id == this.id &&
          other.factionId == this.factionId &&
          other.name == this.name &&
          other.legend == this.legend &&
          other.description == this.description &&
          other.detachment == this.detachment &&
          other.detachmentId == this.detachmentId);
}

class TdetachmentabilityCompanion
    extends UpdateCompanion<TdetachmentabilityData> {
  final Value<int> id;
  final Value<String> factionId;
  final Value<String> name;
  final Value<String?> legend;
  final Value<String?> description;
  final Value<String?> detachment;
  final Value<int?> detachmentId;
  const TdetachmentabilityCompanion({
    this.id = const Value.absent(),
    this.factionId = const Value.absent(),
    this.name = const Value.absent(),
    this.legend = const Value.absent(),
    this.description = const Value.absent(),
    this.detachment = const Value.absent(),
    this.detachmentId = const Value.absent(),
  });
  TdetachmentabilityCompanion.insert({
    this.id = const Value.absent(),
    required String factionId,
    required String name,
    this.legend = const Value.absent(),
    this.description = const Value.absent(),
    this.detachment = const Value.absent(),
    this.detachmentId = const Value.absent(),
  })  : factionId = Value(factionId),
        name = Value(name);
  static Insertable<TdetachmentabilityData> custom({
    Expression<int>? id,
    Expression<String>? factionId,
    Expression<String>? name,
    Expression<String>? legend,
    Expression<String>? description,
    Expression<String>? detachment,
    Expression<int>? detachmentId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (factionId != null) 'faction_id': factionId,
      if (name != null) 'name': name,
      if (legend != null) 'legend': legend,
      if (description != null) 'description': description,
      if (detachment != null) 'detachment': detachment,
      if (detachmentId != null) 'detachment_id': detachmentId,
    });
  }

  TdetachmentabilityCompanion copyWith(
      {Value<int>? id,
      Value<String>? factionId,
      Value<String>? name,
      Value<String?>? legend,
      Value<String?>? description,
      Value<String?>? detachment,
      Value<int?>? detachmentId}) {
    return TdetachmentabilityCompanion(
      id: id ?? this.id,
      factionId: factionId ?? this.factionId,
      name: name ?? this.name,
      legend: legend ?? this.legend,
      description: description ?? this.description,
      detachment: detachment ?? this.detachment,
      detachmentId: detachmentId ?? this.detachmentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (factionId.present) {
      map['faction_id'] = Variable<String>(factionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (legend.present) {
      map['legend'] = Variable<String>(legend.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (detachment.present) {
      map['detachment'] = Variable<String>(detachment.value);
    }
    if (detachmentId.present) {
      map['detachment_id'] = Variable<int>(detachmentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TdetachmentabilityCompanion(')
          ..write('id: $id, ')
          ..write('factionId: $factionId, ')
          ..write('name: $name, ')
          ..write('legend: $legend, ')
          ..write('description: $description, ')
          ..write('detachment: $detachment, ')
          ..write('detachmentId: $detachmentId')
          ..write(')'))
        .toString();
  }
}

class $TdatasheetdetachmentabilityTable extends Tdatasheetdetachmentability
    with
        TableInfo<$TdatasheetdetachmentabilityTable,
            TdatasheetdetachmentabilityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TdatasheetdetachmentabilityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _datasheetIdMeta =
      const VerificationMeta('datasheetId');
  @override
  late final GeneratedColumn<int> datasheetId = GeneratedColumn<int>(
      'datasheetId', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tdatasheet (id)'));
  static const VerificationMeta _detachmentAbilityIdMeta =
      const VerificationMeta('detachmentAbilityId');
  @override
  late final GeneratedColumn<int> detachmentAbilityId = GeneratedColumn<int>(
      'detachmentAbilityId', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES tdetachmentability (id)'));
  @override
  List<GeneratedColumn> get $columns => [datasheetId, detachmentAbilityId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tdatasheetdetachmentability';
  @override
  VerificationContext validateIntegrity(
      Insertable<TdatasheetdetachmentabilityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('datasheetId')) {
      context.handle(
          _datasheetIdMeta,
          datasheetId.isAcceptableOrUnknown(
              data['datasheetId']!, _datasheetIdMeta));
    } else if (isInserting) {
      context.missing(_datasheetIdMeta);
    }
    if (data.containsKey('detachmentAbilityId')) {
      context.handle(
          _detachmentAbilityIdMeta,
          detachmentAbilityId.isAcceptableOrUnknown(
              data['detachmentAbilityId']!, _detachmentAbilityIdMeta));
    } else if (isInserting) {
      context.missing(_detachmentAbilityIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {datasheetId, detachmentAbilityId};
  @override
  TdatasheetdetachmentabilityData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TdatasheetdetachmentabilityData(
      datasheetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}datasheetId'])!,
      detachmentAbilityId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}detachmentAbilityId'])!,
    );
  }

  @override
  $TdatasheetdetachmentabilityTable createAlias(String alias) {
    return $TdatasheetdetachmentabilityTable(attachedDatabase, alias);
  }
}

class TdatasheetdetachmentabilityData extends DataClass
    implements Insertable<TdatasheetdetachmentabilityData> {
  final int datasheetId;
  final int detachmentAbilityId;
  const TdatasheetdetachmentabilityData(
      {required this.datasheetId, required this.detachmentAbilityId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['datasheetId'] = Variable<int>(datasheetId);
    map['detachmentAbilityId'] = Variable<int>(detachmentAbilityId);
    return map;
  }

  TdatasheetdetachmentabilityCompanion toCompanion(bool nullToAbsent) {
    return TdatasheetdetachmentabilityCompanion(
      datasheetId: Value(datasheetId),
      detachmentAbilityId: Value(detachmentAbilityId),
    );
  }

  factory TdatasheetdetachmentabilityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TdatasheetdetachmentabilityData(
      datasheetId: serializer.fromJson<int>(json['datasheetId']),
      detachmentAbilityId:
          serializer.fromJson<int>(json['detachmentAbilityId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'datasheetId': serializer.toJson<int>(datasheetId),
      'detachmentAbilityId': serializer.toJson<int>(detachmentAbilityId),
    };
  }

  TdatasheetdetachmentabilityData copyWith(
          {int? datasheetId, int? detachmentAbilityId}) =>
      TdatasheetdetachmentabilityData(
        datasheetId: datasheetId ?? this.datasheetId,
        detachmentAbilityId: detachmentAbilityId ?? this.detachmentAbilityId,
      );
  TdatasheetdetachmentabilityData copyWithCompanion(
      TdatasheetdetachmentabilityCompanion data) {
    return TdatasheetdetachmentabilityData(
      datasheetId:
          data.datasheetId.present ? data.datasheetId.value : this.datasheetId,
      detachmentAbilityId: data.detachmentAbilityId.present
          ? data.detachmentAbilityId.value
          : this.detachmentAbilityId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetdetachmentabilityData(')
          ..write('datasheetId: $datasheetId, ')
          ..write('detachmentAbilityId: $detachmentAbilityId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(datasheetId, detachmentAbilityId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TdatasheetdetachmentabilityData &&
          other.datasheetId == this.datasheetId &&
          other.detachmentAbilityId == this.detachmentAbilityId);
}

class TdatasheetdetachmentabilityCompanion
    extends UpdateCompanion<TdatasheetdetachmentabilityData> {
  final Value<int> datasheetId;
  final Value<int> detachmentAbilityId;
  final Value<int> rowid;
  const TdatasheetdetachmentabilityCompanion({
    this.datasheetId = const Value.absent(),
    this.detachmentAbilityId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TdatasheetdetachmentabilityCompanion.insert({
    required int datasheetId,
    required int detachmentAbilityId,
    this.rowid = const Value.absent(),
  })  : datasheetId = Value(datasheetId),
        detachmentAbilityId = Value(detachmentAbilityId);
  static Insertable<TdatasheetdetachmentabilityData> custom({
    Expression<int>? datasheetId,
    Expression<int>? detachmentAbilityId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (datasheetId != null) 'datasheetId': datasheetId,
      if (detachmentAbilityId != null)
        'detachmentAbilityId': detachmentAbilityId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TdatasheetdetachmentabilityCompanion copyWith(
      {Value<int>? datasheetId,
      Value<int>? detachmentAbilityId,
      Value<int>? rowid}) {
    return TdatasheetdetachmentabilityCompanion(
      datasheetId: datasheetId ?? this.datasheetId,
      detachmentAbilityId: detachmentAbilityId ?? this.detachmentAbilityId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (datasheetId.present) {
      map['datasheetId'] = Variable<int>(datasheetId.value);
    }
    if (detachmentAbilityId.present) {
      map['detachmentAbilityId'] = Variable<int>(detachmentAbilityId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetdetachmentabilityCompanion(')
          ..write('datasheetId: $datasheetId, ')
          ..write('detachmentAbilityId: $detachmentAbilityId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TdatasheetunitcompositionTable extends Tdatasheetunitcomposition
    with
        TableInfo<$TdatasheetunitcompositionTable,
            TdatasheetunitcompositionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TdatasheetunitcompositionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _datasheetIdMeta =
      const VerificationMeta('datasheetId');
  @override
  late final GeneratedColumn<int> datasheetId = GeneratedColumn<int>(
      'datasheet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tdatasheet (id)'));
  static const VerificationMeta _lineMeta = const VerificationMeta('line');
  @override
  late final GeneratedColumn<int> line = GeneratedColumn<int>(
      'line', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [datasheetId, line, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tdatasheetunitcomposition';
  @override
  VerificationContext validateIntegrity(
      Insertable<TdatasheetunitcompositionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('datasheet_id')) {
      context.handle(
          _datasheetIdMeta,
          datasheetId.isAcceptableOrUnknown(
              data['datasheet_id']!, _datasheetIdMeta));
    } else if (isInserting) {
      context.missing(_datasheetIdMeta);
    }
    if (data.containsKey('line')) {
      context.handle(
          _lineMeta, line.isAcceptableOrUnknown(data['line']!, _lineMeta));
    } else if (isInserting) {
      context.missing(_lineMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {datasheetId, line};
  @override
  TdatasheetunitcompositionData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TdatasheetunitcompositionData(
      datasheetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}datasheet_id'])!,
      line: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}line'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $TdatasheetunitcompositionTable createAlias(String alias) {
    return $TdatasheetunitcompositionTable(attachedDatabase, alias);
  }
}

class TdatasheetunitcompositionData extends DataClass
    implements Insertable<TdatasheetunitcompositionData> {
  final int datasheetId;
  final int line;
  final String? description;
  const TdatasheetunitcompositionData(
      {required this.datasheetId, required this.line, this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['datasheet_id'] = Variable<int>(datasheetId);
    map['line'] = Variable<int>(line);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  TdatasheetunitcompositionCompanion toCompanion(bool nullToAbsent) {
    return TdatasheetunitcompositionCompanion(
      datasheetId: Value(datasheetId),
      line: Value(line),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory TdatasheetunitcompositionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TdatasheetunitcompositionData(
      datasheetId: serializer.fromJson<int>(json['datasheetId']),
      line: serializer.fromJson<int>(json['line']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'datasheetId': serializer.toJson<int>(datasheetId),
      'line': serializer.toJson<int>(line),
      'description': serializer.toJson<String?>(description),
    };
  }

  TdatasheetunitcompositionData copyWith(
          {int? datasheetId,
          int? line,
          Value<String?> description = const Value.absent()}) =>
      TdatasheetunitcompositionData(
        datasheetId: datasheetId ?? this.datasheetId,
        line: line ?? this.line,
        description: description.present ? description.value : this.description,
      );
  TdatasheetunitcompositionData copyWithCompanion(
      TdatasheetunitcompositionCompanion data) {
    return TdatasheetunitcompositionData(
      datasheetId:
          data.datasheetId.present ? data.datasheetId.value : this.datasheetId,
      line: data.line.present ? data.line.value : this.line,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetunitcompositionData(')
          ..write('datasheetId: $datasheetId, ')
          ..write('line: $line, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(datasheetId, line, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TdatasheetunitcompositionData &&
          other.datasheetId == this.datasheetId &&
          other.line == this.line &&
          other.description == this.description);
}

class TdatasheetunitcompositionCompanion
    extends UpdateCompanion<TdatasheetunitcompositionData> {
  final Value<int> datasheetId;
  final Value<int> line;
  final Value<String?> description;
  final Value<int> rowid;
  const TdatasheetunitcompositionCompanion({
    this.datasheetId = const Value.absent(),
    this.line = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TdatasheetunitcompositionCompanion.insert({
    required int datasheetId,
    required int line,
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : datasheetId = Value(datasheetId),
        line = Value(line);
  static Insertable<TdatasheetunitcompositionData> custom({
    Expression<int>? datasheetId,
    Expression<int>? line,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (datasheetId != null) 'datasheet_id': datasheetId,
      if (line != null) 'line': line,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TdatasheetunitcompositionCompanion copyWith(
      {Value<int>? datasheetId,
      Value<int>? line,
      Value<String?>? description,
      Value<int>? rowid}) {
    return TdatasheetunitcompositionCompanion(
      datasheetId: datasheetId ?? this.datasheetId,
      line: line ?? this.line,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (datasheetId.present) {
      map['datasheet_id'] = Variable<int>(datasheetId.value);
    }
    if (line.present) {
      map['line'] = Variable<int>(line.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetunitcompositionCompanion(')
          ..write('datasheetId: $datasheetId, ')
          ..write('line: $line, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TdatasheetmodelcostTable extends Tdatasheetmodelcost
    with TableInfo<$TdatasheetmodelcostTable, TdatasheetmodelcostData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TdatasheetmodelcostTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _datasheetIdMeta =
      const VerificationMeta('datasheetId');
  @override
  late final GeneratedColumn<int> datasheetId = GeneratedColumn<int>(
      'datasheet_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tdatasheet (id)'));
  static const VerificationMeta _lineMeta = const VerificationMeta('line');
  @override
  late final GeneratedColumn<int> line = GeneratedColumn<int>(
      'line', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<int> cost = GeneratedColumn<int>(
      'cost', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [datasheetId, line, description, cost];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tdatasheetmodelcost';
  @override
  VerificationContext validateIntegrity(
      Insertable<TdatasheetmodelcostData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('datasheet_id')) {
      context.handle(
          _datasheetIdMeta,
          datasheetId.isAcceptableOrUnknown(
              data['datasheet_id']!, _datasheetIdMeta));
    } else if (isInserting) {
      context.missing(_datasheetIdMeta);
    }
    if (data.containsKey('line')) {
      context.handle(
          _lineMeta, line.isAcceptableOrUnknown(data['line']!, _lineMeta));
    } else if (isInserting) {
      context.missing(_lineMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('cost')) {
      context.handle(
          _costMeta, cost.isAcceptableOrUnknown(data['cost']!, _costMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {datasheetId, line};
  @override
  TdatasheetmodelcostData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TdatasheetmodelcostData(
      datasheetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}datasheet_id'])!,
      line: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}line'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      cost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cost']),
    );
  }

  @override
  $TdatasheetmodelcostTable createAlias(String alias) {
    return $TdatasheetmodelcostTable(attachedDatabase, alias);
  }
}

class TdatasheetmodelcostData extends DataClass
    implements Insertable<TdatasheetmodelcostData> {
  final int datasheetId;
  final int line;
  final String? description;
  final int? cost;
  const TdatasheetmodelcostData(
      {required this.datasheetId,
      required this.line,
      this.description,
      this.cost});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['datasheet_id'] = Variable<int>(datasheetId);
    map['line'] = Variable<int>(line);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || cost != null) {
      map['cost'] = Variable<int>(cost);
    }
    return map;
  }

  TdatasheetmodelcostCompanion toCompanion(bool nullToAbsent) {
    return TdatasheetmodelcostCompanion(
      datasheetId: Value(datasheetId),
      line: Value(line),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      cost: cost == null && nullToAbsent ? const Value.absent() : Value(cost),
    );
  }

  factory TdatasheetmodelcostData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TdatasheetmodelcostData(
      datasheetId: serializer.fromJson<int>(json['datasheetId']),
      line: serializer.fromJson<int>(json['line']),
      description: serializer.fromJson<String?>(json['description']),
      cost: serializer.fromJson<int?>(json['cost']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'datasheetId': serializer.toJson<int>(datasheetId),
      'line': serializer.toJson<int>(line),
      'description': serializer.toJson<String?>(description),
      'cost': serializer.toJson<int?>(cost),
    };
  }

  TdatasheetmodelcostData copyWith(
          {int? datasheetId,
          int? line,
          Value<String?> description = const Value.absent(),
          Value<int?> cost = const Value.absent()}) =>
      TdatasheetmodelcostData(
        datasheetId: datasheetId ?? this.datasheetId,
        line: line ?? this.line,
        description: description.present ? description.value : this.description,
        cost: cost.present ? cost.value : this.cost,
      );
  TdatasheetmodelcostData copyWithCompanion(TdatasheetmodelcostCompanion data) {
    return TdatasheetmodelcostData(
      datasheetId:
          data.datasheetId.present ? data.datasheetId.value : this.datasheetId,
      line: data.line.present ? data.line.value : this.line,
      description:
          data.description.present ? data.description.value : this.description,
      cost: data.cost.present ? data.cost.value : this.cost,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetmodelcostData(')
          ..write('datasheetId: $datasheetId, ')
          ..write('line: $line, ')
          ..write('description: $description, ')
          ..write('cost: $cost')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(datasheetId, line, description, cost);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TdatasheetmodelcostData &&
          other.datasheetId == this.datasheetId &&
          other.line == this.line &&
          other.description == this.description &&
          other.cost == this.cost);
}

class TdatasheetmodelcostCompanion
    extends UpdateCompanion<TdatasheetmodelcostData> {
  final Value<int> datasheetId;
  final Value<int> line;
  final Value<String?> description;
  final Value<int?> cost;
  final Value<int> rowid;
  const TdatasheetmodelcostCompanion({
    this.datasheetId = const Value.absent(),
    this.line = const Value.absent(),
    this.description = const Value.absent(),
    this.cost = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TdatasheetmodelcostCompanion.insert({
    required int datasheetId,
    required int line,
    this.description = const Value.absent(),
    this.cost = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : datasheetId = Value(datasheetId),
        line = Value(line);
  static Insertable<TdatasheetmodelcostData> custom({
    Expression<int>? datasheetId,
    Expression<int>? line,
    Expression<String>? description,
    Expression<int>? cost,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (datasheetId != null) 'datasheet_id': datasheetId,
      if (line != null) 'line': line,
      if (description != null) 'description': description,
      if (cost != null) 'cost': cost,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TdatasheetmodelcostCompanion copyWith(
      {Value<int>? datasheetId,
      Value<int>? line,
      Value<String?>? description,
      Value<int?>? cost,
      Value<int>? rowid}) {
    return TdatasheetmodelcostCompanion(
      datasheetId: datasheetId ?? this.datasheetId,
      line: line ?? this.line,
      description: description ?? this.description,
      cost: cost ?? this.cost,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (datasheetId.present) {
      map['datasheet_id'] = Variable<int>(datasheetId.value);
    }
    if (line.present) {
      map['line'] = Variable<int>(line.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (cost.present) {
      map['cost'] = Variable<int>(cost.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TdatasheetmodelcostCompanion(')
          ..write('datasheetId: $datasheetId, ')
          ..write('line: $line, ')
          ..write('description: $description, ')
          ..write('cost: $cost, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TfactionTable tfaction = $TfactionTable(this);
  late final $TsourceTable tsource = $TsourceTable(this);
  late final $TdatasheetTable tdatasheet = $TdatasheetTable(this);
  late final $TabilityTable tability = $TabilityTable(this);
  late final $TdetachmentTable tdetachment = $TdetachmentTable(this);
  late final $TenhancementTable tenhancement = $TenhancementTable(this);
  late final $TstratagemTable tstratagem = $TstratagemTable(this);
  late final $TlastupdateTable tlastupdate = $TlastupdateTable(this);
  late final $TdatasheetabilityTable tdatasheetability =
      $TdatasheetabilityTable(this);
  late final $TdatasheetmodelTable tdatasheetmodel =
      $TdatasheetmodelTable(this);
  late final $TdatasheetwargearTable tdatasheetwargear =
      $TdatasheetwargearTable(this);
  late final $TdatasheetkeywordTable tdatasheetkeyword =
      $TdatasheetkeywordTable(this);
  late final $TdatasheetoptionTable tdatasheetoption =
      $TdatasheetoptionTable(this);
  late final $TdatasheetleaderTable tdatasheetleader =
      $TdatasheetleaderTable(this);
  late final $TdatasheetstratagemTable tdatasheetstratagem =
      $TdatasheetstratagemTable(this);
  late final $TdatasheetenhancementTable tdatasheetenhancement =
      $TdatasheetenhancementTable(this);
  late final $TdetachmentabilityTable tdetachmentability =
      $TdetachmentabilityTable(this);
  late final $TdatasheetdetachmentabilityTable tdatasheetdetachmentability =
      $TdatasheetdetachmentabilityTable(this);
  late final $TdatasheetunitcompositionTable tdatasheetunitcomposition =
      $TdatasheetunitcompositionTable(this);
  late final $TdatasheetmodelcostTable tdatasheetmodelcost =
      $TdatasheetmodelcostTable(this);
  late final FactionDao factionDao = FactionDao(this as AppDatabase);
  late final DatasheetDao datasheetDao = DatasheetDao(this as AppDatabase);
  late final AbilityDao abilityDao = AbilityDao(this as AppDatabase);
  late final DatasheetAbilityDao datasheetAbilityDao =
      DatasheetAbilityDao(this as AppDatabase);
  late final DatasheetModelDao datasheetModelDao =
      DatasheetModelDao(this as AppDatabase);
  late final DetachmentDao detachmentDao = DetachmentDao(this as AppDatabase);
  late final EnhancementDao enhancementDao =
      EnhancementDao(this as AppDatabase);
  late final LastUpdateDao lastUpdateDao = LastUpdateDao(this as AppDatabase);
  late final SourceDao sourceDao = SourceDao(this as AppDatabase);
  late final StratagemDao stratagemDao = StratagemDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        tfaction,
        tsource,
        tdatasheet,
        tability,
        tdetachment,
        tenhancement,
        tstratagem,
        tlastupdate,
        tdatasheetability,
        tdatasheetmodel,
        tdatasheetwargear,
        tdatasheetkeyword,
        tdatasheetoption,
        tdatasheetleader,
        tdatasheetstratagem,
        tdatasheetenhancement,
        tdetachmentability,
        tdatasheetdetachmentability,
        tdatasheetunitcomposition,
        tdatasheetmodelcost
      ];
}

typedef $$TfactionTableCreateCompanionBuilder = TfactionCompanion Function({
  required String id,
  required String name,
  Value<String?> link,
  Value<int> rowid,
});
typedef $$TfactionTableUpdateCompanionBuilder = TfactionCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> link,
  Value<int> rowid,
});

final class $$TfactionTableReferences
    extends BaseReferences<_$AppDatabase, $TfactionTable, TfactionData> {
  $$TfactionTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TdatasheetTable, List<TdatasheetData>>
      _tdatasheetRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.tdatasheet,
          aliasName:
              $_aliasNameGenerator(db.tfaction.id, db.tdatasheet.factionId));

  $$TdatasheetTableProcessedTableManager get tdatasheetRefs {
    final manager = $$TdatasheetTableTableManager($_db, $_db.tdatasheet)
        .filter((f) => f.factionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_tdatasheetRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TabilityTable, List<TabilityData>>
      _tabilityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.tability,
              aliasName:
                  $_aliasNameGenerator(db.tfaction.id, db.tability.factionId));

  $$TabilityTableProcessedTableManager get tabilityRefs {
    final manager = $$TabilityTableTableManager($_db, $_db.tability)
        .filter((f) => f.factionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_tabilityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TdetachmentTable, List<TdetachmentData>>
      _tdetachmentRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.tdetachment,
          aliasName:
              $_aliasNameGenerator(db.tfaction.id, db.tdetachment.factionId));

  $$TdetachmentTableProcessedTableManager get tdetachmentRefs {
    final manager = $$TdetachmentTableTableManager($_db, $_db.tdetachment)
        .filter((f) => f.factionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_tdetachmentRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TenhancementTable, List<TenhancementData>>
      _tenhancementRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.tenhancement,
          aliasName:
              $_aliasNameGenerator(db.tfaction.id, db.tenhancement.factionId));

  $$TenhancementTableProcessedTableManager get tenhancementRefs {
    final manager = $$TenhancementTableTableManager($_db, $_db.tenhancement)
        .filter((f) => f.factionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_tenhancementRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TdetachmentabilityTable,
      List<TdetachmentabilityData>> _tdetachmentabilityRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tdetachmentability,
          aliasName: $_aliasNameGenerator(
              db.tfaction.id, db.tdetachmentability.factionId));

  $$TdetachmentabilityTableProcessedTableManager get tdetachmentabilityRefs {
    final manager = $$TdetachmentabilityTableTableManager(
            $_db, $_db.tdetachmentability)
        .filter((f) => f.factionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_tdetachmentabilityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TfactionTableFilterComposer
    extends Composer<_$AppDatabase, $TfactionTable> {
  $$TfactionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get link => $composableBuilder(
      column: $table.link, builder: (column) => ColumnFilters(column));

  Expression<bool> tdatasheetRefs(
      Expression<bool> Function($$TdatasheetTableFilterComposer f) f) {
    final $$TdatasheetTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.factionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> tabilityRefs(
      Expression<bool> Function($$TabilityTableFilterComposer f) f) {
    final $$TabilityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tability,
        getReferencedColumn: (t) => t.factionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TabilityTableFilterComposer(
              $db: $db,
              $table: $db.tability,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> tdetachmentRefs(
      Expression<bool> Function($$TdetachmentTableFilterComposer f) f) {
    final $$TdetachmentTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdetachment,
        getReferencedColumn: (t) => t.factionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentTableFilterComposer(
              $db: $db,
              $table: $db.tdetachment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> tenhancementRefs(
      Expression<bool> Function($$TenhancementTableFilterComposer f) f) {
    final $$TenhancementTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tenhancement,
        getReferencedColumn: (t) => t.factionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TenhancementTableFilterComposer(
              $db: $db,
              $table: $db.tenhancement,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> tdetachmentabilityRefs(
      Expression<bool> Function($$TdetachmentabilityTableFilterComposer f) f) {
    final $$TdetachmentabilityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdetachmentability,
        getReferencedColumn: (t) => t.factionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentabilityTableFilterComposer(
              $db: $db,
              $table: $db.tdetachmentability,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TfactionTableOrderingComposer
    extends Composer<_$AppDatabase, $TfactionTable> {
  $$TfactionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get link => $composableBuilder(
      column: $table.link, builder: (column) => ColumnOrderings(column));
}

class $$TfactionTableAnnotationComposer
    extends Composer<_$AppDatabase, $TfactionTable> {
  $$TfactionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get link =>
      $composableBuilder(column: $table.link, builder: (column) => column);

  Expression<T> tdatasheetRefs<T extends Object>(
      Expression<T> Function($$TdatasheetTableAnnotationComposer a) f) {
    final $$TdatasheetTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.factionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> tabilityRefs<T extends Object>(
      Expression<T> Function($$TabilityTableAnnotationComposer a) f) {
    final $$TabilityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tability,
        getReferencedColumn: (t) => t.factionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TabilityTableAnnotationComposer(
              $db: $db,
              $table: $db.tability,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> tdetachmentRefs<T extends Object>(
      Expression<T> Function($$TdetachmentTableAnnotationComposer a) f) {
    final $$TdetachmentTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdetachment,
        getReferencedColumn: (t) => t.factionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentTableAnnotationComposer(
              $db: $db,
              $table: $db.tdetachment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> tenhancementRefs<T extends Object>(
      Expression<T> Function($$TenhancementTableAnnotationComposer a) f) {
    final $$TenhancementTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tenhancement,
        getReferencedColumn: (t) => t.factionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TenhancementTableAnnotationComposer(
              $db: $db,
              $table: $db.tenhancement,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> tdetachmentabilityRefs<T extends Object>(
      Expression<T> Function($$TdetachmentabilityTableAnnotationComposer a) f) {
    final $$TdetachmentabilityTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdetachmentability,
            getReferencedColumn: (t) => t.factionId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdetachmentabilityTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tdetachmentability,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TfactionTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TfactionTable,
    TfactionData,
    $$TfactionTableFilterComposer,
    $$TfactionTableOrderingComposer,
    $$TfactionTableAnnotationComposer,
    $$TfactionTableCreateCompanionBuilder,
    $$TfactionTableUpdateCompanionBuilder,
    (TfactionData, $$TfactionTableReferences),
    TfactionData,
    PrefetchHooks Function(
        {bool tdatasheetRefs,
        bool tabilityRefs,
        bool tdetachmentRefs,
        bool tenhancementRefs,
        bool tdetachmentabilityRefs})> {
  $$TfactionTableTableManager(_$AppDatabase db, $TfactionTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TfactionTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TfactionTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TfactionTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> link = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TfactionCompanion(
            id: id,
            name: name,
            link: link,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> link = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TfactionCompanion.insert(
            id: id,
            name: name,
            link: link,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TfactionTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {tdatasheetRefs = false,
              tabilityRefs = false,
              tdetachmentRefs = false,
              tenhancementRefs = false,
              tdetachmentabilityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tdatasheetRefs) db.tdatasheet,
                if (tabilityRefs) db.tability,
                if (tdetachmentRefs) db.tdetachment,
                if (tenhancementRefs) db.tenhancement,
                if (tdetachmentabilityRefs) db.tdetachmentability
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tdatasheetRefs)
                    await $_getPrefetchedData<TfactionData, $TfactionTable,
                            TdatasheetData>(
                        currentTable: table,
                        referencedTable:
                            $$TfactionTableReferences._tdatasheetRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TfactionTableReferences(db, table, p0)
                                .tdatasheetRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.factionId == item.id),
                        typedResults: items),
                  if (tabilityRefs)
                    await $_getPrefetchedData<TfactionData, $TfactionTable,
                            TabilityData>(
                        currentTable: table,
                        referencedTable:
                            $$TfactionTableReferences._tabilityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TfactionTableReferences(db, table, p0)
                                .tabilityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.factionId == item.id),
                        typedResults: items),
                  if (tdetachmentRefs)
                    await $_getPrefetchedData<TfactionData, $TfactionTable,
                            TdetachmentData>(
                        currentTable: table,
                        referencedTable:
                            $$TfactionTableReferences._tdetachmentRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TfactionTableReferences(db, table, p0)
                                .tdetachmentRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.factionId == item.id),
                        typedResults: items),
                  if (tenhancementRefs)
                    await $_getPrefetchedData<TfactionData, $TfactionTable, TenhancementData>(
                        currentTable: table,
                        referencedTable: $$TfactionTableReferences
                            ._tenhancementRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TfactionTableReferences(db, table, p0)
                                .tenhancementRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.factionId == item.id),
                        typedResults: items),
                  if (tdetachmentabilityRefs)
                    await $_getPrefetchedData<TfactionData, $TfactionTable,
                            TdetachmentabilityData>(
                        currentTable: table,
                        referencedTable: $$TfactionTableReferences
                            ._tdetachmentabilityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TfactionTableReferences(db, table, p0)
                                .tdetachmentabilityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.factionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TfactionTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TfactionTable,
    TfactionData,
    $$TfactionTableFilterComposer,
    $$TfactionTableOrderingComposer,
    $$TfactionTableAnnotationComposer,
    $$TfactionTableCreateCompanionBuilder,
    $$TfactionTableUpdateCompanionBuilder,
    (TfactionData, $$TfactionTableReferences),
    TfactionData,
    PrefetchHooks Function(
        {bool tdatasheetRefs,
        bool tabilityRefs,
        bool tdetachmentRefs,
        bool tenhancementRefs,
        bool tdetachmentabilityRefs})>;
typedef $$TsourceTableCreateCompanionBuilder = TsourceCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> type,
  Value<int?> edition,
  Value<String?> version,
  Value<DateTime?> errataDate,
  Value<String?> errataLink,
});
typedef $$TsourceTableUpdateCompanionBuilder = TsourceCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> type,
  Value<int?> edition,
  Value<String?> version,
  Value<DateTime?> errataDate,
  Value<String?> errataLink,
});

final class $$TsourceTableReferences
    extends BaseReferences<_$AppDatabase, $TsourceTable, TsourceData> {
  $$TsourceTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TdatasheetTable, List<TdatasheetData>>
      _tdatasheetRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.tdatasheet,
              aliasName:
                  $_aliasNameGenerator(db.tsource.id, db.tdatasheet.sourceId));

  $$TdatasheetTableProcessedTableManager get tdatasheetRefs {
    final manager = $$TdatasheetTableTableManager($_db, $_db.tdatasheet)
        .filter((f) => f.sourceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tdatasheetRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TsourceTableFilterComposer
    extends Composer<_$AppDatabase, $TsourceTable> {
  $$TsourceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get edition => $composableBuilder(
      column: $table.edition, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get errataDate => $composableBuilder(
      column: $table.errataDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get errataLink => $composableBuilder(
      column: $table.errataLink, builder: (column) => ColumnFilters(column));

  Expression<bool> tdatasheetRefs(
      Expression<bool> Function($$TdatasheetTableFilterComposer f) f) {
    final $$TdatasheetTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.sourceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TsourceTableOrderingComposer
    extends Composer<_$AppDatabase, $TsourceTable> {
  $$TsourceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get edition => $composableBuilder(
      column: $table.edition, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get errataDate => $composableBuilder(
      column: $table.errataDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get errataLink => $composableBuilder(
      column: $table.errataLink, builder: (column) => ColumnOrderings(column));
}

class $$TsourceTableAnnotationComposer
    extends Composer<_$AppDatabase, $TsourceTable> {
  $$TsourceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get edition =>
      $composableBuilder(column: $table.edition, builder: (column) => column);

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get errataDate => $composableBuilder(
      column: $table.errataDate, builder: (column) => column);

  GeneratedColumn<String> get errataLink => $composableBuilder(
      column: $table.errataLink, builder: (column) => column);

  Expression<T> tdatasheetRefs<T extends Object>(
      Expression<T> Function($$TdatasheetTableAnnotationComposer a) f) {
    final $$TdatasheetTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.sourceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TsourceTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TsourceTable,
    TsourceData,
    $$TsourceTableFilterComposer,
    $$TsourceTableOrderingComposer,
    $$TsourceTableAnnotationComposer,
    $$TsourceTableCreateCompanionBuilder,
    $$TsourceTableUpdateCompanionBuilder,
    (TsourceData, $$TsourceTableReferences),
    TsourceData,
    PrefetchHooks Function({bool tdatasheetRefs})> {
  $$TsourceTableTableManager(_$AppDatabase db, $TsourceTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TsourceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TsourceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TsourceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<int?> edition = const Value.absent(),
            Value<String?> version = const Value.absent(),
            Value<DateTime?> errataDate = const Value.absent(),
            Value<String?> errataLink = const Value.absent(),
          }) =>
              TsourceCompanion(
            id: id,
            name: name,
            type: type,
            edition: edition,
            version: version,
            errataDate: errataDate,
            errataLink: errataLink,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> type = const Value.absent(),
            Value<int?> edition = const Value.absent(),
            Value<String?> version = const Value.absent(),
            Value<DateTime?> errataDate = const Value.absent(),
            Value<String?> errataLink = const Value.absent(),
          }) =>
              TsourceCompanion.insert(
            id: id,
            name: name,
            type: type,
            edition: edition,
            version: version,
            errataDate: errataDate,
            errataLink: errataLink,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TsourceTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({tdatasheetRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tdatasheetRefs) db.tdatasheet],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tdatasheetRefs)
                    await $_getPrefetchedData<TsourceData, $TsourceTable,
                            TdatasheetData>(
                        currentTable: table,
                        referencedTable:
                            $$TsourceTableReferences._tdatasheetRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TsourceTableReferences(db, table, p0)
                                .tdatasheetRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.sourceId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TsourceTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TsourceTable,
    TsourceData,
    $$TsourceTableFilterComposer,
    $$TsourceTableOrderingComposer,
    $$TsourceTableAnnotationComposer,
    $$TsourceTableCreateCompanionBuilder,
    $$TsourceTableUpdateCompanionBuilder,
    (TsourceData, $$TsourceTableReferences),
    TsourceData,
    PrefetchHooks Function({bool tdatasheetRefs})>;
typedef $$TdatasheetTableCreateCompanionBuilder = TdatasheetCompanion Function({
  Value<int> id,
  required String name,
  required String factionId,
  required int sourceId,
  Value<String?> legend,
  Value<String?> role,
  Value<String?> loadout,
  Value<String?> transport,
  Value<bool?> virtual,
  Value<String?> leaderHead,
  Value<String?> leaderFooter,
  Value<String?> damagedW,
  Value<String?> damagedDescription,
  Value<String?> link,
});
typedef $$TdatasheetTableUpdateCompanionBuilder = TdatasheetCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> factionId,
  Value<int> sourceId,
  Value<String?> legend,
  Value<String?> role,
  Value<String?> loadout,
  Value<String?> transport,
  Value<bool?> virtual,
  Value<String?> leaderHead,
  Value<String?> leaderFooter,
  Value<String?> damagedW,
  Value<String?> damagedDescription,
  Value<String?> link,
});

final class $$TdatasheetTableReferences
    extends BaseReferences<_$AppDatabase, $TdatasheetTable, TdatasheetData> {
  $$TdatasheetTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TfactionTable _factionIdTable(_$AppDatabase db) =>
      db.tfaction.createAlias(
          $_aliasNameGenerator(db.tdatasheet.factionId, db.tfaction.id));

  $$TfactionTableProcessedTableManager get factionId {
    final $_column = $_itemColumn<String>('factionId')!;

    final manager = $$TfactionTableTableManager($_db, $_db.tfaction)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_factionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TsourceTable _sourceIdTable(_$AppDatabase db) => db.tsource
      .createAlias($_aliasNameGenerator(db.tdatasheet.sourceId, db.tsource.id));

  $$TsourceTableProcessedTableManager get sourceId {
    final $_column = $_itemColumn<int>('source_id')!;

    final manager = $$TsourceTableTableManager($_db, $_db.tsource)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TdatasheetmodelTable, List<TdatasheetmodelData>>
      _tdatasheetmodelRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.tdatasheetmodel,
              aliasName: $_aliasNameGenerator(
                  db.tdatasheet.id, db.tdatasheetmodel.datasheetId));

  $$TdatasheetmodelTableProcessedTableManager get tdatasheetmodelRefs {
    final manager = $$TdatasheetmodelTableTableManager(
            $_db, $_db.tdatasheetmodel)
        .filter((f) => f.datasheetId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_tdatasheetmodelRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TdatasheetwargearTable,
      List<TdatasheetwargearData>> _tdatasheetwargearRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tdatasheetwargear,
          aliasName: $_aliasNameGenerator(
              db.tdatasheet.id, db.tdatasheetwargear.datasheetId));

  $$TdatasheetwargearTableProcessedTableManager get tdatasheetwargearRefs {
    final manager = $$TdatasheetwargearTableTableManager(
            $_db, $_db.tdatasheetwargear)
        .filter((f) => f.datasheetId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_tdatasheetwargearRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TdatasheetkeywordTable,
      List<TdatasheetkeywordData>> _tdatasheetkeywordRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tdatasheetkeyword,
          aliasName: $_aliasNameGenerator(
              db.tdatasheet.id, db.tdatasheetkeyword.datasheetId));

  $$TdatasheetkeywordTableProcessedTableManager get tdatasheetkeywordRefs {
    final manager = $$TdatasheetkeywordTableTableManager(
            $_db, $_db.tdatasheetkeyword)
        .filter((f) => f.datasheetId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_tdatasheetkeywordRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TdatasheetoptionTable, List<TdatasheetoptionData>>
      _tdatasheetoptionRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.tdatasheetoption,
              aliasName: $_aliasNameGenerator(
                  db.tdatasheet.id, db.tdatasheetoption.datasheetId));

  $$TdatasheetoptionTableProcessedTableManager get tdatasheetoptionRefs {
    final manager = $$TdatasheetoptionTableTableManager(
            $_db, $_db.tdatasheetoption)
        .filter((f) => f.datasheetId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_tdatasheetoptionRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TdatasheetstratagemTable,
      List<TdatasheetstratagemData>> _tdatasheetstratagemRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tdatasheetstratagem,
          aliasName: $_aliasNameGenerator(
              db.tdatasheet.id, db.tdatasheetstratagem.datasheetId));

  $$TdatasheetstratagemTableProcessedTableManager get tdatasheetstratagemRefs {
    final manager = $$TdatasheetstratagemTableTableManager(
            $_db, $_db.tdatasheetstratagem)
        .filter((f) => f.datasheetId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_tdatasheetstratagemRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TdatasheetenhancementTable,
      List<TdatasheetenhancementData>> _tdatasheetenhancementRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tdatasheetenhancement,
          aliasName: $_aliasNameGenerator(
              db.tdatasheet.id, db.tdatasheetenhancement.datasheetId));

  $$TdatasheetenhancementTableProcessedTableManager
      get tdatasheetenhancementRefs {
    final manager = $$TdatasheetenhancementTableTableManager(
            $_db, $_db.tdatasheetenhancement)
        .filter((f) => f.datasheetId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_tdatasheetenhancementRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TdatasheetdetachmentabilityTable,
          List<TdatasheetdetachmentabilityData>>
      _tdatasheetdetachmentabilityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.tdatasheetdetachmentability,
              aliasName: $_aliasNameGenerator(db.tdatasheet.id,
                  db.tdatasheetdetachmentability.datasheetId));

  $$TdatasheetdetachmentabilityTableProcessedTableManager
      get tdatasheetdetachmentabilityRefs {
    final manager = $$TdatasheetdetachmentabilityTableTableManager(
            $_db, $_db.tdatasheetdetachmentability)
        .filter((f) => f.datasheetId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_tdatasheetdetachmentabilityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TdatasheetunitcompositionTable,
      List<TdatasheetunitcompositionData>> _tdatasheetunitcompositionRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tdatasheetunitcomposition,
          aliasName: $_aliasNameGenerator(
              db.tdatasheet.id, db.tdatasheetunitcomposition.datasheetId));

  $$TdatasheetunitcompositionTableProcessedTableManager
      get tdatasheetunitcompositionRefs {
    final manager = $$TdatasheetunitcompositionTableTableManager(
            $_db, $_db.tdatasheetunitcomposition)
        .filter((f) => f.datasheetId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_tdatasheetunitcompositionRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TdatasheetmodelcostTable,
      List<TdatasheetmodelcostData>> _tdatasheetmodelcostRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tdatasheetmodelcost,
          aliasName: $_aliasNameGenerator(
              db.tdatasheet.id, db.tdatasheetmodelcost.datasheetId));

  $$TdatasheetmodelcostTableProcessedTableManager get tdatasheetmodelcostRefs {
    final manager = $$TdatasheetmodelcostTableTableManager(
            $_db, $_db.tdatasheetmodelcost)
        .filter((f) => f.datasheetId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_tdatasheetmodelcostRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TdatasheetTableFilterComposer
    extends Composer<_$AppDatabase, $TdatasheetTable> {
  $$TdatasheetTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get legend => $composableBuilder(
      column: $table.legend, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get loadout => $composableBuilder(
      column: $table.loadout, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transport => $composableBuilder(
      column: $table.transport, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get virtual => $composableBuilder(
      column: $table.virtual, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get leaderHead => $composableBuilder(
      column: $table.leaderHead, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get leaderFooter => $composableBuilder(
      column: $table.leaderFooter, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get damagedW => $composableBuilder(
      column: $table.damagedW, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get damagedDescription => $composableBuilder(
      column: $table.damagedDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get link => $composableBuilder(
      column: $table.link, builder: (column) => ColumnFilters(column));

  $$TfactionTableFilterComposer get factionId {
    final $$TfactionTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableFilterComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TsourceTableFilterComposer get sourceId {
    final $$TsourceTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sourceId,
        referencedTable: $db.tsource,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TsourceTableFilterComposer(
              $db: $db,
              $table: $db.tsource,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> tdatasheetmodelRefs(
      Expression<bool> Function($$TdatasheetmodelTableFilterComposer f) f) {
    final $$TdatasheetmodelTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdatasheetmodel,
        getReferencedColumn: (t) => t.datasheetId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetmodelTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheetmodel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> tdatasheetwargearRefs(
      Expression<bool> Function($$TdatasheetwargearTableFilterComposer f) f) {
    final $$TdatasheetwargearTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdatasheetwargear,
        getReferencedColumn: (t) => t.datasheetId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetwargearTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheetwargear,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> tdatasheetkeywordRefs(
      Expression<bool> Function($$TdatasheetkeywordTableFilterComposer f) f) {
    final $$TdatasheetkeywordTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdatasheetkeyword,
        getReferencedColumn: (t) => t.datasheetId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetkeywordTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheetkeyword,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> tdatasheetoptionRefs(
      Expression<bool> Function($$TdatasheetoptionTableFilterComposer f) f) {
    final $$TdatasheetoptionTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdatasheetoption,
        getReferencedColumn: (t) => t.datasheetId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetoptionTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheetoption,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> tdatasheetstratagemRefs(
      Expression<bool> Function($$TdatasheetstratagemTableFilterComposer f) f) {
    final $$TdatasheetstratagemTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdatasheetstratagem,
        getReferencedColumn: (t) => t.datasheetId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetstratagemTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheetstratagem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> tdatasheetenhancementRefs(
      Expression<bool> Function($$TdatasheetenhancementTableFilterComposer f)
          f) {
    final $$TdatasheetenhancementTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetenhancement,
            getReferencedColumn: (t) => t.datasheetId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetenhancementTableFilterComposer(
                  $db: $db,
                  $table: $db.tdatasheetenhancement,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> tdatasheetdetachmentabilityRefs(
      Expression<bool> Function(
              $$TdatasheetdetachmentabilityTableFilterComposer f)
          f) {
    final $$TdatasheetdetachmentabilityTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetdetachmentability,
            getReferencedColumn: (t) => t.datasheetId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetdetachmentabilityTableFilterComposer(
                  $db: $db,
                  $table: $db.tdatasheetdetachmentability,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> tdatasheetunitcompositionRefs(
      Expression<bool> Function(
              $$TdatasheetunitcompositionTableFilterComposer f)
          f) {
    final $$TdatasheetunitcompositionTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetunitcomposition,
            getReferencedColumn: (t) => t.datasheetId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetunitcompositionTableFilterComposer(
                  $db: $db,
                  $table: $db.tdatasheetunitcomposition,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> tdatasheetmodelcostRefs(
      Expression<bool> Function($$TdatasheetmodelcostTableFilterComposer f) f) {
    final $$TdatasheetmodelcostTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdatasheetmodelcost,
        getReferencedColumn: (t) => t.datasheetId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetmodelcostTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheetmodelcost,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TdatasheetTableOrderingComposer
    extends Composer<_$AppDatabase, $TdatasheetTable> {
  $$TdatasheetTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get legend => $composableBuilder(
      column: $table.legend, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get loadout => $composableBuilder(
      column: $table.loadout, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transport => $composableBuilder(
      column: $table.transport, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get virtual => $composableBuilder(
      column: $table.virtual, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get leaderHead => $composableBuilder(
      column: $table.leaderHead, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get leaderFooter => $composableBuilder(
      column: $table.leaderFooter,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get damagedW => $composableBuilder(
      column: $table.damagedW, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get damagedDescription => $composableBuilder(
      column: $table.damagedDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get link => $composableBuilder(
      column: $table.link, builder: (column) => ColumnOrderings(column));

  $$TfactionTableOrderingComposer get factionId {
    final $$TfactionTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableOrderingComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TsourceTableOrderingComposer get sourceId {
    final $$TsourceTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sourceId,
        referencedTable: $db.tsource,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TsourceTableOrderingComposer(
              $db: $db,
              $table: $db.tsource,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetTableAnnotationComposer
    extends Composer<_$AppDatabase, $TdatasheetTable> {
  $$TdatasheetTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get legend =>
      $composableBuilder(column: $table.legend, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get loadout =>
      $composableBuilder(column: $table.loadout, builder: (column) => column);

  GeneratedColumn<String> get transport =>
      $composableBuilder(column: $table.transport, builder: (column) => column);

  GeneratedColumn<bool> get virtual =>
      $composableBuilder(column: $table.virtual, builder: (column) => column);

  GeneratedColumn<String> get leaderHead => $composableBuilder(
      column: $table.leaderHead, builder: (column) => column);

  GeneratedColumn<String> get leaderFooter => $composableBuilder(
      column: $table.leaderFooter, builder: (column) => column);

  GeneratedColumn<String> get damagedW =>
      $composableBuilder(column: $table.damagedW, builder: (column) => column);

  GeneratedColumn<String> get damagedDescription => $composableBuilder(
      column: $table.damagedDescription, builder: (column) => column);

  GeneratedColumn<String> get link =>
      $composableBuilder(column: $table.link, builder: (column) => column);

  $$TfactionTableAnnotationComposer get factionId {
    final $$TfactionTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableAnnotationComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TsourceTableAnnotationComposer get sourceId {
    final $$TsourceTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sourceId,
        referencedTable: $db.tsource,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TsourceTableAnnotationComposer(
              $db: $db,
              $table: $db.tsource,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> tdatasheetmodelRefs<T extends Object>(
      Expression<T> Function($$TdatasheetmodelTableAnnotationComposer a) f) {
    final $$TdatasheetmodelTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdatasheetmodel,
        getReferencedColumn: (t) => t.datasheetId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetmodelTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheetmodel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> tdatasheetwargearRefs<T extends Object>(
      Expression<T> Function($$TdatasheetwargearTableAnnotationComposer a) f) {
    final $$TdatasheetwargearTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetwargear,
            getReferencedColumn: (t) => t.datasheetId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetwargearTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tdatasheetwargear,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> tdatasheetkeywordRefs<T extends Object>(
      Expression<T> Function($$TdatasheetkeywordTableAnnotationComposer a) f) {
    final $$TdatasheetkeywordTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetkeyword,
            getReferencedColumn: (t) => t.datasheetId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetkeywordTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tdatasheetkeyword,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> tdatasheetoptionRefs<T extends Object>(
      Expression<T> Function($$TdatasheetoptionTableAnnotationComposer a) f) {
    final $$TdatasheetoptionTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdatasheetoption,
        getReferencedColumn: (t) => t.datasheetId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetoptionTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheetoption,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> tdatasheetstratagemRefs<T extends Object>(
      Expression<T> Function($$TdatasheetstratagemTableAnnotationComposer a)
          f) {
    final $$TdatasheetstratagemTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetstratagem,
            getReferencedColumn: (t) => t.datasheetId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetstratagemTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tdatasheetstratagem,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> tdatasheetenhancementRefs<T extends Object>(
      Expression<T> Function($$TdatasheetenhancementTableAnnotationComposer a)
          f) {
    final $$TdatasheetenhancementTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetenhancement,
            getReferencedColumn: (t) => t.datasheetId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetenhancementTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tdatasheetenhancement,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> tdatasheetdetachmentabilityRefs<T extends Object>(
      Expression<T> Function(
              $$TdatasheetdetachmentabilityTableAnnotationComposer a)
          f) {
    final $$TdatasheetdetachmentabilityTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetdetachmentability,
            getReferencedColumn: (t) => t.datasheetId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetdetachmentabilityTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tdatasheetdetachmentability,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> tdatasheetunitcompositionRefs<T extends Object>(
      Expression<T> Function(
              $$TdatasheetunitcompositionTableAnnotationComposer a)
          f) {
    final $$TdatasheetunitcompositionTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetunitcomposition,
            getReferencedColumn: (t) => t.datasheetId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetunitcompositionTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tdatasheetunitcomposition,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> tdatasheetmodelcostRefs<T extends Object>(
      Expression<T> Function($$TdatasheetmodelcostTableAnnotationComposer a)
          f) {
    final $$TdatasheetmodelcostTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetmodelcost,
            getReferencedColumn: (t) => t.datasheetId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetmodelcostTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tdatasheetmodelcost,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TdatasheetTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TdatasheetTable,
    TdatasheetData,
    $$TdatasheetTableFilterComposer,
    $$TdatasheetTableOrderingComposer,
    $$TdatasheetTableAnnotationComposer,
    $$TdatasheetTableCreateCompanionBuilder,
    $$TdatasheetTableUpdateCompanionBuilder,
    (TdatasheetData, $$TdatasheetTableReferences),
    TdatasheetData,
    PrefetchHooks Function(
        {bool factionId,
        bool sourceId,
        bool tdatasheetmodelRefs,
        bool tdatasheetwargearRefs,
        bool tdatasheetkeywordRefs,
        bool tdatasheetoptionRefs,
        bool tdatasheetstratagemRefs,
        bool tdatasheetenhancementRefs,
        bool tdatasheetdetachmentabilityRefs,
        bool tdatasheetunitcompositionRefs,
        bool tdatasheetmodelcostRefs})> {
  $$TdatasheetTableTableManager(_$AppDatabase db, $TdatasheetTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TdatasheetTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TdatasheetTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TdatasheetTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> factionId = const Value.absent(),
            Value<int> sourceId = const Value.absent(),
            Value<String?> legend = const Value.absent(),
            Value<String?> role = const Value.absent(),
            Value<String?> loadout = const Value.absent(),
            Value<String?> transport = const Value.absent(),
            Value<bool?> virtual = const Value.absent(),
            Value<String?> leaderHead = const Value.absent(),
            Value<String?> leaderFooter = const Value.absent(),
            Value<String?> damagedW = const Value.absent(),
            Value<String?> damagedDescription = const Value.absent(),
            Value<String?> link = const Value.absent(),
          }) =>
              TdatasheetCompanion(
            id: id,
            name: name,
            factionId: factionId,
            sourceId: sourceId,
            legend: legend,
            role: role,
            loadout: loadout,
            transport: transport,
            virtual: virtual,
            leaderHead: leaderHead,
            leaderFooter: leaderFooter,
            damagedW: damagedW,
            damagedDescription: damagedDescription,
            link: link,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String factionId,
            required int sourceId,
            Value<String?> legend = const Value.absent(),
            Value<String?> role = const Value.absent(),
            Value<String?> loadout = const Value.absent(),
            Value<String?> transport = const Value.absent(),
            Value<bool?> virtual = const Value.absent(),
            Value<String?> leaderHead = const Value.absent(),
            Value<String?> leaderFooter = const Value.absent(),
            Value<String?> damagedW = const Value.absent(),
            Value<String?> damagedDescription = const Value.absent(),
            Value<String?> link = const Value.absent(),
          }) =>
              TdatasheetCompanion.insert(
            id: id,
            name: name,
            factionId: factionId,
            sourceId: sourceId,
            legend: legend,
            role: role,
            loadout: loadout,
            transport: transport,
            virtual: virtual,
            leaderHead: leaderHead,
            leaderFooter: leaderFooter,
            damagedW: damagedW,
            damagedDescription: damagedDescription,
            link: link,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TdatasheetTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {factionId = false,
              sourceId = false,
              tdatasheetmodelRefs = false,
              tdatasheetwargearRefs = false,
              tdatasheetkeywordRefs = false,
              tdatasheetoptionRefs = false,
              tdatasheetstratagemRefs = false,
              tdatasheetenhancementRefs = false,
              tdatasheetdetachmentabilityRefs = false,
              tdatasheetunitcompositionRefs = false,
              tdatasheetmodelcostRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tdatasheetmodelRefs) db.tdatasheetmodel,
                if (tdatasheetwargearRefs) db.tdatasheetwargear,
                if (tdatasheetkeywordRefs) db.tdatasheetkeyword,
                if (tdatasheetoptionRefs) db.tdatasheetoption,
                if (tdatasheetstratagemRefs) db.tdatasheetstratagem,
                if (tdatasheetenhancementRefs) db.tdatasheetenhancement,
                if (tdatasheetdetachmentabilityRefs)
                  db.tdatasheetdetachmentability,
                if (tdatasheetunitcompositionRefs) db.tdatasheetunitcomposition,
                if (tdatasheetmodelcostRefs) db.tdatasheetmodelcost
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (factionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.factionId,
                    referencedTable:
                        $$TdatasheetTableReferences._factionIdTable(db),
                    referencedColumn:
                        $$TdatasheetTableReferences._factionIdTable(db).id,
                  ) as T;
                }
                if (sourceId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.sourceId,
                    referencedTable:
                        $$TdatasheetTableReferences._sourceIdTable(db),
                    referencedColumn:
                        $$TdatasheetTableReferences._sourceIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tdatasheetmodelRefs)
                    await $_getPrefetchedData<TdatasheetData, $TdatasheetTable,
                            TdatasheetmodelData>(
                        currentTable: table,
                        referencedTable: $$TdatasheetTableReferences
                            ._tdatasheetmodelRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TdatasheetTableReferences(db, table, p0)
                                .tdatasheetmodelRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.datasheetId == item.id),
                        typedResults: items),
                  if (tdatasheetwargearRefs)
                    await $_getPrefetchedData<TdatasheetData, $TdatasheetTable,
                            TdatasheetwargearData>(
                        currentTable: table,
                        referencedTable: $$TdatasheetTableReferences
                            ._tdatasheetwargearRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TdatasheetTableReferences(db, table, p0)
                                .tdatasheetwargearRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.datasheetId == item.id),
                        typedResults: items),
                  if (tdatasheetkeywordRefs)
                    await $_getPrefetchedData<TdatasheetData, $TdatasheetTable,
                            TdatasheetkeywordData>(
                        currentTable: table,
                        referencedTable: $$TdatasheetTableReferences
                            ._tdatasheetkeywordRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TdatasheetTableReferences(db, table, p0)
                                .tdatasheetkeywordRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.datasheetId == item.id),
                        typedResults: items),
                  if (tdatasheetoptionRefs)
                    await $_getPrefetchedData<TdatasheetData, $TdatasheetTable,
                            TdatasheetoptionData>(
                        currentTable: table,
                        referencedTable: $$TdatasheetTableReferences
                            ._tdatasheetoptionRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TdatasheetTableReferences(db, table, p0)
                                .tdatasheetoptionRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.datasheetId == item.id),
                        typedResults: items),
                  if (tdatasheetstratagemRefs)
                    await $_getPrefetchedData<TdatasheetData, $TdatasheetTable,
                            TdatasheetstratagemData>(
                        currentTable: table,
                        referencedTable: $$TdatasheetTableReferences
                            ._tdatasheetstratagemRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TdatasheetTableReferences(db, table, p0)
                                .tdatasheetstratagemRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.datasheetId == item.id),
                        typedResults: items),
                  if (tdatasheetenhancementRefs)
                    await $_getPrefetchedData<TdatasheetData, $TdatasheetTable,
                            TdatasheetenhancementData>(
                        currentTable: table,
                        referencedTable: $$TdatasheetTableReferences
                            ._tdatasheetenhancementRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TdatasheetTableReferences(db, table, p0)
                                .tdatasheetenhancementRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.datasheetId == item.id),
                        typedResults: items),
                  if (tdatasheetdetachmentabilityRefs)
                    await $_getPrefetchedData<TdatasheetData, $TdatasheetTable,
                            TdatasheetdetachmentabilityData>(
                        currentTable: table,
                        referencedTable: $$TdatasheetTableReferences
                            ._tdatasheetdetachmentabilityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TdatasheetTableReferences(db, table, p0)
                                .tdatasheetdetachmentabilityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.datasheetId == item.id),
                        typedResults: items),
                  if (tdatasheetunitcompositionRefs)
                    await $_getPrefetchedData<TdatasheetData, $TdatasheetTable,
                            TdatasheetunitcompositionData>(
                        currentTable: table,
                        referencedTable: $$TdatasheetTableReferences
                            ._tdatasheetunitcompositionRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TdatasheetTableReferences(db, table, p0)
                                .tdatasheetunitcompositionRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.datasheetId == item.id),
                        typedResults: items),
                  if (tdatasheetmodelcostRefs)
                    await $_getPrefetchedData<TdatasheetData, $TdatasheetTable,
                            TdatasheetmodelcostData>(
                        currentTable: table,
                        referencedTable: $$TdatasheetTableReferences
                            ._tdatasheetmodelcostRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TdatasheetTableReferences(db, table, p0)
                                .tdatasheetmodelcostRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.datasheetId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TdatasheetTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TdatasheetTable,
    TdatasheetData,
    $$TdatasheetTableFilterComposer,
    $$TdatasheetTableOrderingComposer,
    $$TdatasheetTableAnnotationComposer,
    $$TdatasheetTableCreateCompanionBuilder,
    $$TdatasheetTableUpdateCompanionBuilder,
    (TdatasheetData, $$TdatasheetTableReferences),
    TdatasheetData,
    PrefetchHooks Function(
        {bool factionId,
        bool sourceId,
        bool tdatasheetmodelRefs,
        bool tdatasheetwargearRefs,
        bool tdatasheetkeywordRefs,
        bool tdatasheetoptionRefs,
        bool tdatasheetstratagemRefs,
        bool tdatasheetenhancementRefs,
        bool tdatasheetdetachmentabilityRefs,
        bool tdatasheetunitcompositionRefs,
        bool tdatasheetmodelcostRefs})>;
typedef $$TabilityTableCreateCompanionBuilder = TabilityCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> legend,
  Value<String?> factionId,
  Value<String?> description,
});
typedef $$TabilityTableUpdateCompanionBuilder = TabilityCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> legend,
  Value<String?> factionId,
  Value<String?> description,
});

final class $$TabilityTableReferences
    extends BaseReferences<_$AppDatabase, $TabilityTable, TabilityData> {
  $$TabilityTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TfactionTable _factionIdTable(_$AppDatabase db) => db.tfaction
      .createAlias($_aliasNameGenerator(db.tability.factionId, db.tfaction.id));

  $$TfactionTableProcessedTableManager? get factionId {
    final $_column = $_itemColumn<String>('factionId');
    if ($_column == null) return null;
    final manager = $$TfactionTableTableManager($_db, $_db.tfaction)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_factionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TdatasheetabilityTable,
      List<TdatasheetabilityData>> _tdatasheetabilityRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tdatasheetability,
          aliasName: $_aliasNameGenerator(
              db.tability.id, db.tdatasheetability.abilityId));

  $$TdatasheetabilityTableProcessedTableManager get tdatasheetabilityRefs {
    final manager =
        $$TdatasheetabilityTableTableManager($_db, $_db.tdatasheetability)
            .filter((f) => f.abilityId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_tdatasheetabilityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TabilityTableFilterComposer
    extends Composer<_$AppDatabase, $TabilityTable> {
  $$TabilityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get legend => $composableBuilder(
      column: $table.legend, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  $$TfactionTableFilterComposer get factionId {
    final $$TfactionTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableFilterComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> tdatasheetabilityRefs(
      Expression<bool> Function($$TdatasheetabilityTableFilterComposer f) f) {
    final $$TdatasheetabilityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdatasheetability,
        getReferencedColumn: (t) => t.abilityId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetabilityTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheetability,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TabilityTableOrderingComposer
    extends Composer<_$AppDatabase, $TabilityTable> {
  $$TabilityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get legend => $composableBuilder(
      column: $table.legend, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  $$TfactionTableOrderingComposer get factionId {
    final $$TfactionTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableOrderingComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TabilityTableAnnotationComposer
    extends Composer<_$AppDatabase, $TabilityTable> {
  $$TabilityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get legend =>
      $composableBuilder(column: $table.legend, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  $$TfactionTableAnnotationComposer get factionId {
    final $$TfactionTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableAnnotationComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> tdatasheetabilityRefs<T extends Object>(
      Expression<T> Function($$TdatasheetabilityTableAnnotationComposer a) f) {
    final $$TdatasheetabilityTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetability,
            getReferencedColumn: (t) => t.abilityId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetabilityTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tdatasheetability,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TabilityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TabilityTable,
    TabilityData,
    $$TabilityTableFilterComposer,
    $$TabilityTableOrderingComposer,
    $$TabilityTableAnnotationComposer,
    $$TabilityTableCreateCompanionBuilder,
    $$TabilityTableUpdateCompanionBuilder,
    (TabilityData, $$TabilityTableReferences),
    TabilityData,
    PrefetchHooks Function({bool factionId, bool tdatasheetabilityRefs})> {
  $$TabilityTableTableManager(_$AppDatabase db, $TabilityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TabilityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TabilityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TabilityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> legend = const Value.absent(),
            Value<String?> factionId = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              TabilityCompanion(
            id: id,
            name: name,
            legend: legend,
            factionId: factionId,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> legend = const Value.absent(),
            Value<String?> factionId = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              TabilityCompanion.insert(
            id: id,
            name: name,
            legend: legend,
            factionId: factionId,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TabilityTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {factionId = false, tdatasheetabilityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tdatasheetabilityRefs) db.tdatasheetability
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (factionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.factionId,
                    referencedTable:
                        $$TabilityTableReferences._factionIdTable(db),
                    referencedColumn:
                        $$TabilityTableReferences._factionIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tdatasheetabilityRefs)
                    await $_getPrefetchedData<TabilityData, $TabilityTable,
                            TdatasheetabilityData>(
                        currentTable: table,
                        referencedTable: $$TabilityTableReferences
                            ._tdatasheetabilityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TabilityTableReferences(db, table, p0)
                                .tdatasheetabilityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.abilityId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TabilityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TabilityTable,
    TabilityData,
    $$TabilityTableFilterComposer,
    $$TabilityTableOrderingComposer,
    $$TabilityTableAnnotationComposer,
    $$TabilityTableCreateCompanionBuilder,
    $$TabilityTableUpdateCompanionBuilder,
    (TabilityData, $$TabilityTableReferences),
    TabilityData,
    PrefetchHooks Function({bool factionId, bool tdatasheetabilityRefs})>;
typedef $$TdetachmentTableCreateCompanionBuilder = TdetachmentCompanion
    Function({
  Value<int> id,
  required String factionId,
  required String name,
  Value<String?> legend,
  Value<String?> type,
});
typedef $$TdetachmentTableUpdateCompanionBuilder = TdetachmentCompanion
    Function({
  Value<int> id,
  Value<String> factionId,
  Value<String> name,
  Value<String?> legend,
  Value<String?> type,
});

final class $$TdetachmentTableReferences
    extends BaseReferences<_$AppDatabase, $TdetachmentTable, TdetachmentData> {
  $$TdetachmentTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TfactionTable _factionIdTable(_$AppDatabase db) =>
      db.tfaction.createAlias(
          $_aliasNameGenerator(db.tdetachment.factionId, db.tfaction.id));

  $$TfactionTableProcessedTableManager get factionId {
    final $_column = $_itemColumn<String>('faction_id')!;

    final manager = $$TfactionTableTableManager($_db, $_db.tfaction)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_factionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TenhancementTable, List<TenhancementData>>
      _tenhancementRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.tenhancement,
              aliasName: $_aliasNameGenerator(
                  db.tdetachment.id, db.tenhancement.detachmentId));

  $$TenhancementTableProcessedTableManager get tenhancementRefs {
    final manager = $$TenhancementTableTableManager($_db, $_db.tenhancement)
        .filter((f) => f.detachmentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tenhancementRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TstratagemTable, List<TstratagemData>>
      _tstratagemRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.tstratagem,
              aliasName: $_aliasNameGenerator(
                  db.tdetachment.id, db.tstratagem.detachmentId));

  $$TstratagemTableProcessedTableManager get tstratagemRefs {
    final manager = $$TstratagemTableTableManager($_db, $_db.tstratagem)
        .filter((f) => f.detachmentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tstratagemRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TdetachmentabilityTable,
      List<TdetachmentabilityData>> _tdetachmentabilityRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tdetachmentability,
          aliasName: $_aliasNameGenerator(
              db.tdetachment.id, db.tdetachmentability.detachmentId));

  $$TdetachmentabilityTableProcessedTableManager get tdetachmentabilityRefs {
    final manager = $$TdetachmentabilityTableTableManager(
            $_db, $_db.tdetachmentability)
        .filter((f) => f.detachmentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_tdetachmentabilityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TdetachmentTableFilterComposer
    extends Composer<_$AppDatabase, $TdetachmentTable> {
  $$TdetachmentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get legend => $composableBuilder(
      column: $table.legend, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  $$TfactionTableFilterComposer get factionId {
    final $$TfactionTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableFilterComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> tenhancementRefs(
      Expression<bool> Function($$TenhancementTableFilterComposer f) f) {
    final $$TenhancementTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tenhancement,
        getReferencedColumn: (t) => t.detachmentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TenhancementTableFilterComposer(
              $db: $db,
              $table: $db.tenhancement,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> tstratagemRefs(
      Expression<bool> Function($$TstratagemTableFilterComposer f) f) {
    final $$TstratagemTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tstratagem,
        getReferencedColumn: (t) => t.detachmentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TstratagemTableFilterComposer(
              $db: $db,
              $table: $db.tstratagem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> tdetachmentabilityRefs(
      Expression<bool> Function($$TdetachmentabilityTableFilterComposer f) f) {
    final $$TdetachmentabilityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdetachmentability,
        getReferencedColumn: (t) => t.detachmentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentabilityTableFilterComposer(
              $db: $db,
              $table: $db.tdetachmentability,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TdetachmentTableOrderingComposer
    extends Composer<_$AppDatabase, $TdetachmentTable> {
  $$TdetachmentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get legend => $composableBuilder(
      column: $table.legend, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  $$TfactionTableOrderingComposer get factionId {
    final $$TfactionTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableOrderingComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdetachmentTableAnnotationComposer
    extends Composer<_$AppDatabase, $TdetachmentTable> {
  $$TdetachmentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get legend =>
      $composableBuilder(column: $table.legend, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  $$TfactionTableAnnotationComposer get factionId {
    final $$TfactionTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableAnnotationComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> tenhancementRefs<T extends Object>(
      Expression<T> Function($$TenhancementTableAnnotationComposer a) f) {
    final $$TenhancementTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tenhancement,
        getReferencedColumn: (t) => t.detachmentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TenhancementTableAnnotationComposer(
              $db: $db,
              $table: $db.tenhancement,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> tstratagemRefs<T extends Object>(
      Expression<T> Function($$TstratagemTableAnnotationComposer a) f) {
    final $$TstratagemTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tstratagem,
        getReferencedColumn: (t) => t.detachmentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TstratagemTableAnnotationComposer(
              $db: $db,
              $table: $db.tstratagem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> tdetachmentabilityRefs<T extends Object>(
      Expression<T> Function($$TdetachmentabilityTableAnnotationComposer a) f) {
    final $$TdetachmentabilityTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdetachmentability,
            getReferencedColumn: (t) => t.detachmentId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdetachmentabilityTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tdetachmentability,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TdetachmentTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TdetachmentTable,
    TdetachmentData,
    $$TdetachmentTableFilterComposer,
    $$TdetachmentTableOrderingComposer,
    $$TdetachmentTableAnnotationComposer,
    $$TdetachmentTableCreateCompanionBuilder,
    $$TdetachmentTableUpdateCompanionBuilder,
    (TdetachmentData, $$TdetachmentTableReferences),
    TdetachmentData,
    PrefetchHooks Function(
        {bool factionId,
        bool tenhancementRefs,
        bool tstratagemRefs,
        bool tdetachmentabilityRefs})> {
  $$TdetachmentTableTableManager(_$AppDatabase db, $TdetachmentTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TdetachmentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TdetachmentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TdetachmentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> factionId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> legend = const Value.absent(),
            Value<String?> type = const Value.absent(),
          }) =>
              TdetachmentCompanion(
            id: id,
            factionId: factionId,
            name: name,
            legend: legend,
            type: type,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String factionId,
            required String name,
            Value<String?> legend = const Value.absent(),
            Value<String?> type = const Value.absent(),
          }) =>
              TdetachmentCompanion.insert(
            id: id,
            factionId: factionId,
            name: name,
            legend: legend,
            type: type,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TdetachmentTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {factionId = false,
              tenhancementRefs = false,
              tstratagemRefs = false,
              tdetachmentabilityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tenhancementRefs) db.tenhancement,
                if (tstratagemRefs) db.tstratagem,
                if (tdetachmentabilityRefs) db.tdetachmentability
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (factionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.factionId,
                    referencedTable:
                        $$TdetachmentTableReferences._factionIdTable(db),
                    referencedColumn:
                        $$TdetachmentTableReferences._factionIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tenhancementRefs)
                    await $_getPrefetchedData<TdetachmentData,
                            $TdetachmentTable, TenhancementData>(
                        currentTable: table,
                        referencedTable: $$TdetachmentTableReferences
                            ._tenhancementRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TdetachmentTableReferences(db, table, p0)
                                .tenhancementRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.detachmentId == item.id),
                        typedResults: items),
                  if (tstratagemRefs)
                    await $_getPrefetchedData<TdetachmentData,
                            $TdetachmentTable, TstratagemData>(
                        currentTable: table,
                        referencedTable: $$TdetachmentTableReferences
                            ._tstratagemRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TdetachmentTableReferences(db, table, p0)
                                .tstratagemRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.detachmentId == item.id),
                        typedResults: items),
                  if (tdetachmentabilityRefs)
                    await $_getPrefetchedData<TdetachmentData,
                            $TdetachmentTable, TdetachmentabilityData>(
                        currentTable: table,
                        referencedTable: $$TdetachmentTableReferences
                            ._tdetachmentabilityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TdetachmentTableReferences(db, table, p0)
                                .tdetachmentabilityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.detachmentId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TdetachmentTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TdetachmentTable,
    TdetachmentData,
    $$TdetachmentTableFilterComposer,
    $$TdetachmentTableOrderingComposer,
    $$TdetachmentTableAnnotationComposer,
    $$TdetachmentTableCreateCompanionBuilder,
    $$TdetachmentTableUpdateCompanionBuilder,
    (TdetachmentData, $$TdetachmentTableReferences),
    TdetachmentData,
    PrefetchHooks Function(
        {bool factionId,
        bool tenhancementRefs,
        bool tstratagemRefs,
        bool tdetachmentabilityRefs})>;
typedef $$TenhancementTableCreateCompanionBuilder = TenhancementCompanion
    Function({
  required String factionId,
  Value<int> id,
  required String name,
  required int cost,
  Value<String?> detachment,
  Value<int?> detachmentId,
  Value<String?> legend,
  Value<String?> description,
});
typedef $$TenhancementTableUpdateCompanionBuilder = TenhancementCompanion
    Function({
  Value<String> factionId,
  Value<int> id,
  Value<String> name,
  Value<int> cost,
  Value<String?> detachment,
  Value<int?> detachmentId,
  Value<String?> legend,
  Value<String?> description,
});

final class $$TenhancementTableReferences extends BaseReferences<_$AppDatabase,
    $TenhancementTable, TenhancementData> {
  $$TenhancementTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TfactionTable _factionIdTable(_$AppDatabase db) =>
      db.tfaction.createAlias(
          $_aliasNameGenerator(db.tenhancement.factionId, db.tfaction.id));

  $$TfactionTableProcessedTableManager get factionId {
    final $_column = $_itemColumn<String>('faction_id')!;

    final manager = $$TfactionTableTableManager($_db, $_db.tfaction)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_factionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TdetachmentTable _detachmentIdTable(_$AppDatabase db) =>
      db.tdetachment.createAlias($_aliasNameGenerator(
          db.tenhancement.detachmentId, db.tdetachment.id));

  $$TdetachmentTableProcessedTableManager? get detachmentId {
    final $_column = $_itemColumn<int>('detachment_id');
    if ($_column == null) return null;
    final manager = $$TdetachmentTableTableManager($_db, $_db.tdetachment)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_detachmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TdatasheetenhancementTable,
      List<TdatasheetenhancementData>> _tdatasheetenhancementRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tdatasheetenhancement,
          aliasName: $_aliasNameGenerator(
              db.tenhancement.id, db.tdatasheetenhancement.enhancementId));

  $$TdatasheetenhancementTableProcessedTableManager
      get tdatasheetenhancementRefs {
    final manager = $$TdatasheetenhancementTableTableManager(
            $_db, $_db.tdatasheetenhancement)
        .filter((f) => f.enhancementId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_tdatasheetenhancementRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TenhancementTableFilterComposer
    extends Composer<_$AppDatabase, $TenhancementTable> {
  $$TenhancementTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get detachment => $composableBuilder(
      column: $table.detachment, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get legend => $composableBuilder(
      column: $table.legend, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  $$TfactionTableFilterComposer get factionId {
    final $$TfactionTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableFilterComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TdetachmentTableFilterComposer get detachmentId {
    final $$TdetachmentTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.detachmentId,
        referencedTable: $db.tdetachment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentTableFilterComposer(
              $db: $db,
              $table: $db.tdetachment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> tdatasheetenhancementRefs(
      Expression<bool> Function($$TdatasheetenhancementTableFilterComposer f)
          f) {
    final $$TdatasheetenhancementTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetenhancement,
            getReferencedColumn: (t) => t.enhancementId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetenhancementTableFilterComposer(
                  $db: $db,
                  $table: $db.tdatasheetenhancement,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TenhancementTableOrderingComposer
    extends Composer<_$AppDatabase, $TenhancementTable> {
  $$TenhancementTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get detachment => $composableBuilder(
      column: $table.detachment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get legend => $composableBuilder(
      column: $table.legend, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  $$TfactionTableOrderingComposer get factionId {
    final $$TfactionTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableOrderingComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TdetachmentTableOrderingComposer get detachmentId {
    final $$TdetachmentTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.detachmentId,
        referencedTable: $db.tdetachment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentTableOrderingComposer(
              $db: $db,
              $table: $db.tdetachment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TenhancementTableAnnotationComposer
    extends Composer<_$AppDatabase, $TenhancementTable> {
  $$TenhancementTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<String> get detachment => $composableBuilder(
      column: $table.detachment, builder: (column) => column);

  GeneratedColumn<String> get legend =>
      $composableBuilder(column: $table.legend, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  $$TfactionTableAnnotationComposer get factionId {
    final $$TfactionTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableAnnotationComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TdetachmentTableAnnotationComposer get detachmentId {
    final $$TdetachmentTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.detachmentId,
        referencedTable: $db.tdetachment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentTableAnnotationComposer(
              $db: $db,
              $table: $db.tdetachment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> tdatasheetenhancementRefs<T extends Object>(
      Expression<T> Function($$TdatasheetenhancementTableAnnotationComposer a)
          f) {
    final $$TdatasheetenhancementTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetenhancement,
            getReferencedColumn: (t) => t.enhancementId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetenhancementTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tdatasheetenhancement,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TenhancementTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TenhancementTable,
    TenhancementData,
    $$TenhancementTableFilterComposer,
    $$TenhancementTableOrderingComposer,
    $$TenhancementTableAnnotationComposer,
    $$TenhancementTableCreateCompanionBuilder,
    $$TenhancementTableUpdateCompanionBuilder,
    (TenhancementData, $$TenhancementTableReferences),
    TenhancementData,
    PrefetchHooks Function(
        {bool factionId, bool detachmentId, bool tdatasheetenhancementRefs})> {
  $$TenhancementTableTableManager(_$AppDatabase db, $TenhancementTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TenhancementTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TenhancementTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TenhancementTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> factionId = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> cost = const Value.absent(),
            Value<String?> detachment = const Value.absent(),
            Value<int?> detachmentId = const Value.absent(),
            Value<String?> legend = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              TenhancementCompanion(
            factionId: factionId,
            id: id,
            name: name,
            cost: cost,
            detachment: detachment,
            detachmentId: detachmentId,
            legend: legend,
            description: description,
          ),
          createCompanionCallback: ({
            required String factionId,
            Value<int> id = const Value.absent(),
            required String name,
            required int cost,
            Value<String?> detachment = const Value.absent(),
            Value<int?> detachmentId = const Value.absent(),
            Value<String?> legend = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              TenhancementCompanion.insert(
            factionId: factionId,
            id: id,
            name: name,
            cost: cost,
            detachment: detachment,
            detachmentId: detachmentId,
            legend: legend,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TenhancementTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {factionId = false,
              detachmentId = false,
              tdatasheetenhancementRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tdatasheetenhancementRefs) db.tdatasheetenhancement
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (factionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.factionId,
                    referencedTable:
                        $$TenhancementTableReferences._factionIdTable(db),
                    referencedColumn:
                        $$TenhancementTableReferences._factionIdTable(db).id,
                  ) as T;
                }
                if (detachmentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.detachmentId,
                    referencedTable:
                        $$TenhancementTableReferences._detachmentIdTable(db),
                    referencedColumn:
                        $$TenhancementTableReferences._detachmentIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tdatasheetenhancementRefs)
                    await $_getPrefetchedData<TenhancementData,
                            $TenhancementTable, TdatasheetenhancementData>(
                        currentTable: table,
                        referencedTable: $$TenhancementTableReferences
                            ._tdatasheetenhancementRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TenhancementTableReferences(db, table, p0)
                                .tdatasheetenhancementRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.enhancementId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TenhancementTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TenhancementTable,
    TenhancementData,
    $$TenhancementTableFilterComposer,
    $$TenhancementTableOrderingComposer,
    $$TenhancementTableAnnotationComposer,
    $$TenhancementTableCreateCompanionBuilder,
    $$TenhancementTableUpdateCompanionBuilder,
    (TenhancementData, $$TenhancementTableReferences),
    TenhancementData,
    PrefetchHooks Function(
        {bool factionId, bool detachmentId, bool tdatasheetenhancementRefs})>;
typedef $$TstratagemTableCreateCompanionBuilder = TstratagemCompanion Function({
  Value<String?> factionId,
  Value<String?> name,
  Value<int> id,
  Value<String?> type,
  Value<int?> commandPointCost,
  Value<String?> legend,
  Value<String?> turn,
  Value<String?> phase,
  Value<String?> detachment,
  Value<int?> detachmentId,
  Value<String?> description,
});
typedef $$TstratagemTableUpdateCompanionBuilder = TstratagemCompanion Function({
  Value<String?> factionId,
  Value<String?> name,
  Value<int> id,
  Value<String?> type,
  Value<int?> commandPointCost,
  Value<String?> legend,
  Value<String?> turn,
  Value<String?> phase,
  Value<String?> detachment,
  Value<int?> detachmentId,
  Value<String?> description,
});

final class $$TstratagemTableReferences
    extends BaseReferences<_$AppDatabase, $TstratagemTable, TstratagemData> {
  $$TstratagemTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TdetachmentTable _detachmentIdTable(_$AppDatabase db) =>
      db.tdetachment.createAlias(
          $_aliasNameGenerator(db.tstratagem.detachmentId, db.tdetachment.id));

  $$TdetachmentTableProcessedTableManager? get detachmentId {
    final $_column = $_itemColumn<int>('detachment_id');
    if ($_column == null) return null;
    final manager = $$TdetachmentTableTableManager($_db, $_db.tdetachment)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_detachmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TdatasheetstratagemTable,
      List<TdatasheetstratagemData>> _tdatasheetstratagemRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.tdatasheetstratagem,
          aliasName: $_aliasNameGenerator(
              db.tstratagem.id, db.tdatasheetstratagem.stratagemId));

  $$TdatasheetstratagemTableProcessedTableManager get tdatasheetstratagemRefs {
    final manager = $$TdatasheetstratagemTableTableManager(
            $_db, $_db.tdatasheetstratagem)
        .filter((f) => f.stratagemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_tdatasheetstratagemRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TstratagemTableFilterComposer
    extends Composer<_$AppDatabase, $TstratagemTable> {
  $$TstratagemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get factionId => $composableBuilder(
      column: $table.factionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get commandPointCost => $composableBuilder(
      column: $table.commandPointCost,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get legend => $composableBuilder(
      column: $table.legend, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get turn => $composableBuilder(
      column: $table.turn, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phase => $composableBuilder(
      column: $table.phase, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get detachment => $composableBuilder(
      column: $table.detachment, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  $$TdetachmentTableFilterComposer get detachmentId {
    final $$TdetachmentTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.detachmentId,
        referencedTable: $db.tdetachment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentTableFilterComposer(
              $db: $db,
              $table: $db.tdetachment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> tdatasheetstratagemRefs(
      Expression<bool> Function($$TdatasheetstratagemTableFilterComposer f) f) {
    final $$TdatasheetstratagemTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.tdatasheetstratagem,
        getReferencedColumn: (t) => t.stratagemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetstratagemTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheetstratagem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TstratagemTableOrderingComposer
    extends Composer<_$AppDatabase, $TstratagemTable> {
  $$TstratagemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get factionId => $composableBuilder(
      column: $table.factionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get commandPointCost => $composableBuilder(
      column: $table.commandPointCost,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get legend => $composableBuilder(
      column: $table.legend, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get turn => $composableBuilder(
      column: $table.turn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phase => $composableBuilder(
      column: $table.phase, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get detachment => $composableBuilder(
      column: $table.detachment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  $$TdetachmentTableOrderingComposer get detachmentId {
    final $$TdetachmentTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.detachmentId,
        referencedTable: $db.tdetachment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentTableOrderingComposer(
              $db: $db,
              $table: $db.tdetachment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TstratagemTableAnnotationComposer
    extends Composer<_$AppDatabase, $TstratagemTable> {
  $$TstratagemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get factionId =>
      $composableBuilder(column: $table.factionId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get commandPointCost => $composableBuilder(
      column: $table.commandPointCost, builder: (column) => column);

  GeneratedColumn<String> get legend =>
      $composableBuilder(column: $table.legend, builder: (column) => column);

  GeneratedColumn<String> get turn =>
      $composableBuilder(column: $table.turn, builder: (column) => column);

  GeneratedColumn<String> get phase =>
      $composableBuilder(column: $table.phase, builder: (column) => column);

  GeneratedColumn<String> get detachment => $composableBuilder(
      column: $table.detachment, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  $$TdetachmentTableAnnotationComposer get detachmentId {
    final $$TdetachmentTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.detachmentId,
        referencedTable: $db.tdetachment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentTableAnnotationComposer(
              $db: $db,
              $table: $db.tdetachment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> tdatasheetstratagemRefs<T extends Object>(
      Expression<T> Function($$TdatasheetstratagemTableAnnotationComposer a)
          f) {
    final $$TdatasheetstratagemTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetstratagem,
            getReferencedColumn: (t) => t.stratagemId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetstratagemTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tdatasheetstratagem,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TstratagemTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TstratagemTable,
    TstratagemData,
    $$TstratagemTableFilterComposer,
    $$TstratagemTableOrderingComposer,
    $$TstratagemTableAnnotationComposer,
    $$TstratagemTableCreateCompanionBuilder,
    $$TstratagemTableUpdateCompanionBuilder,
    (TstratagemData, $$TstratagemTableReferences),
    TstratagemData,
    PrefetchHooks Function({bool detachmentId, bool tdatasheetstratagemRefs})> {
  $$TstratagemTableTableManager(_$AppDatabase db, $TstratagemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TstratagemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TstratagemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TstratagemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String?> factionId = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<int?> commandPointCost = const Value.absent(),
            Value<String?> legend = const Value.absent(),
            Value<String?> turn = const Value.absent(),
            Value<String?> phase = const Value.absent(),
            Value<String?> detachment = const Value.absent(),
            Value<int?> detachmentId = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              TstratagemCompanion(
            factionId: factionId,
            name: name,
            id: id,
            type: type,
            commandPointCost: commandPointCost,
            legend: legend,
            turn: turn,
            phase: phase,
            detachment: detachment,
            detachmentId: detachmentId,
            description: description,
          ),
          createCompanionCallback: ({
            Value<String?> factionId = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<int?> commandPointCost = const Value.absent(),
            Value<String?> legend = const Value.absent(),
            Value<String?> turn = const Value.absent(),
            Value<String?> phase = const Value.absent(),
            Value<String?> detachment = const Value.absent(),
            Value<int?> detachmentId = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              TstratagemCompanion.insert(
            factionId: factionId,
            name: name,
            id: id,
            type: type,
            commandPointCost: commandPointCost,
            legend: legend,
            turn: turn,
            phase: phase,
            detachment: detachment,
            detachmentId: detachmentId,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TstratagemTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {detachmentId = false, tdatasheetstratagemRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tdatasheetstratagemRefs) db.tdatasheetstratagem
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (detachmentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.detachmentId,
                    referencedTable:
                        $$TstratagemTableReferences._detachmentIdTable(db),
                    referencedColumn:
                        $$TstratagemTableReferences._detachmentIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tdatasheetstratagemRefs)
                    await $_getPrefetchedData<TstratagemData, $TstratagemTable,
                            TdatasheetstratagemData>(
                        currentTable: table,
                        referencedTable: $$TstratagemTableReferences
                            ._tdatasheetstratagemRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TstratagemTableReferences(db, table, p0)
                                .tdatasheetstratagemRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.stratagemId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TstratagemTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TstratagemTable,
    TstratagemData,
    $$TstratagemTableFilterComposer,
    $$TstratagemTableOrderingComposer,
    $$TstratagemTableAnnotationComposer,
    $$TstratagemTableCreateCompanionBuilder,
    $$TstratagemTableUpdateCompanionBuilder,
    (TstratagemData, $$TstratagemTableReferences),
    TstratagemData,
    PrefetchHooks Function({bool detachmentId, bool tdatasheetstratagemRefs})>;
typedef $$TlastupdateTableCreateCompanionBuilder = TlastupdateCompanion
    Function({
  required DateTime lastUpdate,
  Value<int> rowid,
});
typedef $$TlastupdateTableUpdateCompanionBuilder = TlastupdateCompanion
    Function({
  Value<DateTime> lastUpdate,
  Value<int> rowid,
});

class $$TlastupdateTableFilterComposer
    extends Composer<_$AppDatabase, $TlastupdateTable> {
  $$TlastupdateTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => ColumnFilters(column));
}

class $$TlastupdateTableOrderingComposer
    extends Composer<_$AppDatabase, $TlastupdateTable> {
  $$TlastupdateTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => ColumnOrderings(column));
}

class $$TlastupdateTableAnnotationComposer
    extends Composer<_$AppDatabase, $TlastupdateTable> {
  $$TlastupdateTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => column);
}

class $$TlastupdateTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TlastupdateTable,
    TlastupdateData,
    $$TlastupdateTableFilterComposer,
    $$TlastupdateTableOrderingComposer,
    $$TlastupdateTableAnnotationComposer,
    $$TlastupdateTableCreateCompanionBuilder,
    $$TlastupdateTableUpdateCompanionBuilder,
    (
      TlastupdateData,
      BaseReferences<_$AppDatabase, $TlastupdateTable, TlastupdateData>
    ),
    TlastupdateData,
    PrefetchHooks Function()> {
  $$TlastupdateTableTableManager(_$AppDatabase db, $TlastupdateTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TlastupdateTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TlastupdateTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TlastupdateTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<DateTime> lastUpdate = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TlastupdateCompanion(
            lastUpdate: lastUpdate,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required DateTime lastUpdate,
            Value<int> rowid = const Value.absent(),
          }) =>
              TlastupdateCompanion.insert(
            lastUpdate: lastUpdate,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TlastupdateTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TlastupdateTable,
    TlastupdateData,
    $$TlastupdateTableFilterComposer,
    $$TlastupdateTableOrderingComposer,
    $$TlastupdateTableAnnotationComposer,
    $$TlastupdateTableCreateCompanionBuilder,
    $$TlastupdateTableUpdateCompanionBuilder,
    (
      TlastupdateData,
      BaseReferences<_$AppDatabase, $TlastupdateTable, TlastupdateData>
    ),
    TlastupdateData,
    PrefetchHooks Function()>;
typedef $$TdatasheetabilityTableCreateCompanionBuilder
    = TdatasheetabilityCompanion Function({
  required int datasheetId,
  required int line,
  Value<int?> abilityId,
  Value<String?> model,
  Value<String?> name,
  Value<String?> description,
  Value<String?> type,
  Value<String?> parameter,
  Value<int> rowid,
});
typedef $$TdatasheetabilityTableUpdateCompanionBuilder
    = TdatasheetabilityCompanion Function({
  Value<int> datasheetId,
  Value<int> line,
  Value<int?> abilityId,
  Value<String?> model,
  Value<String?> name,
  Value<String?> description,
  Value<String?> type,
  Value<String?> parameter,
  Value<int> rowid,
});

final class $$TdatasheetabilityTableReferences extends BaseReferences<
    _$AppDatabase, $TdatasheetabilityTable, TdatasheetabilityData> {
  $$TdatasheetabilityTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TabilityTable _abilityIdTable(_$AppDatabase db) =>
      db.tability.createAlias(
          $_aliasNameGenerator(db.tdatasheetability.abilityId, db.tability.id));

  $$TabilityTableProcessedTableManager? get abilityId {
    final $_column = $_itemColumn<int>('ability_id');
    if ($_column == null) return null;
    final manager = $$TabilityTableTableManager($_db, $_db.tability)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_abilityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TdatasheetabilityTableFilterComposer
    extends Composer<_$AppDatabase, $TdatasheetabilityTable> {
  $$TdatasheetabilityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get datasheetId => $composableBuilder(
      column: $table.datasheetId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get line => $composableBuilder(
      column: $table.line, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get model => $composableBuilder(
      column: $table.model, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get parameter => $composableBuilder(
      column: $table.parameter, builder: (column) => ColumnFilters(column));

  $$TabilityTableFilterComposer get abilityId {
    final $$TabilityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.abilityId,
        referencedTable: $db.tability,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TabilityTableFilterComposer(
              $db: $db,
              $table: $db.tability,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetabilityTableOrderingComposer
    extends Composer<_$AppDatabase, $TdatasheetabilityTable> {
  $$TdatasheetabilityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get datasheetId => $composableBuilder(
      column: $table.datasheetId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get line => $composableBuilder(
      column: $table.line, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get model => $composableBuilder(
      column: $table.model, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get parameter => $composableBuilder(
      column: $table.parameter, builder: (column) => ColumnOrderings(column));

  $$TabilityTableOrderingComposer get abilityId {
    final $$TabilityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.abilityId,
        referencedTable: $db.tability,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TabilityTableOrderingComposer(
              $db: $db,
              $table: $db.tability,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetabilityTableAnnotationComposer
    extends Composer<_$AppDatabase, $TdatasheetabilityTable> {
  $$TdatasheetabilityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get datasheetId => $composableBuilder(
      column: $table.datasheetId, builder: (column) => column);

  GeneratedColumn<int> get line =>
      $composableBuilder(column: $table.line, builder: (column) => column);

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get parameter =>
      $composableBuilder(column: $table.parameter, builder: (column) => column);

  $$TabilityTableAnnotationComposer get abilityId {
    final $$TabilityTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.abilityId,
        referencedTable: $db.tability,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TabilityTableAnnotationComposer(
              $db: $db,
              $table: $db.tability,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetabilityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TdatasheetabilityTable,
    TdatasheetabilityData,
    $$TdatasheetabilityTableFilterComposer,
    $$TdatasheetabilityTableOrderingComposer,
    $$TdatasheetabilityTableAnnotationComposer,
    $$TdatasheetabilityTableCreateCompanionBuilder,
    $$TdatasheetabilityTableUpdateCompanionBuilder,
    (TdatasheetabilityData, $$TdatasheetabilityTableReferences),
    TdatasheetabilityData,
    PrefetchHooks Function({bool abilityId})> {
  $$TdatasheetabilityTableTableManager(
      _$AppDatabase db, $TdatasheetabilityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TdatasheetabilityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TdatasheetabilityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TdatasheetabilityTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> datasheetId = const Value.absent(),
            Value<int> line = const Value.absent(),
            Value<int?> abilityId = const Value.absent(),
            Value<String?> model = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<String?> parameter = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetabilityCompanion(
            datasheetId: datasheetId,
            line: line,
            abilityId: abilityId,
            model: model,
            name: name,
            description: description,
            type: type,
            parameter: parameter,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int datasheetId,
            required int line,
            Value<int?> abilityId = const Value.absent(),
            Value<String?> model = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<String?> parameter = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetabilityCompanion.insert(
            datasheetId: datasheetId,
            line: line,
            abilityId: abilityId,
            model: model,
            name: name,
            description: description,
            type: type,
            parameter: parameter,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TdatasheetabilityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({abilityId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (abilityId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.abilityId,
                    referencedTable:
                        $$TdatasheetabilityTableReferences._abilityIdTable(db),
                    referencedColumn: $$TdatasheetabilityTableReferences
                        ._abilityIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TdatasheetabilityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TdatasheetabilityTable,
    TdatasheetabilityData,
    $$TdatasheetabilityTableFilterComposer,
    $$TdatasheetabilityTableOrderingComposer,
    $$TdatasheetabilityTableAnnotationComposer,
    $$TdatasheetabilityTableCreateCompanionBuilder,
    $$TdatasheetabilityTableUpdateCompanionBuilder,
    (TdatasheetabilityData, $$TdatasheetabilityTableReferences),
    TdatasheetabilityData,
    PrefetchHooks Function({bool abilityId})>;
typedef $$TdatasheetmodelTableCreateCompanionBuilder = TdatasheetmodelCompanion
    Function({
  required int datasheetId,
  required int line,
  required String name,
  required int move,
  required int toughness,
  required String save,
  Value<String?> invulnerableSave,
  Value<String?> invulnerableSaveDescription,
  required int wounds,
  required String leadership,
  required int objectiveControl,
  required String baseSize,
  Value<String?> baseSizeDescription,
  Value<int> rowid,
});
typedef $$TdatasheetmodelTableUpdateCompanionBuilder = TdatasheetmodelCompanion
    Function({
  Value<int> datasheetId,
  Value<int> line,
  Value<String> name,
  Value<int> move,
  Value<int> toughness,
  Value<String> save,
  Value<String?> invulnerableSave,
  Value<String?> invulnerableSaveDescription,
  Value<int> wounds,
  Value<String> leadership,
  Value<int> objectiveControl,
  Value<String> baseSize,
  Value<String?> baseSizeDescription,
  Value<int> rowid,
});

final class $$TdatasheetmodelTableReferences extends BaseReferences<
    _$AppDatabase, $TdatasheetmodelTable, TdatasheetmodelData> {
  $$TdatasheetmodelTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TdatasheetTable _datasheetIdTable(_$AppDatabase db) =>
      db.tdatasheet.createAlias($_aliasNameGenerator(
          db.tdatasheetmodel.datasheetId, db.tdatasheet.id));

  $$TdatasheetTableProcessedTableManager get datasheetId {
    final $_column = $_itemColumn<int>('datasheet_id')!;

    final manager = $$TdatasheetTableTableManager($_db, $_db.tdatasheet)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_datasheetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TdatasheetmodelTableFilterComposer
    extends Composer<_$AppDatabase, $TdatasheetmodelTable> {
  $$TdatasheetmodelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get line => $composableBuilder(
      column: $table.line, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get move => $composableBuilder(
      column: $table.move, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get toughness => $composableBuilder(
      column: $table.toughness, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get save => $composableBuilder(
      column: $table.save, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get invulnerableSave => $composableBuilder(
      column: $table.invulnerableSave,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get invulnerableSaveDescription => $composableBuilder(
      column: $table.invulnerableSaveDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get wounds => $composableBuilder(
      column: $table.wounds, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get leadership => $composableBuilder(
      column: $table.leadership, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get objectiveControl => $composableBuilder(
      column: $table.objectiveControl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get baseSize => $composableBuilder(
      column: $table.baseSize, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get baseSizeDescription => $composableBuilder(
      column: $table.baseSizeDescription,
      builder: (column) => ColumnFilters(column));

  $$TdatasheetTableFilterComposer get datasheetId {
    final $$TdatasheetTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetmodelTableOrderingComposer
    extends Composer<_$AppDatabase, $TdatasheetmodelTable> {
  $$TdatasheetmodelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get line => $composableBuilder(
      column: $table.line, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get move => $composableBuilder(
      column: $table.move, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get toughness => $composableBuilder(
      column: $table.toughness, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get save => $composableBuilder(
      column: $table.save, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get invulnerableSave => $composableBuilder(
      column: $table.invulnerableSave,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get invulnerableSaveDescription => $composableBuilder(
      column: $table.invulnerableSaveDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get wounds => $composableBuilder(
      column: $table.wounds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get leadership => $composableBuilder(
      column: $table.leadership, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get objectiveControl => $composableBuilder(
      column: $table.objectiveControl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get baseSize => $composableBuilder(
      column: $table.baseSize, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get baseSizeDescription => $composableBuilder(
      column: $table.baseSizeDescription,
      builder: (column) => ColumnOrderings(column));

  $$TdatasheetTableOrderingComposer get datasheetId {
    final $$TdatasheetTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableOrderingComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetmodelTableAnnotationComposer
    extends Composer<_$AppDatabase, $TdatasheetmodelTable> {
  $$TdatasheetmodelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get line =>
      $composableBuilder(column: $table.line, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get move =>
      $composableBuilder(column: $table.move, builder: (column) => column);

  GeneratedColumn<int> get toughness =>
      $composableBuilder(column: $table.toughness, builder: (column) => column);

  GeneratedColumn<String> get save =>
      $composableBuilder(column: $table.save, builder: (column) => column);

  GeneratedColumn<String> get invulnerableSave => $composableBuilder(
      column: $table.invulnerableSave, builder: (column) => column);

  GeneratedColumn<String> get invulnerableSaveDescription => $composableBuilder(
      column: $table.invulnerableSaveDescription, builder: (column) => column);

  GeneratedColumn<int> get wounds =>
      $composableBuilder(column: $table.wounds, builder: (column) => column);

  GeneratedColumn<String> get leadership => $composableBuilder(
      column: $table.leadership, builder: (column) => column);

  GeneratedColumn<int> get objectiveControl => $composableBuilder(
      column: $table.objectiveControl, builder: (column) => column);

  GeneratedColumn<String> get baseSize =>
      $composableBuilder(column: $table.baseSize, builder: (column) => column);

  GeneratedColumn<String> get baseSizeDescription => $composableBuilder(
      column: $table.baseSizeDescription, builder: (column) => column);

  $$TdatasheetTableAnnotationComposer get datasheetId {
    final $$TdatasheetTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetmodelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TdatasheetmodelTable,
    TdatasheetmodelData,
    $$TdatasheetmodelTableFilterComposer,
    $$TdatasheetmodelTableOrderingComposer,
    $$TdatasheetmodelTableAnnotationComposer,
    $$TdatasheetmodelTableCreateCompanionBuilder,
    $$TdatasheetmodelTableUpdateCompanionBuilder,
    (TdatasheetmodelData, $$TdatasheetmodelTableReferences),
    TdatasheetmodelData,
    PrefetchHooks Function({bool datasheetId})> {
  $$TdatasheetmodelTableTableManager(
      _$AppDatabase db, $TdatasheetmodelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TdatasheetmodelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TdatasheetmodelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TdatasheetmodelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> datasheetId = const Value.absent(),
            Value<int> line = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> move = const Value.absent(),
            Value<int> toughness = const Value.absent(),
            Value<String> save = const Value.absent(),
            Value<String?> invulnerableSave = const Value.absent(),
            Value<String?> invulnerableSaveDescription = const Value.absent(),
            Value<int> wounds = const Value.absent(),
            Value<String> leadership = const Value.absent(),
            Value<int> objectiveControl = const Value.absent(),
            Value<String> baseSize = const Value.absent(),
            Value<String?> baseSizeDescription = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetmodelCompanion(
            datasheetId: datasheetId,
            line: line,
            name: name,
            move: move,
            toughness: toughness,
            save: save,
            invulnerableSave: invulnerableSave,
            invulnerableSaveDescription: invulnerableSaveDescription,
            wounds: wounds,
            leadership: leadership,
            objectiveControl: objectiveControl,
            baseSize: baseSize,
            baseSizeDescription: baseSizeDescription,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int datasheetId,
            required int line,
            required String name,
            required int move,
            required int toughness,
            required String save,
            Value<String?> invulnerableSave = const Value.absent(),
            Value<String?> invulnerableSaveDescription = const Value.absent(),
            required int wounds,
            required String leadership,
            required int objectiveControl,
            required String baseSize,
            Value<String?> baseSizeDescription = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetmodelCompanion.insert(
            datasheetId: datasheetId,
            line: line,
            name: name,
            move: move,
            toughness: toughness,
            save: save,
            invulnerableSave: invulnerableSave,
            invulnerableSaveDescription: invulnerableSaveDescription,
            wounds: wounds,
            leadership: leadership,
            objectiveControl: objectiveControl,
            baseSize: baseSize,
            baseSizeDescription: baseSizeDescription,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TdatasheetmodelTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({datasheetId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (datasheetId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.datasheetId,
                    referencedTable:
                        $$TdatasheetmodelTableReferences._datasheetIdTable(db),
                    referencedColumn: $$TdatasheetmodelTableReferences
                        ._datasheetIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TdatasheetmodelTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TdatasheetmodelTable,
    TdatasheetmodelData,
    $$TdatasheetmodelTableFilterComposer,
    $$TdatasheetmodelTableOrderingComposer,
    $$TdatasheetmodelTableAnnotationComposer,
    $$TdatasheetmodelTableCreateCompanionBuilder,
    $$TdatasheetmodelTableUpdateCompanionBuilder,
    (TdatasheetmodelData, $$TdatasheetmodelTableReferences),
    TdatasheetmodelData,
    PrefetchHooks Function({bool datasheetId})>;
typedef $$TdatasheetwargearTableCreateCompanionBuilder
    = TdatasheetwargearCompanion Function({
  required int datasheetId,
  Value<int?> line,
  required int lineInWargear,
  Value<String?> dice,
  Value<String?> name,
  Value<String?> description,
  Value<int?> range,
  Value<String?> type,
  Value<int?> attacks,
  Value<String?> ballisticSkill,
  Value<int?> strength,
  Value<int?> armorPenetration,
  Value<String?> damage,
  Value<int> rowid,
});
typedef $$TdatasheetwargearTableUpdateCompanionBuilder
    = TdatasheetwargearCompanion Function({
  Value<int> datasheetId,
  Value<int?> line,
  Value<int> lineInWargear,
  Value<String?> dice,
  Value<String?> name,
  Value<String?> description,
  Value<int?> range,
  Value<String?> type,
  Value<int?> attacks,
  Value<String?> ballisticSkill,
  Value<int?> strength,
  Value<int?> armorPenetration,
  Value<String?> damage,
  Value<int> rowid,
});

final class $$TdatasheetwargearTableReferences extends BaseReferences<
    _$AppDatabase, $TdatasheetwargearTable, TdatasheetwargearData> {
  $$TdatasheetwargearTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TdatasheetTable _datasheetIdTable(_$AppDatabase db) =>
      db.tdatasheet.createAlias($_aliasNameGenerator(
          db.tdatasheetwargear.datasheetId, db.tdatasheet.id));

  $$TdatasheetTableProcessedTableManager get datasheetId {
    final $_column = $_itemColumn<int>('datasheet_id')!;

    final manager = $$TdatasheetTableTableManager($_db, $_db.tdatasheet)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_datasheetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TdatasheetwargearTableFilterComposer
    extends Composer<_$AppDatabase, $TdatasheetwargearTable> {
  $$TdatasheetwargearTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get line => $composableBuilder(
      column: $table.line, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lineInWargear => $composableBuilder(
      column: $table.lineInWargear, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dice => $composableBuilder(
      column: $table.dice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get range => $composableBuilder(
      column: $table.range, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attacks => $composableBuilder(
      column: $table.attacks, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ballisticSkill => $composableBuilder(
      column: $table.ballisticSkill,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get strength => $composableBuilder(
      column: $table.strength, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get armorPenetration => $composableBuilder(
      column: $table.armorPenetration,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get damage => $composableBuilder(
      column: $table.damage, builder: (column) => ColumnFilters(column));

  $$TdatasheetTableFilterComposer get datasheetId {
    final $$TdatasheetTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetwargearTableOrderingComposer
    extends Composer<_$AppDatabase, $TdatasheetwargearTable> {
  $$TdatasheetwargearTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get line => $composableBuilder(
      column: $table.line, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lineInWargear => $composableBuilder(
      column: $table.lineInWargear,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dice => $composableBuilder(
      column: $table.dice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get range => $composableBuilder(
      column: $table.range, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attacks => $composableBuilder(
      column: $table.attacks, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ballisticSkill => $composableBuilder(
      column: $table.ballisticSkill,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get strength => $composableBuilder(
      column: $table.strength, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get armorPenetration => $composableBuilder(
      column: $table.armorPenetration,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get damage => $composableBuilder(
      column: $table.damage, builder: (column) => ColumnOrderings(column));

  $$TdatasheetTableOrderingComposer get datasheetId {
    final $$TdatasheetTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableOrderingComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetwargearTableAnnotationComposer
    extends Composer<_$AppDatabase, $TdatasheetwargearTable> {
  $$TdatasheetwargearTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get line =>
      $composableBuilder(column: $table.line, builder: (column) => column);

  GeneratedColumn<int> get lineInWargear => $composableBuilder(
      column: $table.lineInWargear, builder: (column) => column);

  GeneratedColumn<String> get dice =>
      $composableBuilder(column: $table.dice, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get range =>
      $composableBuilder(column: $table.range, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get attacks =>
      $composableBuilder(column: $table.attacks, builder: (column) => column);

  GeneratedColumn<String> get ballisticSkill => $composableBuilder(
      column: $table.ballisticSkill, builder: (column) => column);

  GeneratedColumn<int> get strength =>
      $composableBuilder(column: $table.strength, builder: (column) => column);

  GeneratedColumn<int> get armorPenetration => $composableBuilder(
      column: $table.armorPenetration, builder: (column) => column);

  GeneratedColumn<String> get damage =>
      $composableBuilder(column: $table.damage, builder: (column) => column);

  $$TdatasheetTableAnnotationComposer get datasheetId {
    final $$TdatasheetTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetwargearTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TdatasheetwargearTable,
    TdatasheetwargearData,
    $$TdatasheetwargearTableFilterComposer,
    $$TdatasheetwargearTableOrderingComposer,
    $$TdatasheetwargearTableAnnotationComposer,
    $$TdatasheetwargearTableCreateCompanionBuilder,
    $$TdatasheetwargearTableUpdateCompanionBuilder,
    (TdatasheetwargearData, $$TdatasheetwargearTableReferences),
    TdatasheetwargearData,
    PrefetchHooks Function({bool datasheetId})> {
  $$TdatasheetwargearTableTableManager(
      _$AppDatabase db, $TdatasheetwargearTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TdatasheetwargearTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TdatasheetwargearTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TdatasheetwargearTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> datasheetId = const Value.absent(),
            Value<int?> line = const Value.absent(),
            Value<int> lineInWargear = const Value.absent(),
            Value<String?> dice = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> range = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<int?> attacks = const Value.absent(),
            Value<String?> ballisticSkill = const Value.absent(),
            Value<int?> strength = const Value.absent(),
            Value<int?> armorPenetration = const Value.absent(),
            Value<String?> damage = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetwargearCompanion(
            datasheetId: datasheetId,
            line: line,
            lineInWargear: lineInWargear,
            dice: dice,
            name: name,
            description: description,
            range: range,
            type: type,
            attacks: attacks,
            ballisticSkill: ballisticSkill,
            strength: strength,
            armorPenetration: armorPenetration,
            damage: damage,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int datasheetId,
            Value<int?> line = const Value.absent(),
            required int lineInWargear,
            Value<String?> dice = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> range = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<int?> attacks = const Value.absent(),
            Value<String?> ballisticSkill = const Value.absent(),
            Value<int?> strength = const Value.absent(),
            Value<int?> armorPenetration = const Value.absent(),
            Value<String?> damage = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetwargearCompanion.insert(
            datasheetId: datasheetId,
            line: line,
            lineInWargear: lineInWargear,
            dice: dice,
            name: name,
            description: description,
            range: range,
            type: type,
            attacks: attacks,
            ballisticSkill: ballisticSkill,
            strength: strength,
            armorPenetration: armorPenetration,
            damage: damage,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TdatasheetwargearTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({datasheetId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (datasheetId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.datasheetId,
                    referencedTable: $$TdatasheetwargearTableReferences
                        ._datasheetIdTable(db),
                    referencedColumn: $$TdatasheetwargearTableReferences
                        ._datasheetIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TdatasheetwargearTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TdatasheetwargearTable,
    TdatasheetwargearData,
    $$TdatasheetwargearTableFilterComposer,
    $$TdatasheetwargearTableOrderingComposer,
    $$TdatasheetwargearTableAnnotationComposer,
    $$TdatasheetwargearTableCreateCompanionBuilder,
    $$TdatasheetwargearTableUpdateCompanionBuilder,
    (TdatasheetwargearData, $$TdatasheetwargearTableReferences),
    TdatasheetwargearData,
    PrefetchHooks Function({bool datasheetId})>;
typedef $$TdatasheetkeywordTableCreateCompanionBuilder
    = TdatasheetkeywordCompanion Function({
  Value<int> id,
  required int datasheetId,
  Value<String?> keyword,
  Value<String?> model,
  required bool isFactionKeyword,
});
typedef $$TdatasheetkeywordTableUpdateCompanionBuilder
    = TdatasheetkeywordCompanion Function({
  Value<int> id,
  Value<int> datasheetId,
  Value<String?> keyword,
  Value<String?> model,
  Value<bool> isFactionKeyword,
});

final class $$TdatasheetkeywordTableReferences extends BaseReferences<
    _$AppDatabase, $TdatasheetkeywordTable, TdatasheetkeywordData> {
  $$TdatasheetkeywordTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TdatasheetTable _datasheetIdTable(_$AppDatabase db) =>
      db.tdatasheet.createAlias($_aliasNameGenerator(
          db.tdatasheetkeyword.datasheetId, db.tdatasheet.id));

  $$TdatasheetTableProcessedTableManager get datasheetId {
    final $_column = $_itemColumn<int>('datasheetId')!;

    final manager = $$TdatasheetTableTableManager($_db, $_db.tdatasheet)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_datasheetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TdatasheetkeywordTableFilterComposer
    extends Composer<_$AppDatabase, $TdatasheetkeywordTable> {
  $$TdatasheetkeywordTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get keyword => $composableBuilder(
      column: $table.keyword, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get model => $composableBuilder(
      column: $table.model, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFactionKeyword => $composableBuilder(
      column: $table.isFactionKeyword,
      builder: (column) => ColumnFilters(column));

  $$TdatasheetTableFilterComposer get datasheetId {
    final $$TdatasheetTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetkeywordTableOrderingComposer
    extends Composer<_$AppDatabase, $TdatasheetkeywordTable> {
  $$TdatasheetkeywordTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get keyword => $composableBuilder(
      column: $table.keyword, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get model => $composableBuilder(
      column: $table.model, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFactionKeyword => $composableBuilder(
      column: $table.isFactionKeyword,
      builder: (column) => ColumnOrderings(column));

  $$TdatasheetTableOrderingComposer get datasheetId {
    final $$TdatasheetTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableOrderingComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetkeywordTableAnnotationComposer
    extends Composer<_$AppDatabase, $TdatasheetkeywordTable> {
  $$TdatasheetkeywordTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get keyword =>
      $composableBuilder(column: $table.keyword, builder: (column) => column);

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<bool> get isFactionKeyword => $composableBuilder(
      column: $table.isFactionKeyword, builder: (column) => column);

  $$TdatasheetTableAnnotationComposer get datasheetId {
    final $$TdatasheetTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetkeywordTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TdatasheetkeywordTable,
    TdatasheetkeywordData,
    $$TdatasheetkeywordTableFilterComposer,
    $$TdatasheetkeywordTableOrderingComposer,
    $$TdatasheetkeywordTableAnnotationComposer,
    $$TdatasheetkeywordTableCreateCompanionBuilder,
    $$TdatasheetkeywordTableUpdateCompanionBuilder,
    (TdatasheetkeywordData, $$TdatasheetkeywordTableReferences),
    TdatasheetkeywordData,
    PrefetchHooks Function({bool datasheetId})> {
  $$TdatasheetkeywordTableTableManager(
      _$AppDatabase db, $TdatasheetkeywordTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TdatasheetkeywordTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TdatasheetkeywordTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TdatasheetkeywordTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> datasheetId = const Value.absent(),
            Value<String?> keyword = const Value.absent(),
            Value<String?> model = const Value.absent(),
            Value<bool> isFactionKeyword = const Value.absent(),
          }) =>
              TdatasheetkeywordCompanion(
            id: id,
            datasheetId: datasheetId,
            keyword: keyword,
            model: model,
            isFactionKeyword: isFactionKeyword,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int datasheetId,
            Value<String?> keyword = const Value.absent(),
            Value<String?> model = const Value.absent(),
            required bool isFactionKeyword,
          }) =>
              TdatasheetkeywordCompanion.insert(
            id: id,
            datasheetId: datasheetId,
            keyword: keyword,
            model: model,
            isFactionKeyword: isFactionKeyword,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TdatasheetkeywordTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({datasheetId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (datasheetId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.datasheetId,
                    referencedTable: $$TdatasheetkeywordTableReferences
                        ._datasheetIdTable(db),
                    referencedColumn: $$TdatasheetkeywordTableReferences
                        ._datasheetIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TdatasheetkeywordTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TdatasheetkeywordTable,
    TdatasheetkeywordData,
    $$TdatasheetkeywordTableFilterComposer,
    $$TdatasheetkeywordTableOrderingComposer,
    $$TdatasheetkeywordTableAnnotationComposer,
    $$TdatasheetkeywordTableCreateCompanionBuilder,
    $$TdatasheetkeywordTableUpdateCompanionBuilder,
    (TdatasheetkeywordData, $$TdatasheetkeywordTableReferences),
    TdatasheetkeywordData,
    PrefetchHooks Function({bool datasheetId})>;
typedef $$TdatasheetoptionTableCreateCompanionBuilder
    = TdatasheetoptionCompanion Function({
  required int datasheetId,
  required int line,
  Value<String?> button,
  Value<String?> description,
  Value<int> rowid,
});
typedef $$TdatasheetoptionTableUpdateCompanionBuilder
    = TdatasheetoptionCompanion Function({
  Value<int> datasheetId,
  Value<int> line,
  Value<String?> button,
  Value<String?> description,
  Value<int> rowid,
});

final class $$TdatasheetoptionTableReferences extends BaseReferences<
    _$AppDatabase, $TdatasheetoptionTable, TdatasheetoptionData> {
  $$TdatasheetoptionTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TdatasheetTable _datasheetIdTable(_$AppDatabase db) =>
      db.tdatasheet.createAlias($_aliasNameGenerator(
          db.tdatasheetoption.datasheetId, db.tdatasheet.id));

  $$TdatasheetTableProcessedTableManager get datasheetId {
    final $_column = $_itemColumn<int>('datasheet_id')!;

    final manager = $$TdatasheetTableTableManager($_db, $_db.tdatasheet)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_datasheetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TdatasheetoptionTableFilterComposer
    extends Composer<_$AppDatabase, $TdatasheetoptionTable> {
  $$TdatasheetoptionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get line => $composableBuilder(
      column: $table.line, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get button => $composableBuilder(
      column: $table.button, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  $$TdatasheetTableFilterComposer get datasheetId {
    final $$TdatasheetTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetoptionTableOrderingComposer
    extends Composer<_$AppDatabase, $TdatasheetoptionTable> {
  $$TdatasheetoptionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get line => $composableBuilder(
      column: $table.line, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get button => $composableBuilder(
      column: $table.button, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  $$TdatasheetTableOrderingComposer get datasheetId {
    final $$TdatasheetTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableOrderingComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetoptionTableAnnotationComposer
    extends Composer<_$AppDatabase, $TdatasheetoptionTable> {
  $$TdatasheetoptionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get line =>
      $composableBuilder(column: $table.line, builder: (column) => column);

  GeneratedColumn<String> get button =>
      $composableBuilder(column: $table.button, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  $$TdatasheetTableAnnotationComposer get datasheetId {
    final $$TdatasheetTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetoptionTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TdatasheetoptionTable,
    TdatasheetoptionData,
    $$TdatasheetoptionTableFilterComposer,
    $$TdatasheetoptionTableOrderingComposer,
    $$TdatasheetoptionTableAnnotationComposer,
    $$TdatasheetoptionTableCreateCompanionBuilder,
    $$TdatasheetoptionTableUpdateCompanionBuilder,
    (TdatasheetoptionData, $$TdatasheetoptionTableReferences),
    TdatasheetoptionData,
    PrefetchHooks Function({bool datasheetId})> {
  $$TdatasheetoptionTableTableManager(
      _$AppDatabase db, $TdatasheetoptionTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TdatasheetoptionTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TdatasheetoptionTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TdatasheetoptionTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> datasheetId = const Value.absent(),
            Value<int> line = const Value.absent(),
            Value<String?> button = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetoptionCompanion(
            datasheetId: datasheetId,
            line: line,
            button: button,
            description: description,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int datasheetId,
            required int line,
            Value<String?> button = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetoptionCompanion.insert(
            datasheetId: datasheetId,
            line: line,
            button: button,
            description: description,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TdatasheetoptionTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({datasheetId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (datasheetId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.datasheetId,
                    referencedTable:
                        $$TdatasheetoptionTableReferences._datasheetIdTable(db),
                    referencedColumn: $$TdatasheetoptionTableReferences
                        ._datasheetIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TdatasheetoptionTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TdatasheetoptionTable,
    TdatasheetoptionData,
    $$TdatasheetoptionTableFilterComposer,
    $$TdatasheetoptionTableOrderingComposer,
    $$TdatasheetoptionTableAnnotationComposer,
    $$TdatasheetoptionTableCreateCompanionBuilder,
    $$TdatasheetoptionTableUpdateCompanionBuilder,
    (TdatasheetoptionData, $$TdatasheetoptionTableReferences),
    TdatasheetoptionData,
    PrefetchHooks Function({bool datasheetId})>;
typedef $$TdatasheetleaderTableCreateCompanionBuilder
    = TdatasheetleaderCompanion Function({
  required int leaderId,
  required int attachedId,
  Value<int> rowid,
});
typedef $$TdatasheetleaderTableUpdateCompanionBuilder
    = TdatasheetleaderCompanion Function({
  Value<int> leaderId,
  Value<int> attachedId,
  Value<int> rowid,
});

final class $$TdatasheetleaderTableReferences extends BaseReferences<
    _$AppDatabase, $TdatasheetleaderTable, TdatasheetleaderData> {
  $$TdatasheetleaderTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TdatasheetTable _leaderIdTable(_$AppDatabase db) =>
      db.tdatasheet.createAlias(
          $_aliasNameGenerator(db.tdatasheetleader.leaderId, db.tdatasheet.id));

  $$TdatasheetTableProcessedTableManager get leaderId {
    final $_column = $_itemColumn<int>('leader_id')!;

    final manager = $$TdatasheetTableTableManager($_db, $_db.tdatasheet)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_leaderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TdatasheetTable _attachedIdTable(_$AppDatabase db) =>
      db.tdatasheet.createAlias($_aliasNameGenerator(
          db.tdatasheetleader.attachedId, db.tdatasheet.id));

  $$TdatasheetTableProcessedTableManager get attachedId {
    final $_column = $_itemColumn<int>('attached_id')!;

    final manager = $$TdatasheetTableTableManager($_db, $_db.tdatasheet)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_attachedIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TdatasheetleaderTableFilterComposer
    extends Composer<_$AppDatabase, $TdatasheetleaderTable> {
  $$TdatasheetleaderTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TdatasheetTableFilterComposer get leaderId {
    final $$TdatasheetTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.leaderId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TdatasheetTableFilterComposer get attachedId {
    final $$TdatasheetTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.attachedId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetleaderTableOrderingComposer
    extends Composer<_$AppDatabase, $TdatasheetleaderTable> {
  $$TdatasheetleaderTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TdatasheetTableOrderingComposer get leaderId {
    final $$TdatasheetTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.leaderId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableOrderingComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TdatasheetTableOrderingComposer get attachedId {
    final $$TdatasheetTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.attachedId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableOrderingComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetleaderTableAnnotationComposer
    extends Composer<_$AppDatabase, $TdatasheetleaderTable> {
  $$TdatasheetleaderTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TdatasheetTableAnnotationComposer get leaderId {
    final $$TdatasheetTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.leaderId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TdatasheetTableAnnotationComposer get attachedId {
    final $$TdatasheetTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.attachedId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetleaderTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TdatasheetleaderTable,
    TdatasheetleaderData,
    $$TdatasheetleaderTableFilterComposer,
    $$TdatasheetleaderTableOrderingComposer,
    $$TdatasheetleaderTableAnnotationComposer,
    $$TdatasheetleaderTableCreateCompanionBuilder,
    $$TdatasheetleaderTableUpdateCompanionBuilder,
    (TdatasheetleaderData, $$TdatasheetleaderTableReferences),
    TdatasheetleaderData,
    PrefetchHooks Function({bool leaderId, bool attachedId})> {
  $$TdatasheetleaderTableTableManager(
      _$AppDatabase db, $TdatasheetleaderTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TdatasheetleaderTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TdatasheetleaderTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TdatasheetleaderTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> leaderId = const Value.absent(),
            Value<int> attachedId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetleaderCompanion(
            leaderId: leaderId,
            attachedId: attachedId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int leaderId,
            required int attachedId,
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetleaderCompanion.insert(
            leaderId: leaderId,
            attachedId: attachedId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TdatasheetleaderTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({leaderId = false, attachedId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (leaderId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.leaderId,
                    referencedTable:
                        $$TdatasheetleaderTableReferences._leaderIdTable(db),
                    referencedColumn:
                        $$TdatasheetleaderTableReferences._leaderIdTable(db).id,
                  ) as T;
                }
                if (attachedId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.attachedId,
                    referencedTable:
                        $$TdatasheetleaderTableReferences._attachedIdTable(db),
                    referencedColumn: $$TdatasheetleaderTableReferences
                        ._attachedIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TdatasheetleaderTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TdatasheetleaderTable,
    TdatasheetleaderData,
    $$TdatasheetleaderTableFilterComposer,
    $$TdatasheetleaderTableOrderingComposer,
    $$TdatasheetleaderTableAnnotationComposer,
    $$TdatasheetleaderTableCreateCompanionBuilder,
    $$TdatasheetleaderTableUpdateCompanionBuilder,
    (TdatasheetleaderData, $$TdatasheetleaderTableReferences),
    TdatasheetleaderData,
    PrefetchHooks Function({bool leaderId, bool attachedId})>;
typedef $$TdatasheetstratagemTableCreateCompanionBuilder
    = TdatasheetstratagemCompanion Function({
  required int datasheetId,
  required int stratagemId,
  Value<int> rowid,
});
typedef $$TdatasheetstratagemTableUpdateCompanionBuilder
    = TdatasheetstratagemCompanion Function({
  Value<int> datasheetId,
  Value<int> stratagemId,
  Value<int> rowid,
});

final class $$TdatasheetstratagemTableReferences extends BaseReferences<
    _$AppDatabase, $TdatasheetstratagemTable, TdatasheetstratagemData> {
  $$TdatasheetstratagemTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TdatasheetTable _datasheetIdTable(_$AppDatabase db) =>
      db.tdatasheet.createAlias($_aliasNameGenerator(
          db.tdatasheetstratagem.datasheetId, db.tdatasheet.id));

  $$TdatasheetTableProcessedTableManager get datasheetId {
    final $_column = $_itemColumn<int>('datasheet_id')!;

    final manager = $$TdatasheetTableTableManager($_db, $_db.tdatasheet)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_datasheetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TstratagemTable _stratagemIdTable(_$AppDatabase db) =>
      db.tstratagem.createAlias($_aliasNameGenerator(
          db.tdatasheetstratagem.stratagemId, db.tstratagem.id));

  $$TstratagemTableProcessedTableManager get stratagemId {
    final $_column = $_itemColumn<int>('stratagem_id')!;

    final manager = $$TstratagemTableTableManager($_db, $_db.tstratagem)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_stratagemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TdatasheetstratagemTableFilterComposer
    extends Composer<_$AppDatabase, $TdatasheetstratagemTable> {
  $$TdatasheetstratagemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TdatasheetTableFilterComposer get datasheetId {
    final $$TdatasheetTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TstratagemTableFilterComposer get stratagemId {
    final $$TstratagemTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.stratagemId,
        referencedTable: $db.tstratagem,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TstratagemTableFilterComposer(
              $db: $db,
              $table: $db.tstratagem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetstratagemTableOrderingComposer
    extends Composer<_$AppDatabase, $TdatasheetstratagemTable> {
  $$TdatasheetstratagemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TdatasheetTableOrderingComposer get datasheetId {
    final $$TdatasheetTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableOrderingComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TstratagemTableOrderingComposer get stratagemId {
    final $$TstratagemTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.stratagemId,
        referencedTable: $db.tstratagem,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TstratagemTableOrderingComposer(
              $db: $db,
              $table: $db.tstratagem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetstratagemTableAnnotationComposer
    extends Composer<_$AppDatabase, $TdatasheetstratagemTable> {
  $$TdatasheetstratagemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TdatasheetTableAnnotationComposer get datasheetId {
    final $$TdatasheetTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TstratagemTableAnnotationComposer get stratagemId {
    final $$TstratagemTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.stratagemId,
        referencedTable: $db.tstratagem,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TstratagemTableAnnotationComposer(
              $db: $db,
              $table: $db.tstratagem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetstratagemTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TdatasheetstratagemTable,
    TdatasheetstratagemData,
    $$TdatasheetstratagemTableFilterComposer,
    $$TdatasheetstratagemTableOrderingComposer,
    $$TdatasheetstratagemTableAnnotationComposer,
    $$TdatasheetstratagemTableCreateCompanionBuilder,
    $$TdatasheetstratagemTableUpdateCompanionBuilder,
    (TdatasheetstratagemData, $$TdatasheetstratagemTableReferences),
    TdatasheetstratagemData,
    PrefetchHooks Function({bool datasheetId, bool stratagemId})> {
  $$TdatasheetstratagemTableTableManager(
      _$AppDatabase db, $TdatasheetstratagemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TdatasheetstratagemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TdatasheetstratagemTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TdatasheetstratagemTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> datasheetId = const Value.absent(),
            Value<int> stratagemId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetstratagemCompanion(
            datasheetId: datasheetId,
            stratagemId: stratagemId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int datasheetId,
            required int stratagemId,
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetstratagemCompanion.insert(
            datasheetId: datasheetId,
            stratagemId: stratagemId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TdatasheetstratagemTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({datasheetId = false, stratagemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (datasheetId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.datasheetId,
                    referencedTable: $$TdatasheetstratagemTableReferences
                        ._datasheetIdTable(db),
                    referencedColumn: $$TdatasheetstratagemTableReferences
                        ._datasheetIdTable(db)
                        .id,
                  ) as T;
                }
                if (stratagemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.stratagemId,
                    referencedTable: $$TdatasheetstratagemTableReferences
                        ._stratagemIdTable(db),
                    referencedColumn: $$TdatasheetstratagemTableReferences
                        ._stratagemIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TdatasheetstratagemTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TdatasheetstratagemTable,
    TdatasheetstratagemData,
    $$TdatasheetstratagemTableFilterComposer,
    $$TdatasheetstratagemTableOrderingComposer,
    $$TdatasheetstratagemTableAnnotationComposer,
    $$TdatasheetstratagemTableCreateCompanionBuilder,
    $$TdatasheetstratagemTableUpdateCompanionBuilder,
    (TdatasheetstratagemData, $$TdatasheetstratagemTableReferences),
    TdatasheetstratagemData,
    PrefetchHooks Function({bool datasheetId, bool stratagemId})>;
typedef $$TdatasheetenhancementTableCreateCompanionBuilder
    = TdatasheetenhancementCompanion Function({
  required int datasheetId,
  required int enhancementId,
  Value<int> rowid,
});
typedef $$TdatasheetenhancementTableUpdateCompanionBuilder
    = TdatasheetenhancementCompanion Function({
  Value<int> datasheetId,
  Value<int> enhancementId,
  Value<int> rowid,
});

final class $$TdatasheetenhancementTableReferences extends BaseReferences<
    _$AppDatabase, $TdatasheetenhancementTable, TdatasheetenhancementData> {
  $$TdatasheetenhancementTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TdatasheetTable _datasheetIdTable(_$AppDatabase db) =>
      db.tdatasheet.createAlias($_aliasNameGenerator(
          db.tdatasheetenhancement.datasheetId, db.tdatasheet.id));

  $$TdatasheetTableProcessedTableManager get datasheetId {
    final $_column = $_itemColumn<int>('datasheet_id')!;

    final manager = $$TdatasheetTableTableManager($_db, $_db.tdatasheet)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_datasheetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TenhancementTable _enhancementIdTable(_$AppDatabase db) =>
      db.tenhancement.createAlias($_aliasNameGenerator(
          db.tdatasheetenhancement.enhancementId, db.tenhancement.id));

  $$TenhancementTableProcessedTableManager get enhancementId {
    final $_column = $_itemColumn<int>('enhancement_id')!;

    final manager = $$TenhancementTableTableManager($_db, $_db.tenhancement)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_enhancementIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TdatasheetenhancementTableFilterComposer
    extends Composer<_$AppDatabase, $TdatasheetenhancementTable> {
  $$TdatasheetenhancementTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TdatasheetTableFilterComposer get datasheetId {
    final $$TdatasheetTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TenhancementTableFilterComposer get enhancementId {
    final $$TenhancementTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.enhancementId,
        referencedTable: $db.tenhancement,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TenhancementTableFilterComposer(
              $db: $db,
              $table: $db.tenhancement,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetenhancementTableOrderingComposer
    extends Composer<_$AppDatabase, $TdatasheetenhancementTable> {
  $$TdatasheetenhancementTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TdatasheetTableOrderingComposer get datasheetId {
    final $$TdatasheetTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableOrderingComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TenhancementTableOrderingComposer get enhancementId {
    final $$TenhancementTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.enhancementId,
        referencedTable: $db.tenhancement,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TenhancementTableOrderingComposer(
              $db: $db,
              $table: $db.tenhancement,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetenhancementTableAnnotationComposer
    extends Composer<_$AppDatabase, $TdatasheetenhancementTable> {
  $$TdatasheetenhancementTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TdatasheetTableAnnotationComposer get datasheetId {
    final $$TdatasheetTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TenhancementTableAnnotationComposer get enhancementId {
    final $$TenhancementTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.enhancementId,
        referencedTable: $db.tenhancement,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TenhancementTableAnnotationComposer(
              $db: $db,
              $table: $db.tenhancement,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetenhancementTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TdatasheetenhancementTable,
    TdatasheetenhancementData,
    $$TdatasheetenhancementTableFilterComposer,
    $$TdatasheetenhancementTableOrderingComposer,
    $$TdatasheetenhancementTableAnnotationComposer,
    $$TdatasheetenhancementTableCreateCompanionBuilder,
    $$TdatasheetenhancementTableUpdateCompanionBuilder,
    (TdatasheetenhancementData, $$TdatasheetenhancementTableReferences),
    TdatasheetenhancementData,
    PrefetchHooks Function({bool datasheetId, bool enhancementId})> {
  $$TdatasheetenhancementTableTableManager(
      _$AppDatabase db, $TdatasheetenhancementTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TdatasheetenhancementTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$TdatasheetenhancementTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TdatasheetenhancementTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> datasheetId = const Value.absent(),
            Value<int> enhancementId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetenhancementCompanion(
            datasheetId: datasheetId,
            enhancementId: enhancementId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int datasheetId,
            required int enhancementId,
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetenhancementCompanion.insert(
            datasheetId: datasheetId,
            enhancementId: enhancementId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TdatasheetenhancementTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {datasheetId = false, enhancementId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (datasheetId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.datasheetId,
                    referencedTable: $$TdatasheetenhancementTableReferences
                        ._datasheetIdTable(db),
                    referencedColumn: $$TdatasheetenhancementTableReferences
                        ._datasheetIdTable(db)
                        .id,
                  ) as T;
                }
                if (enhancementId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.enhancementId,
                    referencedTable: $$TdatasheetenhancementTableReferences
                        ._enhancementIdTable(db),
                    referencedColumn: $$TdatasheetenhancementTableReferences
                        ._enhancementIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TdatasheetenhancementTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $TdatasheetenhancementTable,
        TdatasheetenhancementData,
        $$TdatasheetenhancementTableFilterComposer,
        $$TdatasheetenhancementTableOrderingComposer,
        $$TdatasheetenhancementTableAnnotationComposer,
        $$TdatasheetenhancementTableCreateCompanionBuilder,
        $$TdatasheetenhancementTableUpdateCompanionBuilder,
        (TdatasheetenhancementData, $$TdatasheetenhancementTableReferences),
        TdatasheetenhancementData,
        PrefetchHooks Function({bool datasheetId, bool enhancementId})>;
typedef $$TdetachmentabilityTableCreateCompanionBuilder
    = TdetachmentabilityCompanion Function({
  Value<int> id,
  required String factionId,
  required String name,
  Value<String?> legend,
  Value<String?> description,
  Value<String?> detachment,
  Value<int?> detachmentId,
});
typedef $$TdetachmentabilityTableUpdateCompanionBuilder
    = TdetachmentabilityCompanion Function({
  Value<int> id,
  Value<String> factionId,
  Value<String> name,
  Value<String?> legend,
  Value<String?> description,
  Value<String?> detachment,
  Value<int?> detachmentId,
});

final class $$TdetachmentabilityTableReferences extends BaseReferences<
    _$AppDatabase, $TdetachmentabilityTable, TdetachmentabilityData> {
  $$TdetachmentabilityTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TfactionTable _factionIdTable(_$AppDatabase db) =>
      db.tfaction.createAlias($_aliasNameGenerator(
          db.tdetachmentability.factionId, db.tfaction.id));

  $$TfactionTableProcessedTableManager get factionId {
    final $_column = $_itemColumn<String>('faction_id')!;

    final manager = $$TfactionTableTableManager($_db, $_db.tfaction)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_factionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TdetachmentTable _detachmentIdTable(_$AppDatabase db) =>
      db.tdetachment.createAlias($_aliasNameGenerator(
          db.tdetachmentability.detachmentId, db.tdetachment.id));

  $$TdetachmentTableProcessedTableManager? get detachmentId {
    final $_column = $_itemColumn<int>('detachment_id');
    if ($_column == null) return null;
    final manager = $$TdetachmentTableTableManager($_db, $_db.tdetachment)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_detachmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TdatasheetdetachmentabilityTable,
          List<TdatasheetdetachmentabilityData>>
      _tdatasheetdetachmentabilityRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.tdatasheetdetachmentability,
              aliasName: $_aliasNameGenerator(db.tdetachmentability.id,
                  db.tdatasheetdetachmentability.detachmentAbilityId));

  $$TdatasheetdetachmentabilityTableProcessedTableManager
      get tdatasheetdetachmentabilityRefs {
    final manager = $$TdatasheetdetachmentabilityTableTableManager(
            $_db, $_db.tdatasheetdetachmentability)
        .filter((f) =>
            f.detachmentAbilityId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_tdatasheetdetachmentabilityRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TdetachmentabilityTableFilterComposer
    extends Composer<_$AppDatabase, $TdetachmentabilityTable> {
  $$TdetachmentabilityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get legend => $composableBuilder(
      column: $table.legend, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get detachment => $composableBuilder(
      column: $table.detachment, builder: (column) => ColumnFilters(column));

  $$TfactionTableFilterComposer get factionId {
    final $$TfactionTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableFilterComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TdetachmentTableFilterComposer get detachmentId {
    final $$TdetachmentTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.detachmentId,
        referencedTable: $db.tdetachment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentTableFilterComposer(
              $db: $db,
              $table: $db.tdetachment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> tdatasheetdetachmentabilityRefs(
      Expression<bool> Function(
              $$TdatasheetdetachmentabilityTableFilterComposer f)
          f) {
    final $$TdatasheetdetachmentabilityTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetdetachmentability,
            getReferencedColumn: (t) => t.detachmentAbilityId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetdetachmentabilityTableFilterComposer(
                  $db: $db,
                  $table: $db.tdatasheetdetachmentability,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TdetachmentabilityTableOrderingComposer
    extends Composer<_$AppDatabase, $TdetachmentabilityTable> {
  $$TdetachmentabilityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get legend => $composableBuilder(
      column: $table.legend, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get detachment => $composableBuilder(
      column: $table.detachment, builder: (column) => ColumnOrderings(column));

  $$TfactionTableOrderingComposer get factionId {
    final $$TfactionTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableOrderingComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TdetachmentTableOrderingComposer get detachmentId {
    final $$TdetachmentTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.detachmentId,
        referencedTable: $db.tdetachment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentTableOrderingComposer(
              $db: $db,
              $table: $db.tdetachment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdetachmentabilityTableAnnotationComposer
    extends Composer<_$AppDatabase, $TdetachmentabilityTable> {
  $$TdetachmentabilityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get legend =>
      $composableBuilder(column: $table.legend, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get detachment => $composableBuilder(
      column: $table.detachment, builder: (column) => column);

  $$TfactionTableAnnotationComposer get factionId {
    final $$TfactionTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.factionId,
        referencedTable: $db.tfaction,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TfactionTableAnnotationComposer(
              $db: $db,
              $table: $db.tfaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TdetachmentTableAnnotationComposer get detachmentId {
    final $$TdetachmentTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.detachmentId,
        referencedTable: $db.tdetachment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentTableAnnotationComposer(
              $db: $db,
              $table: $db.tdetachment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> tdatasheetdetachmentabilityRefs<T extends Object>(
      Expression<T> Function(
              $$TdatasheetdetachmentabilityTableAnnotationComposer a)
          f) {
    final $$TdatasheetdetachmentabilityTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.tdatasheetdetachmentability,
            getReferencedColumn: (t) => t.detachmentAbilityId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdatasheetdetachmentabilityTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tdatasheetdetachmentability,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TdetachmentabilityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TdetachmentabilityTable,
    TdetachmentabilityData,
    $$TdetachmentabilityTableFilterComposer,
    $$TdetachmentabilityTableOrderingComposer,
    $$TdetachmentabilityTableAnnotationComposer,
    $$TdetachmentabilityTableCreateCompanionBuilder,
    $$TdetachmentabilityTableUpdateCompanionBuilder,
    (TdetachmentabilityData, $$TdetachmentabilityTableReferences),
    TdetachmentabilityData,
    PrefetchHooks Function(
        {bool factionId,
        bool detachmentId,
        bool tdatasheetdetachmentabilityRefs})> {
  $$TdetachmentabilityTableTableManager(
      _$AppDatabase db, $TdetachmentabilityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TdetachmentabilityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TdetachmentabilityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TdetachmentabilityTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> factionId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> legend = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> detachment = const Value.absent(),
            Value<int?> detachmentId = const Value.absent(),
          }) =>
              TdetachmentabilityCompanion(
            id: id,
            factionId: factionId,
            name: name,
            legend: legend,
            description: description,
            detachment: detachment,
            detachmentId: detachmentId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String factionId,
            required String name,
            Value<String?> legend = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> detachment = const Value.absent(),
            Value<int?> detachmentId = const Value.absent(),
          }) =>
              TdetachmentabilityCompanion.insert(
            id: id,
            factionId: factionId,
            name: name,
            legend: legend,
            description: description,
            detachment: detachment,
            detachmentId: detachmentId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TdetachmentabilityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {factionId = false,
              detachmentId = false,
              tdatasheetdetachmentabilityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tdatasheetdetachmentabilityRefs)
                  db.tdatasheetdetachmentability
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (factionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.factionId,
                    referencedTable:
                        $$TdetachmentabilityTableReferences._factionIdTable(db),
                    referencedColumn: $$TdetachmentabilityTableReferences
                        ._factionIdTable(db)
                        .id,
                  ) as T;
                }
                if (detachmentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.detachmentId,
                    referencedTable: $$TdetachmentabilityTableReferences
                        ._detachmentIdTable(db),
                    referencedColumn: $$TdetachmentabilityTableReferences
                        ._detachmentIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tdatasheetdetachmentabilityRefs)
                    await $_getPrefetchedData<
                            TdetachmentabilityData,
                            $TdetachmentabilityTable,
                            TdatasheetdetachmentabilityData>(
                        currentTable: table,
                        referencedTable: $$TdetachmentabilityTableReferences
                            ._tdatasheetdetachmentabilityRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TdetachmentabilityTableReferences(db, table, p0)
                                .tdatasheetdetachmentabilityRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.detachmentAbilityId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TdetachmentabilityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TdetachmentabilityTable,
    TdetachmentabilityData,
    $$TdetachmentabilityTableFilterComposer,
    $$TdetachmentabilityTableOrderingComposer,
    $$TdetachmentabilityTableAnnotationComposer,
    $$TdetachmentabilityTableCreateCompanionBuilder,
    $$TdetachmentabilityTableUpdateCompanionBuilder,
    (TdetachmentabilityData, $$TdetachmentabilityTableReferences),
    TdetachmentabilityData,
    PrefetchHooks Function(
        {bool factionId,
        bool detachmentId,
        bool tdatasheetdetachmentabilityRefs})>;
typedef $$TdatasheetdetachmentabilityTableCreateCompanionBuilder
    = TdatasheetdetachmentabilityCompanion Function({
  required int datasheetId,
  required int detachmentAbilityId,
  Value<int> rowid,
});
typedef $$TdatasheetdetachmentabilityTableUpdateCompanionBuilder
    = TdatasheetdetachmentabilityCompanion Function({
  Value<int> datasheetId,
  Value<int> detachmentAbilityId,
  Value<int> rowid,
});

final class $$TdatasheetdetachmentabilityTableReferences extends BaseReferences<
    _$AppDatabase,
    $TdatasheetdetachmentabilityTable,
    TdatasheetdetachmentabilityData> {
  $$TdatasheetdetachmentabilityTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TdatasheetTable _datasheetIdTable(_$AppDatabase db) =>
      db.tdatasheet.createAlias($_aliasNameGenerator(
          db.tdatasheetdetachmentability.datasheetId, db.tdatasheet.id));

  $$TdatasheetTableProcessedTableManager get datasheetId {
    final $_column = $_itemColumn<int>('datasheetId')!;

    final manager = $$TdatasheetTableTableManager($_db, $_db.tdatasheet)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_datasheetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TdetachmentabilityTable _detachmentAbilityIdTable(_$AppDatabase db) =>
      db.tdetachmentability.createAlias($_aliasNameGenerator(
          db.tdatasheetdetachmentability.detachmentAbilityId,
          db.tdetachmentability.id));

  $$TdetachmentabilityTableProcessedTableManager get detachmentAbilityId {
    final $_column = $_itemColumn<int>('detachmentAbilityId')!;

    final manager =
        $$TdetachmentabilityTableTableManager($_db, $_db.tdetachmentability)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_detachmentAbilityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TdatasheetdetachmentabilityTableFilterComposer
    extends Composer<_$AppDatabase, $TdatasheetdetachmentabilityTable> {
  $$TdatasheetdetachmentabilityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TdatasheetTableFilterComposer get datasheetId {
    final $$TdatasheetTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TdetachmentabilityTableFilterComposer get detachmentAbilityId {
    final $$TdetachmentabilityTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.detachmentAbilityId,
        referencedTable: $db.tdetachmentability,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentabilityTableFilterComposer(
              $db: $db,
              $table: $db.tdetachmentability,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetdetachmentabilityTableOrderingComposer
    extends Composer<_$AppDatabase, $TdatasheetdetachmentabilityTable> {
  $$TdatasheetdetachmentabilityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TdatasheetTableOrderingComposer get datasheetId {
    final $$TdatasheetTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableOrderingComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TdetachmentabilityTableOrderingComposer get detachmentAbilityId {
    final $$TdetachmentabilityTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.detachmentAbilityId,
        referencedTable: $db.tdetachmentability,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdetachmentabilityTableOrderingComposer(
              $db: $db,
              $table: $db.tdetachmentability,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetdetachmentabilityTableAnnotationComposer
    extends Composer<_$AppDatabase, $TdatasheetdetachmentabilityTable> {
  $$TdatasheetdetachmentabilityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TdatasheetTableAnnotationComposer get datasheetId {
    final $$TdatasheetTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TdetachmentabilityTableAnnotationComposer get detachmentAbilityId {
    final $$TdetachmentabilityTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.detachmentAbilityId,
            referencedTable: $db.tdetachmentability,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TdetachmentabilityTableAnnotationComposer(
                  $db: $db,
                  $table: $db.tdetachmentability,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$TdatasheetdetachmentabilityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TdatasheetdetachmentabilityTable,
    TdatasheetdetachmentabilityData,
    $$TdatasheetdetachmentabilityTableFilterComposer,
    $$TdatasheetdetachmentabilityTableOrderingComposer,
    $$TdatasheetdetachmentabilityTableAnnotationComposer,
    $$TdatasheetdetachmentabilityTableCreateCompanionBuilder,
    $$TdatasheetdetachmentabilityTableUpdateCompanionBuilder,
    (
      TdatasheetdetachmentabilityData,
      $$TdatasheetdetachmentabilityTableReferences
    ),
    TdatasheetdetachmentabilityData,
    PrefetchHooks Function({bool datasheetId, bool detachmentAbilityId})> {
  $$TdatasheetdetachmentabilityTableTableManager(
      _$AppDatabase db, $TdatasheetdetachmentabilityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TdatasheetdetachmentabilityTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$TdatasheetdetachmentabilityTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TdatasheetdetachmentabilityTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> datasheetId = const Value.absent(),
            Value<int> detachmentAbilityId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetdetachmentabilityCompanion(
            datasheetId: datasheetId,
            detachmentAbilityId: detachmentAbilityId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int datasheetId,
            required int detachmentAbilityId,
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetdetachmentabilityCompanion.insert(
            datasheetId: datasheetId,
            detachmentAbilityId: detachmentAbilityId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TdatasheetdetachmentabilityTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {datasheetId = false, detachmentAbilityId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (datasheetId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.datasheetId,
                    referencedTable:
                        $$TdatasheetdetachmentabilityTableReferences
                            ._datasheetIdTable(db),
                    referencedColumn:
                        $$TdatasheetdetachmentabilityTableReferences
                            ._datasheetIdTable(db)
                            .id,
                  ) as T;
                }
                if (detachmentAbilityId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.detachmentAbilityId,
                    referencedTable:
                        $$TdatasheetdetachmentabilityTableReferences
                            ._detachmentAbilityIdTable(db),
                    referencedColumn:
                        $$TdatasheetdetachmentabilityTableReferences
                            ._detachmentAbilityIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TdatasheetdetachmentabilityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TdatasheetdetachmentabilityTable,
    TdatasheetdetachmentabilityData,
    $$TdatasheetdetachmentabilityTableFilterComposer,
    $$TdatasheetdetachmentabilityTableOrderingComposer,
    $$TdatasheetdetachmentabilityTableAnnotationComposer,
    $$TdatasheetdetachmentabilityTableCreateCompanionBuilder,
    $$TdatasheetdetachmentabilityTableUpdateCompanionBuilder,
    (
      TdatasheetdetachmentabilityData,
      $$TdatasheetdetachmentabilityTableReferences
    ),
    TdatasheetdetachmentabilityData,
    PrefetchHooks Function({bool datasheetId, bool detachmentAbilityId})>;
typedef $$TdatasheetunitcompositionTableCreateCompanionBuilder
    = TdatasheetunitcompositionCompanion Function({
  required int datasheetId,
  required int line,
  Value<String?> description,
  Value<int> rowid,
});
typedef $$TdatasheetunitcompositionTableUpdateCompanionBuilder
    = TdatasheetunitcompositionCompanion Function({
  Value<int> datasheetId,
  Value<int> line,
  Value<String?> description,
  Value<int> rowid,
});

final class $$TdatasheetunitcompositionTableReferences extends BaseReferences<
    _$AppDatabase,
    $TdatasheetunitcompositionTable,
    TdatasheetunitcompositionData> {
  $$TdatasheetunitcompositionTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TdatasheetTable _datasheetIdTable(_$AppDatabase db) =>
      db.tdatasheet.createAlias($_aliasNameGenerator(
          db.tdatasheetunitcomposition.datasheetId, db.tdatasheet.id));

  $$TdatasheetTableProcessedTableManager get datasheetId {
    final $_column = $_itemColumn<int>('datasheet_id')!;

    final manager = $$TdatasheetTableTableManager($_db, $_db.tdatasheet)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_datasheetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TdatasheetunitcompositionTableFilterComposer
    extends Composer<_$AppDatabase, $TdatasheetunitcompositionTable> {
  $$TdatasheetunitcompositionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get line => $composableBuilder(
      column: $table.line, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  $$TdatasheetTableFilterComposer get datasheetId {
    final $$TdatasheetTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetunitcompositionTableOrderingComposer
    extends Composer<_$AppDatabase, $TdatasheetunitcompositionTable> {
  $$TdatasheetunitcompositionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get line => $composableBuilder(
      column: $table.line, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  $$TdatasheetTableOrderingComposer get datasheetId {
    final $$TdatasheetTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableOrderingComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetunitcompositionTableAnnotationComposer
    extends Composer<_$AppDatabase, $TdatasheetunitcompositionTable> {
  $$TdatasheetunitcompositionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get line =>
      $composableBuilder(column: $table.line, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  $$TdatasheetTableAnnotationComposer get datasheetId {
    final $$TdatasheetTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetunitcompositionTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TdatasheetunitcompositionTable,
    TdatasheetunitcompositionData,
    $$TdatasheetunitcompositionTableFilterComposer,
    $$TdatasheetunitcompositionTableOrderingComposer,
    $$TdatasheetunitcompositionTableAnnotationComposer,
    $$TdatasheetunitcompositionTableCreateCompanionBuilder,
    $$TdatasheetunitcompositionTableUpdateCompanionBuilder,
    (TdatasheetunitcompositionData, $$TdatasheetunitcompositionTableReferences),
    TdatasheetunitcompositionData,
    PrefetchHooks Function({bool datasheetId})> {
  $$TdatasheetunitcompositionTableTableManager(
      _$AppDatabase db, $TdatasheetunitcompositionTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TdatasheetunitcompositionTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$TdatasheetunitcompositionTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TdatasheetunitcompositionTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> datasheetId = const Value.absent(),
            Value<int> line = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetunitcompositionCompanion(
            datasheetId: datasheetId,
            line: line,
            description: description,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int datasheetId,
            required int line,
            Value<String?> description = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetunitcompositionCompanion.insert(
            datasheetId: datasheetId,
            line: line,
            description: description,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TdatasheetunitcompositionTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({datasheetId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (datasheetId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.datasheetId,
                    referencedTable: $$TdatasheetunitcompositionTableReferences
                        ._datasheetIdTable(db),
                    referencedColumn: $$TdatasheetunitcompositionTableReferences
                        ._datasheetIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TdatasheetunitcompositionTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $TdatasheetunitcompositionTable,
        TdatasheetunitcompositionData,
        $$TdatasheetunitcompositionTableFilterComposer,
        $$TdatasheetunitcompositionTableOrderingComposer,
        $$TdatasheetunitcompositionTableAnnotationComposer,
        $$TdatasheetunitcompositionTableCreateCompanionBuilder,
        $$TdatasheetunitcompositionTableUpdateCompanionBuilder,
        (
          TdatasheetunitcompositionData,
          $$TdatasheetunitcompositionTableReferences
        ),
        TdatasheetunitcompositionData,
        PrefetchHooks Function({bool datasheetId})>;
typedef $$TdatasheetmodelcostTableCreateCompanionBuilder
    = TdatasheetmodelcostCompanion Function({
  required int datasheetId,
  required int line,
  Value<String?> description,
  Value<int?> cost,
  Value<int> rowid,
});
typedef $$TdatasheetmodelcostTableUpdateCompanionBuilder
    = TdatasheetmodelcostCompanion Function({
  Value<int> datasheetId,
  Value<int> line,
  Value<String?> description,
  Value<int?> cost,
  Value<int> rowid,
});

final class $$TdatasheetmodelcostTableReferences extends BaseReferences<
    _$AppDatabase, $TdatasheetmodelcostTable, TdatasheetmodelcostData> {
  $$TdatasheetmodelcostTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TdatasheetTable _datasheetIdTable(_$AppDatabase db) =>
      db.tdatasheet.createAlias($_aliasNameGenerator(
          db.tdatasheetmodelcost.datasheetId, db.tdatasheet.id));

  $$TdatasheetTableProcessedTableManager get datasheetId {
    final $_column = $_itemColumn<int>('datasheet_id')!;

    final manager = $$TdatasheetTableTableManager($_db, $_db.tdatasheet)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_datasheetIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TdatasheetmodelcostTableFilterComposer
    extends Composer<_$AppDatabase, $TdatasheetmodelcostTable> {
  $$TdatasheetmodelcostTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get line => $composableBuilder(
      column: $table.line, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnFilters(column));

  $$TdatasheetTableFilterComposer get datasheetId {
    final $$TdatasheetTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableFilterComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetmodelcostTableOrderingComposer
    extends Composer<_$AppDatabase, $TdatasheetmodelcostTable> {
  $$TdatasheetmodelcostTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get line => $composableBuilder(
      column: $table.line, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnOrderings(column));

  $$TdatasheetTableOrderingComposer get datasheetId {
    final $$TdatasheetTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableOrderingComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetmodelcostTableAnnotationComposer
    extends Composer<_$AppDatabase, $TdatasheetmodelcostTable> {
  $$TdatasheetmodelcostTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get line =>
      $composableBuilder(column: $table.line, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  $$TdatasheetTableAnnotationComposer get datasheetId {
    final $$TdatasheetTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.datasheetId,
        referencedTable: $db.tdatasheet,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TdatasheetTableAnnotationComposer(
              $db: $db,
              $table: $db.tdatasheet,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TdatasheetmodelcostTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TdatasheetmodelcostTable,
    TdatasheetmodelcostData,
    $$TdatasheetmodelcostTableFilterComposer,
    $$TdatasheetmodelcostTableOrderingComposer,
    $$TdatasheetmodelcostTableAnnotationComposer,
    $$TdatasheetmodelcostTableCreateCompanionBuilder,
    $$TdatasheetmodelcostTableUpdateCompanionBuilder,
    (TdatasheetmodelcostData, $$TdatasheetmodelcostTableReferences),
    TdatasheetmodelcostData,
    PrefetchHooks Function({bool datasheetId})> {
  $$TdatasheetmodelcostTableTableManager(
      _$AppDatabase db, $TdatasheetmodelcostTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TdatasheetmodelcostTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TdatasheetmodelcostTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TdatasheetmodelcostTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> datasheetId = const Value.absent(),
            Value<int> line = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> cost = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetmodelcostCompanion(
            datasheetId: datasheetId,
            line: line,
            description: description,
            cost: cost,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int datasheetId,
            required int line,
            Value<String?> description = const Value.absent(),
            Value<int?> cost = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TdatasheetmodelcostCompanion.insert(
            datasheetId: datasheetId,
            line: line,
            description: description,
            cost: cost,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TdatasheetmodelcostTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({datasheetId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (datasheetId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.datasheetId,
                    referencedTable: $$TdatasheetmodelcostTableReferences
                        ._datasheetIdTable(db),
                    referencedColumn: $$TdatasheetmodelcostTableReferences
                        ._datasheetIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TdatasheetmodelcostTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TdatasheetmodelcostTable,
    TdatasheetmodelcostData,
    $$TdatasheetmodelcostTableFilterComposer,
    $$TdatasheetmodelcostTableOrderingComposer,
    $$TdatasheetmodelcostTableAnnotationComposer,
    $$TdatasheetmodelcostTableCreateCompanionBuilder,
    $$TdatasheetmodelcostTableUpdateCompanionBuilder,
    (TdatasheetmodelcostData, $$TdatasheetmodelcostTableReferences),
    TdatasheetmodelcostData,
    PrefetchHooks Function({bool datasheetId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TfactionTableTableManager get tfaction =>
      $$TfactionTableTableManager(_db, _db.tfaction);
  $$TsourceTableTableManager get tsource =>
      $$TsourceTableTableManager(_db, _db.tsource);
  $$TdatasheetTableTableManager get tdatasheet =>
      $$TdatasheetTableTableManager(_db, _db.tdatasheet);
  $$TabilityTableTableManager get tability =>
      $$TabilityTableTableManager(_db, _db.tability);
  $$TdetachmentTableTableManager get tdetachment =>
      $$TdetachmentTableTableManager(_db, _db.tdetachment);
  $$TenhancementTableTableManager get tenhancement =>
      $$TenhancementTableTableManager(_db, _db.tenhancement);
  $$TstratagemTableTableManager get tstratagem =>
      $$TstratagemTableTableManager(_db, _db.tstratagem);
  $$TlastupdateTableTableManager get tlastupdate =>
      $$TlastupdateTableTableManager(_db, _db.tlastupdate);
  $$TdatasheetabilityTableTableManager get tdatasheetability =>
      $$TdatasheetabilityTableTableManager(_db, _db.tdatasheetability);
  $$TdatasheetmodelTableTableManager get tdatasheetmodel =>
      $$TdatasheetmodelTableTableManager(_db, _db.tdatasheetmodel);
  $$TdatasheetwargearTableTableManager get tdatasheetwargear =>
      $$TdatasheetwargearTableTableManager(_db, _db.tdatasheetwargear);
  $$TdatasheetkeywordTableTableManager get tdatasheetkeyword =>
      $$TdatasheetkeywordTableTableManager(_db, _db.tdatasheetkeyword);
  $$TdatasheetoptionTableTableManager get tdatasheetoption =>
      $$TdatasheetoptionTableTableManager(_db, _db.tdatasheetoption);
  $$TdatasheetleaderTableTableManager get tdatasheetleader =>
      $$TdatasheetleaderTableTableManager(_db, _db.tdatasheetleader);
  $$TdatasheetstratagemTableTableManager get tdatasheetstratagem =>
      $$TdatasheetstratagemTableTableManager(_db, _db.tdatasheetstratagem);
  $$TdatasheetenhancementTableTableManager get tdatasheetenhancement =>
      $$TdatasheetenhancementTableTableManager(_db, _db.tdatasheetenhancement);
  $$TdetachmentabilityTableTableManager get tdetachmentability =>
      $$TdetachmentabilityTableTableManager(_db, _db.tdetachmentability);
  $$TdatasheetdetachmentabilityTableTableManager
      get tdatasheetdetachmentability =>
          $$TdatasheetdetachmentabilityTableTableManager(
              _db, _db.tdatasheetdetachmentability);
  $$TdatasheetunitcompositionTableTableManager get tdatasheetunitcomposition =>
      $$TdatasheetunitcompositionTableTableManager(
          _db, _db.tdatasheetunitcomposition);
  $$TdatasheetmodelcostTableTableManager get tdatasheetmodelcost =>
      $$TdatasheetmodelcostTableTableManager(_db, _db.tdatasheetmodelcost);
}
