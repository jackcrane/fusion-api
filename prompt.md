im building an app where the following happens:
[All ids will be uuids; all fields will have an createdAt and updatedAt field]

- A user (only name is saved, no passwords or anything; all internal connections will use the user ID)
- A user will be able to connect their account to one other user (this is a two way connection, so if user A connects to user B, user B will also be connected to user A)
- There are cards "questions" that will be shown to the users, and the users will be able to answer them as either "yes", "maybe", or "no"; the cards should be sorted into stacks based on the users' answers and will lean towards the most negative sentiment, so if user A answers "yes" on a card, and their partner answers "no", the card will be sorted into the "no" stack.
- When a user requests their card information, their UUID will be in their auth header (JWT). Only show them cards that they answered positively in. For example, if user A answered "yes" a card and user B answered "no", do not show user B that user A answered "yes" on that card, but show user A that their partner answered "no" on that card.
- Both users will be shown the same cards (should be in a different order)
- Cards will be owned by a "CardSet", where the cardsets may have themes. The users will be able to buy CardSets. If a user buys a CardSet, their partner will also be able to use it. Some CardSets will be free. CardSets will be made by other users in the community.
- There will be "dares" where a user can challenge their partner to a card. Dares are linked to a question card. Dares can be "pending", "accepted", "done", or "expired", as well as having a "due" and "points" field.

---

Create and implement an endpoint for `card`. It should return a question for a user to answer
The question should

- Be a card from a cardset that the user has access to
- Not be a card that the user has already answered
- Where possible, be a card that the user's partner has answered
- Where possible, be a random card that satisfies the above conditions and card returns should not necessarily be in the same order for both users
- If user has answered all cards, return `204 No Content`
