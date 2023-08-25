import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$Login {
  factory Variables$Mutation$Login({required String firebaseToken}) =>
      Variables$Mutation$Login._({
        r'firebaseToken': firebaseToken,
      });

  Variables$Mutation$Login._(this._$data);

  factory Variables$Mutation$Login.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$firebaseToken = data['firebaseToken'];
    result$data['firebaseToken'] = (l$firebaseToken as String);
    return Variables$Mutation$Login._(result$data);
  }

  Map<String, dynamic> _$data;

  String get firebaseToken => (_$data['firebaseToken'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$firebaseToken = firebaseToken;
    result$data['firebaseToken'] = l$firebaseToken;
    return result$data;
  }

  CopyWith$Variables$Mutation$Login<Variables$Mutation$Login> get copyWith =>
      CopyWith$Variables$Mutation$Login(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$Login) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$firebaseToken = firebaseToken;
    final lOther$firebaseToken = other.firebaseToken;
    if (l$firebaseToken != lOther$firebaseToken) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$firebaseToken = firebaseToken;
    return Object.hashAll([l$firebaseToken]);
  }
}

abstract class CopyWith$Variables$Mutation$Login<TRes> {
  factory CopyWith$Variables$Mutation$Login(
    Variables$Mutation$Login instance,
    TRes Function(Variables$Mutation$Login) then,
  ) = _CopyWithImpl$Variables$Mutation$Login;

  factory CopyWith$Variables$Mutation$Login.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$Login;

  TRes call({String? firebaseToken});
}

class _CopyWithImpl$Variables$Mutation$Login<TRes>
    implements CopyWith$Variables$Mutation$Login<TRes> {
  _CopyWithImpl$Variables$Mutation$Login(
    this._instance,
    this._then,
  );

  final Variables$Mutation$Login _instance;

  final TRes Function(Variables$Mutation$Login) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? firebaseToken = _undefined}) =>
      _then(Variables$Mutation$Login._({
        ..._instance._$data,
        if (firebaseToken != _undefined && firebaseToken != null)
          'firebaseToken': (firebaseToken as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$Login<TRes>
    implements CopyWith$Variables$Mutation$Login<TRes> {
  _CopyWithStubImpl$Variables$Mutation$Login(this._res);

  TRes _res;

  call({String? firebaseToken}) => _res;
}

class Mutation$Login {
  Mutation$Login({required this.login});

  factory Mutation$Login.fromJson(Map<String, dynamic> json) {
    final l$login = json['login'];
    return Mutation$Login(
        login:
            Mutation$Login$login.fromJson((l$login as Map<String, dynamic>)));
  }

  final Mutation$Login$login login;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$login = login;
    _resultData['login'] = l$login.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$login = login;
    return Object.hashAll([l$login]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$Login) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$login = login;
    final lOther$login = other.login;
    if (l$login != lOther$login) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$Login on Mutation$Login {
  CopyWith$Mutation$Login<Mutation$Login> get copyWith =>
      CopyWith$Mutation$Login(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$Login<TRes> {
  factory CopyWith$Mutation$Login(
    Mutation$Login instance,
    TRes Function(Mutation$Login) then,
  ) = _CopyWithImpl$Mutation$Login;

  factory CopyWith$Mutation$Login.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Login;

  TRes call({Mutation$Login$login? login});
  CopyWith$Mutation$Login$login<TRes> get login;
}

class _CopyWithImpl$Mutation$Login<TRes>
    implements CopyWith$Mutation$Login<TRes> {
  _CopyWithImpl$Mutation$Login(
    this._instance,
    this._then,
  );

  final Mutation$Login _instance;

  final TRes Function(Mutation$Login) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? login = _undefined}) => _then(Mutation$Login(
      login: login == _undefined || login == null
          ? _instance.login
          : (login as Mutation$Login$login)));
  CopyWith$Mutation$Login$login<TRes> get login {
    final local$login = _instance.login;
    return CopyWith$Mutation$Login$login(local$login, (e) => call(login: e));
  }
}

class _CopyWithStubImpl$Mutation$Login<TRes>
    implements CopyWith$Mutation$Login<TRes> {
  _CopyWithStubImpl$Mutation$Login(this._res);

  TRes _res;

  call({Mutation$Login$login? login}) => _res;
  CopyWith$Mutation$Login$login<TRes> get login =>
      CopyWith$Mutation$Login$login.stub(_res);
}

const documentNodeMutationLogin = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'Login'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'firebaseToken')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'firebaseToken'),
                value: VariableNode(name: NameNode(value: 'firebaseToken')),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'jwtToken'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  ),
]);
Mutation$Login _parserFn$Mutation$Login(Map<String, dynamic> data) =>
    Mutation$Login.fromJson(data);
typedef OnMutationCompleted$Mutation$Login = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$Login?,
);

class Options$Mutation$Login extends graphql.MutationOptions<Mutation$Login> {
  Options$Mutation$Login({
    String? operationName,
    required Variables$Mutation$Login variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Login? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Login? onCompleted,
    graphql.OnMutationUpdate<Mutation$Login>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$Login(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLogin,
          parserFn: _parserFn$Mutation$Login,
        );

  final OnMutationCompleted$Mutation$Login? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$Login
    extends graphql.WatchQueryOptions<Mutation$Login> {
  WatchOptions$Mutation$Login({
    String? operationName,
    required Variables$Mutation$Login variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Login? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationLogin,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$Login,
        );
}

extension ClientExtension$Mutation$Login on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$Login>> mutate$Login(
          Options$Mutation$Login options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$Login> watchMutation$Login(
          WatchOptions$Mutation$Login options) =>
      this.watchMutation(options);
}

class Mutation$Login$HookResult {
  Mutation$Login$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$Login runMutation;

  final graphql.QueryResult<Mutation$Login> result;
}

Mutation$Login$HookResult useMutation$Login(
    [WidgetOptions$Mutation$Login? options]) {
  final result =
      graphql_flutter.useMutation(options ?? WidgetOptions$Mutation$Login());
  return Mutation$Login$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$Login> useWatchMutation$Login(
        WatchOptions$Mutation$Login options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$Login
    extends graphql.MutationOptions<Mutation$Login> {
  WidgetOptions$Mutation$Login({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Login? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Login? onCompleted,
    graphql.OnMutationUpdate<Mutation$Login>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$Login(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLogin,
          parserFn: _parserFn$Mutation$Login,
        );

  final OnMutationCompleted$Mutation$Login? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$Login = graphql.MultiSourceResult<Mutation$Login>
    Function(
  Variables$Mutation$Login, {
  Object? optimisticResult,
  Mutation$Login? typedOptimisticResult,
});
typedef Builder$Mutation$Login = widgets.Widget Function(
  RunMutation$Mutation$Login,
  graphql.QueryResult<Mutation$Login>?,
);

class Mutation$Login$Widget extends graphql_flutter.Mutation<Mutation$Login> {
  Mutation$Login$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$Login? options,
    required Builder$Mutation$Login builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$Login(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$Login$login {
  Mutation$Login$login({required this.jwtToken});

  factory Mutation$Login$login.fromJson(Map<String, dynamic> json) {
    final l$jwtToken = json['jwtToken'];
    return Mutation$Login$login(jwtToken: (l$jwtToken as String));
  }

  final String jwtToken;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$jwtToken = jwtToken;
    _resultData['jwtToken'] = l$jwtToken;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$jwtToken = jwtToken;
    return Object.hashAll([l$jwtToken]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$Login$login) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$jwtToken = jwtToken;
    final lOther$jwtToken = other.jwtToken;
    if (l$jwtToken != lOther$jwtToken) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$Login$login on Mutation$Login$login {
  CopyWith$Mutation$Login$login<Mutation$Login$login> get copyWith =>
      CopyWith$Mutation$Login$login(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$Login$login<TRes> {
  factory CopyWith$Mutation$Login$login(
    Mutation$Login$login instance,
    TRes Function(Mutation$Login$login) then,
  ) = _CopyWithImpl$Mutation$Login$login;

  factory CopyWith$Mutation$Login$login.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Login$login;

  TRes call({String? jwtToken});
}

class _CopyWithImpl$Mutation$Login$login<TRes>
    implements CopyWith$Mutation$Login$login<TRes> {
  _CopyWithImpl$Mutation$Login$login(
    this._instance,
    this._then,
  );

  final Mutation$Login$login _instance;

  final TRes Function(Mutation$Login$login) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? jwtToken = _undefined}) => _then(Mutation$Login$login(
      jwtToken: jwtToken == _undefined || jwtToken == null
          ? _instance.jwtToken
          : (jwtToken as String)));
}

class _CopyWithStubImpl$Mutation$Login$login<TRes>
    implements CopyWith$Mutation$Login$login<TRes> {
  _CopyWithStubImpl$Mutation$Login$login(this._res);

  TRes _res;

  call({String? jwtToken}) => _res;
}

class Variables$Mutation$SkipVerification {
  factory Variables$Mutation$SkipVerification({required String mobileNumber}) =>
      Variables$Mutation$SkipVerification._({
        r'mobileNumber': mobileNumber,
      });

  Variables$Mutation$SkipVerification._(this._$data);

  factory Variables$Mutation$SkipVerification.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$mobileNumber = data['mobileNumber'];
    result$data['mobileNumber'] = (l$mobileNumber as String);
    return Variables$Mutation$SkipVerification._(result$data);
  }

  Map<String, dynamic> _$data;

  String get mobileNumber => (_$data['mobileNumber'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$mobileNumber = mobileNumber;
    result$data['mobileNumber'] = l$mobileNumber;
    return result$data;
  }

  CopyWith$Variables$Mutation$SkipVerification<
          Variables$Mutation$SkipVerification>
      get copyWith => CopyWith$Variables$Mutation$SkipVerification(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SkipVerification) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$mobileNumber = mobileNumber;
    final lOther$mobileNumber = other.mobileNumber;
    if (l$mobileNumber != lOther$mobileNumber) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$mobileNumber = mobileNumber;
    return Object.hashAll([l$mobileNumber]);
  }
}

abstract class CopyWith$Variables$Mutation$SkipVerification<TRes> {
  factory CopyWith$Variables$Mutation$SkipVerification(
    Variables$Mutation$SkipVerification instance,
    TRes Function(Variables$Mutation$SkipVerification) then,
  ) = _CopyWithImpl$Variables$Mutation$SkipVerification;

  factory CopyWith$Variables$Mutation$SkipVerification.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SkipVerification;

  TRes call({String? mobileNumber});
}

class _CopyWithImpl$Variables$Mutation$SkipVerification<TRes>
    implements CopyWith$Variables$Mutation$SkipVerification<TRes> {
  _CopyWithImpl$Variables$Mutation$SkipVerification(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SkipVerification _instance;

  final TRes Function(Variables$Mutation$SkipVerification) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? mobileNumber = _undefined}) =>
      _then(Variables$Mutation$SkipVerification._({
        ..._instance._$data,
        if (mobileNumber != _undefined && mobileNumber != null)
          'mobileNumber': (mobileNumber as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SkipVerification<TRes>
    implements CopyWith$Variables$Mutation$SkipVerification<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SkipVerification(this._res);

  TRes _res;

  call({String? mobileNumber}) => _res;
}

class Mutation$SkipVerification {
  Mutation$SkipVerification({required this.skipVerification});

  factory Mutation$SkipVerification.fromJson(Map<String, dynamic> json) {
    final l$skipVerification = json['skipVerification'];
    return Mutation$SkipVerification(
        skipVerification: Mutation$SkipVerification$skipVerification.fromJson(
            (l$skipVerification as Map<String, dynamic>)));
  }

  final Mutation$SkipVerification$skipVerification skipVerification;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$skipVerification = skipVerification;
    _resultData['skipVerification'] = l$skipVerification.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$skipVerification = skipVerification;
    return Object.hashAll([l$skipVerification]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SkipVerification) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$skipVerification = skipVerification;
    final lOther$skipVerification = other.skipVerification;
    if (l$skipVerification != lOther$skipVerification) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$SkipVerification
    on Mutation$SkipVerification {
  CopyWith$Mutation$SkipVerification<Mutation$SkipVerification> get copyWith =>
      CopyWith$Mutation$SkipVerification(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SkipVerification<TRes> {
  factory CopyWith$Mutation$SkipVerification(
    Mutation$SkipVerification instance,
    TRes Function(Mutation$SkipVerification) then,
  ) = _CopyWithImpl$Mutation$SkipVerification;

  factory CopyWith$Mutation$SkipVerification.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SkipVerification;

  TRes call({Mutation$SkipVerification$skipVerification? skipVerification});
  CopyWith$Mutation$SkipVerification$skipVerification<TRes>
      get skipVerification;
}

class _CopyWithImpl$Mutation$SkipVerification<TRes>
    implements CopyWith$Mutation$SkipVerification<TRes> {
  _CopyWithImpl$Mutation$SkipVerification(
    this._instance,
    this._then,
  );

  final Mutation$SkipVerification _instance;

  final TRes Function(Mutation$SkipVerification) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? skipVerification = _undefined}) =>
      _then(Mutation$SkipVerification(
          skipVerification:
              skipVerification == _undefined || skipVerification == null
                  ? _instance.skipVerification
                  : (skipVerification
                      as Mutation$SkipVerification$skipVerification)));
  CopyWith$Mutation$SkipVerification$skipVerification<TRes>
      get skipVerification {
    final local$skipVerification = _instance.skipVerification;
    return CopyWith$Mutation$SkipVerification$skipVerification(
        local$skipVerification, (e) => call(skipVerification: e));
  }
}

class _CopyWithStubImpl$Mutation$SkipVerification<TRes>
    implements CopyWith$Mutation$SkipVerification<TRes> {
  _CopyWithStubImpl$Mutation$SkipVerification(this._res);

  TRes _res;

  call({Mutation$SkipVerification$skipVerification? skipVerification}) => _res;
  CopyWith$Mutation$SkipVerification$skipVerification<TRes>
      get skipVerification =>
          CopyWith$Mutation$SkipVerification$skipVerification.stub(_res);
}

const documentNodeMutationSkipVerification = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SkipVerification'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mobileNumber')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'skipVerification'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'mobileNumber'),
            value: VariableNode(name: NameNode(value: 'mobileNumber')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'jwtToken'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  ),
]);
Mutation$SkipVerification _parserFn$Mutation$SkipVerification(
        Map<String, dynamic> data) =>
    Mutation$SkipVerification.fromJson(data);
typedef OnMutationCompleted$Mutation$SkipVerification = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SkipVerification?,
);

class Options$Mutation$SkipVerification
    extends graphql.MutationOptions<Mutation$SkipVerification> {
  Options$Mutation$SkipVerification({
    String? operationName,
    required Variables$Mutation$SkipVerification variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SkipVerification? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SkipVerification? onCompleted,
    graphql.OnMutationUpdate<Mutation$SkipVerification>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SkipVerification(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSkipVerification,
          parserFn: _parserFn$Mutation$SkipVerification,
        );

  final OnMutationCompleted$Mutation$SkipVerification? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SkipVerification
    extends graphql.WatchQueryOptions<Mutation$SkipVerification> {
  WatchOptions$Mutation$SkipVerification({
    String? operationName,
    required Variables$Mutation$SkipVerification variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SkipVerification? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationSkipVerification,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SkipVerification,
        );
}

extension ClientExtension$Mutation$SkipVerification on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SkipVerification>>
      mutate$SkipVerification(
              Options$Mutation$SkipVerification options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$SkipVerification>
      watchMutation$SkipVerification(
              WatchOptions$Mutation$SkipVerification options) =>
          this.watchMutation(options);
}

class Mutation$SkipVerification$HookResult {
  Mutation$SkipVerification$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SkipVerification runMutation;

  final graphql.QueryResult<Mutation$SkipVerification> result;
}

Mutation$SkipVerification$HookResult useMutation$SkipVerification(
    [WidgetOptions$Mutation$SkipVerification? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SkipVerification());
  return Mutation$SkipVerification$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SkipVerification>
    useWatchMutation$SkipVerification(
            WatchOptions$Mutation$SkipVerification options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SkipVerification
    extends graphql.MutationOptions<Mutation$SkipVerification> {
  WidgetOptions$Mutation$SkipVerification({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SkipVerification? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SkipVerification? onCompleted,
    graphql.OnMutationUpdate<Mutation$SkipVerification>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SkipVerification(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSkipVerification,
          parserFn: _parserFn$Mutation$SkipVerification,
        );

  final OnMutationCompleted$Mutation$SkipVerification? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SkipVerification
    = graphql.MultiSourceResult<Mutation$SkipVerification> Function(
  Variables$Mutation$SkipVerification, {
  Object? optimisticResult,
  Mutation$SkipVerification? typedOptimisticResult,
});
typedef Builder$Mutation$SkipVerification = widgets.Widget Function(
  RunMutation$Mutation$SkipVerification,
  graphql.QueryResult<Mutation$SkipVerification>?,
);

class Mutation$SkipVerification$Widget
    extends graphql_flutter.Mutation<Mutation$SkipVerification> {
  Mutation$SkipVerification$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SkipVerification? options,
    required Builder$Mutation$SkipVerification builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SkipVerification(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SkipVerification$skipVerification {
  Mutation$SkipVerification$skipVerification({required this.jwtToken});

  factory Mutation$SkipVerification$skipVerification.fromJson(
      Map<String, dynamic> json) {
    final l$jwtToken = json['jwtToken'];
    return Mutation$SkipVerification$skipVerification(
        jwtToken: (l$jwtToken as String));
  }

  final String jwtToken;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$jwtToken = jwtToken;
    _resultData['jwtToken'] = l$jwtToken;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$jwtToken = jwtToken;
    return Object.hashAll([l$jwtToken]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SkipVerification$skipVerification) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$jwtToken = jwtToken;
    final lOther$jwtToken = other.jwtToken;
    if (l$jwtToken != lOther$jwtToken) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$SkipVerification$skipVerification
    on Mutation$SkipVerification$skipVerification {
  CopyWith$Mutation$SkipVerification$skipVerification<
          Mutation$SkipVerification$skipVerification>
      get copyWith => CopyWith$Mutation$SkipVerification$skipVerification(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SkipVerification$skipVerification<TRes> {
  factory CopyWith$Mutation$SkipVerification$skipVerification(
    Mutation$SkipVerification$skipVerification instance,
    TRes Function(Mutation$SkipVerification$skipVerification) then,
  ) = _CopyWithImpl$Mutation$SkipVerification$skipVerification;

  factory CopyWith$Mutation$SkipVerification$skipVerification.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SkipVerification$skipVerification;

  TRes call({String? jwtToken});
}

class _CopyWithImpl$Mutation$SkipVerification$skipVerification<TRes>
    implements CopyWith$Mutation$SkipVerification$skipVerification<TRes> {
  _CopyWithImpl$Mutation$SkipVerification$skipVerification(
    this._instance,
    this._then,
  );

  final Mutation$SkipVerification$skipVerification _instance;

  final TRes Function(Mutation$SkipVerification$skipVerification) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? jwtToken = _undefined}) =>
      _then(Mutation$SkipVerification$skipVerification(
          jwtToken: jwtToken == _undefined || jwtToken == null
              ? _instance.jwtToken
              : (jwtToken as String)));
}

class _CopyWithStubImpl$Mutation$SkipVerification$skipVerification<TRes>
    implements CopyWith$Mutation$SkipVerification$skipVerification<TRes> {
  _CopyWithStubImpl$Mutation$SkipVerification$skipVerification(this._res);

  TRes _res;

  call({String? jwtToken}) => _res;
}
