// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fets_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FetsTransactionResponseImpl _$$FetsTransactionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FetsTransactionResponseImpl(
      tid: json['T/ID'] as String?,
      mid: json['M/ID'] as String?,
      issuer: json['issuer'] as String?,
      cardName: json['cardName'] as String?,
      pan: json['pan'] as String?,
      exDate: json['exDate'] as String?,
      scheme: json['scheme'] as String?,
      stan: json['stan'] as String?,
      responseCode: json['responseCode'] as String?,
      payDate: json['payDate'] as String?,
      tellerNo: json['tellerNo'] as String?,
      tellerNoName: json['tellerNoName'] as String?,
      rrn: json['rrn'] as String?,
      authCode: json['authCode'] as String?,
      channel: json['channel'] as String?,
      type: json['type'] as String?,
      amount: json['amount'] as num?,
    );

Map<String, dynamic> _$$FetsTransactionResponseImplToJson(
        _$FetsTransactionResponseImpl instance) =>
    <String, dynamic>{
      'T/ID': instance.tid,
      'M/ID': instance.mid,
      'issuer': instance.issuer,
      'cardName': instance.cardName,
      'pan': instance.pan,
      'exDate': instance.exDate,
      'scheme': instance.scheme,
      'stan': instance.stan,
      'responseCode': instance.responseCode,
      'payDate': instance.payDate,
      'tellerNo': instance.tellerNo,
      'tellerNoName': instance.tellerNoName,
      'rrn': instance.rrn,
      'authCode': instance.authCode,
      'channel': instance.channel,
      'type': instance.type,
      'amount': instance.amount,
    };
