function myFunction() {
    alert("You clicked a button.");
  }

document.addEventListener("DOMContentLoaded", function () {
    const chatList = document.getElementById("chat");
    const messageInput = document.getElementById("message-input");
    const sendButton = document.getElementById("send-button");

    sendButton.addEventListener("click", function () {
        const messageText = messageInput.value.trim();
        if (messageText !== "") {
            const messageElement = document.createElement("li");
            messageElement.textContent = messageText;
            chatList.appendChild(messageElement);
            messageInput.value = "";
            messageInput.focus();
            // You can add additional logic here, such as sending the message to a server.
        }
    });
});
