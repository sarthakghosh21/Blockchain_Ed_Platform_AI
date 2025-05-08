<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Courses</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: white;
        }
        .container {
            margin-top: 40px;
        }
        .card {
            background-color: #1e1e1e;
            border: 1px solid #333;
            color: white;
        }
        iframe {
            width: 100%;
            height: 300px;
            border-radius: 10px;
        }
        #chatbot-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 300px;
            background-color: #1e1e1e;
            border: 1px solid #444;
            border-radius: 10px;
            padding: 10px;
            z-index: 999;
        }
        #chatbox {
            height: 200px;
            overflow-y: auto;
            margin-bottom: 10px;
            background: #2c2c2c;
            padding: 10px;
            border-radius: 8px;
            color: #fff;
        }
        #user-input {
            width: 100%;
            border-radius: 5px;
            padding: 5px;
            border: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-5">Courses</h2>
        <div class="row row-cols-1 row-cols-md-2 g-4">
            <div class="col">
                <div class="card">
                    <div class="card-header">Course 1: Blockchain Basics</div>
                    <div class="card-body">
                        <iframe src="https://www.youtube.com/embed/SSo_EIwHSd4" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-header">Course 2: Ethereum Explained</div>
                    <div class="card-body">
                        <iframe src="https://www.youtube.com/embed/jxLkbJozKbY" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Chatbot -->
    <div id="chatbot-container">
        <div id="chatbox"></div>
        <input type="text" id="user-input" placeholder="Ask a doubt...">
    </div>

    <script>
        const input = document.getElementById("user-input");
        const chatbox = document.getElementById("chatbox");

        input.addEventListener("keydown", function (e) {
            if (e.key === "Enter") {
                const message = input.value.trim();
                if (message) {
                    chatbox.innerHTML += `<div><strong>You:</strong> ${message}</div>`;
                    input.value = "";

                    fetch("/chat", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({ message: message })
                    })
                    .then(res => res.json())
                    .then(data => {
                        chatbox.innerHTML += `<div><strong>Bot:</strong> ${data.response}</div>`;
                        chatbox.scrollTop = chatbox.scrollHeight;
                    })
                    .catch(err => {
                        chatbox.innerHTML += `<div><strong>Bot:</strong> Error getting response.</div>`;
                    });
                }
            }
        });
    </script>
</body>
</html>
