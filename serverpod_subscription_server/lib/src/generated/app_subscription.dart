/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import 'protocol.dart' as _i3;

abstract class AppSubscription extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  AppSubscription._({
    int? id,
    required this.userInfoId,
    this.userInfo,
    required this.expiresAt,
    required this.provider,
    required this.productId,
  }) : super(id);

  factory AppSubscription({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required DateTime expiresAt,
    required _i3.AppSubscriptionProvider provider,
    required String productId,
  }) = _AppSubscriptionImpl;

  factory AppSubscription.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppSubscription(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      expiresAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      provider: _i3.AppSubscriptionProvider.fromJson(
          (jsonSerialization['provider'] as int)),
      productId: jsonSerialization['productId'] as String,
    );
  }

  static final t = AppSubscriptionTable();

  static const db = AppSubscriptionRepository._();

  int userInfoId;

  _i2.UserInfo? userInfo;

  DateTime expiresAt;

  _i3.AppSubscriptionProvider provider;

  String productId;

  @override
  _i1.Table get table => t;

  AppSubscription copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    DateTime? expiresAt,
    _i3.AppSubscriptionProvider? provider,
    String? productId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'expiresAt': expiresAt.toJson(),
      'provider': provider.toJson(),
      'productId': productId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      'expiresAt': expiresAt.toJson(),
      'provider': provider.toJson(),
      'productId': productId,
    };
  }

  static AppSubscriptionInclude include({_i2.UserInfoInclude? userInfo}) {
    return AppSubscriptionInclude._(userInfo: userInfo);
  }

  static AppSubscriptionIncludeList includeList({
    _i1.WhereExpressionBuilder<AppSubscriptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppSubscriptionTable>? orderByList,
    AppSubscriptionInclude? include,
  }) {
    return AppSubscriptionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppSubscription.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AppSubscription.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppSubscriptionImpl extends AppSubscription {
  _AppSubscriptionImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required DateTime expiresAt,
    required _i3.AppSubscriptionProvider provider,
    required String productId,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          expiresAt: expiresAt,
          provider: provider,
          productId: productId,
        );

  @override
  AppSubscription copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    DateTime? expiresAt,
    _i3.AppSubscriptionProvider? provider,
    String? productId,
  }) {
    return AppSubscription(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      expiresAt: expiresAt ?? this.expiresAt,
      provider: provider ?? this.provider,
      productId: productId ?? this.productId,
    );
  }
}

class AppSubscriptionTable extends _i1.Table {
  AppSubscriptionTable({super.tableRelation})
      : super(tableName: 'app_subscription') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    provider = _i1.ColumnEnum(
      'provider',
      this,
      _i1.EnumSerialization.byIndex,
    );
    productId = _i1.ColumnString(
      'productId',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnEnum<_i3.AppSubscriptionProvider> provider;

  late final _i1.ColumnString productId;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: AppSubscription.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        expiresAt,
        provider,
        productId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    return null;
  }
}

class AppSubscriptionInclude extends _i1.IncludeObject {
  AppSubscriptionInclude._({_i2.UserInfoInclude? userInfo}) {
    _userInfo = userInfo;
  }

  _i2.UserInfoInclude? _userInfo;

  @override
  Map<String, _i1.Include?> get includes => {'userInfo': _userInfo};

  @override
  _i1.Table get table => AppSubscription.t;
}

class AppSubscriptionIncludeList extends _i1.IncludeList {
  AppSubscriptionIncludeList._({
    _i1.WhereExpressionBuilder<AppSubscriptionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AppSubscription.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => AppSubscription.t;
}

class AppSubscriptionRepository {
  const AppSubscriptionRepository._();

  final attachRow = const AppSubscriptionAttachRowRepository._();

  Future<List<AppSubscription>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppSubscriptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppSubscriptionTable>? orderByList,
    _i1.Transaction? transaction,
    AppSubscriptionInclude? include,
  }) async {
    return session.db.find<AppSubscription>(
      where: where?.call(AppSubscription.t),
      orderBy: orderBy?.call(AppSubscription.t),
      orderByList: orderByList?.call(AppSubscription.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<AppSubscription?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppSubscriptionTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppSubscriptionTable>? orderByList,
    _i1.Transaction? transaction,
    AppSubscriptionInclude? include,
  }) async {
    return session.db.findFirstRow<AppSubscription>(
      where: where?.call(AppSubscription.t),
      orderBy: orderBy?.call(AppSubscription.t),
      orderByList: orderByList?.call(AppSubscription.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<AppSubscription?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AppSubscriptionInclude? include,
  }) async {
    return session.db.findById<AppSubscription>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<AppSubscription>> insert(
    _i1.Session session,
    List<AppSubscription> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AppSubscription>(
      rows,
      transaction: transaction,
    );
  }

  Future<AppSubscription> insertRow(
    _i1.Session session,
    AppSubscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AppSubscription>(
      row,
      transaction: transaction,
    );
  }

  Future<List<AppSubscription>> update(
    _i1.Session session,
    List<AppSubscription> rows, {
    _i1.ColumnSelections<AppSubscriptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AppSubscription>(
      rows,
      columns: columns?.call(AppSubscription.t),
      transaction: transaction,
    );
  }

  Future<AppSubscription> updateRow(
    _i1.Session session,
    AppSubscription row, {
    _i1.ColumnSelections<AppSubscriptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AppSubscription>(
      row,
      columns: columns?.call(AppSubscription.t),
      transaction: transaction,
    );
  }

  Future<List<AppSubscription>> delete(
    _i1.Session session,
    List<AppSubscription> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AppSubscription>(
      rows,
      transaction: transaction,
    );
  }

  Future<AppSubscription> deleteRow(
    _i1.Session session,
    AppSubscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AppSubscription>(
      row,
      transaction: transaction,
    );
  }

  Future<List<AppSubscription>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AppSubscriptionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AppSubscription>(
      where: where(AppSubscription.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppSubscriptionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AppSubscription>(
      where: where?.call(AppSubscription.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AppSubscriptionAttachRowRepository {
  const AppSubscriptionAttachRowRepository._();

  Future<void> userInfo(
    _i1.Session session,
    AppSubscription appSubscription,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (appSubscription.id == null) {
      throw ArgumentError.notNull('appSubscription.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $appSubscription = appSubscription.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<AppSubscription>(
      $appSubscription,
      columns: [AppSubscription.t.userInfoId],
      transaction: transaction,
    );
  }
}
