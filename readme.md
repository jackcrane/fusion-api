# Fusion API Docs

## Deployment

```diff
- TODO: Add deployment instructions
- TODO: Dockerize
- TODO: Add GitHub Actions
```

## Authorization

Almost all routes will require authorization. This app does not use passwords, and jwts will be provided when

- A user registers
- A call is made to the `/login` endpoint with the users `uuid`.

All `jwt`s are not set to expire. `jwt`s have an `id` field that is the users `uuid`. All `jwt`s are verified against the `JWT_SECRET` environment variable.

### `POST /user/register`

Registers a new user. Returns a `jwt`.

#### Request

```json
{
  "name": "Jack Crane"
}
```

#### Response

```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBiZTYzODk6LTA1M2EtNDkwYy1iY2FjLTVlZDg3MjIzMDY4NCIsImlhdCI6MTY4NTQ5MTEzNCwiZXhwIjoxNjg2MDk1OTM0fQ.HORCY9SgG7ViaI_6XFnjazHntxC89yiquIipzQcpBso"
}
```

#### Headers

```json
{
  "Content-Type": "application/json"
}
```

### `POST /user/login`

Logs in a user by uuid. Returns a `jwt`.

#### Request

```json
{
  "userId": "0be6389-053a-490c-bcaf-5ed872230684"
}
```

#### Response

```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBiZTYzODk6LTA1M2EtNDkwYy1iY2FjLTVlZDg3MjIzMDY4NCIsImlhdCI6MTY4NTQ5MTEzNCwiZXhwIjoxNjg2MDk1OTM0fQ.HORCY9SgG7ViaI_6XFnjazHntxC89yiquIipzQcpBso"
}
```

#### Headers

```json
{
  "Content-Type": "application/json"
}
```

### `GET /user`

Returns the user associated with the `jwt` provided in the `authorization` header.

#### Headers

```json
{
  "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBiZTYzODk6LTA1M2EtNDkwYy1iY2FjLTVlZDg3MjIzMDY4NCIsImlhdCI6MTY4NTQ5MTEzNCwiZXhwIjoxNjg2MDk1OTM0fQ.HORCY9SgG7ViaI_6XFnjazHntxC89yiquIipzQcpBso"
}
```

## Relationships [`partnerships`]

Because the nature of this app is to connect people in relationships, users will be connected with a partner immediately after registration. This is done by one user `inviting` another user to be their partner. The invited user must then `accept` the invitation. This happens client-side with a 6-digit pin.

### `POST /partner/invite`

Invites a user to be a partner. Returns an [`invitation`](#invitation) object. The `code` field is the 6-digit pin that the user shares with their partner and is supplied to the `accept` endpoint.

#### Headers

```json
{
  "Content-Type": "application/json",
  "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBiZTYzODk6LTA1M2EtNDkwYy1iY2FjLTVlZDg3MjIzMDY4NCIsImlhdCI6MTY4NTQ5MTEzNCwiZXhwIjoxNjg2MDk1OTM0fQ.HORCY9SgG7ViaI_6XFnjazHntxC89yiquIipzQcpBso"
}
```

### `POST /partner/accept`

Accepts an invitation to be a partner.

#### Request

```json
{
  "code": "461074"
}
```

#### Response

```json
{
  "message": "Invitation accepted"
}
```

#### Headers

```json
{
  "Content-Type": "application/json",
  "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBiZTYzODk6LTA1M2EtNDkwYy1iY2FjLTVlZDg3MjIzMDY4NCIsImlhdCI6MTY4NTQ5MTEzNCwiZXhwIjoxNjg2MDk1OTM0fQ.HORCY9SgG7ViaI_6XFnjazHntxC89yiquIipzQcpBso"
}
```

## Types

### `invitation`

```json
{
  "id": "5e71495c-b7fe-4505-9098-00aeb997fe0b",
  "inviterId": "f6a4425f-6da8-44e9-9a60-480f6cc234bc",
  "code": "461074",
  "createdAt": "2023-05-31T00:00:24.093Z",
  "updatedAt": "2023-05-31T00:00:24.093Z"
}
```
