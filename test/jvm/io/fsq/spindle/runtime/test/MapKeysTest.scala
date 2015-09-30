// Copyright 2014 Foursquare Labs Inc. All Rights Reserved.

package io.fsq.spindle.runtime.test

import com.foursquare.common.thrift.base.NonStringMapKeyException
import com.foursquare.spindle.runtime.{KnownTProtocolNames, TProtocolInfo}
import io.fsq.spindle.codegen.test.gen.MapWithI32Keys
import org.apache.thrift.transport.TMemoryBuffer
import org.junit.Test


class MapKeysTest {

  @Test(expected=classOf[NonStringMapKeyException])
  def testBSONStringOnlyMapKeys() {
    doTestStringOnlyMapKeys(KnownTProtocolNames.TBSONProtocol)
  }

  @Test(expected=classOf[NonStringMapKeyException])
  def testTReadableJSONStringOnlyMapKeys() {
    doTestStringOnlyMapKeys(KnownTProtocolNames.TReadableJSONProtocol)
  }

  private def doTestStringOnlyMapKeys(tproto: String) {
    val struct = MapWithI32Keys.newBuilder
      .foo(Map(123 -> "A", 456 -> "B"))
      .result()

    // Attempt to write the object out.
    val protocolFactory = TProtocolInfo.getWriterFactory(tproto)
    val trans = new TMemoryBuffer(1024)
    val oprot = protocolFactory.getProtocol(trans)
    struct.write(oprot)  // Expected to throw NonStringMapKeyException.
  }
}
