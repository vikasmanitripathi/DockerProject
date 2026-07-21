<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Credential Store</title>
    <style>
        :root {
            color-scheme: light;
        }
        * { box-sizing: border-box; }
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            margin: 0;
            min-height: 100vh;
            background: linear-gradient(135deg, #eff6ff 0%, #f8fafc 100%);
            color: #0f172a;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
        }
        .shell {
            width: min(100%, 1050px);
            background: white;
            border-radius: 24px;
            box-shadow: 0 20px 45px rgba(15, 23, 42, 0.12);
            overflow: hidden;
            display: grid;
            grid-template-columns: 1.05fr 0.95fr;
        }
        .visual {
            background: linear-gradient(145deg, #dbeafe 0%, #eff6ff 100%);
            padding: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .visual img {
            width: 100%;
            max-width: 420px;
            border-radius: 18px;
            box-shadow: 0 16px 30px rgba(37, 99, 235, 0.15);
        }
        .card {
            padding: 42px 38px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .eyebrow {
            display: inline-block;
            width: fit-content;
            padding: 6px 10px;
            border-radius: 999px;
            background: #dbeafe;
            color: #1d4ed8;
            font-size: 0.8rem;
            font-weight: 700;
            margin-bottom: 12px;
            letter-spacing: 0.04em;
            text-transform: uppercase;
        }
        h2 {
            margin: 0 0 8px;
            font-size: 1.9rem;
            font-weight: 700;
        }
        .subtitle {
            margin: 0 0 22px;
            color: #475569;
            line-height: 1.6;
        }
        form { display: flex; flex-direction: column; gap: 12px; }
        label {
            font-weight: 600;
            color: #334155;
        }
        input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            font-size: 0.95rem;
            outline: none;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }
        input:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.15);
        }
        button {
            margin-top: 6px;
            padding: 12px 14px;
            background: linear-gradient(135deg, #2563eb, #1d4ed8);
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 700;
            font-size: 0.95rem;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            box-shadow: 0 10px 20px rgba(37, 99, 235, 0.18);
        }
        button:hover { transform: translateY(-1px); }
        .hint {
            font-size: 0.9rem;
            color: #64748b;
            margin-top: 14px;
        }
        .link {
            display: inline-block;
            margin-top: 10px;
            color: #2563eb;
            text-decoration: none;
            font-weight: 600;
        }
        .link:hover { text-decoration: underline; }
        @media (max-width: 840px) {
            .shell { grid-template-columns: 1fr; }
            .visual { padding: 24px 24px 0; }
            .card { padding: 24px; }
        }
    </style>
</head>
<body>
    <div class="shell">
        <div class="visual">
            <img src="images/hero.svg" alt="Secure credentials illustration">
        </div>
        <div class="card">
            <span class="eyebrow">Secure access</span>
            <h2>Store your credentials</h2>
            <p class="subtitle">Create a secure entry with a polished experience designed for quick submissions and clear feedback.</p>
            <form action="login.jsp" method="post">
                <label for="username">Username</label>
                <input id="username" name="username" type="text" required>

                <label for="password">Password</label>
                <input id="password" name="password" type="password" required>

                <button type="submit">Save Credential</button>
            </form>
            <p class="hint">Usernames must be unique. Duplicate entries are rejected.</p>
            <a class="link" href="users.jsp">View stored user IDs</a>
        </div>
    </div>
</body>
</html>
