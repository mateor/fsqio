namespace java io.fsq.thriftexample.talent

include "io/fsq/thriftexample/people/person.thrift"

typedef person.Person PersonDetails

struct Actor {
  1: required PersonDetails details
  2: optional PersonDetails agentDetails
}
