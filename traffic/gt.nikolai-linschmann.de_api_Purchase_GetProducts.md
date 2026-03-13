# https://gt.nikolai-linschmann.de/api/Purchase/GetProducts

## Request

```
{
  "Signature": "ce245fc6d4bb2d406925f81a8855f194",
  "Token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiYWQ0MTNiYzg4OGY0NDExYjRiZDZlNmYyYWVlMTgyOCIsInVuaXF1ZV9uYW1lIjoiVGVzdCIsImp0aSI6ImZmNmQwNmI4NTM1NDQwOGNhZmExMTlhYWUwOTQwNTAzIiwibmJmIjoxNzczNDE0NzcyLCJleHAiOjE3NzM0MjE5NzIsImlzcyI6IkdvYWxUYWN0aWNzLkFwaSIsImF1ZCI6IkdvYWxUYWN0aWNzLkNsaWVudCJ9.XKmL6YMFGenxkl3db6Z8f4bSw_s0NsedZUBQZZvTbFM",
  "Locale": "en-DE",
  "UtcOffset": "00:00:00",
  "Culture": "en-US",
  "Platform": 1
}
```

## Response

```
{
  "products": [
    {
      "id": "a1b2c3d4-e5f6-0000-0000-000000000001",
      "name": "20.000 GT Stars",
      "category": "gt_stars",
      "price": 599,
      "identifier": "com.xyrality.goaltactics.stars_20k",
      "image": "",
      "money": 0,
      "medipacks": 0,
      "gtStars": 20000
    },
    {
      "id": "a1b2c3d4-e5f6-0000-0000-000000000002",
      "name": "44.000 GT Stars",
      "category": "gt_stars",
      "price": 1099,
      "identifier": "com.xyrality.goaltactics.stars_44k",
      "image": "",
      "money": 0,
      "medipacks": 0,
      "gtStars": 44000
    },
    {
      "id": "a1b2c3d4-e5f6-0000-0000-000000000003",
      "name": "87.000 GT Stars",
      "category": "gt_stars",
      "price": 2199,
      "identifier": "com.xyrality.goaltactics.stars_87k",
      "image": "",
      "money": 0,
      "medipacks": 0,
      "gtStars": 87000
    },
    {
      "id": "a1b2c3d4-e5f6-0000-0000-000000000004",
      "name": "250.000 GT Stars",
      "category": "gt_stars",
      "price": 5499,
      "identifier": "com.xyrality.goaltactics.stars_250k",
      "image": "",
      "money": 0,
      "medipacks": 0,
      "gtStars": 250000
    },
    {
      "id": "a1b2c3d4-e5f6-0000-0000-000000000005",
      "name": "600.000 GT Stars",
      "category": "gt_stars",
      "price": 10999,
      "identifier": "com.xyrality.goaltactics.stars_600k",
      "image": "",
      "money": 0,
      "medipacks": 0,
      "gtStars": 600000
    }
  ],
  "userData": null,
  "success": true,
  "message": null,
  "status": 1,
  "errorMessage": null,
  "punishment": 0,
  "totalCount": 0,
  "currentPage": 0,
  "totalPages": 0
}
```
