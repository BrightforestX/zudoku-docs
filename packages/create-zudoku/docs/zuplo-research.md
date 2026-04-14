# Zuplo API Monetization Research

## Zuplo Monetization Model

Zuplo's API monetization is built on four primitives:

### Meters

- **Purpose**: Count things (API calls, tokens consumed, bytes transferred)
- **Configuration**: Event type, aggregation (count/sum), JSONPath value extraction
- **Examples**:
  - `api_requests`: event_type="request", aggregation="count", increment_by=1
  - `tokens_total`: event_type="completion", aggregation="sum",
    value_property="$.usage.total_tokens"

### Features

- **Metered Features**: Link to a meter, enable quota tracking with included allowance
- **Static Features**: Boolean on/off (Priority Support, Beta access)
- **Entitlements**: Hard limits (blocked at quota) vs soft limits (overage billing)

### Plans

- **Structure**: Subscription tiers with phases containing rate cards
- **Phases**: Support trials (auto-convert to paid), multiple currencies, billing cadences
- **Examples**: "Pro plan with 2-week trial → $99/mo with 10K requests included"

### Rate Cards

- **Purpose**: Pricing atoms tying features to prices with entitlements
- **Pricing Models**:
  - Flat fee: $99/mo
  - Per-unit: $0.01 per API call
  - Tiered: Free (0-1K), $0.005 (1K-10K), $0.003 (10K+)

## Zuplo API Endpoints

### Metering

- `GET/POST /meters` - Manage meters
- `POST /meters/{id}/events` - Send metering events
- Metering policies: `monetization-metering-inbound`

### Plans & Pricing

- `GET/POST /plans` - Plan CRUD
- `POST /plans/{id}/publish` - Publish plan to Stripe
- Rate card APIs embedded in plan structure

### Stripe Integration

- `POST /stripe/connect` - Connect Stripe account
- Auto-creates Stripe Products and Prices when plans published
- Zuplo plan → Stripe Product
- Zuplo rate card → Stripe Price (recurring with billing scheme)

## Stripe API Patterns

### Pricing Structure

- **Products**: Represent offerings (inventory/provisioning)
- **Prices**: Specific SKUs (cost, currency, billing cycle)
- **Lookup Keys**: Dynamic price rendering (avoid hardcoded prices)

### Key Price Fields (in cents)

```typescript
{
  unit_amount: 1000, // $10.00
  currency: "usd",
  recurring: {
    interval: "month",
    interval_count: 1
  },
  lookup_key: "standard_monthly"
}
```

### Pricing Models

- **Flat-rate**: Same price per unit
- **Package**: Charge by group of units
- **Graduated**: Tiered pricing per unit blocks
- **Volume**: Same unit price above thresholds
- **Usage-based**: Metered billing

### Customer Management

- Customer objects linked to API keys
- Subscriptions auto-sync access state
- Failed payments → automatic revoke/downgrade
- Trial phases → auto-conversion

## Integration Patterns

### Gateway Metering Policy

```json
{
  "name": "meter-api-calls",
  "policyType": "monetization-metering-inbound",
  "options": {
    "meterName": "api_requests",
    "incrementBy": 1
  }
}
```

### Real-time Quota Enforcement

- Gateway checks usage before API execution
- Hits quota → 429 Too Many Requests response
- Finer-grained than batch-based metering

### Developer Portal Flow

1. Customer visits pricing page
2. Stripe Checkout session created
3. Payment success → Zuplo API key provisioned
4. Key scoped to plan entitlements
5. Usage tracked in real-time

## Required Types for Integration

### Zuplo Types Needed

- Meter configuration (event type, aggregation, value extraction)
- Feature types (metered vs static)
- Plan phases with rate cards
- Policy configurations

### Stripe Types Integration

- Price creation (unit_amount, recurring, lookup_key)
- Customer management
- Subscription lifecycle events
- Webhook handling for access control

## Key API Endpoints to Define

### Zuplo Integration

- /v1/meters - CRUD meters
- /v1/features - CRUD features
- /v1/plans - CRUD plans
- /v1/policies - Configure gateway policies
- /v1/api-keys - Customer API key management

### Stripe API Endpoints

- /v1/prices - Create/update prices
- /v1/customers - Customer management
- /v1/subscriptions - Subscription management
- /v1/checkout/sessions - Payment checkout
- /v1/webhook_endpoints - Event webhooks

### Transaction-Based Pricing Examples

- Payment APIs: 2.9% + $0.30 per charge (Stripe model)
- Fraud APIs: Per-screening fee ($0.01–$1.00)
- Volume discounts: 2.9% standard → 2.2% + $0.25 enterprise
