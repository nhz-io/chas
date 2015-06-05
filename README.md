# chas

Channel API Server

[![Build Status][travis-image]][travis-url]

[![NPM][npm-image]][npm-url]

## Classes

### [Resource][resource.coffee-url]
Dummy resource for services.

### [Channel][channel.coffee-url]
Communication channel class. Extends [EventEmitter][events.EventEmitter-url]

#### Properties
* split - a [split stream][split-join-url]
* join - a [join stream][split-join-url]
* socket - an underlying [socket][net.Socket-url]

#### Methods
* constructor({socket:[Socket][net.Socket-url]})
  * Will throw an error if no `socket` provided

* read()
  * Returns the data waiting on the [join stream][split-join-url]

* write(message)
  * Writes the message into the [split stream][split-join-url]

* close()
  * Closes the `streams` and ends the `socket`

#### Extended methods
* [once][once-url](event, callback)
* [on][on-url](event, callback)
* [addListener][addListener-url](event, callback)
* [removeListener][removeListener-url](event, callback)
* [removeAllListeners][removeAllListeners-url](event)
* [listeners][listeners-url](event)

The above methods call the respective methods of the [join stream][split-join-url]
if the event argument is `'data'` or call the `super` method otherwise

#### Events
* data
  * The listener will receive the message coming from the other end of the channel.
    The message can be either `String`, `Object` or `Array`.
    The channel is originally intended to transfer JSON object.

### [Service][service.coffee-url]
Receives messages coming from the `channel`. Message must be an object with:
* id
* params
* resource
* action

### [Server][server.coffee-url]
Extends [Sever][net.Server-url]. Automatically creates a `channel` upon new connection
and emits `channel` event. Automatically closes the `channel` when `socket` ends.


[travis-image]: https://travis-ci.org/nhz-io/chas.svg
[travis-url]: https://travis-ci.org/nhz-io/chas

[npm-image]: https://nodei.co/npm/chas.png
[npm-url]: https://nodei.co/npm/chas

[resource.coffee-url]: source/resource.coffee
[channel.coffee-url]: source/channel.coffee
[service.coffee-url]: source/service.coffee
[server.coffee-url]: source/server.coffee

[net.Socket-url]: https://nodejs.org/api/net.html#net_class_net_socket
[events.EventEmitter-url]: https://nodejs.org/api/events.html#events_class_events_eventemitter

[split-join-url]: https://github.com/nhz-io/split-join
[once-url]: https://nodejs.org/api/events.html#events_emitter_once_event_listener
[on-url]: https://nodejs.org/api/events.html#events_emitter_on_event_listener
[addListener-url]: https://nodejs.org/api/events.html#events_emitter_addlistener_event_listener
[removeListener-url]: https://nodejs.org/api/events.html#events_emitter_removelistener_event_listener
[removeAllListeners-url]: https://nodejs.org/api/events.html#events_emitter_removealllisteners_event
[listeners-url]: https://nodejs.org/api/events.html#events_emitter_listeners_event
