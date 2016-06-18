// Copyright 2014 Foursquare Labs Inc. All Rights Reserved.

package io.fsq.spindle.codegen.binary.test

import io.fsq.spindle.codegen.binary.ThriftCodegen
import java.nio.file.{Files, Paths}
import java.util.Arrays
import org.junit.{Rule, Test, Ignore}
import org.junit.Assert._
import org.junit.rules.TemporaryFolder

class CodegenSampleTest {
  val SampleFolder = "test/jvm/io/fsq/spindle/codegen/binary/output"
  val OutFolder = "io/fsq/common/thrift/descriptors/programs/gen"
  val Filenames = Vector("java_programs.java", "programs.scala")
  val Message = "The thrift_descriptor samples didn't match. %s has been overwritten with the expected value."

  val outDir = new TemporaryFolder()
  @Rule def outDirFn = outDir

  val workingDir = new TemporaryFolder()
  @Rule def workingDirFn = workingDir

  @Ignore("Travis cannot handle a 10,000+ line Scala file, who knew. Split this into a smaller check.")
  def testSampleMatchesActualCodegen(): Unit = {

    ThriftCodegen.main(Array(
      "--template", "src/resources/io/fsq/ssp/codegen/scala/record.ssp",
      "--java_template", "src/resources/io/fsq/ssp/codegen/javagen/record.ssp",
      "--extension", "scala",
      "--thrift_include", "src/thrift",
      "--namespace_out", outDir.getRoot.getAbsolutePath,
      "--working_dir", workingDir.getRoot.getAbsolutePath,
      "src/thrift/io/fsq/common/thrift/descriptors/programs/gen/programs.thrift"
    ))

    val noMatchFiles = Filenames.filterNot(filename => {
      val expected = Files.readAllBytes(Paths.get(outDir.getRoot.getAbsolutePath, OutFolder, filename))
      val actualPath = Paths.get(SampleFolder, filename)
      val matches = try {
        Arrays.equals(expected, Files.readAllBytes(actualPath))
      } catch {
        case _: Exception => false
      }
      if (!matches) {
        // Be helpful and overwrite the sample with the expected value.
        Files.write(actualPath, expected)
      }
      matches
    })
    assertTrue(
      "The thrift_descriptor samples didn't match. They have been overwritten with the expected values.",
      noMatchFiles.isEmpty
    )
  }
}
