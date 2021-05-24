// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<CryptoModel> welcomeFromJson(String str) => List<CryptoModel>.from(
    json.decode(str).map((x) => CryptoModel.fromJson(x)));

String welcomeToJson(List<CryptoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CryptoModel {
  CryptoModel({
    this.id,
    this.currency,
    this.symbol,
    this.name,
    this.logoUrl,
    this.status,
    this.price,
    this.priceDate,
    this.priceTimestamp,
    this.circulatingSupply,
    this.maxSupply,
    this.marketCap,
    this.marketCapDominance,
    this.numExchanges,
    this.numPairs,
    this.numPairsUnmapped,
    this.firstCandle,
    this.firstTrade,
    this.firstOrderBook,
    this.rank,
    this.rankDelta,
    this.high,
    this.highTimestamp,
    this.the1D,
    this.the30D,
    this.firstPricedAt,
  });

  String id;
  String currency;
  String symbol;
  String name;
  String logoUrl;
  Status status;
  String price;
  DateTime priceDate;
  DateTime priceTimestamp;
  String circulatingSupply;
  String maxSupply;
  String marketCap;
  String marketCapDominance;
  String numExchanges;
  String numPairs;
  String numPairsUnmapped;
  DateTime firstCandle;
  DateTime firstTrade;
  DateTime firstOrderBook;
  String rank;
  String rankDelta;
  String high;
  DateTime highTimestamp;
  The1D the1D;
  The1D the30D;
  DateTime firstPricedAt;

  factory CryptoModel.fromJson(Map<String, dynamic> json) => CryptoModel(
        id: json["id"],
        currency: json["currency"],
        symbol: json["symbol"],
        name: json["name"],
        logoUrl: json["logo_url"],
        status: statusValues.map[json["status"]],
        price: json["price"],
        priceDate: DateTime.parse(json["price_date"]),
        priceTimestamp: DateTime.parse(json["price_timestamp"]),
        circulatingSupply: json["circulating_supply"],
        maxSupply: json["max_supply"] == null ? null : json["max_supply"],
        marketCap: json["market_cap"],
        marketCapDominance: json["market_cap_dominance"],
        numExchanges: json["num_exchanges"],
        numPairs: json["num_pairs"],
        numPairsUnmapped: json["num_pairs_unmapped"],
        firstCandle: DateTime.parse(json["first_candle"]),
        firstTrade: json["first_trade"] == null
            ? null
            : DateTime.parse(json["first_trade"]),
        firstOrderBook: json["first_order_book"] == null
            ? null
            : DateTime.parse(json["first_order_book"]),
        rank: json["rank"],
        rankDelta: json["rank_delta"],
        high: json["high"],
        highTimestamp: DateTime.parse(json["high_timestamp"]),
        the1D: The1D.fromJson(json["1d"]),
        the30D: The1D.fromJson(json["30d"]),
        firstPricedAt: json["first_priced_at"] == null
            ? null
            : DateTime.parse(json["first_priced_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "currency": currency,
        "symbol": symbol,
        "name": name,
        "logo_url": logoUrl,
        "status": statusValues.reverse[status],
        "price": price,
        "price_date": priceDate.toIso8601String(),
        "price_timestamp": priceTimestamp.toIso8601String(),
        "circulating_supply": circulatingSupply,
        "max_supply": maxSupply == null ? null : maxSupply,
        "market_cap": marketCap,
        "market_cap_dominance": marketCapDominance,
        "num_exchanges": numExchanges,
        "num_pairs": numPairs,
        "num_pairs_unmapped": numPairsUnmapped,
        "first_candle": firstCandle.toIso8601String(),
        "first_trade": firstTrade == null ? null : firstTrade.toIso8601String(),
        "first_order_book":
            firstOrderBook == null ? null : firstOrderBook.toIso8601String(),
        "rank": rank,
        "rank_delta": rankDelta,
        "high": high,
        "high_timestamp": highTimestamp.toIso8601String(),
        "1d": the1D.toJson(),
        "30d": the30D.toJson(),
        "first_priced_at":
            firstPricedAt == null ? null : firstPricedAt.toIso8601String(),
      };
}

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

class The1D {
  The1D({
    this.volume,
    this.priceChange,
    this.priceChangePct,
    this.volumeChange,
    this.volumeChangePct,
    this.marketCapChange,
    this.marketCapChangePct,
  });

  String volume;
  String priceChange;
  String priceChangePct;
  String volumeChange;
  String volumeChangePct;
  String marketCapChange;
  String marketCapChangePct;

  factory The1D.fromJson(Map<String, dynamic> json) => The1D(
        volume: json["volume"],
        priceChange: json["price_change"],
        priceChangePct: json["price_change_pct"],
        volumeChange: json["volume_change"],
        volumeChangePct: json["volume_change_pct"],
        marketCapChange: json["market_cap_change"] == null
            ? null
            : json["market_cap_change"],
        marketCapChangePct: json["market_cap_change_pct"] == null
            ? null
            : json["market_cap_change_pct"],
      );

  Map<String, dynamic> toJson() => {
        "volume": volume,
        "price_change": priceChange,
        "price_change_pct": priceChangePct,
        "volume_change": volumeChange,
        "volume_change_pct": volumeChangePct,
        "market_cap_change": marketCapChange == null ? null : marketCapChange,
        "market_cap_change_pct":
            marketCapChangePct == null ? null : marketCapChangePct,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
