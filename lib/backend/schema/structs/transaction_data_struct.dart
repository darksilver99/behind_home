// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionDataStruct extends FFFirebaseStruct {
  TransactionDataStruct({
    String? carRegistration,
    String? carRegistrationProvince,
    String? carType,
    String? cardNumber,
    DateTime? createDate,
    DateTime? dateIn,
    DateTime? dateOut,
    String? firstName,
    bool? isOut,
    String? lastName,
    String? objective,
    String? preName,
    String? stamp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _carRegistration = carRegistration,
        _carRegistrationProvince = carRegistrationProvince,
        _carType = carType,
        _cardNumber = cardNumber,
        _createDate = createDate,
        _dateIn = dateIn,
        _dateOut = dateOut,
        _firstName = firstName,
        _isOut = isOut,
        _lastName = lastName,
        _objective = objective,
        _preName = preName,
        _stamp = stamp,
        super(firestoreUtilData);

  // "car_registration" field.
  String? _carRegistration;
  String get carRegistration => _carRegistration ?? '';
  set carRegistration(String? val) => _carRegistration = val;

  bool hasCarRegistration() => _carRegistration != null;

  // "car_registration_province" field.
  String? _carRegistrationProvince;
  String get carRegistrationProvince => _carRegistrationProvince ?? '';
  set carRegistrationProvince(String? val) => _carRegistrationProvince = val;

  bool hasCarRegistrationProvince() => _carRegistrationProvince != null;

  // "car_type" field.
  String? _carType;
  String get carType => _carType ?? '';
  set carType(String? val) => _carType = val;

  bool hasCarType() => _carType != null;

  // "card_number" field.
  String? _cardNumber;
  String get cardNumber => _cardNumber ?? '';
  set cardNumber(String? val) => _cardNumber = val;

  bool hasCardNumber() => _cardNumber != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  set createDate(DateTime? val) => _createDate = val;

  bool hasCreateDate() => _createDate != null;

  // "date_in" field.
  DateTime? _dateIn;
  DateTime? get dateIn => _dateIn;
  set dateIn(DateTime? val) => _dateIn = val;

  bool hasDateIn() => _dateIn != null;

  // "date_out" field.
  DateTime? _dateOut;
  DateTime? get dateOut => _dateOut;
  set dateOut(DateTime? val) => _dateOut = val;

  bool hasDateOut() => _dateOut != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "is_out" field.
  bool? _isOut;
  bool get isOut => _isOut ?? false;
  set isOut(bool? val) => _isOut = val;

  bool hasIsOut() => _isOut != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "objective" field.
  String? _objective;
  String get objective => _objective ?? '';
  set objective(String? val) => _objective = val;

  bool hasObjective() => _objective != null;

  // "pre_name" field.
  String? _preName;
  String get preName => _preName ?? '';
  set preName(String? val) => _preName = val;

  bool hasPreName() => _preName != null;

  // "stamp" field.
  String? _stamp;
  String get stamp => _stamp ?? '';
  set stamp(String? val) => _stamp = val;

  bool hasStamp() => _stamp != null;

  static TransactionDataStruct fromMap(Map<String, dynamic> data) =>
      TransactionDataStruct(
        carRegistration: data['car_registration'] as String?,
        carRegistrationProvince: data['car_registration_province'] as String?,
        carType: data['car_type'] as String?,
        cardNumber: data['card_number'] as String?,
        createDate: data['create_date'] as DateTime?,
        dateIn: data['date_in'] as DateTime?,
        dateOut: data['date_out'] as DateTime?,
        firstName: data['first_name'] as String?,
        isOut: data['is_out'] as bool?,
        lastName: data['last_name'] as String?,
        objective: data['objective'] as String?,
        preName: data['pre_name'] as String?,
        stamp: data['stamp'] as String?,
      );

  static TransactionDataStruct? maybeFromMap(dynamic data) => data is Map
      ? TransactionDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'car_registration': _carRegistration,
        'car_registration_province': _carRegistrationProvince,
        'car_type': _carType,
        'card_number': _cardNumber,
        'create_date': _createDate,
        'date_in': _dateIn,
        'date_out': _dateOut,
        'first_name': _firstName,
        'is_out': _isOut,
        'last_name': _lastName,
        'objective': _objective,
        'pre_name': _preName,
        'stamp': _stamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'car_registration': serializeParam(
          _carRegistration,
          ParamType.String,
        ),
        'car_registration_province': serializeParam(
          _carRegistrationProvince,
          ParamType.String,
        ),
        'car_type': serializeParam(
          _carType,
          ParamType.String,
        ),
        'card_number': serializeParam(
          _cardNumber,
          ParamType.String,
        ),
        'create_date': serializeParam(
          _createDate,
          ParamType.DateTime,
        ),
        'date_in': serializeParam(
          _dateIn,
          ParamType.DateTime,
        ),
        'date_out': serializeParam(
          _dateOut,
          ParamType.DateTime,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'is_out': serializeParam(
          _isOut,
          ParamType.bool,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'objective': serializeParam(
          _objective,
          ParamType.String,
        ),
        'pre_name': serializeParam(
          _preName,
          ParamType.String,
        ),
        'stamp': serializeParam(
          _stamp,
          ParamType.String,
        ),
      }.withoutNulls;

  static TransactionDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      TransactionDataStruct(
        carRegistration: deserializeParam(
          data['car_registration'],
          ParamType.String,
          false,
        ),
        carRegistrationProvince: deserializeParam(
          data['car_registration_province'],
          ParamType.String,
          false,
        ),
        carType: deserializeParam(
          data['car_type'],
          ParamType.String,
          false,
        ),
        cardNumber: deserializeParam(
          data['card_number'],
          ParamType.String,
          false,
        ),
        createDate: deserializeParam(
          data['create_date'],
          ParamType.DateTime,
          false,
        ),
        dateIn: deserializeParam(
          data['date_in'],
          ParamType.DateTime,
          false,
        ),
        dateOut: deserializeParam(
          data['date_out'],
          ParamType.DateTime,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        isOut: deserializeParam(
          data['is_out'],
          ParamType.bool,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        objective: deserializeParam(
          data['objective'],
          ParamType.String,
          false,
        ),
        preName: deserializeParam(
          data['pre_name'],
          ParamType.String,
          false,
        ),
        stamp: deserializeParam(
          data['stamp'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TransactionDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TransactionDataStruct &&
        carRegistration == other.carRegistration &&
        carRegistrationProvince == other.carRegistrationProvince &&
        carType == other.carType &&
        cardNumber == other.cardNumber &&
        createDate == other.createDate &&
        dateIn == other.dateIn &&
        dateOut == other.dateOut &&
        firstName == other.firstName &&
        isOut == other.isOut &&
        lastName == other.lastName &&
        objective == other.objective &&
        preName == other.preName &&
        stamp == other.stamp;
  }

  @override
  int get hashCode => const ListEquality().hash([
        carRegistration,
        carRegistrationProvince,
        carType,
        cardNumber,
        createDate,
        dateIn,
        dateOut,
        firstName,
        isOut,
        lastName,
        objective,
        preName,
        stamp
      ]);
}

TransactionDataStruct createTransactionDataStruct({
  String? carRegistration,
  String? carRegistrationProvince,
  String? carType,
  String? cardNumber,
  DateTime? createDate,
  DateTime? dateIn,
  DateTime? dateOut,
  String? firstName,
  bool? isOut,
  String? lastName,
  String? objective,
  String? preName,
  String? stamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TransactionDataStruct(
      carRegistration: carRegistration,
      carRegistrationProvince: carRegistrationProvince,
      carType: carType,
      cardNumber: cardNumber,
      createDate: createDate,
      dateIn: dateIn,
      dateOut: dateOut,
      firstName: firstName,
      isOut: isOut,
      lastName: lastName,
      objective: objective,
      preName: preName,
      stamp: stamp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TransactionDataStruct? updateTransactionDataStruct(
  TransactionDataStruct? transactionData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    transactionData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTransactionDataStructData(
  Map<String, dynamic> firestoreData,
  TransactionDataStruct? transactionData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (transactionData == null) {
    return;
  }
  if (transactionData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && transactionData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final transactionDataData =
      getTransactionDataFirestoreData(transactionData, forFieldValue);
  final nestedData =
      transactionDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = transactionData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTransactionDataFirestoreData(
  TransactionDataStruct? transactionData, [
  bool forFieldValue = false,
]) {
  if (transactionData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(transactionData.toMap());

  // Add any Firestore field values
  transactionData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTransactionDataListFirestoreData(
  List<TransactionDataStruct>? transactionDatas,
) =>
    transactionDatas
        ?.map((e) => getTransactionDataFirestoreData(e, true))
        .toList() ??
    [];
