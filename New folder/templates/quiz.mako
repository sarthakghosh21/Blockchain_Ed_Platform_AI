<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quiz</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: white;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            background-color: #1e1e1e;
            color: white;
            border: 1px solid #333;
        }
        .card-body {
            padding: 20px;
        }
        .btn-submit {
            background-color: #0d6efd;
            border: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-5">Quiz</h2>
        <form method="POST">
            <!-- Question 1 -->
            <div class="card mb-3">
                <div class="card-header">
                    Question 1: What is Blockchain?
                </div>
                <div class="card-body">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q1" id="q1a" value="answer1">
                        <label class="form-check-label" for="q1a">Answer 1: A digital ledger</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q1" id="q1b" value="answer2">
                        <label class="form-check-label" for="q1b">Answer 2: A type of cryptocurrency</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q1" id="q1c" value="answer3">
                        <label class="form-check-label" for="q1c">Answer 3: A decentralized database</label>
                    </div>
                </div>
            </div>
            
            <!-- Question 2 -->
            <div class="card mb-3">
                <div class="card-header">
                    Question 2: What is a Smart Contract?
                </div>
                <div class="card-body">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q2" id="q2a" value="answer1">
                        <label class="form-check-label" for="q2a">Answer 1: A contract written in legal terms</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q2" id="q2b" value="answer2">
                        <label class="form-check-label" for="q2b">Answer 2: A piece of code that automatically executes a contract on the blockchain</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q2" id="q2c" value="answer3">
                        <label class="form-check-label" for="q2c">Answer 3: A digital currency wallet</label>
                    </div>
                </div>
            </div>
            
            <!-- Question 3 -->
            <div class="card mb-3">
                <div class="card-header">
                    Question 3: What is the purpose of mining in blockchain technology?
                </div>
                <div class="card-body">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q3" id="q3a" value="answer1">
                        <label class="form-check-label" for="q3a">Answer 1: To create new blocks and validate transactions</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q3" id="q3b" value="answer2">
                        <label class="form-check-label" for="q3b">Answer 2: To store user data in the blockchain</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q3" id="q3c" value="answer3">
                        <label class="form-check-label" for="q3c">Answer 3: To delete old transactions</label>
                    </div>
                </div>
            </div>

            <!-- Question 4 -->
            <div class="card mb-3">
                <div class="card-header">
                    Question 4: What is the main advantage of using a Decentralized Exchange (DEX)?
                </div>
                <div class="card-body">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q4" id="q4a" value="answer1">
                        <label class="form-check-label" for="q4a">Answer 1: Centralized control over trades</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q4" id="q4b" value="answer2">
                        <label class="form-check-label" for="q4b">Answer 2: Greater security and no need for a middleman</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q4" id="q4c" value="answer3">
                        <label class="form-check-label" for="q4c">Answer 3: Lower fees due to middlemen</label>
                    </div>
                </div>
            </div>

            <!-- Question 5 -->
            <div class="card mb-3">
                <div class="card-header">
                    Question 5: Which consensus algorithm is used in Ethereum 2.0?
                </div>
                <div class="card-body">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q5" id="q5a" value="answer1">
                        <label class="form-check-label" for="q5a">Answer 1: Proof of Work</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q5" id="q5b" value="answer2">
                        <label class="form-check-label" for="q5b">Answer 2: Proof of Stake</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q5" id="q5c" value="answer3">
                        <label class="form-check-label" for="q5c">Answer 3: Delegated Proof of Stake</label>
                    </div>
                </div>
            </div>

            <!-- Question 6 -->
            <div class="card mb-3">
                <div class="card-header">
                    Question 6: Which cryptocurrency is primarily associated with Ethereum?
                </div>
                <div class="card-body">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q6" id="q6a" value="answer1">
                        <label class="form-check-label" for="q6a">Answer 1: Bitcoin</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q6" id="q6b" value="answer2">
                        <label class="form-check-label" for="q6b">Answer 2: Ether</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="q6" id="q6c" value="answer3">
                        <label class="form-check-label" for="q6c">Answer 3: Litecoin</label>
                    </div>
                </div>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-submit">Submit Quiz</button>
            </div>
        </form>
    </div>
</body>
</html>
