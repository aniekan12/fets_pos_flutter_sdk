import 'package:freezed_annotation/freezed_annotation.dart';

part 'fets_transaction_response.freezed.dart';
part 'fets_transaction_response.g.dart';

@freezed
class FetsTransactionResponse with _$FetsTransactionResponse {
  const factory FetsTransactionResponse({
    @JsonKey(name: 'T/ID') String? tid,
    @JsonKey(name: 'M/ID') String? mid,
    @JsonKey(name: 'issuer') String? issuer,
    @JsonKey(name: 'cardName') String? cardName,
    @JsonKey(name: 'pan') String? pan,
    @JsonKey(name: 'exDate') String? exDate,
    @JsonKey(name: 'scheme') String? scheme,
    @JsonKey(name: 'stan') String? stan,
    @JsonKey(name: 'responseCode') String? responseCode,
    @JsonKey(name: 'payDate') String? payDate,
    @JsonKey(name: 'tellerNo') String? tellerNo,
    @JsonKey(name: 'tellerNoName') String? tellerNoName,
    @JsonKey(name: 'rrn') String? rrn,
    @JsonKey(name: 'authCode') String? authCode,
    @JsonKey(name: 'channel') String? channel,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'amount') num? amount,
  }) = _FetsTransactionResponse;

  factory FetsTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$FetsTransactionResponseFromJson(json);
}
