import consumer from "consumer"

document.addEventListener("turbo:load", () => {
  const messagesDiv = document.getElementById("chat-messages")

  if (messagesDiv) {
    const chatId = messagesDiv.dataset.chatId

    consumer.subscriptions.create(
      { channel: "ChatChannel", chat_id: chatId },
      {
        received(data) {
          messagesDiv.insertAdjacentHTML("beforeend", `
            <div class="chat-bubble theirs">
              <p>${data.content}</p>
              <span class="chat-time">${data.created_at}</span>
            </div>
          `)
        }
      }
    )
  }
})
