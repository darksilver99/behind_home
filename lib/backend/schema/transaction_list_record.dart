import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionListRecord extends FirestoreRecord {
  TransactionListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "card_number" field.
  String? _cardNumber;
  String get cardNumber => _cardNumber ?? '';
  bool hasCardNumber() => _cardNumber != null;

  // "pre_name" field.
  String? _preName;
  String get preName => _preName ?? '';
  bool hasPreName() => _preName != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "car_registration" field.
  String? _carRegistration;
  String get carRegistration => _carRegistration ?? '';
  bool hasCarRegistration() => _carRegistration != null;

  // "car_registration_province" field.
  String? _carRegistrationProvince;
  String get carRegistrationProvince => _carRegistrationProvince ?? '';
  bool hasCarRegistrationProvince() => _carRegistrationProvince != null;

  // "stamp" field.
  String? _stamp;
  String get stamp => _stamp ?? '';
  bool hasStamp() => _stamp != null;

  // "objective" field.
  String? _objective;
  String get objective => _objective ?? '';
  bool hasObjective() => _objective != null;

  // "car_type" field.
  String? _carType;
  String get carType => _carType ?? '';
  bool hasCarType() => _carType != null;

  // "date_in" field.
  DateTime? _dateIn;
  DateTime? get dateIn => _dateIn;
  bool hasDateIn() => _dateIn != null;

  // "date_out" field.
  DateTime? _dateOut;
  DateTime? get dateOut => _dateOut;
  bool hasDateOut() => _dateOut != null;

  // "is_out" field.
  bool? _isOut;
  bool get isOut => _isOut ?? false;
  bool hasIsOut() => _isOut != null;

  // "contact_address" field.
  String? _contactAddress;
  String get contactAddress => _contactAddress ?? '';
  bool hasContactAddress() => _contactAddress != null;

  // "all_card_data" field.
  String? _allCardData;
  String get allCardData => _allCardData ?? '';
  bool hasAllCardData() => _allCardData != null;

  // "all_registration_data" field.
  String? _allRegistrationData;
  String get allRegistrationData => _allRegistrationData ?? '';
  bool hasAllRegistrationData() => _allRegistrationData != null;

  // "card_image" field.
  String? _cardImage;
  String get cardImage => _cardImage ?? '';
  bool hasCardImage() => _cardImage != null;

  // "registration_image" field.
  String? _registrationImage;
  String get registrationImage => _registrationImage ?? '';
  bool hasRegistrationImage() => _registrationImage != null;

  // "more_detail" field.
  String? _moreDetail;
  String get moreDetail => _moreDetail ?? '';
  bool hasMoreDetail() => _moreDetail != null;

  // "more_image" field.
  List<String>? _moreImage;
  List<String> get moreImage => _moreImage ?? const [];
  bool hasMoreImage() => _moreImage != null;

  // "transaction_number" field.
  String? _transactionNumber;
  String get transactionNumber => _transactionNumber ?? '';
  bool hasTransactionNumber() => _transactionNumber != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _cardNumber = snapshotData['card_number'] as String?;
    _preName = snapshotData['pre_name'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _carRegistration = snapshotData['car_registration'] as String?;
    _carRegistrationProvince =
        snapshotData['car_registration_province'] as String?;
    _stamp = snapshotData['stamp'] as String?;
    _objective = snapshotData['objective'] as String?;
    _carType = snapshotData['car_type'] as String?;
    _dateIn = snapshotData['date_in'] as DateTime?;
    _dateOut = snapshotData['date_out'] as DateTime?;
    _isOut = snapshotData['is_out'] as bool?;
    _contactAddress = snapshotData['contact_address'] as String?;
    _allCardData = snapshotData['all_card_data'] as String?;
    _allRegistrationData = snapshotData['all_registration_data'] as String?;
    _cardImage = snapshotData['card_image'] as String?;
    _registrationImage = snapshotData['registration_image'] as String?;
    _moreDetail = snapshotData['more_detail'] as String?;
    _moreImage = getDataList(snapshotData['more_image']);
    _transactionNumber = snapshotData['transaction_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transaction_list');

  static Stream<TransactionListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionListRecord.fromSnapshot(s));

  static Future<TransactionListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionListRecord.fromSnapshot(s));

  static TransactionListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionListRecordData({
  DateTime? createDate,
  String? cardNumber,
  String? preName,
  String? firstName,
  String? lastName,
  String? carRegistration,
  String? carRegistrationProvince,
  String? stamp,
  String? objective,
  String? carType,
  DateTime? dateIn,
  DateTime? dateOut,
  bool? isOut,
  String? contactAddress,
  String? allCardData,
  String? allRegistrationData,
  String? cardImage,
  String? registrationImage,
  String? moreDetail,
  String? transactionNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'card_number': cardNumber,
      'pre_name': preName,
      'first_name': firstName,
      'last_name': lastName,
      'car_registration': carRegistration,
      'car_registration_province': carRegistrationProvince,
      'stamp': stamp,
      'objective': objective,
      'car_type': carType,
      'date_in': dateIn,
      'date_out': dateOut,
      'is_out': isOut,
      'contact_address': contactAddress,
      'all_card_data': allCardData,
      'all_registration_data': allRegistrationData,
      'card_image': cardImage,
      'registration_image': registrationImage,
      'more_detail': moreDetail,
      'transaction_number': transactionNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionListRecordDocumentEquality
    implements Equality<TransactionListRecord> {
  const TransactionListRecordDocumentEquality();

  @override
  bool equals(TransactionListRecord? e1, TransactionListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createDate == e2?.createDate &&
        e1?.cardNumber == e2?.cardNumber &&
        e1?.preName == e2?.preName &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.carRegistration == e2?.carRegistration &&
        e1?.carRegistrationProvince == e2?.carRegistrationProvince &&
        e1?.stamp == e2?.stamp &&
        e1?.objective == e2?.objective &&
        e1?.carType == e2?.carType &&
        e1?.dateIn == e2?.dateIn &&
        e1?.dateOut == e2?.dateOut &&
        e1?.isOut == e2?.isOut &&
        e1?.contactAddress == e2?.contactAddress &&
        e1?.allCardData == e2?.allCardData &&
        e1?.allRegistrationData == e2?.allRegistrationData &&
        e1?.cardImage == e2?.cardImage &&
        e1?.registrationImage == e2?.registrationImage &&
        e1?.moreDetail == e2?.moreDetail &&
        listEquality.equals(e1?.moreImage, e2?.moreImage) &&
        e1?.transactionNumber == e2?.transactionNumber;
  }

  @override
  int hash(TransactionListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.cardNumber,
        e?.preName,
        e?.firstName,
        e?.lastName,
        e?.carRegistration,
        e?.carRegistrationProvince,
        e?.stamp,
        e?.objective,
        e?.carType,
        e?.dateIn,
        e?.dateOut,
        e?.isOut,
        e?.contactAddress,
        e?.allCardData,
        e?.allRegistrationData,
        e?.cardImage,
        e?.registrationImage,
        e?.moreDetail,
        e?.moreImage,
        e?.transactionNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionListRecord;
}
