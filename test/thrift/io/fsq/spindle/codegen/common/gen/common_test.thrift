// Copyright 2013 Foursquare Labs Inc. All Rights Reserved.

namespace java io.fsq.spindle.codegen.common.gen

include "io/fsq/spindle/codegen/libs/gen/common_libs.thrift"

typedef binary MyBinary
typedef binary (enhanced_types="bson:ObjectId") ObjectId


struct TestStructOidList {
  1: optional bool aBool
  2: optional list<ObjectId> anObjectIdList
  3: optional i32 anI32
}

// A struct with a field of each type.

struct TestStruct {
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
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoUnknownFieldsTrackingExceptInnerStruct {
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
  14: optional list<common_libs.InnerStruct> aStructList
}

struct TestStructInnerStructNoUnknownFieldsTracking {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStructNoUnknownFieldsTracking aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStructNoUnknownFieldsTracking> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStructNoUnknownFieldsTracking> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoUnknownFieldsTracking {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStructNoUnknownFieldsTracking aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStructNoUnknownFieldsTracking> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStructNoUnknownFieldsTracking> aStructList
}

// Identical structs, with one field missing. Useful for testing forwards wire compatibility, that is that you can
// read a serialized struct into an out-of-date version that's missing fields, and they are skipped correctly.

struct TestStructNoBool {
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
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoBoolNoUnknownFieldsTracking {
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
  14: optional list<common_libs.InnerStruct> aStructList
}

struct TestStructNoBoolRetiredFields {
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
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
  retired_ids="1"
  retired_wire_names="aBool"
)

struct TestStructNoBoolRetiredFieldsNoUnknownFieldsTracking {
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
  14: optional list<common_libs.InnerStruct> aStructList
} (
  retired_ids="1"
  retired_wire_names="aBool"
)

struct TestStructNoByte {
  1: optional bool aBool
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
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoI16 {
  1: optional bool aBool
  2: optional byte aByte
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
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoI32 {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStruct aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStruct> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoI64 {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStruct aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStruct> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoDouble {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStruct aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStruct> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoString {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  8: optional binary aBinary
  9: optional common_libs.InnerStruct aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStruct> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoBinary {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  9: optional common_libs.InnerStruct aStruct
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStruct> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoStruct {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  10: optional set<string> aSet
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStruct> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoSet {
  1: optional bool aBool
  2: optional byte aByte
  3: optional i16 anI16
  4: optional i32 anI32
  5: optional i64 anI64
  6: optional double aDouble
  7: optional string aString
  8: optional binary aBinary
  9: optional common_libs.InnerStruct aStruct
  11: optional list<i32> aList
  12: optional map<string, common_libs.InnerStruct> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
)

struct TestStructNoList {
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
  12: optional map<string, common_libs.InnerStruct> aMap
  13: optional MyBinary aMyBinary
  14: optional list<common_libs.InnerStruct> aStructList
} (
  preserve_unknown_fields="1"
)
