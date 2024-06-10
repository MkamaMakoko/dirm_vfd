part of '_.dart';

final class UserInfo {
  final String status, message, username, email, token;
  final int expiresIn, tokenStartingTime, tokenExpireTime;
  final VFDAInformation vfdaInformation;
  final ClientInformation clientInformation;
  final List<({String id, String name})> branches;

  factory UserInfo.fromMap(Map map) => UserInfo(
      status: map['userStatus'],
      message: map['userStatusMessage'],
      username: map['userName'],
      email: map['userEmail'],
      token: map['token'],
      expiresIn: map['expiresIn'],
      tokenStartingTime: map['tokenStartingTime'],
      branches: [
        for (final branch in (map['branches'] as Map).entries)
          (id: branch.key, name: branch.value)
      ],
      tokenExpireTime: map['tokenExpireTime'],
      vfdaInformation: VFDAInformation.fromMap(map['vfdAInformation']),
      clientInformation: ClientInformation.fromMap(map['clientInformation']));

  UserInfo({
    required this.status,
    required this.message,
    required this.username,
    required this.email,
    required this.token,
    required this.expiresIn,
    required this.tokenStartingTime,
    required this.tokenExpireTime,
    required this.vfdaInformation,
    required this.clientInformation,
    required this.branches,
  });
}

final class VFDAInformation {
  final String certKey,
      uin,
      taxOffice,
      // tin,
      // isVatRegistered,
      vrn,
      businessName,
      physicalAddress,
      mobile,
      street;
  final int tin;
  final bool isVatRegistered;

  VFDAInformation(
      {required this.certKey,
      required this.uin,
      required this.taxOffice,
      required this.tin,
      required this.isVatRegistered,
      required this.vrn,
      required this.businessName,
      required this.physicalAddress,
      required this.mobile,
      required this.street});

  factory VFDAInformation.fromMap(Map map) => VFDAInformation(
        certKey: map['certkey'],
        uin: map['uin'],
        taxOffice: map['taxOffice'],
        tin: map['tin'],
        isVatRegistered: map['isVatRegistered'],
        vrn: map['vrn'],
        businessName: map['businessName'],
        physicalAddress: map['physicalAddress'],
        mobile: map['mobile'],
        street: map['street'],
      );
}

final class ClientInformation {
  final String logo,
      businessName,
      physicalAddress,
      email,
      mobile,
      street,
      district,
      region,
      registrationDate,
      verified,
      status,
      message;
  final int clientId;

  ClientInformation(
      {required this.clientId,
      required this.logo,
      required this.businessName,
      required this.physicalAddress,
      required this.email,
      required this.mobile,
      required this.street,
      required this.district,
      required this.region,
      required this.registrationDate,
      required this.verified,
      required this.status,
      required this.message});

  factory ClientInformation.fromMap(Map map) => ClientInformation(
      clientId: map['clientId'],
      logo: map['logo'],
      businessName: map['businessName'],
      physicalAddress: map['physicalAddress'],
      email: map['email'],
      mobile: map['mobile'],
      street: map['street'],
      district: map['district'],
      region: map['region'],
      registrationDate: map['registrationDate'],
      verified: map['verified'],
      status: map['status'],
      message: map['statusMessage']);
}
