# reprocare


# Architecture Pattern

## 1. View Mixin Structure
```dart
mixin XViewMixin on State<XView> {
  // Controllers
  late final GlobalKey<FormState> formKey;
  late final TextEditingController field1Controller;
  late final TextEditingController field2Controller;
  late final ValueNotifier<bool> someNotifier;
  
  // Cubit
  late final XCubit xCubit;

  @override
  void initState() {
    super.initState();
    initializeMixin();
  }

  Future<void> initializeMixin() async {
    // Initialize controllers
    field1Controller = TextEditingController();
    field2Controller = TextEditingController();
    formKey = GlobalKey<FormState>();
    someNotifier = ValueNotifier(false);
    
    // Initialize cubit
    xCubit = ServiceLocatorProvider.provide();

    await initializeServices();
  }

  Future<void> initializeServices() async {}

  // State listener
  void cubitStateListener(BuildContext context, XState state) {
    if (state == XState.success()) {
      // Handle success state
    }
  }

  // UI actions
  void someAction() {
    someNotifier.value = !someNotifier.value;
  }

  // Business logic
  Future<void> someBusinessLogic() async {
    final request = XRequest(
      field1: field1Controller.text,
      field2: field2Controller.text,
    );

    await xCubit.someOperation(request);
  }
}
```

## 2. Cubit Structure
```dart
// Abstract State
abstract class XState extends BaseState {
  const XState();
  
  factory XState.initial() = _Initial;
  factory XState.loading() = _Loading;
  factory XState.listSuccess() = _ListSuccess;
  factory XState.detailSuccess() = _DetailSuccess;
  factory XState.addSuccess() = _AddSuccess;
  factory XState.updateSuccess() = _UpdateSuccess;
  factory XState.deleteSuccess() = _DeleteSuccess;
  factory XState.failure(AppException exception) = _Failure;
}

// Cubit Implementation
class XCubit extends Cubit<XState> with BaseCubit {
  final IXRepository _repository;
  
  XCubit(this._repository) : super(XState.initial());
  
  // State variables
  List<XEntity>? items;
  XEntity? item;
  
  @override 
  Future<void> initialize() async {}
  
  // CRUD Operations
  Future<void> getAll() async {
    safeEmit(XState.loading());
    final response = await _repository.getAll();
    
    final value = switch (response) {
      Success(value: final List<XEntity> _response) => {
          items = _response,
          safeEmit(XState.listSuccess()),
        },
      Failure(exception: final AppException exception) => {
          safeEmit(XState.failure(exception)),
        },
    };
  }
}
```

## 3. Repository Structure
```dart
// Abstract Repository
abstract class IXRepository {
  Future<Result<List<XEntity>, AppException>> getAll();
  Future<Result<XEntity, AppException>> getById(String id);
  Future<Result<XEntity, AppException>> save(XSaveRequest request);
  Future<Result<XEntity, AppException>> update(String id, XSaveRequest request);
  Future<Result<dynamic, AppException>> delete(String id);
}

// Repository Implementation
final class XRepository implements IXRepository {
  final IXService _service;
  
  XRepository(this._service);
  
  @override
  Future<Result<List<XEntity>, AppException>> getAll() async {
    final response = await _service.getAll();
    
    return switch (response) {
      Success(value: final List<XModel> _response) => Success(
          _response.map((e) => XEntity.fromJson(e.toJson())).toList()),
      Failure(exception: final AppException exception) => Failure(exception)
    };
  }
  
  @override
  Future<Result<XEntity, AppException>> getById(String id) async {
    final response = await _service.getById(id);
    
    return switch (response) {
      Success(value: final XModel _response) =>
        Success(XEntity.fromJson(_response.toJson())),
      Failure(exception: final AppException exception) => Failure(exception)
    };
  }
}
```

## 4. Service Structure
```dart
// Abstract Service
abstract class IXService {
  Future<Result<List<XModel>, AppException>> getAll();
  Future<Result<XModel, AppException>> getById(String id);
  Future<Result<XModel, AppException>> save(XSaveRequest request);
  Future<Result<XModel, AppException>> update(String id, XSaveRequest request);
  Future<Result<dynamic, AppException>> delete(String id);
}

// Service Implementation
final class XService implements IXService {
  final INetworkClient _networkClient;
  
  XService(this._networkClient);
  
  @override
  Future<Result<List<XModel>, AppException>> getAll() async {
    return await _networkClient.call(
      path: HttpClientEndPoints.X.URL,
      callType: HttpCallType.GET,
      mapper: (json) => APIModelMapper.jsonToList(json, XModel.fromJson),
    );
  }
  
  @override
  Future<Result<XModel, AppException>> getById(String id) async {
    return await _networkClient.call(
      path: HttpClientEndPoints.X.URL + '/$id',
      callType: HttpCallType.GET,
      mapper: (json) => APIModelMapper.jsonToItem(json, XModel.fromJson),
    );
  }
}
```

## Key Features
- Clean Architecture principles
- Dependency Injection
- Result pattern for error handling
- Model-Entity conversion in Repository layer
- Network operations in Service layer
- State management in Cubit layer
- Safe state emission with BaseCubit mixin
- Abstract classes for better maintainability
- Consistent naming conventions
- Type-safe operations
- View mixins for UI logic separation
