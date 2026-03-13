# API Endpoints Extraction Report

**Source:** SSL Capture Files from `/information/original_API_requests/logs/`  
**Total Files Processed:** 132  
**Total Unique Endpoints Found:** 24  
**Generation Date:** 2024

---

## Executive Summary

This report documents all API endpoints discovered from SSL traffic captures of the Goal Tactics mobile application. The data was extracted from 132 capture files containing HTTP request/response pairs.

### Key Findings:
- **24 unique API endpoints** identified across **13 controllers**
- All endpoints use **JSON request/response bodies** (except for some GET endpoints)
- Authentication required for most endpoints (via `Token` field)
- Consistent request signature pattern across all authenticated endpoints
- Response envelopes include standard error handling fields

---

## API Endpoints by Controller

### 1. Authentication (1 endpoint)

#### POST `/api/Authentication/Login`
- **Occurrences:** 1
- **Request Schema:**
  ```json
  {
    "Login": "string",
    "Password": "string",
    "Signature": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "token": "string",
    "userId": "string",
    "level": "number",
    "isAdmin": "boolean",
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

---

### 2. Chat (1 endpoint)

#### POST `/api/Chat/GetChatHistory`
- **Occurrences:** 3
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:** No JSON body

---

### 3. Common (2 endpoints)

#### GET `/api/Common/GetVersion`
- **Occurrences:** 1
- **Request Schema:** No JSON body
- **Response Schema:** `number` (API version as integer)

#### POST `/api/Common/GetCountries`
- **Occurrences:** 1
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "countries": "array<{id, name, short}>",
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

---

### 4. Friends (2 endpoints)

#### POST `/api/Friends/GetChallenges`
- **Occurrences:** 1
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "challenges": "array<...>",
    "friends": "array<...>",
    "matchDate": "string",
    "endDate": "string",
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

#### POST `/api/Friends/GetFriends`
- **Occurrences:** 1
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "friends": "array<...>",
    "friendName": "null",
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

---

### 5. League (1 endpoint)

#### POST `/api/League/GetLeagueTable`
- **Occurrences:** 1
- **Request Schema:**
  ```json
  {
    "Id": "string",
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "teams": "array<...>",
    "leagueName": "string",
    "mount": "number",
    "dismount": "number",
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

---

### 6. Sponsor (1 endpoint)

#### POST `/api/Sponsor/GetSponsors`
- **Occurrences:** 4
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:** No JSON body

---

### 7. Squad (2 endpoints)

#### POST `/api/Squad/GetPlayers`
- **Occurrences:** 3
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "players": "array<...>",
    "playersOnTransfermarket": "array",
    "homeShirt": "string",
    "awayShirt": "string",
    "costRename": "number",
    "costShirt": "number",
    "costOrigin": "number",
    "costUpgrade": "number",
    "transfermarketMinHours": "number",
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

#### POST `/api/Squad/GetSkillCards`
- **Occurrences:** 3
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "cards": "array<...>",
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

---

### 8. Stadium (2 endpoints)

#### POST `/api/Stadium/GetStadium`
- **Occurrences:** 3
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:** No JSON body

#### POST `/api/Stadium/GetUnderConstruction`
- **Occurrences:** 1
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "building": {
      "id": "string",
      "name": "string",
      "description": "null",
      "effectName": "null",
      "currentValue": "number",
      "maxValue": "number",
      "newValue": "number",
      "buildStart": "null",
      "buildEnd": "string",
      "earnings": "number",
      "utilization": "number",
      "upgradeCost": "number",
      "upgradeCostPremium": "number",
      "dailyCost": "number",
      "dailyCostIncrease": "number",
      "profit": "number",
      "profitSign": "null",
      "profitIncrease": "number",
      "duration": "number",
      "capacity": "number",
      "hasWarning": "boolean"
    },
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

---

### 9. Team (8 endpoints)

#### POST `/api/Team/GetAccomplishments`
- **Occurrences:** 1
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:** No JSON body

#### POST `/api/Team/GetFinanceHistory`
- **Occurrences:** 1
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "financeHistory": "array<...>",
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

#### POST `/api/Team/GetFinances`
- **Occurrences:** 1
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "today": "number",
    "yesterday": "number",
    "todays": "array<...>",
    "yesterdays": "array<...>",
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

#### POST `/api/Team/GetMyMail`
- **Occurrences:** 1
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:** No JSON body

#### POST `/api/Team/GetMyResources`
- **Occurrences:** 48 (Most frequently called endpoint)
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "money": "number",
    "medipacks": "number",
    "gtStars": "number",
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

#### POST `/api/Team/GetMyTeamExtendedInfo`
- **Occurrences:** 3
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:** No JSON body

#### POST `/api/Team/GetMyTeamInfo`
- **Occurrences:** 2
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "teamData": {
      "name": "string",
      "logo": "string",
      "country": "string",
      "countryName": "string",
      "leagueName": "string",
      "leagueId": "string",
      "homeTrikot": "string",
      "awayTrikot": "string",
      "marketValue": "number",
      "strength": "number",
      "mood": "number",
      "teamMood": "string",
      "wins": "number",
      "losses": "number",
      "fans": "number",
      "members": "number",
      "matchTrend": "string",
      "userData": "object",
      "myLike": "boolean",
      "likesMe": "boolean",
      "challengeStatus": "number"
    },
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

#### POST `/api/Team/GetTeamInfo`
- **Occurrences:** 2
- **Request Schema:**
  ```json
  {
    "Id": "string",
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "teamData": {
      "name": "string",
      "logo": "string",
      "country": "string",
      "countryName": "string",
      "leagueName": "string",
      "leagueId": "string",
      "homeTrikot": "string",
      "awayTrikot": "string",
      "marketValue": "number",
      "strength": "number",
      "mood": "number",
      "teamMood": "string",
      "wins": "number",
      "losses": "number",
      "fans": "number",
      "members": "number",
      "matchTrend": "string",
      "userData": "object",
      "myLike": "boolean",
      "likesMe": "boolean",
      "challengeStatus": "number"
    },
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

---

### 10. Training (1 endpoint)

#### POST `/api/Training/GetTraining`
- **Occurrences:** 1
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:** No JSON body

---

### 11. Transfermarket (1 endpoint)

#### POST `/api/Transfermarket/Search`
- **Occurrences:** 1
- **Request Schema:**
  ```json
  {
    "Talent": {
      "Min": "number",
      "Max": "number"
    },
    "SkillIndex": "number",
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "players": "array<...>",
    "favorites": "array<...>",
    "sellings": "array",
    "involved": "boolean",
    "myTeamId": "string",
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

---

### 12. Tutorial (1 endpoint)

#### POST `/api/Tutorial/GetTutorial`
- **Occurrences:** 1
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "currentStep": "null",
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

---

### 13. User (1 endpoint)

#### POST `/api/User/GetPreferences`
- **Occurrences:** 1
- **Request Schema:**
  ```json
  {
    "Signature": "string",
    "Token": "string",
    "Locale": "string",
    "UtcOffset": "string",
    "Culture": "string",
    "Platform": "number"
  }
  ```
- **Response Schema:**
  ```json
  {
    "notificationSettings": {
      "auctionOverbid": "boolean",
      "matchResults": "boolean",
      "lineupIncomplete": "boolean",
      "friendInvite": "boolean",
      "ineffectiveTraining": "boolean",
      "friendlyMatch": "boolean",
      "system": "boolean",
      "auctionEnd": "boolean"
    },
    "userData": {
      "name": "string",
      "score": "number",
      "created": "string",
      "lastActivity": "string",
      "facebookId": "string",
      "appleId": "null",
      "email": "string",
      "password": "null",
      "rank": "string"
    },
    "errorMessage": "null",
    "status": "number",
    "message": "null",
    "punishment": "number"
  }
  ```

---

## Common Patterns

### Request Signature Pattern (Standard Authenticated Endpoints)
Most authenticated endpoints follow this request pattern:
```json
{
  "Signature": "string",      // MD5 hash for security
  "Token": "string",          // UUID auth token
  "Locale": "string",         // e.g., "de-DE"
  "UtcOffset": "string",      // e.g., "01:00:00"
  "Culture": "string",        // e.g., "de-DE"
  "Platform": "number"        // Client platform ID
}
```

### Response Envelope Pattern
Most responses follow this wrapper pattern:
```json
{
  // ... actual data fields ...
  "errorMessage": "null|string",  // Error details or null
  "status": "number",             // HTTP-like status code (1 = success)
  "message": "null|string",       // Additional message
  "punishment": "number"          // User punishment level
}
```

---

## Statistics

| Metric | Count |
|--------|-------|
| Total Unique Endpoints | 24 |
| Total Controllers | 13 |
| Endpoints with Responses | 20 |
| Endpoints without Response Body | 4 |
| GET Endpoints | 1 |
| POST Endpoints | 23 |
| Most Called Endpoint | `/api/Team/GetMyResources` (48 occurrences) |

---

## Generated Files

The following files have been created in the repository root:

1. **API_ENDPOINTS_SUMMARY.txt** - Human-readable summary of all endpoints
2. **API_ENDPOINTS_REFERENCE.json** - Compact JSON reference with schemas
3. **API_ENDPOINTS_DETAILED.json** - Complete detailed JSON with sample data
4. **API_ENDPOINTS_CLEAN.json** - Raw extracted endpoint data
5. **API_EXTRACTION_REPORT.md** - This comprehensive report

---

## Recommendations for DTO Comparison

1. Compare response schemas in `API_ENDPOINTS_REFERENCE.json` against current DTOs
2. Validate that all array types have proper nested type definitions
3. Check for any missing optional fields marked as "null"
4. Ensure error handling fields are present in all response DTOs
5. Verify platform support field is properly typed as number
