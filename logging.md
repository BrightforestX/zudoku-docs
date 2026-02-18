# Logging & Crashlytics

Zudoku supports Firebase Crashlytics and Google Cloud Logging for structured observability. All logs
use a consistent format and never include secrets or PII.

## Structured Log Format

Logs use JSON with these fields:

- **event**: Event name/category
- **level**: `debug` | `info` | `warn` | `error`
- **component**: Component/module name (e.g. `zudoku`, `zudoku-cli`)
- **message**: Human-readable message
- **timestamp**: ISO 8601 (when applicable)

Example:

```json
{
  "event": "config_loaded",
  "level": "info",
  "component": "zudoku",
  "message": "Configuration loaded successfully",
  "timestamp": "2025-02-18T12:00:00.000Z"
}
```

**Never log secrets or PII.** Use `sanitizeForLogging()` from `zudoku/lib/logging` when handling
user input or sensitive data.

## Server-Side: Cloud Logging (Node/TS)

When `FIREBASE_PROJECT_ID` and `GOOGLE_APPLICATION_CREDENTIALS` are set, the Zudoku dev server sends
`info`, `warn`, and `error` logs to Google Cloud Logging.

### Setup

1. Create a
   [Google Cloud service account](https://console.cloud.google.com/iam-admin/serviceaccounts) with
   **Logs Writer** role.
2. Download the JSON key.
3. Set environment variables:

```bash
FIREBASE_PROJECT_ID=your-firebase-project-id
GOOGLE_APPLICATION_CREDENTIALS=/path/to/service-account-key.json
```

Or use `.env`:

```env
FIREBASE_PROJECT_ID=your-firebase-project-id
GOOGLE_APPLICATION_CREDENTIALS=./service-account-key.json
```

### Usage

The Zudoku logger automatically forwards logs when Cloud Logging is enabled. No code changes are
required.

## Client-Side: Firebase Crashlytics (React)

To enable Firebase Crashlytics for client-side error reporting:

1. Install the Firebase peer dependency: `pnpm add firebase`
2. Set public env vars (via `.env` or `ZUDOKU_PUBLIC_*` in config):

```env
ZUDOKU_PUBLIC_FIREBASE_PROJECT_ID=your-project-id
ZUDOKU_PUBLIC_FIREBASE_API_KEY=your-api-key
ZUDOKU_PUBLIC_FIREBASE_APP_ID=your-app-id
```

Crashlytics initializes automatically when these are set. Uncaught errors and unhandled promise
rejections are reported to Firebase Crashlytics.

## Go CLI: Cloud Logging

The Zudoku CLI (`zudoku-cli`) uses structured JSON logs. When `FIREBASE_PROJECT_ID` and
`GOOGLE_APPLICATION_CREDENTIALS` are set, logs are also sent to Google Cloud Logging.

```bash
export FIREBASE_PROJECT_ID=your-project-id
export GOOGLE_APPLICATION_CREDENTIALS=/path/to/key.json
zudoku search "query" --domain example.com
```

## Firebase Config

A minimal `firebase.json` at the project root can be used for Firebase CLI tooling:

```json
{
  "projects": {
    "default": "your-firebase-project-id"
  }
}
```

Replace `your-firebase-project-id` with your actual Firebase/GCP project ID.

## Best Practices

- Use structured fields (`event`, `level`, `component`, `message`) consistently.
- Never log API keys, passwords, tokens, or PII (emails, SSNs, etc.).
- Prefer `info` for normal operations, `warn` for recoverable issues, `error` for failures.
- In production, keep `LOG_LEVEL` at `info` or `warn` to avoid excessive logs.
