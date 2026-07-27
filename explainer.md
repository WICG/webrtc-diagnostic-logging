# Explainer: WebRTC Diagnostic Logging API

## Authors:

 - Guido Urdaneta (Google)

## 1. Introduction
WebRTC applications often encounter complex connectivity or media quality issues
that are difficult to reproduce in local environments. To debug these issues in
production, sometimes it is helpful for developers to have access to internal
state and performance metrics. This also applies to issues in the user agent.

The WebRTC Web Diagnostic Logging API allows authorized web applications to
trigger the collection of diagnostic data in a log file so that it can be used
for local debugging. It also allows an application to share the diagnostic
data with the user agent vendor, subject to user authorization, with the purpose
of providing information that can help fix bugs in or improve the user agent.

This API is mainly targeted to enterprise users, although there is nothing in
the spec that prevents its usage in any other environments.

## 2. Goals
*  Help developers troubleshoot and improve WebRTC applications by allowing the
   user agent to collect internal diagnostic data into local log files that
   provide insight into WebRTC sessions. An example of this is an individual
   developer fixing a bug with the help of the logs.
*  Help organizations troubleshoot WebRTC applications by allowing them to
   to collect internal diagnostic data that provide insight into WebRTC
   sessions. An example of this is an organization that aggregates and processes
   logs from its users and finds bugs in their internal WebRTC deployment.
*  Help users and application developers collaborate with user agents vendors by
   making it possible to share diagnostic logs with the user agent vendor.

## 3. Non-Goals
The following are explicit non-goals
* The proposed API does not provide a mechanism to share diagnostic data about
  WebRTC sessions with the application. That is, the API does not expose any
  diagnostic information to the application other than a unique ID that can
  be used to identify a WebRTC logging session.
* The proposed API does not impose any requirements with regards to format or
  specific diagnostic data to be collected by the user agent or any
  characteristics of how the data collection method works.
* The proposed API does not impose any requirements with regards to the
  mechanism for sharing diagnostic logs with the user agent, other than it
  requires explicit authorization by the user.
* The proposed API does not impose any requirements with regards to the
  specific mechanism for user authorization. The only requirement is that the
  application cannot know if diagnostic logging is allowed or not.

## 4. Proposed Approach

The proposed approach is to provide a API with three operations:
* Start diagnostic logging: starts diagnostic logging and returns a unique ID
  that can be used to identify the logging session.
* Finish diagnostic logging: stops logging and makes the collected diagnostic
  data available as local files, in an implementation-defined manner.
* Cancel diagnostic logging: stops logging and discards any collected diagnostic
  data.

Example use for local debugging:
```javascript
// Before starting a call
await RTCPeerConnection.startDiagnosticLogging();

// When a call ends normally
await RTCPeerConnection.finishDiagnosticLogging();

// When a situation occurs where the diagnostic data is not useful
await RTCPeerConnection.cancelLogging();
```

The application can allow sharing the diagnostic data with the user agent
(subject to user authorization) and add custom metadata to the log:
```
let id = await RTCPeerConnection.startDiagnosticLogging({allowUpload: true, metadata: {'app':'myapp'}});
sendToApplication(id);

await RTCPeerConnection.finishDiagnosticLogging();
```

In this case, the application can file a bug report with the user agent and 
include the id in the report, so that user-agent developers can associate the
shared log with the bug report.

## 5. Privacy and Security Considerations

This API allows a user agent to collect internal diagnostic data about WebRTC
operations. This data should never be exposed to the Web application as it
may contain internal information about user activity.

The collection of this data requires explicit user authorization. The proposed
spec does not define a specific authorization mechanism, but possible schemes
could include UI controls, prompts, enterprise policies, or any combination
thereof.

The collected data is stored locally, in an implementation-defined manner.
The API provides an option to share the collected diagnostic logs with the user
agent vendor via an implementation-defined mechanism. The only for these
implementation details is that all operations must be explicitly authorized by
the user.

The API also allows the application to attach metadata to the logs when starting
and finishing the logging session. To prevent abuse, the API enforces limits on
the size of the metadata. Specifically, no more than 5 key-value pairs can be
attached, and each key and each value must be no greater than 100 characters.

## Stakeholder Feedback / Opposition

- Google (implementor) : Positive
- ByteDance (stakeholder) : [Interested in a solution for at least one of the use cases](https://github.com/w3c/webrtc-extensions/issues/124)
