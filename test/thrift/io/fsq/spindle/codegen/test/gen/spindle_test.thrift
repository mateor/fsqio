// Copyright 2013 Foursquare Labs Inc. All Rights Reserved.

namespace java io.fsq.spindle.codegen.test.gen
include "io/fsq/spindle/codegen/libs/gen/common_libs.thrift"

typedef binary MyBinary
typedef binary (enhanced_types="bson:ObjectId") ObjectId


struct TestStructNoMap {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStruct aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoMyBinary {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStruct aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStruct> aMap
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoStructList {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStruct aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStruct> aMap
  13: optional MyBinary aMyBinary
} (
  preserve_unknown_fields="1"
)

struct TestStructInnerStructNoString {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStructNoString aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStructNoString> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStructNoString> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoUnknownFieldsTrackingInnerStructNoString {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStructNoString aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStructNoString> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStructNoString> aStructList
}

struct TestStructInnerStructNoStringNoUnknownFieldsTracking {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStructNoStringNoUnknownFieldsTracking aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStructNoStringNoUnknownFieldsTracking> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStructNoStringNoUnknownFieldsTracking> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoUnknownFieldsTrackingInnerStructNoStringNoUnknownFieldsTracking {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStructNoStringNoUnknownFieldsTracking aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStructNoStringNoUnknownFieldsTracking> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStructNoStringNoUnknownFieldsTracking> aStructList
}

struct TestStructInnerStructNoI32 {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStructNoI32 aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStructNoI32> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStructNoI32> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructInnerStructNoI32RetiredFields {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStructNoI32RetiredFields aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStructNoI32RetiredFields> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStructNoI32RetiredFields> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructCollections {
  1: optional list<bool> listBool
  2: optional list<byte> listByte
  3: optional list<i16> listI16
  4: optional list<i32> listI32
  5: optional list<i64> listI64
  6: optional list<double> listDouble
  7: optional list<string> listString
  8: optional list<binary> listBinary
  9: optional list<common_libs.InnerStruct> listStruct
  11: optional set<bool> setBool
  12: optional set<byte> setByte
  13: optional set<i16> setI16
  14: optional set<i32> setI32
  15: optional set<i64> setI64
  16: optional set<double> setDouble
  17: optional set<string> setString
  18: optional set<binary> setBinary
  19: optional set<common_libs.InnerStruct> setStruct
  21: optional map<string, bool> mapBool
  22: optional map<string, byte> mapByte
  23: optional map<string, i16> mapI16
  24: optional map<string, i32> mapI32
  25: optional map<string, i64> mapI64
  26: optional map<string, double> mapDouble
  27: optional map<string, string> mapString
  28: optional map<string, binary> mapBinary
  29: optional map<string, common_libs.InnerStruct> mapStruct
} (
  preserve_unknown_fields="1"
)

struct TestStructNestedCollections {
  1: optional list<list<bool>> listBool
  2: optional list<list<byte>> listByte
  3: optional list<list<i16>> listI16
  4: optional list<list<i32>> listI32
  5: optional list<list<i64>> listI64
  6: optional list<list<double>> listDouble
  7: optional list<list<string>> listString
  8: optional list<list<binary>> listBinary
  9: optional list<list<common_libs.InnerStruct>> listStruct
  11: optional set<set<bool>> setBool
  12: optional set<set<byte>> setByte
  13: optional set<set<i16>> setI16
  14: optional set<set<i32>> setI32
  15: optional set<set<i64>> setI64
  16: optional set<set<double>> setDouble
  17: optional set<set<string>> setString
  18: optional set<set<binary>> setBinary
  19: optional set<set<common_libs.InnerStruct>> setStruct
  21: optional map<string, map<string, bool>> mapBool
  22: optional map<string, map<string, byte>> mapByte
  23: optional map<string, map<string, i16>> mapI16
  24: optional map<string, map<string, i32>> mapI32
  25: optional map<string, map<string, i64>> mapI64
  26: optional map<string, map<string, double>> mapDouble
  27: optional map<string, map<string, string>> mapString
  28: optional map<string, map<string, binary>> mapBinary
  29: optional map<string, map<string, common_libs.InnerStruct>> mapStruct
} (
  preserve_unknown_fields="1"
)

struct TestStructMapStructKeysValues {
  1: optional map<common_libs.InnerStruct, common_libs.InnerStruct> mapStructs
}

struct TestStructIdentifierOverThousand {
  1001: optional bool aBool
}

exception TestFirstException {
  1: i32 value
}

exception TestSecondException {
  1: i32 value
}

exception TestThirdException {
  1: i32 value
}

service TestServices {
  i32 dummy1(1: i32 A) throws (1: TestFirstException ex1);
  i32 dummy2(1: i32 A) throws (1: TestFirstException ex1, 2: TestSecondException ex2);
  i32 dummy3(1: i32 A) throws (1: TestFirstException ex1, 2: TestSecondException ex2, 3: TestThirdException ex3);
}

service ChildTestServices extends TestServices {
  i32 dummy4(1: i32 A);
  oneway void dummyOneway(1: i32 A, 2: i32 B);
}
