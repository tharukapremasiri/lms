<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Louver International School-Index.html</title>
    <link rel="stylesheet" href="Student/index.css">
    <style>
        /* --- Root Variables for easy branding --- */
:root {
    --primary-blue: #1a4d8c;
    --secondary-blue: #f0f5ff;
    --accent-gold: #ffcc00;
    --text-dark: #333;
    --text-light: #666;
    --border-color: #ddd;
    --white: #ffffff;
    --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* --- General Reset --- */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f4f7f6;
    color: var(--text-dark);
    line-height: 1.6;
}

/* --- Header Styling --- */
header {
    background-color: var(--white);
    padding: 1rem 5%;
    border-bottom: 3px solid var(--primary-blue);
    box-shadow: var(--shadow);
}

.header-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.logo {
    height: 60px;
    width: auto;
}

h1 {
    font-size: 1.5rem;
    color: var(--primary-blue);
    flex-grow: 1;
    margin-left: 20px;
}

.login-status a {
    text-decoration: none;
    font-size: 0.9rem;
    font-weight: 600;
    transition: color 0.3s;
}

.login-status a:hover {
    color: var(--primary-blue) !important;
}

/* --- Welcome Section --- */
.welcome-section {
    text-align: center;
    padding: 40px 20px;
    background: linear-gradient(135deg, #1a4d8c 0%, #3a7bd5 100%);
    color: white;
    margin-bottom: 30px;
}

.faculty-logo {
    height: 80px;
    margin-bottom: 15px;
    filter: brightness(0) invert(1); /* Makes logo white if it's dark */
}

.highlight {
    color: var(--accent-gold);
}

/* --- Main Layout --- */
.content-wrapper {
    display: grid;
    grid-template-columns: 1fr 300px; /* Main content vs Sidebar */
    gap: 30px;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px 50px;
}

/* --- Content Sections (Announcements & Courses) --- */
section h2 {
    border-left: 5px solid var(--primary-blue);
    padding-left: 15px;
    margin-bottom: 20px;
    font-size: 1.4rem;
    color: var(--primary-blue);
}

.announcement, .course {
    background: var(--white);
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 15px;
    box-shadow: var(--shadow);
    border-left: 4px solid transparent;
    transition: transform 0.2s, border-color 0.2s;
}

.course:hover {
    transform: translateY(-3px);
    border-left-color: var(--primary-blue);
}

.announcement strong, .course strong {
    display: block;
    font-size: 1.1rem;
    color: var(--primary-blue);
    margin-bottom: 5px;
}

.announcement a {
    display: inline-block;
    margin-top: 10px;
    color: #d9534f; /* Alert red for important notices */
    text-decoration: none;
    font-weight: bold;
}

/* --- Sidebar Styling --- */
.sidebar h3 {
    background: var(--primary-blue);
    color: white;
    padding: 10px 15px;
    font-size: 1rem;
    border-radius: 4px 4px 0 0;
}

.sidebar ul {
    list-style: none;
    background: white;
    margin-bottom: 20px;
    border: 1px solid var(--border-color);
    border-radius: 0 0 4px 4px;
}

.sidebar ul li {
    border-bottom: 1px solid #eee;
}

.sidebar ul li a {
    display: block;
    padding: 10px 15px;
    text-decoration: none;
    color: var(--text-dark);
    font-size: 0.9rem;
}

.sidebar ul li a:hover {
    background-color: var(--secondary-blue);
    color: var(--primary-blue);
}

/* --- Calendar Widget --- */
.calendar {
    background: white;
    border: 1px solid var(--border-color);
    border-radius: 4px;
    overflow: hidden;
}

.calendar-month {
    text-align: center;
    padding: 10px;
    background: #eee;
    font-weight: bold;
}

.calendar-grid {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    gap: 1px;
    background: var(--border-color);
    padding: 5px;
}

.calendar-grid div {
    background: white;
    text-align: center;
    padding: 10px 0;
    font-size: 0.8rem;
}

/* --- Responsive Design --- */
@media (max-width: 900px) {
    .content-wrapper {
        grid-template-columns: 1fr;
    }
    
    .header-container {
        flex-direction: column;
        text-align: center;
    }
    
    h1 {
        margin: 10px 0;
    }
}
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <img src="images/logo.png" alt="University Logo" class="logo">
            <h1>Louver International School</h1>
            <div class="login-status">
                <a style="color: black;" href="login.php">You are not logged in. (Log in)</a>
            </div>
        </div>
    </header>
    <main>
        <section class="welcome-section">
            <img src="images/logo.png" alt="Faculty Logo" class="faculty-logo">
            <h2>Welcome to the <span class="highlight">Virtual Learning Environment</span></h2>
            <h3>for the <span class="faculty-name">Louver International School</span></h3>
        </section>
        <div class="content-wrapper">
            <section class="site-announcements">
                <h2>Site announcements</h2>
                <div class="announcement">
                    <p><strong>Revised Examination Timetable - Grade 11 - Special Exam</strong></p>
                    <p>by Section Admin - Wednesday, 5 June 2024, 13:00 PM</p>
                    <p>Revised Examination Timetable - Grade 10 (2026) </p>
                    <a href="/documents/notice.pdf" target="_blank">Art Competiotion Organized by School Art Circle</a>
                </div>
            </section>
            <section class="all-courses">
                <h2>All Courses</h2>
                <div class="course">
                    <p><strong>Grade 5</strong></p>
                    <p>Course description or additional information can go here.</p>
                </div>
                <div class="course">
                    <p><strong>Grade 6</strong></p>
                    <p>Course description or additional information can go here.</p>
                </div>
                <div class="course">
                    <p><strong>Grade 7</strong></p>
                    <p>Course description or additional information can go here.</p>
                </div>
                <div class="course">
                    <p><strong>Grade 8</strong></p>
                    <p>Course description or additional information can go here.</p>
                </div>
                <div class="course">
                    <p><strong>Grade 9</strong></p>
                    <p>Course description or additional information can go here.</p>
                </div>
                <div class="course">
                    <p><strong>Grade 10</strong></p>
                    <p>Course description or additional information can go here.</p>
                </div>
                <div class="course">
                    <p><strong>Grade 11</strong></p>
                    <p>Course description or additional information can go here.</p>
                </div>
            </section>
            <aside class="sidebar">
                <nav class="main-menu">
                    <h3>Main menu</h3>
                    <ul>
                        <li><a href="#">Site announcements</a></li>
                    </ul>
                </nav>
                <nav class="navigation">
                    <h3>Navigation</h3>
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Site announcements</a></li>
                        <li><a href="#">Courses</a></li>
                    </ul>
                </nav>
                <div class="calendar">
                    <h3>Calendar</h3>
                    <div id="calendar">
                        <!-- Add your calendar widget or structure here -->
                        <div class="calendar-month">
                            <span>June 2024</span>
                        </div>
                        <div class="calendar-grid">
                            <!-- Add the days of the month here -->
                            <div>1</div><div>2</div><div>3</div> <!-- Add more days as needed -->
                        </div>
                    </div>
                </div>
            </aside>
        </div>
    </main>
</body>
</html>
