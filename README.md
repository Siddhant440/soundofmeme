# soundofmeme
created by Siddhant Bisht

SoundOfMeme is a application powered by Gemini AI that generates meme-style lyrics based on user input. At this stage, music functionality is not included in the project.

How It Works -

Application Purpose: The app generates lyrics with sarcasm, jokes, parody, or memes, based on user requests.
Integration: Utilizes Gemini AI to create content and Firestore to store chat history.

Roles of Dart Files-

**message.dart**

Function: Defines the Message class to store details like the sender (user or AI), message content, and timestamp.

**messages.dart**

Function: Renders messages in the chat UI, applies different styles for user and AI messages, and handles message display, including loading indicators.

**chat_screen.dart**

Function: Manages the main chat interface, including sending messages, interacting with Gemini AI, and displaying lyrics in a LyricsCard.

**firebase_service.dart**

Function: Handles Firestore interactions:
addMessage: Adds new messages to Firestore.
updateMessage: Updates existing messages.
deleteMessage: Deletes messages.
getMessagesStream: Streams messages for real-time updates.

**custom_appbar.dart**

Function: Defines a custom AppBar with a title, logo, and a button to toggle the CustomDrawer.

**custom_drawer.dart**

Function: Shows chat history in a drawer, fetching messages from Firestore. Users can also delete messages from this history.

**lyrics_card.dart**

Function: Displays generated lyrics in a full-screen overlay with a background image and a close button. Uses SlidingText for animating the lyrics.

**message_card.dart**

Function: Renders individual messages in the history drawer with a delete button and timestamp, allowing message deletion from Firestore.

**sliding_text.dart**

Function: Manages scrolling of lyrics within the LyricsCard, ensuring lyrics scroll to the bottom and allowing users to scroll back up.
Overall Flow

User Input: The user types and sends a message.
Message Handling: The app processes the message, adds it to the chat, and sends it to Gemini AI.
AI Response: Gemini AI generates lyrics, which are displayed in the chat.
Firestore Integration: Messages are stored in Firestore. Users can view and delete messages from the history drawer.
Lyrics Display: Generated lyrics appear in a LyricsCard, with scrolling managed by SlidingText.
