**2.1. What information does this feature expose, and for what purposes?**
The only information exposed by this feature is a random identifier (UUID format) that identifies a logging
session. This identifier can be used in bug reports if the logging session is shared with the user
agent vendor.


**2.2. Do features in your specification expose the minimum amount of information necessary to implement the intended functionality?**
Yes.

**2.3. Do the features in your specification expose personal information, personally-identifiable information (PII), or information derived from either?**
No.

**2.4. How do the features in your specification deal with sensitive information?**
The feature may deal with sensitive information, but that information is never exposed to the Web.
Logs produced by this feature are gated by explicit user consent and stored in local files.
The user can authorize sharing logs with the user agent vendor, but they are never exposed to the Web.

**2.5. Does data exposed by your specification carry related but distinct information that may not be obvious to users?**
No.

**2.6. Do the features in your specification introduce state that persists across browsing sessions?**
The feature can store logs in the file system, but these logs or any reference to them are never exposed to
the Web other than the random ID referred to above.

**2.7. Do the features in your specification expose information about the underlying platform to origins?**
No. Log files may contain information about the underlying platform, but they are not exposed to the Web.

**2.8. Does this specification allow an origin to send data to the underlying platform?**
If so, what kind of data can be sent?
No.

**2.9. Do features in this specification enable access to device sensors?**
No.

**2.10. Do features in this specification enable new script execution/loading mechanisms?**
No.

**2.11. Do features in this specification allow an origin to access other devices?**
No.

**2.12. Do features in this specification allow an origin some measure of control over a user agent’s native UI?**
No.

**2.13. What temporary identifiers do the features in this specification create or expose to the web?**
The only temporary identifier is the logging session identifier. A new identifier is generated for each
logging session. Since the API is best effort, a session identifier does not guarantee that logging
actually occurs, since logging is gated by explicit user consent not exposed to the Web.

**2.14. How does this specification distinguish between behavior in first-party and third-party contexts?**
The feature only works for first-party context. Any third-party resources included by the first-party
are ignored/not subject to diagnostic logging.

**2.15. How do the features in this specification work in the context of a browser’s Private Browsing or Incognito mode?**
A random logging session ID is generated, but no logging occurs in incognito mode. It is not possible
to detect incognito mode using this feature.

**2.16. Does this specification have both "Security Considerations" and "Privacy Considerations" sections?**
Yes.

**2.17. Do features in your specification enable origins to downgrade default security protections?**
No.

**2.18. What happens when a document that uses your feature is kept alive in BFCache (instead of getting destroyed) after navigation, and potentially gets reused on future navigations back to the document?**
The diagnostic logging related to the WebRTC activity for the document is ended. This is not visible to the Web application.

**2.19. What happens when a document that uses your feature gets disconnected?**
The diagnostic logging related to the WebRTC activity for the document is ended. This is not visible to the Web application.

**2.20. Does your spec define when and how new kinds of errors should be raised?**
The spec does not define any errors. It is a best-effort API. If an error occurs, it is handled internally and not exposed to the Web application.

**2.21. Does your feature allow sites to learn about the user’s use of assistive technology?**
No.

**2.22. What should this questionnaire have asked?**
The questions seem appropriate.
